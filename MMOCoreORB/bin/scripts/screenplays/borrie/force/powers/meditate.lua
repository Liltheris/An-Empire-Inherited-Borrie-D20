BorForce_Meditate = BorForce_BasePower:new({
	name = "Force Meditation",
	requiredSkills = {"rp_inward_novice"},

	action = "Short rest",

	selfEffect = "clienteffect/pl_force_meditate_self.cef",

	targetSelf = true,

	helpString = "Restore half of your total Force Pool as a short rest. You must be out of combat, and not in imminent danger to do this.",
})

function BorForce_Meditate:showHelp(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end

function BorForce_Meditate:execute(pPlayer)
	if(BorForceUtility:canUseForcePower(pPlayer, pPlayer, self) == false) then
		return
	end
	
	self:performAbility(pPlayer)
end

function BorForce_Meditate:performAbility(pPlayer, fpi)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	
	if(CreatureObject(pPlayer):isRidingMount()) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot do this while mounted.")
		return
	end

	if (pGhost == nil) then
		return
	end
	
	local forcePower = math.floor(PlayerObject(pGhost):getForcePower())
	local forcePowerMax = math.floor(PlayerObject(pGhost):getForcePowerMax())
	
	local willPoints = CreatureObject(pPlayer):getHAM(6)
	
	if(willPoints < 2) then
		CreatureObject(pPlayer):sendSystemMessage("Meditating now will incapacitate you. You cannot find the peace of mind required.")
		return
	end
	
	local clientEffect = "clienteffect/pl_force_meditate_self.cef"
	
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. "! In the cover of safety, they regenerate their force pool by " .. math.floor(forcePowerMax / 2) .. " points!"
	
	CreatureObject(pPlayer):setMoodString("meditating")
	CreatureObject(pPlayer):setPosture(POSTURESITTING)

	
	local forcePowerPoints = math.min(forcePowerMax, forcePower + (forcePowerMax / 2))
	
	PlayerObject(pGhost):setForcePower(forcePowerPoints)
	SceneObject(pPlayer):setStoredInt("force_defense", 0)
	CreatureObject(pPlayer):setHAM(6, CreatureObject(pPlayer):getHAM(6) - 1)
	
	broadcastMessageWithName(pPlayer, message)

	BorForceUtility:playAbilityEffects(pPlayer, pPlayer, self)
end