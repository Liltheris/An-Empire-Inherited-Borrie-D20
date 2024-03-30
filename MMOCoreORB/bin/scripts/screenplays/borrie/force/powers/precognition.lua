BorForce_Precognition = BorForce_BasePower:new({
	name = "Precognition",
	requiredSkills = {"rp_ability_legendary_precognition"},

	targetSelf = true,

	helpString = "Roll Sense + FPI vs DC 30. On success,  may provide a glimpse of the future, or an accurate view of past events.\n\\#FF0000Due to the nature of this power, it can only be performed with DM validation."
})

function BorForce_Precognition:showHelp(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end

function BorForce_Precognition:execute(pPlayer)
	local fpi = BorForceUtility:getForcePointInput(pPlayer, power)

	if(BorForceUtility:canUseForcePower(pPlayer, pPlayer, self) == false) then
		return
	end
	
	if(fpi < self.fpiMin) then
		BorForceUtility:promptForcePointInput(pPlayer, self, "BorForce_Precognition", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Precognition:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Precognition:performAbility(pPlayer, fpi)
	if(BorForceUtility:canUseForcePower(pPlayer, pTarget, self) == false) then
		return
	end

	if(BorForceUtility:handleFPI(pPlayer, self, fpi) == false) then
		return
	end
	
	local dc = 30

	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_sense"))
	local roll = math.floor(math.random(1,20))	

	local msg = CreatureObject(pPlayer):getFirstName() .. " uses " .. self.name .. " "..BorForceUtility:rollSpamFPI(roll, skillValue, fpi, dc)

	if((skillValue + roll >= dc and roll > 1) or roll == 20) then
		msg = msg .. " and gains insight into the future, or reveals the past..."
	else
		msg = msg .. " and fails. They do not sense what the future holds, or what has happened before."
	end
	broadcastMessageWithName(pPlayer, msg)
end