character_creation_convo_handler = Object:new {
}

function character_creation_convo_handler:getNextConversationScreen(conversationTemplate, conversingPlayer, selectedOption)
    -- Assign the player to variable creature for use inside this function.
    local creature = LuaCreatureObject(conversingPlayer)
    -- Get the last conversation to determine whetehr or not we're  on the first screen
    local convosession = creature:getConversationSession()
    lastConversation = nil
    local conversation = LuaConversationTemplate(conversationTemplate)



    -- If there is a conversation open, do stuff with it
    if ( conversation ~= nil ) then
    -- check to see if we have a next screen
        if ( convosession ~= nil ) then
            local session = LuaConversationSession(convosession)
            if ( session ~= nil ) then
                lastConversationScreen = session:getLastConversationScreen()
            end
        end
        -- Last conversation was nil, so get the first screen
        if ( lastConversationScreen == nil ) then
            nextConversationScreen = conversation:getScreen("greeting")
        else
            -- Start playing the rest of the conversation based on user input
            local luaLastConversationScreen = LuaConversationScreen(lastConversationScreen)
            -- Set variable to track what option the player picked and get the option picked
            local optionLink = luaLastConversationScreen:getOptionLink(selectedOption)
            nextConversationScreen = conversation:getScreen(optionLink)
        end
    end
-- end of the conversation logic.

	if ( lastConversationScreen ~= nil ) then
		local luaLastConversationScreen = LuaConversationScreen(lastConversationScreen)
		local optionData = luaLastConversationScreen:getOptionData(selectedOption)
		SceneObject(conversingPlayer):setStoredInt("faction_conv_last_index", tonumber(optionData))		
	end	
		
return nextConversationScreen
end

