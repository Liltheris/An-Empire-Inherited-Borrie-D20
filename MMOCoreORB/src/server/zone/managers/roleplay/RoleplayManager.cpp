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

	//apprenticeshipEnabled = lua->getGlobalByte("apprenticeshipEnabled");

	delete lua;
	lua = nullptr;
}