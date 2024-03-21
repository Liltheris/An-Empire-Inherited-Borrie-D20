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
    SKILL = 0,
    ATTRIBUTE = 1,
    FORCESKILL = 2,
};

class RoleplayManager : public Singleton<RoleplayManager>, public Logger, public Object {
    const RpSkillData attributes[8] = {
		{"awareness", "", ""},
		{"charisma", "", ""},
		{"constitution", "", ""},
		{"dexterity", "", ""},
		{"intelligence", "", ""},
		{"mindfulness", "", ""},
		{"precision", "", ""},
		{"strength", "", ""},
	};
	const RpSkillData skills[26] = {
		{"armor", "constitution", ""},
		{"athletics", "dexterity", ""},
		{"bluff", "charisma", ""},
		{"command", "charisma", ""},
		{"composure", "mindfulness", ""},
		{"computers", "intelligence", ""},
		{"defending", "", ""},
		{"demolitions", "precision", ""},
		{"engineering", "intelligence", ""},
		{"intimidation", "charisma", ""},
		{"investigation", "awareness", ""},
		{"larceny", "dexterity", ""},
		{"maneuverability", "dexterity", ""},
		{"mechanics", "precision", ""},
		{"medicine", "intelligence", ""},
		{"melee", "dexterity", ""},
		{"performance", "charisma", ""},
		{"persuasion", "charisma", ""},
		{"piloting", "intelligence", ""},
		{"ranged", "precision", ""},
		{"resolve", "mindfulness", ""},
		{"science", "intelligence", ""},
		{"slicing", "intelligence", ""},
		{"survival", "awareness", ""},
		{"throwing", "precision", ""},
		{"unarmed", "dexterity", ""},
	};
	const RpSkillData forceSkills[7] = {
		{"alter", "", ""},
		{"control", "", ""},
		{"inward", "", ""},
		{"lightning", "", ""},
		{"lightsaber", "", ""},
		{"sense", "", ""},
		{"telekinesis", "", ""},
	};

public:
    RoleplayManager();
    ~RoleplayManager();

    void loadLuaConfig();

    //Returns the index of the given RP skill. Returns -1 if skill does not exist.
    int getRpSkillIndex(String skill);

    //Returns the skill data at the given index.
    RpSkillData getRpSkill(int index);
};

}
}
}
}

using namespace server::zone::managers::roleplay;

#endif // ROLEPLAYMANAGER_H_