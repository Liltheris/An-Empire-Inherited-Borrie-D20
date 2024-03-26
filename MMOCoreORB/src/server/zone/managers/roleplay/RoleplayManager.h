#ifndef ROLEPLAYMANAGER_H_
#define ROLEPLAYMANAGER_H_

#include "engine/engine.h"
#include "server/zone/managers/roleplay/RpSkillData.h"

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

	int combatBaseDC;

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

    //Returns the index of the given RP skill. Returns -1 if skill does not exist.
    int getRpSkillIndex(String skill, RpSkillType type = RpSkillType::SKILL);

    //Returns the skill data at the given index.
    RpSkillData getRpSkill(int index, RpSkillType type = RpSkillType::SKILL);

	//Returns the vector containing the skills of the requested type.
	Vector<RpSkillData> getRpSkillList(RpSkillType type = RpSkillType::SKILL);

	//Returns true if the provided string is an excluded first name.
	inline bool isNameExcluded(String name){
		return stringExcludedNames.contains(name);
	}
};

}
}
}
}

using namespace server::zone::managers::roleplay;

#endif // ROLEPLAYMANAGER_H_