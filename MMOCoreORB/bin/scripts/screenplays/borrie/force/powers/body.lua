BorForce_Body = BorForce_BasePower:new({
	name = "Force Body",
	requiredSkills = {"rp_ability_forcebody", "rp_training_jedi_guardian_01"},
	selfEffect = "clienteffect/pl_force_heal_self.cef",

	targetSelf = true,

	helpString = "Roll Alter, DC 10. On success, restores 1 Action Point for every Force Point invested."
})

function BorForce_Body:showHelp(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end

function BorForce_Body:execute(pPlayer)	
	local fpi = BorForceUtility:getForcePointInput(pPlayer, self)
	
	if(BorForceUtility:canUseForcePower(pPlayer, pPlayer, self) == false) then
		return
	end

	if(fpi < self.fpiMin) then
		BorForceUtility:promptForcePointInput(pPlayer, self, "BorForce_Body", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Body:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Body:performAbility(pPlayer, fpi)

	if(BorForceUtility:handleFPI(pPlayer, self, fpi) == false) then
		return
	end
	
	local dc = 10

	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_inward"))
	local roll = math.floor(math.random(1,20))	
		
	local msg = CreatureObject(pPlayer):getFirstName().." used "..self.name.."!"

	if((skillValue + roll >= dc and roll > 1) or roll == 20) then
		msg = msg .. " They rejuvinate themselves for "..fpi.." action points! "..BorForceUtility:rollSpam(roll, skillValue, dc)
		BorForceUtility:playAbilityEffects(pPlayer, pPlayer, self)

		CreatureObject(pPlayer):setHAM(3, math.min(CreatureObject(pPlayer):getHAM(3) + fpi, CreatureObject(pPlayer):getMaxHAM(3)))
	else 
		msg = msg .. " Unfortunately, their focus is broken, and they fail to rejuvinate themselves. "..BorForceUtility:rollSpam(roll, skillValue, dc)
	end
	
	broadcastMessageWithName(pPlayer, msg)
end