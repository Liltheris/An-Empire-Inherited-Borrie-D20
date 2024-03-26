#ifndef BORSKILL_H_
#define BORSKILL_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/managers/creature/CreatureManager.h"
#include "server/zone/packets/chat/ChatSystemMessage.h"
#include "engine/util/u3d/Coordinate.h"
#include "server/zone/managers/skill/SkillManager.h"

#include "server/zone/managers/roleplay/RoleplayManager.h"

#include "server/db/ServerDatabase.h"

class BorSkill : public Logger {
public:
	static bool GetStringIsAttribute(String input) {
		RoleplayManager* rp = RoleplayManager::instance();
		return (rp->getRpSkillIndex(input, RpSkillType::ATTRIBUTE) != -1);
	}

	static String GetSkillParent(String skill) {
		RoleplayManager* rp = RoleplayManager::instance();
		return rp->getRpSkill(rp->getRpSkillIndex(skill, RpSkillType::SKILL), RpSkillType::SKILL).getParent();
	}

	static String GetSkillAltParent(String skill) {
		RoleplayManager* rp = RoleplayManager::instance();
		return rp->getRpSkill(rp->getRpSkillIndex(skill, RpSkillType::SKILL), RpSkillType::SKILL).getAltParent();
	}

	static bool GetStringIsSkill(String skill) {
		RoleplayManager* rp = RoleplayManager::instance();
		return (rp->getRpSkillIndex(skill, RpSkillType::SKILL) != -1);
	}

	static bool GetStringIsForceSkill(String skill) {
		RoleplayManager* rp = RoleplayManager::instance();
		return (rp->getRpSkillIndex(skill, RpSkillType::FORCESKILL) != -1);
	}

	static bool GetSkillIsForceSkill(String skill) {
		return GetStringIsForceSkill(GetSkillRealName(skill));
	}

	static String GetSkillRealName(String input) {
		StringTokenizer args(input);
		String output;
		args.setDelimeter("_");
		if (!args.hasMoreTokens())
			return "invalid";
		else {
			args.getStringToken(output);
			if(args.hasMoreTokens()) {
				args.getStringToken(output);
				return output;
			}
			else return "invalid";
		}
	}

	static String GetSkillSuffixFromValue(int value) {
		if (value == 1)
			return "novice";
		else if (value == 2)
			return "a01";
		else if (value == 3)
			return "a02";
		else if (value == 4)
			return "a03";
		else if (value == 5)
			return "a04";
		else if (value == 6)
			return "b01";
		else if (value == 7)
			return "b02";
		else if (value == 8)
			return "b03";
		else if (value == 9)
			return "b04";
		else if (value == 10)
			return "master";
		else
			return "novice";
	}

	static int GetSkillLevelFromString(String input) {
		StringTokenizer args(input);
		String value;
		args.setDelimeter("_");
		if (!args.hasMoreTokens())
			return -1;
		else {
			args.getStringToken(value);
			if (args.hasMoreTokens()) { //skill name
				args.getStringToken(value);
				if (args.hasMoreTokens()) { //Skill Value
					args.getStringToken(value);
					if (value == "novice")
						return 1;
					else if (value == "a01")
						return 2;
					else if (value == "a02")
						return 3;
					else if (value == "a03")
						return 4;
					else if (value == "a04")
						return 5;
					else if (value == "b01")
						return 6;
					else if (value == "b02")
						return 7;
					else if (value == "b03")
						return 8;
					else if (value == "b04")
						return 9;
					else if (value == "master")
						return 10;
					else
						return 0;
				} else {
					return -1;
				}
			} else
				return -1;
		}
	}

	static int GetRealSkillLevel(CreatureObject* player, String input) {
		if(player->hasSkill("rp_" + input + "_master")) {
			return 10;
		} else if(player->hasSkill("rp_" + input + "_b04")) {
			return 9;
		} else if(player->hasSkill("rp_" + input + "_b03")) {
			return 8;
		} else if(player->hasSkill("rp_" + input + "_b02")) {
			return 7;
		} else if(player->hasSkill("rp_" + input + "_b01")) {
			return 6;
		} else if(player->hasSkill("rp_" + input + "_a04")) {
			return 5;
		} else if(player->hasSkill("rp_" + input + "_a03")) {
			return 4;
		} else if(player->hasSkill("rp_" + input + "_a02")) {
			return 3;
		} else if(player->hasSkill("rp_" + input + "_a01")) {
			return 2;
		} else if(player->hasSkill("rp_" + input + "_novice")) {
			return 1;
		} else {
			return 0;
		}
	}

