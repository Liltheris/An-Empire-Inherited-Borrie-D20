BorForce_ReadMind = BorForce_BasePower:new({
	name = "Read Mind",
	requiredSkills = {"rp_ability_readmind"},

	selfAnim = "force_persuasion",

	minRange = 0,
	idealRange = 0,
	farRange = 20,
	maxRange = 50,

	targetSelf = false,

	helpString = "Roll sense + FPI vs the target's Mindfulness roll to read the mind of the target. The use of this ability is contextual.\nForce-sensitives resist with Mindfulness * 2."
})

function BorForce_ReadMind:showHelp(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end

function BorForce_ReadMind:execute(pPlayer)
	local fpi = BorForceUtility:getForcePointInput(pPlayer, self)

	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)

	if(BorForceUtility:canUseForcePower(pPlayer, pTarget, self) == false) then
		return
	end
	
	if(fpi < self.fpiMin) then
		BorForceUtility:promptForcePointInput(pPlayer, self, "BorForce_ReadMind", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_ReadMind:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_ReadMind:performAbility(pPlayer, fpi)
	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)
		
	if(BorForceUtility:canUseForcePower(pPlayer, pTarget, self) == false) then
		return
	end

	if(BorForceUtility:handleFPI(pPlayer, self, fpi) == false) then
		return
	end

	fpi = math.floor(fpi)

	local targetSkillValue = math.floor(CreatureObject(pTarget):getSkillMod("rp_mindfulness"))
	local targetRoll = math.floor(math.random(1,20))
	local fsMod = 1

	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_sense"))
	local roll = math.floor(math.random(1,20))


	if(CreatureObject(pTarget):hasSkill("rp_force_prog_novice")) then
		fsMod = 2
	end

	local targetTotal = (targetSkillValue + targetRoll) * fsMod
	local total = skillValue + roll + fpi
	
	local msg = CreatureObject(pPlayer):getFirstName() .. " uses " .. self.name .. "!"
	local targetName = CreatureObject(pTarget):getFirstName() 
	
	msg = msg .. " They attempt to read "..targetName.."'s mind "..BorForceUtility:rollSpamFPINoDC(roll, skillValue, fpi).." vs "..BorForceUtility:rollSpamNoDC(targetRoll, targetSkillValue)

	if(CreatureObject(pTarget):hasSkill("rp_force_prog_novice")) then
		msg = msg .. " x2 = "..targetTotal.."."
	end

	if(total > targetTotal) then
		msg = msg .. " and succeed! "..targetName.." has their mind read, revealing what "..CreatureObject(pPlayer):getFirstName().." wishes to know."
	else 
		msg = msg .. " and fail!"
	end

	broadcastMessageWithName(pPlayer, msg)
	
	BorForceUtility:playAbilityEffects(pPlayer, pPlayer, self)
end