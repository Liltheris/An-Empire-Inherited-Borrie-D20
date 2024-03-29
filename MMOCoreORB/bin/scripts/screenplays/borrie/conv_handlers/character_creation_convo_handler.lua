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
	local playerFactionTag = SceneObject(conversingPlayer):getStoredString("faction_current")

	local attributePoints = SceneObject(conversingPlayer):getStoredInt("starer_attr_points")
	local skillPoints = SceneObject(conversingPlayer):getStoredInt("starer_skill_points")

	local homeworld = SceneObject(conversingPlayer):getStoredString("homeworld")

	local isSoldier = CreatureObject(conversingPlayer):hasSkill("rp_bg_military")
	local isMando = CreatureObject(conversingPlayer):hasSkill("rp_bg_mando")
	
	clonedConversation:removeAllOptions()
		
	--Checking conditions for enabling the leave option.
	local readyToLeave = true

	if (isMando and playerFactionTag == "") then
		readyToLeave = false
	end

	if (isSoldier and playerFactionTag == "") then
		readyToLeave = false
	end

	if (attributePoints ~= 0 or skillPoints ~= 0) then
		readyToLeave = false
	end

	--Set logic for which logic to take for the first screen.
	if(screenID == "greeting") then
		if(playerFactionTag == "") then
			traitorLevel = BorFactionManager:getTraitorLevel(conversingPlayer, factionTag)
			if(traitorLevel == 1) then
				screenID = "traitor1_greeting"
			elseif(traitorLevel == 2) then
				screenID = "traitor2_greeting"
			else 
				screenID = "greeting"
			end			
		elseif(playerFactionTag == factionTag) then
			screenID = "greeting_member"
		elseif(BorFactionManager:getFactionIsEnemy(factionTag, playerFactionTag) == true) then
			screenID = "enemy_greeting"
		elseif(BorFactionManager:getFactionIsAlly(factionTag, playerFactionTag) == true) then
			screenID = "ally_greeting"
		end
	end

	--Handle mando helmet distribution.
	if(string.find(screenID, "mando")) then
		SceneObject(conversingPlayer):setStoredString("faction_current", "mando")
		SceneObject(conversingPlayer):setStoredString("rank_mando", 1)

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

	if(string.find(screenID, "start_")) then
		local planet
		local dest
		-- Soldiers start at their respective bases.
		if (isSoldier) then
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

		SceneObject(pPlayer):switchZone(dest[1], dest[2],dest[3],dest[4], dest[6]) 
		screenID = "abort"
	end
	
	------------------------------------------------------------------------------------------------------
	--Base menu
	------------------------------------------------------------------------------------------------------
	if(screenID == "greeting" or screenID == "return_menu") then
		if (screenID == "greeting") then
			clonedConversation:setCustomDialogText("Welcome, "..playerName..". Come, let us decide your origins.")
		else
			clonedConversation:setCustomDialogText("Please, do continue.")
		end

		--Soldiers choose their starting faction.
		if(isSoldier) then
			if (playerFactionTag == "") then
				clonedConversation:addOption("I would like to choose the faction I fight for.", "faction")
			else
				clonedConversation:addOption("I would like to change the faction I fight for.", "faction")
			end
		end

		--Mandos start with their helmet.
		if(isMando and playerFactionTag == "") then
			clonedConversation:addOption("I've come to collect my buy'ce.", "mando")
		end

		--Choosing a homeworld.
		--if(homeworld ~= "") then
		--	clonedConversation:addOption("I would like to choose a home world.", "homeworld")
		--end

		--The player is ready to leave!
		if(readyToLeave) then
			clonedConversation:addOption("I am ready to begin my adventure.", "leave")
		end
		clonedConversation:addOption("I should go.", "abort")

	------------------------------------------------------------------------------------------------------
	--Handling soldiers selecting their starting faction.
	------------------------------------------------------------------------------------------------------
	elseif(screenID == "faction") then
		clonedConversation:SetCustomDialogText("You are a soldier, but who do you fight for? The Empire? Or the Republic?")
		clonedConversation:addOption("The Empire.", "soldier_empire")
		clonedConversation:addOption("The Republic.", "soldier_republic")

	elseif(screenID == "soldier_empire") then
		clonedConversation:SetCustomDialogText("So be it.")
		clonedConversation:addOption("For the Empire!", "return_menu")

		--Set faction data.
		SceneObject(conversingPlayer):setStoredString("faction_current", "empire")
		SceneObject(conversingPlayer):setStoredString("rank_empire", 1)

	elseif(screenID == "soldier_republic") then
		clonedConversation:SetCustomDialogText("So be it.")
		clonedConversation:addOption("For the Republic!", "return_menu")

		--Set faction data.
		SceneObject(conversingPlayer):setStoredString("faction_current", "newrepublic")
		SceneObject(conversingPlayer):setStoredString("rank_newrepublic", 1)
	
	------------------------------------------------------------------------------------------------------
	--Handling the distribution of the starter helmet for mando players.
	------------------------------------------------------------------------------------------------------
	elseif(screenID == "mando") then
		clonedConversation:SetCustomDialogText("Ah, yes. It is not much of your beskar'gam, but it will make you mandalorian enough.")
		clonedConversation:addOption("Mandalorian Helmet", "mando_helmet_s01")
		clonedConversation:addOption("Mandalorian Helmet (feminine)", "mando_helmet_s02")
		clonedConversation:addOption("Mandalorian Helmet (beta)", "mando_helmet_beta")
		clonedConversation:addOption("Crusader Mk. III Helmet", "mando_helmet_reb")
		clonedConversation:addOption("Crusader Mk. IV Helmet", "mando_helmet_imp")

	------------------------------------------------------------------------------------------------------
	--Handle leaving the starter zone!
	------------------------------------------------------------------------------------------------------
	elseif(screenID == "leave") then
		clonedConversation:SetCustomDialogText("Very well, "..playerName..", I will not stop you. Choose where you wish to begin your adventure.")
		--Soldiers can only deploy to planets that their faction controls, or have active bases on.
		if(isSoldier) then
			if(playerFactionTag == "empire") then
				clonedConversation:addOption("Carida.", "start_carida")
				clonedConversation:addOption("Tatooine.", "start_tatooine")
				clonedConversation:addOption("Rori.", "start_rori")
				clonedConversation:addOption("Ord Mantell.", "start_ord_mantell")
				--clonedConversation:addOption("Sulon.", "start_sulon")
			end
			if(playerFactionTag == "newrepublic") then
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
		clonedConversation:addOption("I am from Tatooine.", "home_tatooine")
		clonedConversation:addOption("I am from Tatooine.", "home_tatooine")
	end
	
    return pConvScreen
end