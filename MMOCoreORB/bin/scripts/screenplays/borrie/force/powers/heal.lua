BorForce_Heal = BorForce_BasePower:new({
	name = "Force Heal Self",
	requiredSkills = {"rp_ability_healself", "rp_training_jedi_guardian_04"},

	action = "Major",

	selfEffect = "clienteffect/pl_force_heal_self.cef",

	helpString = "Roll Alter against DC10 + Dark side points / 2 to heal 2 health point per Force point used."
})

function BorForce_Heal:showHelp(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end

function BorForce_Heal:execute(pPlayer)
	local fpi = BorForceUtility:getForcePointInput(pPlayer, power)

	if(BorForceUtility:canUseForcePower(pPlayer, pPlayer, self) == false) then
		return
	end
	
	if(fpi < self.fpiMin) then
		BorForceUtility:promptForcePointInput(pPlayer, self, "BorForce_Heal", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Heal:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Heal:performAbility(pPlayer, fpi)
	if(BorForceUtility:canUseForcePower(pPlayer, pTarget, self) == false) then
		return
	end

	if(BorForceUtility:handleFPI(pPlayer, self, fpi) == false) then
		return
	end
	
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_alter"))
	local roll = math.floor(math.random(1,20))	
	local darkSidePoints = CreatureObject(pPlayer):getShockWounds()

	local dc = math.floor(10 + darkSidePoints/2)

	local msg = CreatureObject(pPlayer):getFirstName() .. " uses " .. self.name .. "!"
	
	if((skillValue + roll >= dc and roll > 1) or roll == 20) then
		msg = msg .. " They heal themselves for ".. fpi .." health points! " .. BorForceUtility:rollSpam(roll, skillValue, dc)
		BorForceUtility:playAbilityEffects(pPlayer, pPlayer, self)

		CreatureObject(pPlayer):setHAM(0, math.min(CreatureObject(pPlayer):getHAM(0) + fpi * 2, CreatureObject(pPlayer):getMaxHAM(0)))
	else 
		msg = msg .. " Unfortunately, their focus is broken, and they fail to heal themselves. " .. BorForceUtility:rollSpam(roll, skillValue, dc)
	end
	
	broadcastMessageWithName(pPlayer, msg)
end

