#ifndef ROLEPLAYMANAGER_H_
#define ROLEPLAYMANAGER_H_

#include "engine/engine.h"
#include "server/zone/managers/roleplay/RpSkillData.h"
#include "server/zone/managers/roleplay/RpCombatAnimSet.h"

namespace server {
namespace zone {
namespace managers {
namespace roleplay {

enum RpSkillType {
	ALLSKILLS = 0,
    ATTRIBUTE = 1,
	SKILL = 2,
    FORCESKILL = 3,
};

class RoleplayManager : public Singleton<RoleplayManager>, public Logger, public Object {
    Vector<RpSkillData> attributes;
	Vector<RpSkillData> skills;
	Vector<RpSkillData> forceSkills;

	Vector<String> stringExcludedNames;

	Vector<int> forceTiers;

	RpCombatAnimSet pistolAnims;
	RpCombatAnimSet carbineAnims;
	RpCombatAnimSet rifleAnims;
	RpCombatAnimSet sniperAnims;
	RpCombatAnimSet repeaterAnims;

	RpCombatAnimSet swordAnims;
	RpCombatAnimSet sword2hAnims;
	RpCombatAnimSet poleAnims;
	RpCombatAnimSet unarmedAnims;

	int midAnimThreshold;
	int strongAnimThreshold;

	int combatBaseDC;
	int powerAttackDcMod;

	int aimedDcMods[9];

	int maxAttributes;
	int maxTraining;
	int maxFeats;

	float skillCostMultiplier;

public:
    RoleplayManager();
    ~RoleplayManager();

    void loadLuaConfig();

	float getSkillCostMultiplier() const {
		return skillCostMultiplier;
	}

	int getMaxAttributes() const {
		return maxAttributes;
	}

	int getMaxTraining() const {
		return maxTraining;
	}

	int getMaxFeats() const {
		return maxFeats;
	}

	int getBaseDC() const {
		return combatBaseDC;
	}

	int getPowerAttacDckMod() const {
		return powerAttackDcMod;
	}

	int getAimedAttackMod(int slot) const {
		return aimedDcMods[slot];
	}

    //Returns the index of the given RP skill. Returns -1 if skill does not exist.
    int getRpSkillIndex(String skill, RpSkillType type = RpSkillType::SKILL) const;

    //Returns the skill data at the given index.
    RpSkillData getRpSkill(int index, RpSkillType type = RpSkillType::SKILL) const;

	//Returns the vector containing the skills of the requested type.
	Vector<RpSkillData> getRpSkillList(RpSkillType type = RpSkillType::SKILL) const;

	//Returns true if the provided string is an excluded first name.
	inline bool isNameExcluded(String name) const {
		return stringExcludedNames.contains(name);
	}

	//Returns the number of skill boxes required for the provided force tier. Returns -1 on invalid values.
	int getForceTierRequirement(int tier) const ;

	String getCombatAnim(String animSet, int damage) const;

	inline String getFlurryAnim(String animSet) const {
		return getAnimSet(animSet).getFlurryAnim();
	}

	inline String getPowerAnim(String animSet) const {
		return getAnimSet(animSet).getPowerAnim();
	}

	RpCombatAnimSet getAnimSet(String setName) const;
};

}
}
}
}

using namespace server::zone::managers::roleplay;

#endif // ROLEPLAYMANAGER_H_