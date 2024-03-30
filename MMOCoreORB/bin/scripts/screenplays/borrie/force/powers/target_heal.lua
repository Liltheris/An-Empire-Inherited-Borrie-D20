BorForce_TargetHeal = BorForce_BasePower:new({
	name = "Force Heal Other",
	requiredSkills = {"rp_ability_healother", "rp_training_jedi_consular_01"},

	combatAnim = "force_healing_1",
	targetSelf = false,

	minRange = 0,
	idealRange = 2,
	farRange = 4,
	maxRange = 8,

	helpString = "Roll Alter against DC10 + Dark side points / 2 to heal a target within 8 meters range for 2 health point per Force point used."
})

function BorForce_TargetHeal:showHelp(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end

function BorForce_TargetHeal:execute(pPlayer)
	local fpi = BorForceUtility:getForcePointInput(pPlayer, self)

	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)
	
	if(BorForceUtility:canUseForcePower(pPlayer, pTarget, self) == false) then
		return
	end
	
	if(fpi < self.fpiMin) then
		BorForceUtility:promptForcePointInput(pPlayer, self, "BorForce_TargetHeal", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_TargetHeal:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_TargetHeal:performAbility(pPlayer, fpi)
	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)
		
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
	
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. "!"
	local targetName = CreatureObject(pTarget):getFirstName() 

	if((skillValue + roll >= dc and roll > 1) or roll == 20) then
		message = message .. " They heal ".. targetName .." for ".. fpi * 2 .." health points! ".. BorForceUtility:rollSpam(roll, skillValue, dc)

		BorForceUtility:playAbilityEffects(pPlayer, pTarget, self)
		CreatureObject(pTarget):setHAM(0, math.min(CreatureObject(pTarget):getHAM(0) + fpi * 2, CreatureObject(pTarget):getMaxHAM(0)))
	else 
		message = message .. " Unfortunately, their focus is broken, and they fail to heal ".. targetName ..". ".. BorForceUtility:rollSpam(roll, skillValue, dc)
	end
	
	broadcastMessageWithName(pPlayer, message)
	
end