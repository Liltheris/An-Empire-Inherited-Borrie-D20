BorForce_Sight = BorForce_MeditatePower:new({
	name = "Force Sight",

	selfAnim = "force_persuasion",

	targetSelf = true,

	helpString = "All characters within 50 meters of the user must roll Stealth versus the user's Sense roll + FPI. Additionally, clears the blinded status effect.",
})

function BorForce_Sight:showHelp(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end

function BorForce_Sight:execute(pPlayer)
	local fpi = BorForceUtility:getForcePointInput(pPlayer, self)

	if(BorForceUtility:canUseForcePower(pPlayer, pPlayer, self) == false) then
		return
	end
	
	if(fpi < self.fpiMin) then
		BorForceUtility:promptForcePointInput(pPlayer, self, "BorForce_Sight", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Sight:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Sight:performAbility(pPlayer, fpi)
	if(BorForceUtility:canUseForcePower(pPlayer, pPlayer, self) == false) then
		return
	end
	
	if(BorForceUtility:handleFPI(pPlayer, self, fpi) == false) then
		return
	end
	
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_sense"))
	local roll = math.floor(math.random(1,20))
	
	local msg = CreatureObject(pPlayer):getFirstName() .. " uses " .. self.name .. "!"
			

		msg = msg .. " They listen to the Force, attempting to reveal what they cannot see. "..BorForceUtility:rollSpamFPINoDC(roll, skillValue, fpi)
		msg = msg .. " All stealthed characters within 50 meters must roll stealth against their roll result to remain stealthed."
	
	broadcastMessageWithName(pPlayer, msg)
	
	BorForceUtility:playAbilityEffects(pPlayer, pPlayer, self)
end