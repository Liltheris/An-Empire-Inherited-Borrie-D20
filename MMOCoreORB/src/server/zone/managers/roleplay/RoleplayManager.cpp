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

	powerAttackDcMod = lua->getGlobalInt("powerAttackDcMod");

	LuaObject luaAimedMods = lua->getGlobalObject("aimedDcMods");

	if (luaAimedMods.isValidTable()){
		for (int i = 1; i < luaAimedMods.getTableSize(); i++){
			aimedDcMods[i-1] = luaAimedMods.getIntAt(i);
		}
	} else {
		fatal("LUA AIMEDDCMODS OBJECT IS NOT VALID!");
	}

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
		for (int i = 1; i <= luaStringExcludedNames.getTableSize(); i++){
			String name = luaStringExcludedNames.getStringAt(i);

			stringExcludedNames.add(name);
		}
	} else {
		fatal("LUA STRING EXCLUDED NAMES OBJECT IS NOT VALID!");
	}
	luaStringExcludedNames.pop();

	LuaObject luaForceTiers = lua->getGlobalObject("forceTiers");

	if (luaForceTiers.isValidTable()){
		for (int i = 1; i <= luaForceTiers.getTableSize(); i++){
			int forceTier = luaForceTiers.getIntAt(i);

			forceTiers.add(forceTier);
		}
	} else {
		fatal("LUA FORCE TIERS OBJECT IS NOT VALID!");
	}
	if (forceTiers.size() < 4){
		warning(" Force Tiers are incomplete! Found tiers: "+String::valueOf(forceTiers.size())+" Expected 4!");
	}
	luaForceTiers.pop();

	// Begin Combat animation data loading

	if (!lua->runFile("scripts/managers/roleplay/combat_animation_manager.lua")) {
		fatal("COULD NOT FIND COMBAT ANIMATIONS");
	}

	// Animation type thresholds

	midAnimThreshold = lua->getGlobalInt("midAnimThreshold");
	strongAnimThreshold = lua->getGlobalInt("strongAnimThreshold");

	// Pistol Anims

	LuaObject luaWeaponAnims = lua->getGlobalObject("rp_pistol_anims");
	if (luaWeaponAnims.isValidTable()){
		pistolAnims = RpCombatAnimSet(true);

		LuaObject anims = luaWeaponAnims.getObjectField("basic");
		if (anims.isValidTable()){
			for (int i = 1; i < anims.getTableSize(); i++){
				pistolAnims.addBasicAnim(anims.getStringAt(i));
			}
		}
		anims.pop();

		anims = luaWeaponAnims.getObjectField("flurry");
		if (anims.isValidTable()){
			for (int i = 1; i < anims.getTableSize(); i++){
				pistolAnims.addFlurryAnim(anims.getStringAt(i));
			}
		}
		anims.pop();

		anims = luaWeaponAnims.getObjectField("power");
		if (anims.isValidTable()){
			for (int i = 1; i < anims.getTableSize(); i++){
				pistolAnims.addPowerAnim(anims.getStringAt(i));
			}
		}
		anims.pop();

	} else {
		fatal("COMBAT ANIMS: PISTOL ANIMS LUA OBJECT IS NOT VALID!");
	}
	luaWeaponAnims.pop();

	// Carbine Anims

	luaWeaponAnims = lua->getGlobalObject("rp_carbine_anims");
	if (luaWeaponAnims.isValidTable()){
		carbineAnims = RpCombatAnimSet(true);

		LuaObject anims = luaWeaponAnims.getObjectField("basic");
		if (anims.isValidTable()){
			for (int i = 1; i < anims.getTableSize(); i++){
				carbineAnims.addBasicAnim(anims.getStringAt(i));
			}
		}
		anims.pop();

		anims = luaWeaponAnims.getObjectField("flurry");
		if (anims.isValidTable()){
			for (int i = 1; i < anims.getTableSize(); i++){
				carbineAnims.addFlurryAnim(anims.getStringAt(i));
			}
		}
		anims.pop();

		anims = luaWeaponAnims.getObjectField("power");
		if (anims.isValidTable()){
			for (int i = 1; i < anims.getTableSize(); i++){
				carbineAnims.addPowerAnim(anims.getStringAt(i));
			}
		}
		anims.pop();

	} else {
		fatal("COMBAT ANIMS: CARBINE ANIMS LUA OBJECT IS NOT VALID!");
	}
	luaWeaponAnims.pop();

	// Rifle Anims

	luaWeaponAnims = lua->getGlobalObject("rp_rifle_anims");
	if (luaWeaponAnims.isValidTable()){
		rifleAnims = RpCombatAnimSet(true);

		LuaObject anims = luaWeaponAnims.getObjectField("basic");
		if (anims.isValidTable()){
			for (int i = 1; i < anims.getTableSize(); i++){
				rifleAnims.addBasicAnim(anims.getStringAt(i));
			}
		}
		anims.pop();

		anims = luaWeaponAnims.getObjectField("flurry");
		if (anims.isValidTable()){
			for (int i = 1; i < anims.getTableSize(); i++){
				rifleAnims.addFlurryAnim(anims.getStringAt(i));
			}
		}
		anims.pop();

		anims = luaWeaponAnims.getObjectField("power");
		if (anims.isValidTable()){
			for (int i = 1; i < anims.getTableSize(); i++){
				rifleAnims.addPowerAnim(anims.getStringAt(i));
			}
		}
		anims.pop();

	} else {
		fatal("COMBAT ANIMS: RIFLE ANIMS LUA OBJECT IS NOT VALID!");
	}
	luaWeaponAnims.pop();

	// Sniper Anims

	luaWeaponAnims = lua->getGlobalObject("rp_sniper_anims");
	if (luaWeaponAnims.isValidTable()){
		sniperAnims = RpCombatAnimSet(true);

		LuaObject anims = luaWeaponAnims.getObjectField("basic");
		if (anims.isValidTable()){
			for (int i = 1; i < anims.getTableSize(); i++){
				sniperAnims.addBasicAnim(anims.getStringAt(i));
			}
		}
		anims.pop();

		anims = luaWeaponAnims.getObjectField("flurry");
		if (anims.isValidTable()){
			for (int i = 1; i < anims.getTableSize(); i++){
				sniperAnims.addFlurryAnim(anims.getStringAt(i));
			}
		}
		anims.pop();

		anims = luaWeaponAnims.getObjectField("power");
		if (anims.isValidTable()){
			for (int i = 1; i < anims.getTableSize(); i++){
				sniperAnims.addPowerAnim(anims.getStringAt(i));
			}
		}
		anims.pop();

	} else {
		fatal("COMBAT ANIMS: SNIPER ANIMS LUA OBJECT IS NOT VALID!");
	}
	luaWeaponAnims.pop();

	// Repeater Anims

	luaWeaponAnims = lua->getGlobalObject("rp_repeater_anims");
	if (luaWeaponAnims.isValidTable()){
		repeaterAnims = RpCombatAnimSet(true);

		LuaObject anims = luaWeaponAnims.getObjectField("basic");
		if (anims.isValidTable()){
			for (int i = 1; i < anims.getTableSize(); i++){
				repeaterAnims.addBasicAnim(anims.getStringAt(i));
			}
		}
		anims.pop();

		anims = luaWeaponAnims.getObjectField("flurry");
		if (anims.isValidTable()){
			for (int i = 1; i < anims.getTableSize(); i++){
				repeaterAnims.addFlurryAnim(anims.getStringAt(i));
			}
		}
		anims.pop();

		anims = luaWeaponAnims.getObjectField("power");
		if (anims.isValidTable()){
			for (int i = 1; i < anims.getTableSize(); i++){
				repeaterAnims.addPowerAnim(anims.getStringAt(i));
			}
		}
		anims.pop();

	} else {
		fatal("COMBAT ANIMS: REPEATER ANIMS LUA OBJECT IS NOT VALID!");
	}
	luaWeaponAnims.pop();

	// 1h Anims

	luaWeaponAnims = lua->getGlobalObject("rp_1h_anims");
	if (luaWeaponAnims.isValidTable()){
		swordAnims = RpCombatAnimSet(false);

		LuaObject anims = luaWeaponAnims.getObjectField("basic");
		if (anims.isValidTable()){
			LuaObject subAnims = anims.getObjectField("weak");
			if (subAnims.isValidTable()){
				for (int i = 1; i < subAnims.getTableSize(); i++){
					swordAnims.addBasicAnim(subAnims.getStringAt(i), "weak");
				}
			}
			subAnims.pop();

			subAnims = anims.getObjectField("mid");
			if (subAnims.isValidTable()){
				for (int i = 1; i < subAnims.getTableSize(); i++){
					swordAnims.addBasicAnim(subAnims.getStringAt(i), "mid");
				}
			}
			subAnims.pop();

			subAnims = anims.getObjectField("strong");
			if (subAnims.isValidTable()){
				for (int i = 1; i < subAnims.getTableSize(); i++){
					swordAnims.addBasicAnim(subAnims.getStringAt(i), "strong");
				}
			}
			subAnims.pop();
		}
		anims.pop();

		anims = luaWeaponAnims.getObjectField("flurry");
		if (anims.isValidTable()){
			for (int i = 1; i < anims.getTableSize(); i++){
				swordAnims.addFlurryAnim(anims.getStringAt(i));
			}
		}
		anims.pop();

		anims = luaWeaponAnims.getObjectField("power");
		if (anims.isValidTable()){
			for (int i = 1; i < anims.getTableSize(); i++){
				swordAnims.addPowerAnim(anims.getStringAt(i));
			}
		}
		anims.pop();

	} else {
		fatal("COMBAT ANIMS: 1H ANIMS LUA OBJECT IS NOT VALID!");
	}
	luaWeaponAnims.pop();

	// 2h Anims

	luaWeaponAnims = lua->getGlobalObject("rp_2h_anims");
	if (luaWeaponAnims.isValidTable()){
		sword2hAnims = RpCombatAnimSet(false);

		LuaObject anims = luaWeaponAnims.getObjectField("basic");
		if (anims.isValidTable()){
			LuaObject subAnims = anims.getObjectField("weak");
			if (subAnims.isValidTable()){
				for (int i = 1; i < subAnims.getTableSize(); i++){
					sword2hAnims.addBasicAnim(subAnims.getStringAt(i), "weak");
				}
			}
			subAnims.pop();

			subAnims = anims.getObjectField("mid");
			if (subAnims.isValidTable()){
				for (int i = 1; i < subAnims.getTableSize(); i++){
					sword2hAnims.addBasicAnim(subAnims.getStringAt(i), "mid");
				}
			}
			subAnims.pop();

			subAnims = anims.getObjectField("strong");
			if (subAnims.isValidTable()){
				for (int i = 1; i < subAnims.getTableSize(); i++){
					sword2hAnims.addBasicAnim(subAnims.getStringAt(i), "strong");
				}
			}
			subAnims.pop();
		}
		anims.pop();

		anims = luaWeaponAnims.getObjectField("flurry");
		if (anims.isValidTable()){
			for (int i = 1; i < anims.getTableSize(); i++){
				sword2hAnims.addFlurryAnim(anims.getStringAt(i));
			}
		}
		anims.pop();

		anims = luaWeaponAnims.getObjectField("power");
		if (anims.isValidTable()){
			for (int i = 1; i < anims.getTableSize(); i++){
				sword2hAnims.addPowerAnim(anims.getStringAt(i));
			}
		}
		anims.pop();

	} else {
		fatal("COMBAT ANIMS: 2H ANIMS LUA OBJECT IS NOT VALID!");
	}
	luaWeaponAnims.pop();

	// 1h Anims

	luaWeaponAnims = lua->getGlobalObject("rp_pole_anims");
	if (luaWeaponAnims.isValidTable()){
		poleAnims = RpCombatAnimSet(false);

		LuaObject anims = luaWeaponAnims.getObjectField("basic");
		if (anims.isValidTable()){
			LuaObject subAnims = anims.getObjectField("weak");
			if (subAnims.isValidTable()){
				for (int i = 1; i < subAnims.getTableSize(); i++){
					poleAnims.addBasicAnim(subAnims.getStringAt(i), "weak");
				}
			}
			subAnims.pop();

			subAnims = anims.getObjectField("mid");
			if (subAnims.isValidTable()){
				for (int i = 1; i < subAnims.getTableSize(); i++){
					poleAnims.addBasicAnim(subAnims.getStringAt(i), "mid");
				}
			}
			subAnims.pop();

			subAnims = anims.getObjectField("strong");
			if (subAnims.isValidTable()){
				for (int i = 1; i < subAnims.getTableSize(); i++){
					poleAnims.addBasicAnim(subAnims.getStringAt(i), "strong");
				}
			}
			subAnims.pop();
		}
		anims.pop();

		anims = luaWeaponAnims.getObjectField("flurry");
		if (anims.isValidTable()){
			for (int i = 1; i < anims.getTableSize(); i++){
				poleAnims.addFlurryAnim(anims.getStringAt(i));
			}
		}
		anims.pop();

		anims = luaWeaponAnims.getObjectField("power");
		if (anims.isValidTable()){
			for (int i = 1; i < anims.getTableSize(); i++){
				poleAnims.addPowerAnim(anims.getStringAt(i));
			}
		}
		anims.pop();

	} else {
		fatal("COMBAT ANIMS: POLE ANIMS LUA OBJECT IS NOT VALID!");
	}
	luaWeaponAnims.pop();

	// Unarmed Anims

	luaWeaponAnims = lua->getGlobalObject("rp_unarmed_anims");
	if (luaWeaponAnims.isValidTable()){
		unarmedAnims = RpCombatAnimSet(false);

		LuaObject anims = luaWeaponAnims.getObjectField("basic");
		if (anims.isValidTable()){
			LuaObject subAnims = anims.getObjectField("weak");
			if (subAnims.isValidTable()){
				for (int i = 1; i < subAnims.getTableSize(); i++){
					unarmedAnims.addBasicAnim(subAnims.getStringAt(i), "weak");
				}
			}
			subAnims.pop();

			subAnims = anims.getObjectField("mid");
			if (subAnims.isValidTable()){
				for (int i = 1; i < subAnims.getTableSize(); i++){
					unarmedAnims.addBasicAnim(subAnims.getStringAt(i), "mid");
				}
			}
			subAnims.pop();

			subAnims = anims.getObjectField("strong");
			if (subAnims.isValidTable()){
				for (int i = 1; i < subAnims.getTableSize(); i++){
					unarmedAnims.addBasicAnim(subAnims.getStringAt(i), "strong");
				}
			}
			subAnims.pop();
		}
		anims.pop();

		anims = luaWeaponAnims.getObjectField("flurry");
		if (anims.isValidTable()){
			for (int i = 1; i < anims.getTableSize(); i++){
				unarmedAnims.addFlurryAnim(anims.getStringAt(i));
			}
		}
		anims.pop();

		anims = luaWeaponAnims.getObjectField("power");
		if (anims.isValidTable()){
			for (int i = 1; i < anims.getTableSize(); i++){
				unarmedAnims.addPowerAnim(anims.getStringAt(i));
			}
		}
		anims.pop();

	} else {
		fatal("COMBAT ANIMS: UNARMED ANIMS LUA OBJECT IS NOT VALID!");
	}
	luaWeaponAnims.pop();

	delete lua;
	lua = nullptr;
}

