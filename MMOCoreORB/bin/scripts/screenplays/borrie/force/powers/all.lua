require("screenplays.roleplay.rp_utility")
require("screenplays.roleplay.rp_combat")

BorForceUtility = {

}

BorForce_BasePower = {
	name = "",
	tag = "",
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

function BorForce_BasePower:new(o)
	o = o or {}

	setmetatable(o, self)
    self.__index = self
    
    return o
end

function BorForce_BasePower:showHelp(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end

function BorForce_BasePower:execute(pPlayer)	
	local fpi = BorForceUtility:getForcePointInput(pPlayer, self)
	
	if(BorForceUtility:canUseForcePower(pPlayer, pPlayer, self) == false) then
		return
	end

	if(fpi < self.fpiMin) then
		BorForceUtility:promptForcePointInput(pPlayer, self, self.tag, "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_BasePower:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
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
	
	return math.min(self:getMaxFPI(pPlayer), inputPoints)
	
end

function BorForceUtility:getMaxFPI(pPlayer)
	if (pPlayer == nil) then
		return 0
	end

	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	
	if (pGhost == nil) then
		return 0
	end

	local forcePower = PlayerObject(pGhost):getForcePower()
	local forcePowerMax = PlayerObject(pGhost):getForcePowerMax()

	-- Default to 0 for non-FS / unawakened.
	local usableForce = 0

	if(CreatureObject(pPlayer):hasSkill("rp_force_prog_master")) then
		-- Master of the Force can use their entire Force bar.
		usableForce = forcePowerMax

	elseif(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_04")) then
		-- Journeyman Force users can use half of their Force bar.
		usableForce = math.floor(forcePowerMax * 0.5)

	elseif(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_03")) then
		-- Adept Force users can use a quarter of their Force bar.
		usableForce = math.floor(forcePowerMax * 0.25)

	elseif(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_02")) then
		-- Initiated Force users can use up to 5 FPI.
		usableForce = 5
	elseif(CreatureObject(pPlayer):hasSkill("rp_force_prog_rank_01")) then 
		-- Aware Force users can use up to 2 FPI.
		usableForce = 2
	end

	-- Return either the usable Force, or the available Force if lower.
	return math.min(usableForce, forcePower)

end

function BorForceUtility:promptForcePointInput(pPlayer, power, screenplay, callback)
	local pGhost = CreatureObject(pPlayer):getPlayerObject()
	
	if (pGhost == nil) then
		return
	end

	local forcePower = PlayerObject(pGhost):getForcePower()	
	
	local fpiMax = 999
	local fpiMin = 1

	if (power.fpiMax ~= 999) then
		fpiMax = power.fpiMax
	end

	if (power.fpiMin ~= 1) then
		fpiMin = power.fpiMin
	end

	local usableForcePower = math.floor(math.min(fpiMax, BorForceUtility:getMaxFPI(pPlayer)) - fpiMin)
	
	local suiManager = LuaSuiManager()
	local optionsTo = {"Force Pool", usableForcePower, 1}
	local optionsFrom = {"Applied Power", fpiMin, 1}	
	suiManager:sendTransferBox(pPlayer, pPlayer, "Force Point Input", power.name .. ": How many force points do you wish to commit to using this power?", "Okay", screenplay, callback, optionsFrom, optionsTo)	
end