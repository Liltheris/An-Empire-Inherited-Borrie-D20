BorForce_DetectAlignment = BorForce_BasePower:new({
	name = "Detect Alignment",
	requiredSkills = {"species_miraluka"},

	selfTarget = false,

	helpString = "reveals the Force alignment of your target."
})

function BorForce_DetectAlignment:showHelp(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end

function BorForce_DetectAlignment:execute(pPlayer)
	if(BorForceUtility:canUseForcePower(pPlayer, pTarget, self) == false) then
		return
	end

	self:performAbility(pPlayer, fpi)
end

function BorForce_DetectAlignment:performAbility(pPlayer, fpi)
	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)

	if(BorForceUtility:canUseForcePower(pPlayer, pTarget, self) == false) then
		return
	end

	local msg = CreatureObject(pPlayer):getFirstName() .. " uses " .. self.name .. "! They appear in an almost meditative focus for a while."

	broadcastMessageWithName(pPlayer, msg)

	if(CreatureObject(pTarget):hasSkill("rp_force_prog_novice")) then
		local targetMsg = "You cannot help but feel... observed."

		local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_sense"))
		local roll = math.floor(math.random(1,20))	

		local targetSkillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_mindfulness"))
		local targetRoll = math.floor(math.random(1,20))

		if(targetRoll + targetSkillValue >= roll + skillValue) then
			targetMsg = targetMsg .. " Your attention seems subtly drawn to "..CreatureObject(pPlayer):getFirstName().."."
		end

		CreatureObject(pTarget):sendSystemMessage(targetMsg)
	end

	local darkSidePoints = CreatureObject(pTarget):getShockWounds()
	local targetName = CreatureObject(pTarget):getFirstName()

	msg = "You reach out to "..targetName

	if (darkSidePoints < 1) then
		msg = msg .. ", who appears pure within the Force. They do not know the dark side."
	elseif (darkSidePoints < 50) then
		msg = msg .. ", who does not appear corrupted, though they do know the dark side."
	elseif (darkSidePoints < 75) then
		msg = msg .. ", who is showing corruption. They know and rely on the dark side."
	elseif (darkSidePoints < 90) then
		msg = msg .. ", who is deeply corrupted by the dark side."
	else
		msg = msg .. ", and immediately regret this decision. To look upon them is to look into the void of the dark side itself. Every part of your being screams to you but one word: Run."
	end
	
	CreatureObject(pPlayer):sendSystemMessage(targetMsg)
end