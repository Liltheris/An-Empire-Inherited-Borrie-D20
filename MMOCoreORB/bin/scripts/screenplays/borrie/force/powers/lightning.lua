BorForce_Lightning = BorForce_BasePower:new({
	name = "Force Lightning",
	requiredSkills = {"rp_lightning_a03"},
	combatAnim = "force_lightning_1_particle_level_3",

	minRange = 0,
	idealRange = 1,
	farRange = 12,
	maxRange = 20,

	corruptionPoints = 1,

	helpString = "Roll Lightning versus a scaling range DC. On success, does 1d2 - 1d12 + 1 electricity damage per Force point invested."
})

function BorForce_Lightning:showHelp(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end

function BorForce_Lightning:execute(pPlayer)
	local fpi = BorForceUtility:getForcePointInput(pPlayer, self)

	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)
	
	if(BorForceUtility:canUseForcePower(pPlayer, pTarget, self) == false) then
		return
	end
	
	if(fpi < self.fpiMin) then
		BorForceUtility:promptForcePointInput(pPlayer, self, "BorForce_Lightning", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Lightning:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Lightning:performAbility(pPlayer, fpi)

	if(BorForceUtility:handleFPI(pPlayer, self, fpi) == false) then
		return
	end
	
	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)
		
	BorForceUtility:canUseForcePower(pPlayer, pTarget, self)
	
	local targetName = CreatureObject(pTarget):getFirstName() 
	local dc = math.floor(BorForceUtility:getRangeDC(pPlayer, pTarget, self))

	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_lightning"))
	local dieType = math.floor(skillValue/2)
	local roll = math.floor(math.random(1,20))	

	local msg = CreatureObject(pPlayer):getFirstName().." attempts to use "..self.name.." on "..targetName.." "

	if((skillValue + roll >= dc and roll > 1) or roll == 20) then
		local damage = math.floor(math.random(1,dieType) + fpi)
		local hitSlot = math.floor(math.random(1,10))
		--local damageString = applyAdjustedHealthDamage(pTarget, "electricity", damage, hitSlot)
		local damageString = applyAdjustedHealthDamage(hitSlot, damage, "electricity", pTarget)

		msg = msg..BorForceUtility:rollSpam(roll, skillValue, dc).." and hits, shocking them with a bolt of lightning, dealing 1d"..dieType.."+"..fpi.." = "..damageString.." damage!"
		BorForceUtility:playAbilityEffects(pPlayer, pTarget, self)
		BorForce:addCorruptionPoints(pPlayer, self.corruptionPoints)
	else
		msg = msg..BorForceUtility:rollSpam(roll, skillValue, dc).." and fails!"
	end

	broadcastMessageWithName(pPlayer, msg)
end