	static bool CanTrainNextSkill(CreatureObject* creature, int rank, String skill) {
		if(rank > 10)
			return false;
		if(skill == "")
			return false;

		String skillName = "rp_" + skill + "_" + GetSkillSuffixFromValue(rank);
		creature->sendSystemMessage(skillName);

		SkillManager* skillManager = SkillManager::instance();
		RoleplayManager* rp = RoleplayManager::instance();

		bool hasXP = skillManager->canLearnSkill(skillName, creature, false);
		int points = 0;

		// Skill handling
		if (rp->getRpSkillIndex(skill, RpSkillType::SKILL) != -1){
			// Get our starter points.
			points = creature->getStoredInt("starter_skill_points");

			// Get the skill's data.
			RpSkillData data = rp->getRpSkill(rp->getRpSkillIndex(skill, RpSkillType::SKILL), RpSkillType::SKILL);

			int parentLevel = GetRealSkillLevel(creature, data.getParent());
			int skillLevel = GetRealSkillLevel(creature, data.getName());

			// We can learn the skill if we have points and our level does not exceed our parent level.
			if(skillLevel - parentLevel < 0 && points > 0)
				return true;
		}

		// Attribute handling
		if (rp->getRpSkillIndex(skill, RpSkillType::ATTRIBUTE) != -1){
			// Get our starter points.
			points = creature->getStoredInt("starter_attr_points");

			// Get our attribute's data.
			RpSkillData data = rp->getRpSkill(rp->getRpSkillIndex(skill, RpSkillType::ATTRIBUTE), RpSkillType::ATTRIBUTE);
			
			// We can get the attribute if we have a point!
			if (points > 0)
				return true;
		}

		// No special handling, so just check if we have the XP needed.
		return hasXP;
	}

	static float getXpCostMultiplier(CreatureObject* player, String skill){
		RoleplayManager* rp = RoleplayManager::instance();

		String skillName = GetSkillRealName(skill);
		RpSkillData data;

		if (GetStringIsSkill(skillName)){
			data = rp->getRpSkill(rp->getRpSkillIndex(skillName, RpSkillType::SKILL), RpSkillType::SKILL);
		} else if (GetStringIsAttribute(skillName)){
			data = rp->getRpSkill(rp->getRpSkillIndex(skillName, RpSkillType::ATTRIBUTE), RpSkillType::ATTRIBUTE);
		} else if (GetStringIsForceSkill){
			data = rp->getRpSkill(rp->getRpSkillIndex(skillName, RpSkillType::FORCESKILL), RpSkillType::FORCESKILL);
		} else {
			//The skill in question is not an RP skill of any type, so just assume that the XP cost multiplier is 1.
			return 1.0f;
		}

		//If the found skill does not have a skill parent, simply return 1 as the multiplier.
		if (data.getParent() == ""){
			return 1.0f;
		}

		int parentLevel = GetRealSkillLevel(player, data.getParent());
		int skillLevel = GetSkillLevelFromString(skill);

		if (skillLevel - parentLevel > 0){
			return pow(rp->getSkillCostMultiplier(), skillLevel - parentLevel);
		}

		return 1.0f;
	}

	static int getFinalXpCost(CreatureObject* player, String skillName){
		SkillManager* skillManager = SkillManager::instance();
		float multi = getXpCostMultiplier(player, skillName);

		return skillManager->getSkill(skillName)->getXpCost() * multi;

	}

	static bool GetQualifiedForSkill(CreatureObject* creature, String skill) {
		String skillName = GetSkillRealName(skill);

		if (GetStringIsForceSkill(skillName)) {
			//See if they have Force Aware at the very least.
			if(!creature->hasSkill("rp_force_prog_rank_01")) //Force Aware
				return false;
		}

		if (GetStringIsSkill(skillName)) {
			int desiredLevel = GetSkillLevelFromString(skill);
			if (desiredLevel == -1)
				return false;
		}

		if (GetStringIsAttribute(skillName)) {
			SkillManager* skillManager = SkillManager::instance();
			RoleplayManager* rp = RoleplayManager::instance();

			if (skillManager->getRpAttributeCount(creature) >= rp->getMaxAttributes())
				return false;
		}

		return true;
	}

	static void trainAttribute(CreatureObject* player, String skillName) {
		int currentRank = GetRealSkillLevel(player, skillName);

		// Check that we still meet the requirements for the skill.
		if (CanTrainNextSkill(player, currentRank + 1, skillName)) {
			SkillManager* skillManager = SkillManager::instance();
			int freePoints = player->getStoredInt("starter_attr_points");
			// Spend free Attribute points if we have them, otherwise, spend XP.
			if(freePoints > 0) {
				player->setStoredInt("starter_attr_points", freePoints - 1);
				skillManager->awardSkill("rp_" + skillName + "_" + GetSkillSuffixFromValue(currentRank + 1), player, true, false, true);
				player->sendSystemMessage("You've gained a point in " + skillName + ". You have " + String::valueOf(freePoints - 1) + " remaining free attribute points.");
			} else {
				skillManager->awardSkill("rp_" + skillName + "_" + GetSkillSuffixFromValue(currentRank + 1), player, true, false, false);
				player->sendSystemMessage("You've gained a point in " + skillName + ".");
			}
		} else {
			//Something happened
			player->sendSystemMessage("ERROR: Something happened. You were eligible for the attribute you selected when you selected it, but you are no longer eligible.");
		}
	}

