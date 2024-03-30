BorForce_Crush = BorForce_BasePower:new({
	name = "Force Crush",
	requiredSkills = {"rp_ability_frocecrush"},
	combatAnim = "force_choke_1_particle_level_1",

	action = "Major",

	minRange = 0,
	idealRange = 1,
	farRange = 20,
	maxRange = 32,

	fpiMin = 1,
	fpiMax = 10,

	corruptionPoints = 2,

	helpString = "Crush the target for 1 point of kinetic damage for every Force point invested. If used on a living target, gain two points of dark side corruption.",
})

function BorForce_Crush:showHelp(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end

function BorForce_Crush:execute(pPlayer)
	local fpi = BorForceUtility:getForcePointInput(pPlayer, self)

	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)

	if(BorForceUtility:canUseForcePower(pPlayer, pTarget, self) == false) then
		return
	end
	
	if(fpi < self.fpiMin) then
		BorForceUtility:promptForcePointInput(pPlayer, self, "BorForce_Crush", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Crush:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Crush:performAbility(pPlayer, fpi)
	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)
		
	if(BorForceUtility:canUseForcePower(pPlayer, pTarget, self) == false) then
		return
	end

	if(BorForceUtility:handleFPI(pPlayer, self, fpi) == false) then
		return
	end
	
	local targetName = CreatureObject(pTarget):getFirstName() 
	local dc = math.floor(BorForceUtility:getRangeDC(pPlayer, pTarget, self))

	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_telekinesis"))
	local roll = math.floor(math.random(1,20))	

	local msg = CreatureObject(pPlayer):getFirstName().." attempts to use "..self.name.." on "..targetName.." "

	if((skillValue + roll >= dc and roll > 1) or roll == 20) then
		local damage = math.floor(math.random(1,dieType) + fpi)
		local hitSlot = math.floor(math.random(1,10))
		local damageString = applyAdjustedHealthDamage(pTarget, "kinetic", damage, hitSlot)

		msg = msg..BorForceUtility:rollSpam(roll, skillValue, dc).." and succeeds, crushing them for 1d"..dieType.."+"..fpi.." = "..damageString.." damage!"
		BorForceUtility:playAbilityEffects(pPlayer, pTarget, self)

		-- ObjectTypes 1026 is droids, 1027 is probe droids (god knows why they are seperate. #SOE)
		if(CreatureObject(pTarget):getGameObjectType() ~= 1026 and CreatureObject(pTarget):getGameObjectType() ~= 1027) then
			BorForce:addCorruptionPoints(pPlayer, self.corruptionPoints)
		end
	else
		msg = msg..BorForceUtility:rollSpam(roll, skillValue, dc).." and fails!"
	end

end