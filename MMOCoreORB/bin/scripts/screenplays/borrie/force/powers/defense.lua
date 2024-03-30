BorForce_Defense = BorForce_BasePower:new({
	name = "Force Defense",
	requiredSkills = {"rp_ability_forcedefense"},

	selfEffect = "clienteffect/pl_force_shield_self.cef",
	selfAnim = "force_protection",

	targetSelf = true,

	helpString = "Roll inward against 5 + half of the Force Points used. On success, the next attack against the user will absorb 1 damage per force point used.",
})

function BorForce_Defense:showHelp(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end

function BorForce_Defense:execute(pPlayer)
	local fpi = BorForceUtility:getForcePointInput(pPlayer, self)

	if(BorForceUtility:canUseForcePower(pPlayer, pPlayer, self) == false) then
		return
	end
	
	if(fpi < self.fpiMin) then
		BorForceUtility:promptForcePointInput(pPlayer, self, "BorForce_Defense", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_Defense:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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

function BorForce_Defense:performAbility(pPlayer, fpi)
	if(BorForceUtility:canUseForcePower(pPlayer, pTarget, self) == false) then
		return
	end

	if(BorForceUtility:handleFPI(pPlayer, self, fpi) == false) then
		return
	end

	local dc = 5 + math.floor((fpi / 2)+0.5)
	
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_inward"))
	local roll = math.floor(math.random(1,20))
	
	local message = CreatureObject(pPlayer):getFirstName() .. " uses " .. self.name .. "!"
	
	if(roll + skillValue >= dc) then
		SceneObject(pPlayer):setStoredInt("force_defense", fpi)
		message = message .. " The Force surrounds them, protecting them from up to \\#FF00FF" .. fpi .. "\\#FFFFFF damage on the next attack against them."
	else
		SceneObject(pPlayer):setStoredInt("force_defense", 0)
		message = message .. " They attempt to protect themself against incoming attacks, but fail!"
	end
	message = message .. BorForceUtility:rollSpam(roll, skillValue, dc)

	broadcastMessageWithName(pPlayer, message)
end