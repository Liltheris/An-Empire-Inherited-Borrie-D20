#ifndef ROLEPLAYMANAGER_H_
#define ROLEPLAYMANAGER_H_

#include "engine/engine.h"

namespace server {
namespace zone {
namespace managers {
namespace roleplay {

struct RpSkillData {
	String name;
	String parentSkillName;
	String altParentSkill;
};

enum RpSkillType {
	ALLSKILLS = 0,
    ATTRIBUTE = 1,
	SKILL = 2,
    FORCESKILL = 3,
};

class RoleplayManager : public Singleton<RoleplayManager>, public Logger, public Object {
    Vector<RpSkillData>* attributes;
	Vector<RpSkillData>* skills;
	Vector<RpSkillData>* forceSkills;

	int maxAttributes;
	int maxTraining;
	int maxFeats;

	float skillCostMultiplier;

public:
    RoleplayManager();
    ~RoleplayManager();

    void loadLuaConfig();

    //Returns the index of the given RP skill. Returns -1 if skill does not exist.
    int getRpSkillIndex(String skill, RpSkillType type = RpSkillType::ALLSKILLS);

    //Returns the skill data at the given index.
    RpSkillData getRpSkill(int index, RpSkillType type = RpSkillType::ALLSKILLS);
};

}
}
}
}

using namespace server::zone::managers::roleplay;

#endif // ROLEPLAYMANAGER_H_