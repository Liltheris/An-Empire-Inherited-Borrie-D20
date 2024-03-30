function table.copy(t)
	local t2 = {};
	for k,v in pairs(t) do
		if type(v) == "table" then
			t2[k] = table.copy(v);
		else
			t2[k] = v;
		end
	end
	return t2;
end

BorForceUtility = {

}

BorForce_BasePower = {
	name = "",
	requiredSkills = {},

	action = "Minor",

	selfEffect = "",
	selfAnim = "",
	targetEffect = "",
	targetAnim = "",
	combatAnim = "",

	minRange = -1,
	idealRange = -1,
	farRange = -1,
	maxRange = -1,

	targetSelf = false,
	targetCount = 1,

	fpiMin = 1,
	fpiMax = 999,

	corruptionPoints = 0,

	helpString = "",
}

function BorForce_BasePower:new(newData)
	local outData = table.copy(self)

	if(newData.name ~= nil) then
		outData.name = newData.name
	end

	if(newData.requiredSkills ~= nil) then
		outData.requiredSkills = newData.requiredSkills
	end

	if(newData.action ~= nil) then
		outData.action = newData.action
	end

	if(newData.selfEffect ~= nil) then
		outData.selfEffect = newData.selfEffect
	end

	if(newData.selfAnim ~= nil) then
		outData.selfAnim = newData.selfAnim
	end

	if(newData.targetAnim ~= nil) then
		outData.targetAnim = newData.targetAnim
	end

	if(newData.combatAnim ~= nil) then
		outData.combatAnim = newData.combatAnim
	end

	if(newData.minRange ~= nil) then
		outData.minRange = newData.minRange
	end

	if(newData.idealRange ~= nil) then
		outData.idealRange = newData.idealRange
	end

	if(newData.farRange ~= nil) then
		outData.farRange = newData.farRange
	end

	if(newData.maxRange ~= nil) then
		outData.maxRange = newData.maxRange
	end

	if(newData.targetSelf ~= nil) then
		outData.targetSelf = newData.targetSelf
	end

	if(newData.targetCount ~= nil) then
		outData.targetCount = newData.targetCount
	end

	if(newData.fpiMin ~= nil) then
		outData.fpiMin = newData.fpiMin
	end

	if(newData.fpiMax ~= nil) then
		outData.fpiMax = newData.fpiMax
	end

	if(newData.corruptionPoints ~= nil) then
		outData.corruptionPoints = newData.corruptionPoints
	end

	if(newData.helpString ~= nil) then
		outData.helpString = newData.helpString
	end

	return outData
end

function BorForceUtility:displayHelp(power, pPlayer)
	local msg = power.name..": "

	--Show ranges, if we are not self-targeting.
	if (power.targetSelf == false) then
		msg = msg .. "\nRanges: ("
		if (power.minRange ~= -1) then
			msg = msg .. "Min: "..power.minRange..", " 
			msg = msg .. "Ideal: "..power.idealRange.." - "..power.farRange..", "
			msg = msg .. "Max: "..power.maxRange..")"
		end
	else
		msg = msg .. "\nSelf-targeting"
	end

	--FPI costs
	if(power.fpiMin ~= 1) then
		msg = msg .. "\nMinimum FPI: "..power.fpiMin
	end
	if(power.fpiMax ~= 999) then
		msg = msg .. "\nMaximum FPI: "..power.fpiMax
	end

	--Corruption
	if(power.corruptionPoints ~= 0) then
		msg = msg .. "\nCorruption: "..power.corruptionPoints
		if(power.targetCount > 1) then
			msg = msg .. " per target hit."
		end
	end

	msg = msg.."\nAction type: "..power.action

	msg = msg.."\n"..power.helpString

	--Output the final message
	CreatureObject(pPlayer):sendSystemMessage(msg)
end

