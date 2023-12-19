/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef RPRELOADCOMMAND_H_
#define RPRELOADCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/borrie/BorCombat.h"

class RpreloadCommand : public QueueCommand {
public:
	RpreloadCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (!creature->isPlayerCreature())
			return GENERALERROR;

		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

		if (ghost == nullptr)
			return GENERALERROR;

		int adminLevelCheck = ghost->getAdminLevel();

		if (creature->getStoredInt("secretdm") == 1) {
			adminLevelCheck = 15;
		}

		if (target != 0 && adminLevelCheck >= 1) {
			// We're reloading an NPC's weapon.
			ManagedReference<CreatureObject*> targetCreature;
			targetCreature = server->getZoneServer()->getObject(target, false)->asCreatureObject();

			if (targetCreature == nullptr) {
				creature->sendSystemMessage("Your target needs to be a creature in order to reload!");
				return SUCCESS;
			}
			// Reload the weapon.
			BorCombat::reloadWeapon(targetCreature, creature, creature->getWeapon());
			return SUCCESS;

		} else {
			// We're reloading our own weapon.
			BorCombat::reloadWeapon(creature, creature, creature->getWeapon());
			return SUCCESS;
		}
		return SUCCESS;
	}

};

#endif //RPRELOADCOMMAND_H_
