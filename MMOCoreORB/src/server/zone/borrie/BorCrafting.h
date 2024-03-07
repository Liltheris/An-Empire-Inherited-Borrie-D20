#ifndef BORCRAFTING_H_
#define BORCRAFTING_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/managers/skill/SkillManager.h"
#include "server/zone/managers/player/PlayerManager.h"
#include "server/zone/objects/creature/CreatureObject.h"

class BorCrafting : public Logger {
public:
    static String getAmmoPackForWeaponType(int objectType, int damageType) {
        return "";
    }
};

#endif 