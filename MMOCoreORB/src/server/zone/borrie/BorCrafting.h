#ifndef BORCRAFTING_H_
#define BORCRAFTING_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/managers/skill/SkillManager.h"
#include "server/zone/managers/player/PlayerManager.h"
#include "server/zone/objects/creature/CreatureObject.h"

class BorCrafting : public Logger {
public:
    static String getAmmoPackForWeaponType(int objectType, int damageType) {
        if (damageType == 1){
            return "ammo_kinetic";
        }

        switch (objectType){
            case SceneObjectType::PISTOL:
                return "ammo_powerpack_small";
            case SceneObjectType::CARBINE:
                return "ammo_powerpack_medium";
            case SceneObjectType::RIFLE:
                return "ammo_powerpack_large";
        };
    }
};

#endif 