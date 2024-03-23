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

	static bool CanTrainNextSkill(CreatureObject* creature, int rank, String skill, String parentAttribute = "", String altParentAttribute = "") {

		if(rank > 10)
			return false;
		if(skill == "")
			return false;

		String skillName = "rp_" + skill + "_" + GetSkillSuffixFromValue(rank);

		SkillManager* skillManager = SkillManager::instance();
		RoleplayManager* rp = RoleplayManager::instance();

		bool hasXP = skillManager->canLearnSkill(skillName, creature, false);
		int points = creature->getStoredInt("starter_attr_points");

		RpSkillData data = rp->getRpSkill(rp->getRpSkillIndex(skill, RpSkillType::SKILL), RpSkillType::SKILL);

		if (data.getName() != ""){
			points = creature->getStoredInt("starter_skill_points");

			int parentLevel = GetRealSkillLevel(creature, data.getParent());
			int skillLevel = GetRealSkillLevel(creature, data.getName());

			if(skillLevel - parentLevel < 0 && points > 0)
				return true;
		} else {
			data = rp->getRpSkill(rp->getRpSkillIndex(skill, RpSkillType::ATTRIBUTE), RpSkillType::ATTRIBUTE);

			if (data.getName() != "" && points > 0)
				return true;
		}

		return hasXP;
	}

	static float getXpCostMultiplier(CreatureObject* player, String skill){
		RoleplayManager* rp = RoleplayManager::instance();

		String skillName = GetSkillRealName(skill);

		RpSkillData data = rp->getRpSkill(rp->getRpSkillIndex(skillName, RpSkillType::SKILL), RpSkillType::SKILL);

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
		} else {
			return true;
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

		if (CanTrainNextSkill(player, currentRank + 1, skillName, skillParent, skillAltParent)) {
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
};

#endif /*BORSKILL_H_*/