function character_creation_convo_handler:runScreenHandlers(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen)
    -- Plays the screens of the conversation.
    local player = LuaSceneObject(conversingPlayer)
    local screen = LuaConversationScreen(conversationScreen)
    local screenID = screen:getScreenID()
    local pConvScreen = screen:cloneScreen()
    local clonedConversation = LuaConversationScreen(pConvScreen)
	
	--Get personal data about the Player
	local playerName = CreatureObject(conversingPlayer):getFirstName()
	local playerFactionTag = SceneObject(conversingPlayer):getStoredString("faction_current") or ""

	local attributePoints = SceneObject(conversingPlayer):getStoredInt("starter_attr_points")
	local skillPoints = SceneObject(conversingPlayer):getStoredInt("starter_skill_points")
	local wasToldofClothing = SceneObject(conversingPlayer):getStoredInt("cc_clothes") > 0

	local homeworld = SceneObject(conversingPlayer):getStoredString("homeworld")

	local isImp = CreatureObject(conversingPlayer):hasSkill("rp_bg_imp_recruit")
	local isRep = CreatureObject(conversingPlayer):hasSkill("rp_bg_rep_recruit")

	local isCriminal = CreatureObject(conversingPlayer):hasSkill("rp_bg_criminal")
	local isMedical = CreatureObject(conversingPlayer):hasSkill("rp_bg_medical")
	local isEngineer = CreatureObject(conversingPlayer):hasSkill("rp_bg_engineer")

	local isMando = CreatureObject(conversingPlayer):hasSkill("rp_bg_mando")

	clonedConversation:removeAllOptions()
	
	--Awarding skills for each starting backgroud.

	if (isImp or isRep and CreatureObject(conversingPlayer):hasSkill("rp_training_military_novice") == false) then
		awardSkill(conversingPlayer, "rp_training_military_novice")
	end

	if (isMando and CreatureObject(conversingPlayer):hasSkill("rp_training_mando_novice") == false) then
		awardSkill(conversingPlayer, "rp_training_mando_novice")
	end

	if (isCriminal and CreatureObject(conversingPlayer):hasSkill("rp_training_criminal_novice") == false) then
		awardSkill(conversingPlayer, "rp_training_criminal_novice")
		awardSkill(conversingPlayer, "social_language_hutt_comprehend")
	end

	if (isMedical and CreatureObject(conversingPlayer):hasSkill("rp_training_medical_novice") == false) then
		awardSkill(conversingPlayer, "rp_training_medical_novice")
	end

	if (isEngineer and CreatureObject(conversingPlayer):hasSkill("rp_training_engineer_novice") == false) then
		awardSkill(conversingPlayer, "rp_training_engineer_novice")
	end

	

	--Checking conditions for enabling the leave option.
	local readyToLeave = wasToldofClothing

	if (creatureObject(conversingPlayer):getHAM(0) ~= creatureObject(conversingPlayer):getMaxHAM(0)) then
		readyToLeave = false
	end

	if (isImp and CreatureObject(conversingPlayer):hasSkill("species_human") == false) then
		readyToLeave = false
		screenID = "invalid"
	end

	if (isMando and playerFactionTag == "") then
		readyToLeave = false
	end

	if (attributePoints ~= 0 or skillPoints ~= 0) then
		readyToLeave = false
	end

	--Set player faction for soldiers.
	if (isImp and playerFactionTag == "") then
		playerFactionTag = "empire"
		SceneObject(conversingPlayer):setStoredString("faction_current", playerFactionTag)
		SceneObject(conversingPlayer):setStoredInt("rank_empire", 1)
	end

	if (isRep and playerFactionTag == "") then
		playerFactionTag = "newrepublic"
		SceneObject(conversingPlayer):setStoredString("faction_current", playerFactionTag)
		SceneObject(conversingPlayer):setStoredInt("rank_newrepublic", 1)
	end

	--Handle mando helmet distribution.
	if(string.find(screenID, "mando_helmet")) then
		playerFactionTag = "mando"
		SceneObject(conversingPlayer):setStoredString("faction_current", playerFactionTag)
		SceneObject(conversingPlayer):setStoredInt("rank_mando", 1)

		local inventory = SceneObject(conversingPlayer):getSlottedObject("inventory")

		if (inventory ~= nil) then
			local item

			if (screenID == "mando_helmet_s01") then
				item = giveItem(inventory, "object/tangible/wearables/armor/roleplay/mandalorian/armor_mandalorian_helmet.iff", -1)
			elseif (screenID == "mando_helmet_s02") then
				item = giveItem(inventory, "object/tangible/wearables/armor/roleplay/mandalorian/armor_mandalorian_helmet_s02.iff", -1)
			elseif (screenID == "mando_helmet_beta") then
				item = giveItem(inventory, "object/tangible/wearables/armor/roleplay/mandalorian_beta/armor_mandalorian_beta_helmet.iff", -1)
			elseif (screenID == "mando_helmet_imp") then
				item = giveItem(inventory, "object/tangible/wearables/armor/roleplay/mandalorian_imperial/armor_mandalorian_imperial_helmet.iff", -1)
			elseif (screenID == "mando_helmet_reb") then
				item = giveItem(inventory, "object/tangible/wearables/armor/roleplay/mandalorian_rebel/armor_mandalorian_rebel_helmet.iff", -1)
			else
				item = giveItem(inventory, "object/tangible/wearables/armor/roleplay/mandalorian/armor_mandalorian_helmet.iff", -1)
			end

			CreatureObject(conversingPlayer):sendSystemMessage("You have been given your helmet!")
			screenID = "return_menu"
		end
	end

	--Travel to our starting location of choice.
	if(string.find(screenID, "start_")) then
		local planet
		local dest
		-- Soldiers start at their respective bases.
		if (isRep or isImp) then
			if(screenID == "start_carida") then
				planet = travelSystem:getPlanetFromTag("carida")
				dest = planet.spaceports[1].public_arrival
			end
			if(screenID == "start_dantooine") then
				planet = travelSystem:getPlanetFromTag("dantooine")
				dest = planet.spaceports[1].public_arrival
			end
			if(screenID == "start_tatooine") then
				planet = travelSystem:getPlanetFromTag("tatooine")
				dest = planet.spaceports[2].public_arrival
			end
			if(screenID == "start_rori") then
				planet = travelSystem:getPlanetFromTag("rori")
				dest = planet.spaceports[1].public_arrival
			end
			if(screenID == "start_sulon") then
				planet = travelSystem:getPlanetFromTag("sulon")
				dest = planet.spaceports[1].public_arrival
			end
			if(screenID == "start_ord_mantell") then
				planet = travelSystem:getPlanetFromTag("ord_mantell")
				dest = planet.spaceports[1].public_arrival
			end
		else
			local destTag = string.gsub(screenID, "start_", "")
			planet = travelSystem:getPlanetFromTag(destTag)
			dest = planet.spaceports[1].public_arrival
		end

		SceneObject(conversingPlayer):switchZone(dest[1], dest[2],dest[3],dest[4], dest[6]) 
		screenID = "abort"
	end
	
	------------------------------------------------------------------------------------------------------
	--Base menu
	------------------------------------------------------------------------------------------------------
	if(screenID == "greeting" or screenID == "return_menu") then
		if (screenID == "greeting") then
			clonedConversation:setCustomDialogText("Welcome, "..playerName..". Come, let us decide your origins.")
		else
			clonedConversation:setCustomDialogText("Let us continue.")
		end

		if(readyToLeave) then
			clonedConversation:addOption("I am ready to begin my adventure.", "leave")
		else
			clonedConversation:addOption("What is the next step?", "next_step")
		end

		--Mandos start with their helmet.
		if(isMando and playerFactionTag == "") then
			clonedConversation:addOption("I've come to collect my buy'ce.", "mando")
		end

		--Choosing a homeworld.
		--if(homeworld ~= "") then
		--	clonedConversation:addOption("I would like to choose a home world.", "homeworld")
		--end
		
		clonedConversation:addOption("I should go.", "abort")
	
	------------------------------------------------------------------------------------------------------
	--Handling the distribution of the starter helmet for mando players.
	------------------------------------------------------------------------------------------------------
	elseif(screenID == "mando") then
		clonedConversation:setCustomDialogText("Ah, yes. It is not much of your beskar'gam, but it will make you mandalorian enough.")
		clonedConversation:addOption("Mandalorian Helmet", "mando_helmet_s01")
		clonedConversation:addOption("Mandalorian Helmet (feminine)", "mando_helmet_s02")
		clonedConversation:addOption("Mandalorian Helmet (beta)", "mando_helmet_beta")
		clonedConversation:addOption("Crusader Mk. III Helmet", "mando_helmet_reb")
		clonedConversation:addOption("Crusader Mk. IV Helmet", "mando_helmet_imp")

	------------------------------------------------------------------------------------------------------
	--Handle leaving the starter zone!
	------------------------------------------------------------------------------------------------------
	elseif(screenID == "leave") then
		clonedConversation:setCustomDialogText("Very well, "..playerName..", I will not stop you. Choose where you wish to begin your adventure.")
		--Soldiers can only deploy to planets that their faction controls, or have active bases on.
		if(isImp or isRep) then
			if(isImp) then
				clonedConversation:addOption("Carida.", "start_carida")
				clonedConversation:addOption("Tatooine.", "start_tatooine")
				clonedConversation:addOption("Rori.", "start_rori")
				clonedConversation:addOption("Ord Mantell.", "start_ord_mantell")
				--clonedConversation:addOption("Sulon.", "start_sulon")
			end
			if(isRep) then
				clonedConversation:addOption("Dantooine.", "start_dantooine")
				clonedConversation:addOption("Rori.", "start_rori")
			end
		else
			--Only mandos should be able to start on Mandalore.
			if(isMando) then
				clonedConversation:addOption("Mandalore.", "start_mandalore")
			end
			clonedConversation:addOption("Tatooine.", "start_tatooine")
			clonedConversation:addOption("Rori.", "start_rori")
			clonedConversation:addOption("Dantooine.", "start_dantooine")
			clonedConversation:addOption("Ord Mantell.", "start_ord_mantell")
			clonedConversation:addOption("Sulon.", "start_sulon")
		end
	------------------------------------------------------------------------------------------------------
	--Handle homeworld selection
	------------------------------------------------------------------------------------------------------
	elseif(screenID == "homeworld") then
		clonedConversation:setCustomDialogText("Where you hail from is not insignificant, but it mustn't define you.")
		clonedConversation:addOption("I am from Tatooine. (Languages: Huttese, Jawa Trade)", "home_tatooine")

	------------------------------------------------------------------------------------------------------
	--Player advice.
	------------------------------------------------------------------------------------------------------
	elseif(screenID == "next_step") then
		if(attributePoints > 0) then
			clonedConversation:setCustomDialogText("You should consider your attributes. Remember, these attributes define who you are, and are very slow to improve. You start with 30 points to use. Use '/train' to access the training menu, and assign your points.")
			clonedConversation:addOption("I will do that.", "abort")

		elseif(skillPoints > 0) then
			clonedConversation:setCustomDialogText("You should consider your skills. Skills are easy to learn, but require a lot of experience to master, especially if the skill's attribute is lower than your skill level. Use '/train' to access the training menu, and assign your points.")
			clonedConversation:addOption("I will do that.", "abort")

		elseif(isMando and playerFactionTag == "") then
			clonedConversation:setCustomDialogText("Your attributes and skills are ready, now you must choose your buy'ce.")
			clonedConversation:addOption("Mandalorian Helmet", "mando_helmet_s01")
			clonedConversation:addOption("Mandalorian Helmet (feminine)", "mando_helmet_s02")
			clonedConversation:addOption("Mandalorian Helmet (beta)", "mando_helmet_beta")
			clonedConversation:addOption("Crusader Mk. III Helmet", "mando_helmet_reb")
			clonedConversation:addOption("Crusader Mk. IV Helmet", "mando_helmet_imp")

		elseif(wasToldofClothing == false) then
			clonedConversation:setCustomDialogText("Before you go into the Galaxy, you should spend some time getting dressed. You will find several chests of clothing to my left, and vendors selling you arms and armour to my right. Find what you need, but do not worry, clothing and weapons are available at tailors and vendors in most large cities.")
			clonedConversation:addOption("I will do that.", "abort")
			SceneObject(conversingPlayer):setStoredInt("cc_clothes", 1)

		elseif(creatureObject(conversingPlayer):getHAM(0) ~= creatureObject(conversingPlayer):getMaxHAM(0)) then
			clonedConversation:setCustomDialogText("You are almost ready to begin your adventure. Resting allows you to restore your health, action and will. As you have only now begun, your pools are empty. Go now, and refill them by using the '/rest' command to perform a 'Long Rest.' After that, you may begin your adventure.")
			clonedConversation:addOption("I will do that.", "abort")
		end


	elseif(screenID == "invalid") then
		if(isImp) then
			clonedConversation:setCustomDialogText("You must be human to be a part of the Empire. I am afraid that your character is not valid for roleplay, and must be recreated.")
		end
		clonedConversation:addOption("I see.", "abort")
	end
	
    return pConvScreen
end