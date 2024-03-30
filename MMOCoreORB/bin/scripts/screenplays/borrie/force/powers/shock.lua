BorForce_Shock = BorForce_BasePower:new({
	name = "Force Shock",
	requiredSkills = {"rp_lightning_novice"},

	combatAnim = "force_lightning_1_particle_level_1_medium",

	minRange = 0,
	idealRange = 1,
	farRange = 12,
	maxRange = 20,

	corruptionPoints = 1,

	helpString = "",
})

function BorForce_Shock:showHelp(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end

function BorForce_Shock:execute(pPlayer)
	local fpi = BorForceUtility:getForcePointInput(pPlayer, self)

	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)
	
	if(BorForceUtility:canUseForcePower(pPlayer, pTarget, self) == false) then
		return
	end
	
	if(fpi < self.fpiMin) then
		BorForceUtility:promptForcePointInput(pPlayer, self, "BorForce_Shock", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Shock:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Shock:performAbility(pPlayer, fpi)
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

	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_lightning"))
	local roll = math.floor(math.random(1,20))

	local msg = CreatureObject(pPlayer):getFirstName() .. " uses " .. self.name

	if((skillValue + roll >= dc and roll > 1) or roll == 20) then
		msg = msg .. "! A flash of lightning extends from their fingertips and strikes "..targetName.." "..BorForceUtility:rollSpamFPI(roll, skillValue, fpi, dc)
		msg = msg .. ", leaving them stunned!"
		BorForceUtility:playAbilityEffects(pPlayer, pTarget, self)
	else
		msg = msg .. " but fails!" .. BorForceUtility:rollSpamFPI(roll, skillValue, fpi, dc)
	end
	
	broadcastMessageWithName(pPlayer, msg)
end