	static void trainSkill(CreatureObject* player, String skillName) {
		String skillParent = GetSkillParent(skillName);
		String skillAltParent = GetSkillAltParent(skillName);
		int currentRank = GetRealSkillLevel(player, skillName);

		if (CanTrainNextSkill(player, currentRank + 1, skillName)) {
			//Train it
			SkillManager* skillManager = SkillManager::instance();
			int freePoints = player->getStoredInt("starter_skill_points");
			// Spend free Skill points if we have them, and the skill does not exceed the attribute level.
			if(freePoints > 0 && currentRank < BorSkill::GetRealSkillLevel(player, skillParent)) {
				player->setStoredInt("starter_skill_points", freePoints - 1);
				skillManager->awardSkill("rp_" + skillName + "_" + BorSkill::GetSkillSuffixFromValue(currentRank + 1), player, true, false, true);
				player->sendSystemMessage("You've gained a point in " + skillName + "! You have " + String::valueOf(freePoints - 1) + " remaining free skill points.");
			} else {
				skillManager->awardSkill("rp_" + skillName + "_" + BorSkill::GetSkillSuffixFromValue(currentRank + 1), player, true, false, false);
				player->sendSystemMessage("You've gained a point in " + skillName + "!");
			}
		} else {
			//Something happened
			player->sendSystemMessage("ERROR: Something happened. You were eligible for the skill you selected when you selected it, but you are no longer eligible.");
		}
	}

	static bool resetSkillsAndAttributes(CreatureObject* player){
		bool maxedSkillFound = false;

		int xp = 0;

		RoleplayManager* rp = RoleplayManager::instance();

		Vector<RpSkillData> skills = rp->getRpSkillList(RpSkillType::SKILL);
		Vector<RpSkillData> attributes = rp->getRpSkillList(RpSkillType::ATTRIBUTE);

		for (int i = 0; i < skills.size(); i++){
			RpSkillData skill = skills.get(i);

			if(!maxedSkillFound && player->hasSkill("rp_"+skill.getName()+"_master")){
				maxedSkillFound = true;
				revokeFullSkill(player, skill.getName(), false);
			} else {
				xp += revokeFullSkill(player, skill.getName());
			}
		}

		for (int i = 0; i < attributes.size(); i++){
			RpSkillData attribute = attributes.get(i);

			revokeFullSkill(player, attribute.getName());
		}

		player->setStoredInt("starter_skill_points", 15);
		player->setStoredInt("starter_attr_points", 30);
		player->setStoredLong("long_rest_time", -1);


		PlayerObject* playerObject = player->getPlayerObject();
		playerObject->addExperience("rp_general", xp);

		player->setStoredInt("respec", 1);

		return true;
	}

	static int revokeFullSkill(CreatureObject* player, String skillName, bool returnXP = true){
		int xp = 0;

		if(player->hasSkill("rp_" + skillName + "_master")) {
			xp += revokeRpSkill(player,"rp_" + skillName + "_master");
		}
		if(player->hasSkill("rp_" + skillName + "_b04")) {
			xp += revokeRpSkill(player,"rp_" + skillName + "_b04");
		}
		if(player->hasSkill("rp_" + skillName + "_b03")) {
			xp += revokeRpSkill(player,"rp_" + skillName + "_b03");
		}
		if(player->hasSkill("rp_" + skillName + "_b02")) {
			xp += revokeRpSkill(player,"rp_" + skillName + "_b02");
		}
		if(player->hasSkill("rp_" + skillName + "_b01")) {
			xp += revokeRpSkill(player,"rp_" + skillName + "_b01");
		}
		if(player->hasSkill("rp_" + skillName + "_a04")) {
			xp += revokeRpSkill(player,"rp_" + skillName + "_a04");
		}
		if(player->hasSkill("rp_" + skillName + "_a03")) {
			xp += revokeRpSkill(player,"rp_" + skillName + "_a03");
		}
		if(player->hasSkill("rp_" + skillName + "_a02")) {
			xp += revokeRpSkill(player,"rp_" + skillName + "_a02");
		}
		if(player->hasSkill("rp_" + skillName + "_a01")) {
			xp += revokeRpSkill(player,"rp_" + skillName + "_a01");
		}
		if(player->hasSkill("rp_" + skillName + "_novice")) {
			xp += revokeRpSkill(player,"rp_" + skillName + "_novice");
		}

		if (returnXP){
			return xp;
		}
		return 0;
	}

	static int revokeRpSkill(CreatureObject* creature, String skillName){
		SkillManager* skillManager = SkillManager::instance();
		Skill* skill = skillManager->getSkill(skillName);

		if (skill != nullptr){
			int xp = skill->getXpCost();
			creature->removeSkill(skillName);
			return xp;
		}
		return 0;
	}
};

#endif /*BORSKILL_H_*/