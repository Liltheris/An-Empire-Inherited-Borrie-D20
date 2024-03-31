BorForce_Jump = BorForce_BasePower:new({
	name = "Force Jump",
	requiredSkills = {"rp_alter_a01"},

	selfEffect = "clienteffect/pl_force_jump.cef",
	selfAnim = "jump",

	targetSelf = true,

	helpString = "Jump to any location within FPI * 4 meters range, and remove any movement impairing effects.",
})

function BorForce_Jump:showHelp(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end

function BorForce_Jump:execute(pPlayer)
	local fpi = BorForceUtility:getForcePointInput(pPlayer, self)
	
	if(BorForceUtility:canUseForcePower(pPlayer, pPlayer, self) == false) then
		return
	end
	
	if(fpi < self.fpiMin) then
		BorForceUtility:promptForcePointInput(pPlayer, self, "BorForce_Jump", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Jump:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Jump:performAbility(pPlayer, fpi)
	if(BorForceUtility:canUseForcePower(pPlayer, pPlayer, self) == false) then
		return
	end
	
	if(BorForceUtility:handleFPI(pPlayer, self, fpi) == false) then
		return
	end
		
	local msg = CreatureObject(pPlayer):getFirstName().." uses "..self.name.."!"
	msg = msg.." They can jump up to \\#FF00FF"..fpi * 4 .."\\#FFFFFF meters, and clear all movement impairing effects."
	
	--TO DO: Added status effect clearing.

	BorForceUtility:playAbilityEffects(pPlayer, pPlayer, self)
	broadcastMessageWithName(pPlayer, msg)
end
