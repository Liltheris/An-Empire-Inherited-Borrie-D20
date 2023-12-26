BorForce_Defense = {
	name = "Force Defense",
	effectName = "clienteffect/pl_force_shield_self.cef",
}

function BorForce_Defense:showHelp(pPlayer)
	
end

function BorForce_Defense:execute(pPlayer)
	local hasPower = CreatureObject(pPlayer):hasSkill("rp_ability_forcedefense")
	
	if(hasPower == false) then
		BorForceUtility:reportPowerNotKnown(pPlayer)
		return
	end
	
	local fpi = BorForceUtility:getForcePointInput(pPlayer)
	
	if(fpi < 1) then
		BorForceUtility:promptForcePointInput(pPlayer, self.name, "BorForce_Defense", "onFPICallback")
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
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return
	end
	
	local forcePower = math.floor(PlayerObject(pGhost):getForcePower())
	
	fpi = math.floor(fpi)
	
	if(forcePower < fpi) then
		CreatureObject(pPlayer):sendSystemMessage("You don't have enough Force Power to commit " .. fpi .. " points.")
		return
	end
	
	--Execute Force Code
	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_inward"))
	local roll = math.floor(math.random(1,20))
	
	local message = CreatureObject(pPlayer):getFirstName() .. " used " .. self.name .. "!"
	
	if(roll + skillValue >= 5 + fpi / 2)
		SceneObject(pPlayer):setStoredInt("force_defense", fpi)
		message = message .. " The Force surrounds them, protecting them from up to " .. fpi .. " damage on the next attack against them."
	else
		SceneObject(pPlayer):setStoredInt("force_defense", 0)
		message = message .. " They attempt to protect themself against incoming attacks, but fail!"
	end
	message = message .. " (1d20 = " .. roll .. " + " .. skillValue .. " = " .. roll + skillValue .. " vs DC: " .. 5 + fpi / 2 .. ")"
	broadcastMessageWithName(pPlayer, message)
	
	--Drain Force Pool
	PlayerObject(pGhost):setForcePower(forcePower - fpi)	
	
end