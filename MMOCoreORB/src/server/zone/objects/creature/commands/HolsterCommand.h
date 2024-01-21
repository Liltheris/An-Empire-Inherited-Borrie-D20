/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.
        
        Original file from Empire in Flames
        https://www.empireinflames.com/

        https://gitlab.com/Halyn/EiF-Public/-/blob/unstable/MMOCoreORB/src/server/zone/objects/creature/commands/HolsterCommand.h
        */

#ifndef HOLSTERCOMMAND_H_
#define HOLSTERCOMMAND_H_

#include "server/zone/objects/creature/events/HolsterTask.h"

class HolsterCommand : public QueueCommand {
public:

	HolsterCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

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

		ManagedReference<SceneObject*> object;
		if (target != 0) {
			object = server->getZoneServer()->getObject(target, false);
		}

		ManagedReference<CreatureObject*> targetCreature;


		if (adminLevelCheck > 0) {
			if (object != nullptr) {
				if (object->isCreatureObject()) {
					targetCreature = object->asCreatureObject();
				} else {
					targetCreature = creature;
				}
			} else {
				targetCreature = creature;
			}			
		} else {
			targetCreature = creature;
		}

		if (targetCreature->isInCombat()) {
			targetCreature->sendSystemMessage("You cannot holster a weapon in combat!");
			return GENERALERROR;
		}
		
		Reference<Task*> pendingTask = targetCreature->getPendingTask("holster");
		if (pendingTask != nullptr)
			return SUCCESS;

		pendingTask = targetCreature->getPendingTask("unholster");
		if (pendingTask != nullptr)
			return SUCCESS;
		
		pendingTask = targetCreature->getPendingTask("stow");
		if (pendingTask != nullptr)
			return SUCCESS;

		pendingTask = targetCreature->getPendingTask("unstow");
		if (pendingTask != nullptr)
			return SUCCESS;
		
		pendingTask = targetCreature->getPendingTask("shoulder");
		if (pendingTask != nullptr)
			return SUCCESS;

		pendingTask = targetCreature->getPendingTask("unshoulder");
		if (pendingTask != nullptr)
			return SUCCESS;

		ManagedReference<WeaponObject*> heldWeapon = targetCreature->getSlottedObject("hold_r").castTo<WeaponObject*>();
		ManagedReference<WeaponObject*> holsteredWeapon = targetCreature->getHolsteredWeapon("holster");
		if (holsteredWeapon != nullptr) {
			for (int j = 0; j < holsteredWeapon->getArrangementDescriptorSize(); ++j) {
				const Vector<String>* descriptors = holsteredWeapon->getArrangementDescriptor(j);
				for (int k = 0; k < descriptors->size(); ++k) {
					const String& descriptorName = descriptors->get(k);
					if (descriptorName == "hip_holster_melee" || descriptorName == "hip_holster_gun" || descriptorName == "hip_holster_melee_reverse") {
						targetCreature->doAnimation("draw_holster");
						Reference<Task*> task = new HolsterTask(targetCreature, holsteredWeapon);
						targetCreature->addPendingTask("unholster", task, 100);
					}
					if (descriptorName == "back_holster_melee" || descriptorName == "back_holster_gun" || descriptorName == "back_holster_melee_alt" || descriptorName == "back_holster_gun_alt") {
						targetCreature->doAnimation("draw_pack");
						Reference<Task*> task = new HolsterTask(targetCreature, holsteredWeapon);
						targetCreature->addPendingTask("unholster", task, 500);
					}
				}
			}
		} else if (heldWeapon != nullptr) {
			for (int j = 0; j < heldWeapon->getArrangementDescriptorSize(); ++j) {
				const Vector<String>* descriptors = heldWeapon->getArrangementDescriptor(j);
				for (int k = 0; k < descriptors->size(); ++k) {
					const String& descriptorName = descriptors->get(k);
					if (descriptorName == "hip_holster_melee" || descriptorName == "hip_holster_gun" || descriptorName == "hip_holster_melee_reverse") {
						targetCreature->doAnimation("stow_holster");
						Reference<Task*> task = new HolsterTask(targetCreature, heldWeapon);
						targetCreature->addPendingTask("holster", task, 500);
					}
					if (descriptorName == "back_holster_melee" || descriptorName == "back_holster_gun" || descriptorName == "back_holster_melee_alt" || descriptorName == "back_holster_gun_alt") {
						targetCreature->doAnimation("stow_pack");
						Reference<Task*> task = new HolsterTask(targetCreature, heldWeapon);
						targetCreature->addPendingTask("holster", task, 500);
					}
				}
			}
		}

		// creature->info("transfer item command");
		return SUCCESS;
	}

};

#endif //HOLSTERCOMMAND_H_