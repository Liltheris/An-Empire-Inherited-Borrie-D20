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

	combatBaseDC = lua->getGlobalInt("combatBaseDC");

	skillCostMultiplier = lua->getGlobalFloat("skillCostMultiplier");

	LuaObject luaAttributes = lua->getGlobalObject("attributes");

	//Load our attributes from lua!
	if (luaAttributes.isValidTable()){
		for (int i = 1; i <= luaAttributes.getTableSize(); i++){
			LuaObject data = luaAttributes.getObjectAt(i);
			if(data.isValidTable()){
				RpSkillData skill = RpSkillData();

				skill.setName(data.getStringAt(1));
				skill.setParent(data.getStringAt(2));
				skill.setAltParent(data.getStringAt(3));

				attributes.add(skill);
			} else {
				error("Attribute at index "+String::valueOf(i)+" is not a valid lua object!");
			}
			data.pop();
		}
	} else {
		fatal("LUA ATTRIBUTES OBJECT IS NOT VALID!");
	}
	luaAttributes.pop();

	LuaObject luaSkills = lua->getGlobalObject("skills");

	//Load our skills from lua!
	if (luaSkills.isValidTable()){
		for (int i = 1; i <= luaSkills.getTableSize(); i++){
			LuaObject data = luaSkills.getObjectAt(i);
			if(data.isValidTable()){
				RpSkillData skill = RpSkillData();

				skill.setName(data.getStringAt(1));
				skill.setParent(data.getStringAt(2));
				skill.setAltParent(data.getStringAt(3));

				skills.add(skill);
			} else {
				error("Skill at index "+String::valueOf(i)+" is not a valid lua object!");
			}
			data.pop();
		}
	} else {
		fatal("LUA SKILLS OBJECT IS NOT VALID!");
	}
	luaSkills.pop();

	LuaObject luaForceSkills = lua->getGlobalObject("forceSkills");

	//Load our Force skills from lua!
	if (luaForceSkills.isValidTable()){
		for (int i = 1; i <= luaForceSkills.getTableSize(); i++){
			LuaObject data = luaForceSkills.getObjectAt(i);
			if(data.isValidTable()){
				RpSkillData skill = RpSkillData();

				skill.setName(data.getStringAt(1));
				skill.setParent(data.getStringAt(2));
				skill.setAltParent(data.getStringAt(3));

				forceSkills.add(skill);
			} else {
				error("ForceSkill at index "+String::valueOf(i)+" is not a valid lua object!");
			}
			data.pop();
		}
	} else {
		fatal("LUA FORCESKILLS OBJECT IS NOT VALID!");
	}
	luaForceSkills.pop();

	LuaObject luaStringExcludedNames = lua->getGlobalObject("stringExcludedNames");

	if (luaStringExcludedNames.isValidTable()){
		for (int i = 1; i < luaStringExcludedNames.getTableSize(); i++){
			String name = luaStringExcludedNames.getStringAt(i);

			stringExcludedNames.add(name);
		}
	} else {
		fatal("LUA STRING EXCLUDED NAMES OBJECT IS NOT VALID!");
	}
	luaStringExcludedNames.pop();

	delete lua;
	lua = nullptr;
}

int RoleplayManager::getRpSkillIndex(String skill, RpSkillType type) {
	switch (type){
		case RpSkillType::ATTRIBUTE:{
			for (int i = 0; i < attributes.size(); i++){
				if (attributes.get(i).getName() == skill){
					return i;
				}
			}
			break;
		}	
		case RpSkillType::SKILL:{
			for (int i = 0; i < skills.size(); i++){
				if (skills.get(i).getName() == skill){
					return i;
				}
			}
			break;
		}
		case RpSkillType::FORCESKILL:{
			for (int i = 0; i < forceSkills.size(); i++){
				if (forceSkills.get(i).getName() == skill){
					return i;
				}
			}
			break;
		}
		default: {
			error("getRPSkillIndex() was provided with an invalid type!");
			return -1;
		}
	}
	
	//Return -1, as we've not been able to find the skill!
	return -1;
}

RpSkillData RoleplayManager::getRpSkill(int index, RpSkillType type) {
	switch (type){
		case RpSkillType::ATTRIBUTE: return attributes.get(index);
		case RpSkillType::SKILL: return skills.get(index);
		case RpSkillType::FORCESKILL:return forceSkills.get(index);
		default:{
			error("getRpSkill() was provided with an invalid type.");
		}
	}
	return RpSkillData();
}

Vector<RpSkillData> RoleplayManager::getRpSkillList(RpSkillType type){
	switch (type){
		case RpSkillType::ATTRIBUTE: return attributes;
		case RpSkillType::SKILL: return skills;
		case RpSkillType::FORCESKILL:return forceSkills;
		default:{
			error("getRpSkillData() was provided with an invalid type.");
		}
	}
	return skills;
}