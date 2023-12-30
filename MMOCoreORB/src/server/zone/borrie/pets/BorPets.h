#ifndef BORPETS_H_
#define BORPETS_H_

#include "engine/engine.h"
#include "server/zone/managers/director/DirectorManager.h"
#include "server/zone/managers/creature/CreatureManager.h"

class BorPets : public Logger {
public:

    static void applySkillsToPet(CreatureObject* target, String mobileTemplate) {
        Lua* lua = DirectorManager::instance()->getLuaInstance();

        mobileTemplate = mobileTemplate.toLowerCase();

        lua->runFile("custom_scripts/rp_npcs/skills/" + getSkillFromMobileTemplate(mobileTemplate) + ".lua");

        LuaObject luaObject = lua->getGlobalObject("skillSet");

        if(luaObject.isValidTable()) {\
            // Clear our previous mods to prevent doubling up.
            target->removeAllSkillModsOfType(SkillModManager::PERMANENTMOD);
            for (int i = 1; i <= luaObject.getTableSize(); ++i) {
                LuaObject objData = luaObject.getObjectAt(i);
                if (objData.isValidTable()) {
                    String skillKey = objData.getStringAt(1);
                    int minSkill = objData.getIntAt(2);
                    int maxSkill = objData.getIntAt(3);     
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

private:
    static String getSkillFromMobileTemplate(String mobileTemplate){
        Lua* lua = DirectorManager::instance()->getLuaInstance();

        lua->runFile("custom_scripts/rp_npcs/pet_definitions.lua");

        LuaObject luaObject = lua->getGlobalObject("petDefinitions");

        if(luaObject.isValidTable()) {
            //Run over the definitions to find our pet.
            for (int i = 1; i <= luaObject.getTableSize(); i++) {
                LuaObject objData = luaObject.getObjectAt(i);
                if (objData.isValidTable()) {
                    String petTemplate = objData.getStringAt(1);
                    
                    if (petTemplate == mobileTemplate)
                        return objData.getStringAt(2);
                }
                objData.pop();
            }
        }
        luaObject.pop();
        return "";
    }
};



#endif