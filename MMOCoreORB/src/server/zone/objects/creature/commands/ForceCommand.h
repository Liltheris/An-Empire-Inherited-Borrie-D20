#ifndef FORCECOMMAND_H_
#define FORCECOMMAND_H_

#include "QueueCommand.h"
#include "server/zone/borrie/BorUtil.h"

class ForceCommand : public QueueCommand {

public: 

	String abilityName = "";

	ForceCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {
	
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		
		//First load our ability's lua data.

		Lua* lua = DirectorManager::instance()->getLuaInstance();

		lua->runFile("custom_scripts/abilities/force/" + abilityName + ".lua");

        LuaObject luaObject = lua->getGlobalObject(abilityName);

		if(!luaObject.isValidTable()) {
			creature->sendSystemMessage("Unable to find lua data for the ability ["+abilityName+"]!");
			return GENERALERROR;
		}

		int minFPI = luaObject.getIntField("minFPI", 0);
		int maxFPI = luaObject.getIntField("maxFPI", 999);

		bool isTargeted = luaObject.getBooleanField("isTargeted", false);

		int maxRange = luaObject.getIntField("maxRange", 32);

		if (creature == nullptr){
			return GENERALERROR;
		}

		ManagedReference<CreatureObject*> targetCreature;

		if (isTargeted) {
			ManagedReference<SceneObject*> targetObject;
			targetObject = server->getZoneServer()->getObject(target, false);

			if (targetObject->isCreatureObject()){
				targetCreature = targetObject->asCreatureObject();
			}

			if (targetCreature == nullptr){
				creature->sendSystemMessage("You need a valid target to use this Force power!");
				return SUCCESS;
			}
		}

		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();
		ManagedReference<CreatureObject*> caster = creature;

		if (ghost == nullptr)
			return GENERALERROR;

		int adminLevelCheck = ghost->getAdminLevel();

		if (creature->getStoredInt("secretdm") == 1) {
			adminLevelCheck = 15;
		}

		StringTokenizer args(arguments.toString());

		String forcePointInputString;
		if (args.hasMoreTokens()) {
			args.getStringToken(forcePointInputString);
		} else {
			openFPI_SUI();
			return SUCCESS;
		}

		// Allow admins to command NPCs to do force powers
		if (adminLevelCheck > 1){
			if (forcePointInputString.toLowerCase() == "npc"){
				uint64 storedTarget = creature->getStoredLong("storedtarget");
				ManagedReference<SceneObject*> storedObject;

				if (storedTarget != 0) {
					storedObject = server->getZoneServer()->getObject(storedTarget, false);
				}

				if (storedObject->isCreatureObject()){
					caster = storedObject->asCreatureObject();
				}
			}

			if (args.hasMoreTokens()) {
			args.getStringToken(forcePointInputString);
			} else {
				forcePointInputString = "";
			}
		}

		//Check that we are in range!
		if (isTargeted && caster->getDistanceTo(targetCreature) > maxRange){
			creature->sendSystemMessage("You are too far away to perform this force power!");
			return SUCCESS;
		}

		if (forcePointInputString.toLowerCase() == "help"){
			//Display our help text!
			String msg = luaObject.getStringField("helpText", "Could not find help text!");
			creature->sendSystemMessage(msg);
			return SUCCESS;
		}

		if (isValidFPI(caster, Integer::valueOf(forcePointInputString), minFPI, maxFPI)){
			performForceAction(creature, targetCreature, Integer::valueOf(forcePointInputString));
		} else {
			openFPI_SUI();
			return SUCCESS;
		}
	}

	virtual int performForceAction(CreatureObject* creature, CreatureObject* target, int inputFPI) const;

	bool isValidFPI(CreatureObject* creature, int fpi, int minFPI, int maxFPI) const {
		int progLimit = 0;

		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

		int playerMax = ghost->getForcePowerMax();

		// get our FPI limit from our Force progression.
		if (creature->hasSkill("rp_force_prog_master"))
			progLimit = playerMax;
		else if (creature->hasSkill("rp_force_prog_rank_04"))
			progLimit = playerMax / 2;
		else if (creature->hasSkill("rp_force_prog_rank_03"))
			progLimit = playerMax / 4;
		else if (creature->hasSkill("rp_force_prog_rank_02"))
			progLimit = 2;
		else if (creature->hasSkill("rp_force_prog_rank_01"))
			progLimit = 1;
		
		maxFPI = Math::min(progLimit, maxFPI);

		// check that our FPI is within the limits!
		return fpi <= maxFPI && fpi >= minFPI;
	}

	void openFPI_SUI() const {

	}
};

#endif //FORCECOMMAND_H_