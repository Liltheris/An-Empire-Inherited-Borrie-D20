BorForce_Persuade = BorForce_BasePower:new({
	name = "Force Persuasion",
	requiredSkills = {"rp_ability_persuade"},

	minRange = 0,
	idealRange = 0,
	farRange = 20,
	maxRange = 50,

	fpiMin = 1,
	fpiMax = 20,

	targetSelf = false,

	helpString = "Force Persuasion can replace one bluff, persuasion or intimidation roll. If the target's mindfulness roll is beat, the success is considered a nat 20.\nForce-sensitive double their mindfulness roll.",
})

function BorForce_Persuade:showHelp(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end

function BorForce_Persuade:execute(pPlayer)
	local fpi = BorForceUtility:getForcePointInput(pPlayer, self)

	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)

	if(BorForceUtility:canUseForcePower(pPlayer, pTarget, self) == false) then
		return
	end
	
	if(fpi < self.fpiMin) then
		BorForceUtility:promptForcePointInput(pPlayer, self, "BorForce_Persuade", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Persuade:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Persuade:performAbility(pPlayer, fpi)
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

	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_control"))
	local roll = math.floor(math.random(1,20))


	if(CreatureObject(pTarget):hasSkill("rp_force_prog_novice")) then
		fsMod = 2
	end

	local targetTotal = (targetSkillValue + targetRoll) * fsMod
	local total = skillValue + roll + fpi
	
	local msg = CreatureObject(pPlayer):getFirstName() .. " uses " .. self.name .. "!"
	local targetName = CreatureObject(pTarget):getFirstName() 

	msg = msg .. " They attempt to use the Force to persuade "..targetName.." to see things their way "..BorForceUtility:rollSpamFPINoDC(roll, skillValue, fpi).." vs "..BorForceUtility:rollSpamNoDC(targetRoll, targetSkillValue)

	if(CreatureObject(pTarget):hasSkill("rp_force_prog_novice")) then
		msg = msg .. " x2 = "..targetTotal.."."
	end

	if(total > targetTotal) then
		msg = msg .. " and succeed! "..CreatureObject(pPlayer):getFirstName().." persuades "..targetName..", allowing them to perform a social check with an automatic nat 20 success."
	else 
		msg = msg .. " and fail!"
	end

	broadcastMessageWithName(pPlayer, msg)
	
	BorForceUtility:playAbilityEffects(pPlayer, pPlayer, self)
end