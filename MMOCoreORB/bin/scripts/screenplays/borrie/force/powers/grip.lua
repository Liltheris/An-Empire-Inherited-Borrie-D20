BorForce_Grip = BorForce_BasePower:new({
	name = "Force Grip",
	requiredSkills = {"rp_ability_forcegrip"},

	SelfAnim = "force_choke",

	minRange = 0,
	idealRange = 1,
	farRange = 20,
	maxRange = 32,

	fpiMin = 2,
	fpiMax = 2,

	targetSelf = false,

	helpString = "Roll Telekinesis vs a Ranged DC to attempt to immobilise the target. If the success is a nat 20, also stuns the target."
})

function BorForce_Grip:showHelp(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end

function BorForce_Grip:execute(pPlayer)
	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)

	if(BorForceUtility:canUseForcePower(pPlayer, pTarget, self) == false) then
		return
	end
	
	self:performAbility(pPlayer, fpi)
end

function BorForce_Grip:performAbility(pPlayer, fpi)
	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)
		
	if(BorForceUtility:canUseForcePower(pPlayer, pTarget, self) == false) then
		return
	end

	if(BorForceUtility:handleFPI(pPlayer, self, 2) == false) then
		return
	end
	
	local targetName = CreatureObject(pTarget):getFirstName() 

	local dc = math.floor(BorForceUtility:getRangeDC(pPlayer, pTarget, self))

	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_telekinesis"))
	local roll = math.floor(math.random(1,20))	

	local msg = CreatureObject(pPlayer):getFirstName().." attempts to use "..self.name.." on "..targetName.." "..BorForceUtility:rollSpam(roll, skillValue, dc)
	
	if((skillValue + roll >= dc and roll > 1) or roll == 20) then
		BorForceUtility:applyStatusEffect(pPlayer, pTarget, "immobilized", 1)
		msg = msg.." and succeeds, immobilising them!"

		if(roll == 20) then
			BorForceUtility:applyStatusEffect(pPlayer, pTarget, "stunned", 1)
			msg = msg.." additionally, "..targetName.." is also stunned!"
		end

		BorForceUtility:playAbilityEffects(pPlayer, pTarget, self)
	else
		msg = msg..BorForceUtility:rollSpam(roll, skillValue, dc).." and fails!"
	end
	
	broadcastMessageWithName(pPlayer, msg)
end