int RoleplayManager::getRpSkillIndex(String skill, RpSkillType type) const {
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

RpSkillData RoleplayManager::getRpSkill(int index, RpSkillType type) const {
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

Vector<RpSkillData> RoleplayManager::getRpSkillList(RpSkillType type) const {
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

String RoleplayManager::getCombatAnim(String animSet, int damage) const {
	int level = 0;

	if (damage >= strongAnimThreshold)
		level = 2;
	else if (damage >= midAnimThreshold)
		level = 1;

	String anim = getAnimSet(animSet).getBasicAnim(level);

	info("getCombatAnim() - level: "+String::valueOf(level)+" animSet: "+animSet+" - Anim: "+anim, true);
	return anim;
}

RpCombatAnimSet RoleplayManager::getAnimSet(String setName) const {
	if (setName == "pistol")
		return pistolAnims;
	else if (setName == "carbine")
		return carbineAnims;
	else if (setName == "rifle")
		return rifleAnims;
	else if (setName == "sniper")
		return sniperAnims;
	else if (setName == "repeater")
		return repeaterAnims;
	else if (setName == "1h")
		return swordAnims;
	else if (setName == "2h")
		return sword2hAnims;
	else if (setName == "pole")
		return poleAnims;
	else if (setName == "unarmed")
		return unarmedAnims;
	else return pistolAnims;
}

int RoleplayManager::getForceTierRequirement(int tier) const {
	if (tier < 2 || tier > 5)
		return -1;

	return forceTiers.get(tier-2);
}