BorForce_Flash = BorForce_BasePower:new({
	name = "Force Flash",
	requiredSkills = {"rp_ability_forceflash"},

	combatAnim = "force_mind_blast_1_particle_level_1_light",
	
	minRange = 0,
	idealRange = 1,
	farRange = 15,
	maxRange = 25,

	targetSelf = false,

	helpString = "Emit a bright flash of light from the user's hand. Roll Control + FPI vs the target's Awareness roll. If hit, the target is blinded for 1d4 turns."
})

function BorForce_Flash:showHelp(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end

function BorForce_Flash:execute(pPlayer)
	local fpi = BorForceUtility:getForcePointInput(pPlayer, self)

	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)

	if(BorForceUtility:canUseForcePower(pPlayer, pTarget, self) == false) then
		return
	end
	
	if(fpi < self.fpiMin) then
		BorForceUtility:promptForcePointInput(pPlayer, self, "BorForce_Flash", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Flash:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end
	
	spent = tonumber(spent)
	
	if(spent < 1) then
		CreatureObject(pPlayer):sendSystemMessage("You need to commit at least one force point to use this ability.")
		return
	end
	
	self:performAbility(pPlayer, spent)
end

function BorForce_Flash:performAbility(pPlayer, fpi)
	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)
		
	if(BorForceUtility:canUseForcePower(pPlayer, pTarget, self) == false) then
		return
	end

	if(BorForceUtility:handleFPI(pPlayer, self, fpi) == false) then
		return
	end

	fpi = math.floor(fpi)
	
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_control"))
	local roll = math.floor(math.random(1,20))
	local total = skillValue + roll + fpi
	
	local targetSkillValue = math.floor(CreatureObject(pTarget):getSkillMod("rp_resolve"))
	local targetRoll = math.floor(math.random(1,20))
	local targetTotal = targetSkillValue + targetRoll
	
	local msg = CreatureObject(pPlayer):getFirstName() .. " uses " .. self.name .. "!"
	local targetName = CreatureObject(pTarget):getFirstName() 
	
	local rollString = BorForceUtility:rollSpamFPINoDC(roll, skillValue, fpi).." vs "..BorForceUtility:rollSpamNoDC(targetRoll, targetSkillValue)
	
	CreatureObject(pPlayer):doCombatAnimation(pPlayer, pTarget, "force_mind_blast_1_particle_level_1_light")
	
	if(total > targetTotal) then
		local blindDuration = math.floor(math.random(1,4))
		local blindCount = SceneObject(pTarget):getStoredInt("state_blind_duration")

		blindDuration = math.floor(math.max(blindCount, blindDuration))

		msg = msg .. " From their palm, a flash of light shines out, and blinds " .. targetName .. " for " .. tonumber(blindDuration) .. " turns! "
		
		BorForceUtility:applyStatusEffect(pPlayer, pTarget, "blinded", blindDuration)
	else 
		msg = msg.. " From their palm, a flash of light shines out, but " .. targetName .. " managed to look away just in time! "
	end
	
	msg = msg .. rollString

	BorForceUtility:playAbilityEffects(pPlayer, pTarget, self)
	broadcastMessageWithName(pPlayer, msg)
	
end