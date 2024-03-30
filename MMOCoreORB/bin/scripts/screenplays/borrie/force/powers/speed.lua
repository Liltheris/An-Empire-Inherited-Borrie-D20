BorForce_Speed = BorForce_BasePower:new({
	name = "Force Speed",
	requiredSkills = {"rp_alter_novice"},

	selfEffect = "clienteffect/pl_force_speed_self.cef",

	helpString = "Allows you to move an extra 2 meters per Force point spent. Alternatively, roll Alter + FPI vs DC30. On success, you may perform a second major action this turn.",
})

function BorForce_Speed:showHelp(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end

function BorForce_Speed:execute(pPlayer)
	local fpi = BorForceUtility:getForcePointInput(pPlayer, self)

	if(BorForceUtility:canUseForcePower(pPlayer, pPlayer, self) == false) then
		return
	end
	
	if(fpi < self.fpiMin) then
		BorForceUtility:promptForcePointInput(pPlayer, self, "BorForce_Speed", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Speed:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Speed:performAbility(pPlayer, fpi)
	if(BorForceUtility:canUseForcePower(pPlayer, pPlayer, self) == false) then
		return
	end
	
	if(BorForceUtility:handleFPI(pPlayer, self, fpi) == false) then
		return
	end
	
	local dc = 30

	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_alter"))
	local roll = math.floor(math.random(1,20))	
		
	local msg = CreatureObject(pPlayer):getFirstName() .. " uses " .. self.name .. "!"
	msg = msg .. " They can go up to " .. fpi * 2 .. " extra meters on their next move action"
	if((skillValue + roll >= dc and roll > 1) or roll == 20) then
		msg = msg .. " or they can perform a second major action! "..BorForceUtility:rollSpamFPI(roll, skillValue, fpi, dc)
	else 
		msg = msg .. "! They cannot perform a second major action. "..BorForceUtility:rollSpamFPI(roll, skillValue, fpi, dc)
	end
	
	broadcastMessageWithName(pPlayer, msg)
	
	BorForceUtility:playAbilityEffects(pPlayer, pPlayer, self)
end
