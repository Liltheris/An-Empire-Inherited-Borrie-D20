RpCombat = {}

function RpCombat:applyStatusEffect(caster, target, status, duration)
	if(status == "stunned") then
		CreatureObject(target):setState(STUNNED)
		CreatureObject(target):sendSystemMessage("You have been stunned!")

	elseif(status == "blinded") then
		CreatureObject(target):setState(BLINDED)
		CreatureObject(target):sendSystemMessage("You have been blinded!")

	elseif(status == "immobilized") then
		CreatureObject(target):setState(IMMOBILIZED)
		CreatureObject(target):sendSystemMessage("You have been immobilised!")

	elseif(status == "onfire") then
		CreatureObject(target):setState(ONFIRE)
		CreatureObject(target):sendSystemMessage("You have been set on fire!")

	elseif(status == "bleeding") then
		CreatureObject(target):setState(BLEEDING)
		CreatureObject(target):sendSystemMessage("You have are now bleeding!")
	else
		CreatureObject(caster):sendSystemMessage("Error: failed to apply "..status.." to target!")
		return false
	end

	--Apply the timer for the status.
	SceneObject(target):setStoredInt("state_"..status.."_duration", duration)

	return true
end

function RpCombat:removeStatusEffect(caster, target, status)
	if(status == "stunned") then
		CreatureObject(target):clearState(STUNNED)
		CreatureObject(target):sendSystemMessage("You are no longer stunned!")

	elseif(status == "blinded") then
		CreatureObject(target):clearState(BLINDED)
		CreatureObject(target):sendSystemMessage("You are no longer blinded!")

	elseif(status == "immobilized") then
		CreatureObject(target):clearState(IMMOBILIZED)
		CreatureObject(target):sendSystemMessage("You are no longer immobilised!")

	elseif(status == "onfire") then
		CreatureObject(target):clearState(ONFIRE)
		CreatureObject(target):sendSystemMessage("You are no longer on fire!")

	elseif(status == "bleeding") then
		CreatureObject(target):clearState(BLEEDING)
		CreatureObject(target):sendSystemMessage("You are no longer bleeding!")
	else
		CreatureObject(caster):sendSystemMessage("Error: failed to remove "..status.." to target!")
		return false
	end

	--Apply the timer for the status.
	SceneObject(target):setStoredInt("state_"..status.."_duration", -1)

	return true
end

function RpCombat:getRangeDC(pPlayer, pTarget, rangeData)
	local dc = 99

	if (SceneObject(pPlayer):getDistanceTo(pTarget) < rangeData.idealRange) then
		dc = 15
	elseif (SceneObject(pPlayer):getDistanceTo(pTarget) < rangeData.farRange) then
		dc = 10
	elseif (SceneObject(pPlayer):getDistanceTo(pTarget) < rangeData.maxRange) then
		dc = 20
	end

	return dc
end