BorForce_TwistMind = BorForce_BasePower:new({
	name = "Twist Mind",
	requiredSkills = {"rp_ability_legendary_twistmind"},

	combatAnim = "force_knockdown_1_arc_particle_level_1",

	minRange = 0,
	idealRange = 1,
	farRange = 20,
	maxRange = 32,

	fpiMin = 10,
	fpiMax = 100,

	corruptionPoints = 4,

	helpString = "Twists the mind of the target, rendering them incapacitated on success. Applies stunned to the user on failure. Usage of twist reality applies 4 dark side points.\nForce-sensitives resist with Mindfulness * 2 + resolve. "
})

function BorForce_TwistMind:showHelp(pPlayer)
	BorForceUtility:displayHelp(self, pPlayer)
end

function BorForce_TwistMind:execute(pPlayer)
	local fpi = BorForceUtility:getForcePointInput(pPlayer, self)

	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)
	
	if(BorForceUtility:canUseForcePower(pPlayer, pTarget, self) == false) then
		return
	end
	
	if(fpi < self.fpiMin) then
		BorForceUtility:promptForcePointInput(pPlayer, self, "BorForce_TwistMind", "onFPICallback")
	else 
		self:performAbility(pPlayer, fpi)
	end
end

function BorForce_TwistMind:onFPICallback(pPlayer, pSui, eventIndex, remaining, spent) 
	local cancelPressed = (eventIndex == 1)

	if (cancelPressed) then
		return
	end
	
	spent = tonumber(spent)
	
	if(spent < self.fpiMin) then
		CreatureObject(pPlayer):sendSystemMessage("You need to commit at least ten force points to use this ability.")
		return
	end
	
	self:performAbility(pPlayer, spent)
end

function BorForce_TwistMind:performAbility(pPlayer, fpi)
	local targetID = CreatureObject(pPlayer):getTargetID()
	local pTarget = getSceneObject(targetID)
		
	if(BorForceUtility:canUseForcePower(pPlayer, pTarget, self) == false) then
		return
	end

	if(BorForceUtility:handleFPI(pPlayer, self, fpi) == false) then
		return
	end

	fpi = math.floor(fpi)

	local targetSkillValue1 = math.floor(CreatureObject(pTarget):getSkillMod("rp_mindfulness"))
	local targetRoll1 = math.floor(math.random(1,20))
	local targetSkillValue2 = math.floor(CreatureObject(pTarget):getSkillMod("rp_resolve"))
	local targetRoll2 = math.floor(math.random(1,20))
	local fsMod = 1

	local skillValue = math.floor(CreatureObject(pPlayer):getSkillMod("rp_control"))
	local roll = math.floor(math.random(1,20))


	if(CreatureObject(pTarget):hasSkill("rp_force_prog_novice")) then
		fsMod = 2
	end

	local targetTotal1 = (targetSkillValue1 + targetRoll1) * fsMod
	local targetTotal2 = targetSkillValue2 + targetRoll2
	local total = skillValue + roll + fpi

	local targetName = CreatureObject(pTarget):getFirstName()
	local msg = CreatureObject(pPlayer):getFirstName() .. " uses " .. self.name .. " on "..targetName

	msg = msg .."\\#DBDBDB(1d20: "..self:rollColour(roll).." + "..skillValue.." + \\#FF00FF"..fpi.."\\#DBDBDB = "..total.."vs "
	msg = msg .."2d20: ("..self:rollColour(targetRoll1).." + "..self:rollColour(targetRoll2)..") + "..targetSkillValue1.." + "..targetSkillValue2.." = "..targetTotal1+targetTotal2..")\\#FFFFFF"

	if(total > targetTotal1+targetTotal2) then
		msg = msg .. " and succeed! "..targetName.." writhes in agony as their mind is turned and twisted until they drop unconscious."

		CreatureObject(pTarget):setPosture(KNOCKEDDOWN)

		BorForceUtility:playAbilityEffects(pPlayer, pTarget, self)
	else 
		msg = msg .. " and fails, becoming stunned!"
		BorForceUtility:applyStatusEffect(pPlayer, pPlayer, "stunned", 1)
	end

	BorForce:addCorruptionPoints(pPlayer, self.corruptionPoints)
	broadcastMessageWithName(pPlayer, msg)
end

function BorForce_TwistMind:rollColour(roll)
	rollString = ""

	if (roll == 20) then
		rollString = "\\#00FF00"..roll.."\\#DBDBDB"
	elseif (roll == 1) then
		rollString = "\\#FF0000"..roll.."\\#DBDBDB"
	else
		rollString = rollString..roll
	end

	return rollString
end