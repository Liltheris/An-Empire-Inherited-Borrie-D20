#ifndef BORPETS_H_
#define BORPETS_H_

#include "engine/engine.h"
#include "server/zone/managers/director/DirectorManager.h"
#include "server/zone/managers/creature/CreatureManager.h"

class BorPets : public Logger {
public:

    static void ApplySkillTemplateToPet(CreatureObject* target, String skillTemplate) {
        Lua* lua = DirectorManager::instance()->getLuaInstance();

        skillTemplate = skillTemplate.toLowerCase();

        lua->runFile("custom_scripts/rp_npcs/skills/" + skillTemplate + ".lua");

        LuaObject luaObject = lua->getGlobalObject("skillSet");

        if(luaObject.isValidTable()) {
            for (int i = 1; i <= luaObject.getTableSize(); ++i) {
                LuaObject objData = luaObject.getObjectAt(i);
                if (objData.isValidTable()) {
                    String skillKey = objData.getStringAt(1);
                    int minSkill = objData.getIntAt(2);
                    int maxSkill = objData.getIntAt(3);     
                    //int finalSkill = System::random(maxSkill - minSkill) + 1 + minSkill;
                    int finalSkill = minSkill + System::random(maxSkill - minSkill);
                    target->addSkillMod(SkillModManager::PERMANENTMOD, skillKey, finalSkill);
                    if(skillKey == "rp_health") {
                        target->setMaxHAM(0, finalSkill);
                        target->setBaseHAM(0, finalSkill);
                        target->setHAM(0, finalSkill);
                    } else if(skillKey == "rp_action") {
                        target->setMaxHAM(3, finalSkill);
                        target->setBaseHAM(3, finalSkill);
                        target->setHAM(3, finalSkill);
                    } else if(skillKey == "rp_will") {
                        target->setMaxHAM(6, finalSkill);
                        target->setBaseHAM(6, finalSkill);
                        target->setHAM(6, finalSkill);
                    }
                }
                objData.pop();
            }
        }
        luaObject.pop();
    } 
};

#endif