function BorForceUtility:applyStatusEffect(caster, target, status, duration)
	if(status == "stunned") then
		CreatureObject(target):setState(STUNNED)

	elseif(status == "blinded") then
		CreatureObject(target):setState(BLINDED)

	elseif(status == "immobilized") then
		CreatureObject(target):setState(IMMOBILIZED)

	elseif(status == "onfire") then
		CreatureObject(target):setState(ONFIRE)

	elseif(status == "bleeding") then
		CreatureObject(target):setState(BLEEDING)
	else
		CreatureObject(caster):sendSystemMessage("Error: failed to apply "..status.." to target!")
		return false
	end

	--Apply the timer for the status.
	SceneObject(target):setStoredInt("state_"..status.."_duration", duration)

	return true
end

function BorForceUtility:rollSpam(roll, bonus, dc)
	rollString = ""

	if (roll == 20) then
		rollString = "\\#00FF00"..roll.."\\#DBDBDB"
	elseif (roll == 1) then
		rollString = "\\#FF0000"..roll.."\\#DBDBDB"
	else
		rollString = rollString..roll
	end

	return "\\#DBDBDB(1d20: "..rollString.." + "..bonus.." = "..roll+bonus.." vs DC: "..dc..")\\#FFFFFF"
end

function BorForceUtility:rollSpamFPI(roll, bonus, fpi, dc)
	rollString = ""

	if (roll == 20) then
		rollString = "\\#00FF00"..roll.."\\#DBDBDB"
	elseif (roll == 1) then
		rollString = "\\#FF0000"..roll.."\\#DBDBDB"
	else
		rollString = rollString..roll
	end

	return "\\#DBDBDB(1d20: "..roll.." + "..bonus.." + \\#FF00FF"..fpi.."\\#DBDBDB = "..roll+bonus+fpi.." vs DC: "..dc..")\\#FFFFFF"
end

function BorForceUtility:rollSpamNoDC(roll, bonus)
	rollString = ""

	if (roll == 20) then
		rollString = "\\#00FF00"..roll.."\\#DBDBDB"
	elseif (roll == 1) then
		rollString = "\\#FF0000"..roll.."\\#DBDBDB"
	else
		rollString = rollString..roll
	end

	return "\\#DBDBDB(1d20: "..roll.." + "..bonus.." = "..roll+bonus..")\\#FFFFFF"
end

function BorForceUtility:rollSpamFPINoDC(roll, bonus, fpi)
	rollString = ""

	if (roll == 20) then
		rollString = "\\#00FF00"..roll.."\\#DBDBDB"
	elseif (roll == 1) then
		rollString = "\\#FF0000"..roll.."\\#DBDBDB"
	else
		rollString = rollString..roll
	end

	return "\\#DBDBDB(1d20: "..roll.." + "..bonus.." + \\#FF00FF"..fpi.."\\#DBDBDB = "..roll+bonus+fpi..")\\#FFFFFF"
end

function BorForceUtility:handleFPI(pPlayer, power, fpi)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()

	if (pGhost == nil) then
		return false
	end
	
	local forcePower = math.floor(PlayerObject(pGhost):getForcePower())

	fpi = math.floor(fpi)
	
	if(forcePower < fpi) then
		CreatureObject(pPlayer):sendSystemMessage("You don't have enough Force Power to commit ".. fpi .." points.")
		return false
	end

	PlayerObject(pGhost):setForcePower(forcePower - fpi)

	return true
end

function BorForceUtility:playAbilityEffects(pPlayer, pTarget, power)
	if(power.combatAnim ~= "") then
		CreatureObject(pPlayer):doCombatAnimation(pPlayer, pTarget, power.combatAnim)
	else
		--Play effects
		if(power.selfEffect ~= "") then
			CreatureObject(pPlayer):playEffect(power.selfEffect, "")	
		end
		if(power.targetEffect ~= "") then
			CreatureObject(pTarget):playEffect(power.targetEffect, "")	
		end

		--Play anims
		if(power.selfAnim ~= "") then
			CreatureObject(pPlayer):doAnimation(power.selfAnim)
		end
		if(power.targetAnim ~= "") then
			CreatureObject(pTarget):doAnimation(power.targetAnim)
		end
	end
end

function BorForceUtility:getForcePointInput(pPlayer, power) 
	if(pPlayer ~= nil) then

		local fpiMax = 999

		if (power.fpiMax ~= 999) then
			fpiMax = power.fpiMax
		end

		local input = SceneObject(pPlayer):getStoredInt("force_command_fpi")

		return math.floor(math.min(self:capMaximumAllowedForcePoints(pPlayer, input), fpiMax))
	else
		return 0
	end
