BorForce_ManipulateObject = BorForce_BasePower:new({
	name = "Manipulate Object",
	requiredSkills = {"rp_telekinesis_novice"},

	selfAnim = "force_choke",

	helpString = "Allows the user to move an object through the Force. Roll Telekinesis + FPI vs a DC that is determined by the complexity of the manipulation, and the size of the object.",
})

function BorForce_ManipulateObject:showHelp(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end

function BorForce_ManipulateObject:execute(pPlayer)
	local fpi = BorForceUtility:getForcePointInput(pPlayer, self)
	
	if(BorForceUtility:canUseForcePower(pPlayer, pPlayer, self) == false) then
		return
	end
	
	if(fpi < self.fpiMin) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_ManipulateObject", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_ManipulateObject:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_ManipulateObject:performAbility(pPlayer, fpi)
	if(BorForceUtility:canUseForcePower(pPlayer, pPlayer, self) == false) then
		return
	end
	
	if(BorForceUtility:handleFPI(pPlayer, self, fpi) == false) then
		return
	end

	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_telekinesis"))
	local roll = math.floor(math.random(1,20))	
		
	local msg = CreatureObject(pPlayer):getFirstName().." uses "..self.name.."!"
	msg = msg .. "They attempt to move an object through the Force! " .. BorForceUtility:rollSpamFPINoDC(roll, skillValue, fpi)
	
	BorForceUtility:playAbilityEffects(pPlayer, pPlayer, self)
end