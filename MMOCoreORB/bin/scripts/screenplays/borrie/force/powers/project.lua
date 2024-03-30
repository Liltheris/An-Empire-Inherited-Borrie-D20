BorForce_Project = BorForce_BasePower:new({
	name = "Force Project",
	requiredSkills = {"rp_ability_projectimage"},

	selfAnim = "force_illusion",

	fpiMin = 1,
	fpiMax = 15,

	targetSelf = true,

	helpString = "Projects an image of the user away from their current location. The next attack against the user must beat FPI * 2 to hit instead of the range DC. "
})

function BorForce_Project:showHelp(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end

function BorForce_Project:execute(pPlayer)
	local fpi = BorForceUtility:getForcePointInput(pPlayer, self)

	if(BorForceUtility:canUseForcePower(pPlayer, pPlayer, self) == false) then
		return
	end
	
	if(fpi < self.fpiMin) then
		BorForceUtility:promptForcePointInput(pPlayer, self, "BorForce_Project", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Project:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Project:performAbility(pPlayer, fpi)
	if(BorForceUtility:canUseForcePower(pPlayer, pTarget, self) == false) then
		return
	end

	if(BorForceUtility:handleFPI(pPlayer, self, fpi) == false) then
		return
	end

	local dc = 10

	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_alter"))
	local roll = math.floor(math.random(1,20))	

	local msg = CreatureObject(pPlayer):getFirstName() .." uses "..self.name.. " "..BorForceUtility:rollSpam(roll, skillValue, dc)

	if((skillValue + roll >= dc and roll > 1) or roll == 20) then

		msg = msg.." and succeeds! They become hard to focus on, seeming to be in two places at the same time. The DC of the next attack against them is now ".. fpi*2 .."!"
		SceneObject(pPlayer):setStoredInt("project_dc", fpi)
		SceneObject(pPlayer):setStoredInt("project_timer", 2)
	else
		msg = msg.." and fails!"
	end
	
	BorForceUtility:playAbilityEffects(pPlayer, pPlayer, self)
	broadcastMessageWithName(pPlayer, msg)	
end