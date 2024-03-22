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
		return rp->getRpSkill(rp->getRpSkillIndex(skill, RpSkillType::SKILL), RpSkillType::SKILL)->parentSkillName;
	}

	static String GetSkillAltParent(String skill) {
		RoleplayManager* rp = RoleplayManager::instance();
		return rp->getRpSkill(rp->getRpSkillIndex(skill, RpSkillType::SKILL), RpSkillType::SKILL)->altParentSkill;
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

		/*if (parentAttribute != "" && altParentAttribute != "") {
			points = creature->getStoredInt("starter_skill_points");

			int parentValue = GetRealSkillLevel(creature, parentAttribute);
			int altParentValue = GetRealSkillLevel(creature, altParentAttribute);
			String skillRealName = GetSkillRealName(skill);
			if(parentValue < rank && altParentValue < rank) {
				return false;
			} 				
		}*/

		RpSkillData* data = rp->getRpSkill(rp->getRpSkillIndex(skill, RpSkillType::SKILL), RpSkillType::SKILL);

		int parentLevel = GetRealSkillLevel(creature, data->parentSkillName);
		int skillLevel = GetRealSkillLevel(creature, data->name);

		if(skillLevel - parentLevel <= 0 && points > 0)
			return true;
		
		return hasXP;
	}

	static float getXpCostMultiplier(CreatureObject* player, String skill){
		RoleplayManager* rp = RoleplayManager::instance();

		skill = GetSkillRealName(skill);

		RpSkillData* data = rp->getRpSkill(rp->getRpSkillIndex(skill, RpSkillType::SKILL), RpSkillType::SKILL);

		int parentLevel = GetRealSkillLevel(player, data->parentSkillName);
		int skillLevel = GetRealSkillLevel(player, data->name);

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
		if (GetStringIsSkill(skillName)) {
			if(GetStringIsForceSkill(skillName)) {
				//See if they have Force Aware at the very least.
				if(!creature->hasSkill("rp_force_prog_rank_01")) //Force Aware
					return false;
				//Check if the Force skill is off cooldown to learn.
				if(!creature->checkCooldownRecovery(skill))
					return false;
			}
			int desiredLevel = GetSkillLevelFromString(skill);
			if (desiredLevel == -1)
				return false;			
		} else {
			return true;
		}
	}
};

#endif /*BORSKILL_H_*/