end

function BorForceUtility:canUseForcePower(pPlayer, pTarget, power)

	local hasRequiredSkill = false

	for i = 1, #power.requiredSkills, 1 do
		if (CreatureObject(pPlayer):hasSkill(power.requiredSkills[i])) then
			hasRequiredSkill = true
		end
	end

	if(hasRequiredSkill == false) then
		CreatureObject(pPlayer):sendSystemMessage("You lack the knowledge to use "..power.name..".")
		return false
	end

	if((pTarget == nil or SceneObject(pTarget):isCreatureObject() == false) and power.targetSelf == false) then
		CreatureObject(pPlayer):sendSystemMessage("You require a valid target to use "..power.name..".")
		return false
	end

	if(pTarget == pPlayer and power.targetSelf == false) then
		CreatureObject(pPlayer):sendSystemMessage("You cannot use "..power.name.." on yourself.")
		return false
	end

	if(power.targetSelf == false) then
		if(SceneObject(pPlayer):getDistanceTo(pTarget) < power.minRange) then
			CreatureObject(pPlayer):sendSystemMessage("You are too close to your target to use "..power.name..".")
			return false
		end

		if(SceneObject(pPlayer):getDistanceTo(pTarget) > power.maxRange) then
			CreatureObject(pPlayer):sendSystemMessage("You are too far way from your target to use "..power.name..".")
			return false
		end
	end

	return true
end

function BorForceUtility:getRangeDC(pPlayer, pTarget, power)
	local dc = 99

	if (SceneObject(pPlayer):getDistanceTo(pTarget) < power.idealRange) then
		dc = 15
	elseif (SceneObject(pPlayer):getDistanceTo(pTarget) < power.farRange) then
		dc = 10
	elseif (SceneObject(pPlayer):getDistanceTo(pTarget) < power.maxRange) then
		dc = 20
	end

	return dc
end

function BorForceUtility:reportPowerNotKnown(pPlayer)
	CreatureObject(pPlayer):sendSystemMessage("You don't have the pre-requisites to use this force power.")
end

function BorForceUtility:capMaximumAllowedForcePoints(pPlayer, inputPoints)
	if(inputPoints == 0) then 
		return 0
	end
	
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	
	if (pGhost == nil) then
		return 0
	end
	
	local forcePowerMax = PlayerObject(pGhost):getForcePowerMax()	
	
	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_master")) then -- Master of the Force
		return math.min(PlayerObject(pGhost):getForcePowerMax(), inputPoints)
	elseif(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_04")) then -- Journeyman
		return math.min(PlayerObject(pGhost):getForcePowerMax() / 2, inputPoints)
	elseif(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_03")) then -- Adept
		return math.min(PlayerObject(pGhost):getForcePowerMax() / 4, inputPoints)
	elseif(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_02")) then -- Initiated
		return math.min(2, inputPoints)
	elseif(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01")) then -- Aware
		return 1
	elseif(CreatureObject(pPlayer):hasSkill("rp_force_prog_novice")) then -- Force Sensitive
		return 0
	else 
		return 0
	end
	
end

function BorForceUtility:promptForcePointInput(pPlayer, power, screenplay, callback)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	
	if (pGhost == nil) then
		return
	end

	local forcePower = PlayerObject(pGhost):getForcePower()	
	
	local fpiMax = 999
	local fpiMin = 0

	if (power.fpiMax ~= 999) then
		fpiMax = power.fpiMax
	end

	if (power.fpiMin ~= 0) then
		fpiMin = power.fpiMin
	end

	local usableForcePower = math.floor(math.min(self:capMaximumAllowedForcePoints(pPlayer, forcePower), fpiMax))
	
	local suiManager = LuaSuiManager()
	local optionsTo = {"Force Pool", usableForcePower, 1}
	local optionsFrom = {"Applied Power", fpiMin, 1}	
	suiManager:sendTransferBox(pPlayer, pPlayer, "Force Point Input", power.name .. ": How many force points do you wish to commit to using this power?", "Okay", screenplay, callback, optionsFrom, optionsTo)	
end