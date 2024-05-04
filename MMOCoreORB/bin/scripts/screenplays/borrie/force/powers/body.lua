BorForce_Body = BorForce_BasePower:new {
	name = "Force Body",
	tag = "BorForce_Body",

	requiredSkills = {"rp_ability_forcebody", "rp_training_jedi_guardian_01"},
	selfEffect = "clienteffect/pl_force_heal_self.cef",

	targetSelf = true,

	helpString = "Roll Alter, DC 10. On success, restores 1 Action Point for every Force Point invested."
}

function BorForce_Body:performAbility(pPlayer, fpi)
	if(BorForceUtility:canUseForcePower(pPlayer, pPlayer, self) == false) then
		return
	end

	if(BorForceUtility:handleFPI(pPlayer, self, fpi) == false) then
		return
	end
	
	local dc = 10

	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_inward"))
	local roll = math.floor(math.random(1,20))	
		
	local msg = CreatureObject(pPlayer):getFirstName().." used "..self.name.."!"

	if((skillValue + roll >= dc and roll > 1) or roll == 20) then
		msg = msg .. " They rejuvinate themselves for \\#FF00FF"..fpi.."\\#FFFFFF action points! "..BorForceUtility:rollSpam(roll, skillValue, dc)
		BorForceUtility:playAbilityEffects(pPlayer, pPlayer, self)

		CreatureObject(pPlayer):setHAM(3, math.min(CreatureObject(pPlayer):getHAM(3) + fpi, CreatureObject(pPlayer):getMaxHAM(3)))
	else 
		msg = msg .. " Unfortunately, their focus is broken, and they fail to rejuvinate themselves. "..BorForceUtility:rollSpam(roll, skillValue, dc)
	end
	
	broadcastMessageWithName(pPlayer, msg)
end