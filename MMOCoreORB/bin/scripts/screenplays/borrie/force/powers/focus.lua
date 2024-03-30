BorForce_Focus = BorForce_BasePower:new({
	name = "Force Focus",
	requiredSkills = {"rp_inward_a03"},

	selfEffect = "clienteffect/pl_force_feedback_self.cef",
	targetSelf = true,

	helpString = "Use to replace your next non-social, non-combat skill roll with the result of your Inward roll + FPI."
})

function BorForce_Focus:showHelp(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end

function BorForce_Focus:execute(pPlayer)
	local fpi = BorForceUtility:getForcePointInput(pPlayer)

	if(BorForceUtility:canUseForcePower(pPlayer, pPlayer, self) == false) then
		return
	end
	
	if(fpi < self.fpiMin) then
		BorForceUtility:promptForcePointInput(pPlayer, self, "BorForce_Focus", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Focus:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Focus:performAbility(pPlayer, fpi)
	if(BorForceUtility:canUseForcePower(pPlayer, pTarget, self) == false) then
		return
	end

	if(BorForceUtility:handleFPI(pPlayer, self, fpi) == false) then
		return
	end
	
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_inward"))
	local roll = math.floor(math.random(1,20))	

	local msg = CreatureObject(pPlayer):getFirstName() .. " uses " .. self.name .. "!"

	msg = msg.." Their next non-social, non-combat skill roll will be replaced with "..BorForceUtility:rollSpamFPINoDC(roll, skillValue, fpi).."!"

	CreatureObject(pPlayer):setStoredInt("focus_roll", roll+skillValue+fpi)
	
	BorForceUtility:playAbilityEffects(pPlayer, pPlayer, self)
	broadcastMessageWithName(pPlayer, msg)
end