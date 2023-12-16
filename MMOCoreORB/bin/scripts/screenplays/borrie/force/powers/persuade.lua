BorForce_Persuade = {
	name = "Force Persuasion",
	range = 64
}

function BorForce_Persuade:showHelp(pPlayer)
	local helpMessage = self.name .. ": "
	helpMessage =  helpMessage .. "Gain an automatic success for persuasion, bluff, or intimidation checks. "
	helpMessage =  helpMessage .. "Rolls with the Control skill + fpi against the target’s Mindfulness. "
	helpMessage =  helpMessage .. "Upon success, your next persuasion, bluff, or intimidation check will be considered an automatic success. "
	CreatureObject(pPlayer):sendSystemMessage(helpMessage)
end

function BorForce_Persuade:execute(pPlayer)
	local hasPower = CreatureObject(pPlayer):hasSkill("rp_ability_persuade")
	
	if(hasPower == false) then
		BorForceUtility:reportPowerNotKnown(pPlayer)
		return
	end
	
	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)
		
	if (pTarget == nil or not SceneObject(pTarget):isCreatureObject()) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a creature.")
		return
	end
	
	if(SceneObject(pPlayer):getObjectID() == SceneObject(pTarget):getObjectID()) then
		CreatureObject(pPlayer):sendSystemMessage("Sadly, you cannot use the Force to convince yourself to make what is probably a bad decision.")
		return
	end
	
	if(SceneObject(pPlayer):getDistanceTo(pTarget) > self.range) then
		CreatureObject(pPlayer):sendSystemMessage("Your target is too far away.")
		return
	end
	
	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_Persuade", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Persuade:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end
	
	spent = math.min(tonumber(spent), 20) -- Max 20
	
	if(spent < 1) then
		CreatureObject(pPlayer):sendSystemMessage("You need to commit at least one force point to use this ability.")
		return
	end
	
	self:performAbility(pPlayer, spent)
end

function BorForce_Persuade:performAbility(pPlayer, fpi)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)
		
	if (pTarget == nil or not SceneObject(pTarget):isCreatureObject()) then
		CreatureObject(pPlayer):sendSystemMessage("Invalid target, must be a creature.")
		return
	end
	
	if(SceneObject(pPlayer):getObjectID() == SceneObject(pTarget):getObjectID()) then
		CreatureObject(pPlayer):sendSystemMessage("Sadly, you cannot use the Force to convince yourself to make what is probably a bad decision.")
		return
	end
	
	local forcePower = math.floor(PlayerObject(pGhost):getForcePower())
	
	fpi = math.floor(fpi)
	
	if(forcePower < fpi) then
		CreatureObject(pPlayer):sendSystemMessage("You don't have enough Force Power to commit " .. fpi .. " points.")
		return
	end
	
	if(SceneObject(pPlayer):getDistanceTo(pTarget) > self.range) then
		CreatureObject(pPlayer):sendSystemMessage("Your target is too far away.")
		return
	end
	
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_control"))
	local roll = math.floor(math.random(1,20))
	local yourTotal = skillValue + roll + fpi
	
	local targetSkillValue = math.floor(CreatureObject(pTarget):getSkillMod("rp_mindfulness"))
	local targetRoll = math.floor(math.random(1,20))
	
	if(CreatureObject(pTarget):hasSkill("rp_force_prog_novice"))
		targetSkillValue = targetSkillValue * 2
	end
	
	local theirTotal = targetSkillValue + targetRoll
	
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. "!"
	local targetName = CreatureObject(pTarget):getFirstName() 
	
	local rollString = " (1d20 = " .. roll .. " + " .. skillValue .. " + " .. fpi .. " = " .. yourTotal .. " vs 1d20 = " .. targetRoll .. " + " .. targetSkillValue .. " = " .. theirTotal .. ")" 
	
	if(yourTotal > theirTotal) then
		message = message .. " Their influence is felt, allowing them to automatically suceed with their next persuasion, intimidation, or bluff roll against " .. targetName .. "!"
	else 
		message = message .. " However, " .. targetName .. " is unaffected by " .. CreatureObject(pPlayer):getFirstName() .. "'s empowered influence."
	end
	
	message = message .. rollString

	CreatureObject(pPlayer):doAnimation("force_persuasion")	
	broadcastMessageWithName(pPlayer, message)
	
	PlayerObject(pGhost):setForcePower(forcePower - fpi)
	
end