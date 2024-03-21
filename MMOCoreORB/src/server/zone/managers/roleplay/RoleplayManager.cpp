#include "RoleplayManager.h"

RoleplayManager::RoleplayManager()
	: Logger("RoleplayManager") {
}

RoleplayManager::~RoleplayManager(){
    
}

void RoleplayManager::loadLuaConfig() {
	Lua* lua = new Lua();
	lua->init();

	lua->runFile("scripts/managers/roleplay_manager.lua");

	maxAttributes = lua->getGlobalInt("maxAttributes");
	maxFeats = lua->getGlobalInt("maxFeats");
	maxTraining = lua->getGlobalInt("maxTraining");

	skillCostMultiplier = lua->getGlobalFloat("skillCostMultiplier");

	delete lua;
	lua = nullptr;
}

int RoleplayManager::getRpSkillIndex(String skill, RpSkillType type) {
	switch (type){
		case RpSkillType::ATTRIBUTE:{
			for (int i = 0; i < attributes->size(); i++){
				if (attributes->get(i).name == skill){
					return i;
				}
			}
			break;
		}	
		case RpSkillType::SKILL:{
			for (int i = 0; i < skills->size(); i++){
				if (skills->get(i).name == skill){
					return i;
				}
			}
			break;
		}
		case RpSkillType::FORCESKILL:{
			for (int i = 0; i < forceSkills->size(); i++){
				if (forceSkills->get(i).name == skill){
					return i;
				}
			}
			break;
		}
	}
	
	//Return -1, as we've not been able to find the skill!
	return -1;
}

RpSkillData RoleplayManager::getRpSkill(int index, RpSkillType type) {

}