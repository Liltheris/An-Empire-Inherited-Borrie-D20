/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef FIREHEAVYWEAPONCOMMAND_H_
#define FIREHEAVYWEAPONCOMMAND_H_

#include "server/zone/borrie/BorCombat.h"

class FireHeavyWeaponCommand : public CombatQueueCommand {
public:

	FireHeavyWeaponCommand(const String& name, ZoneProcessServer* server)
		: CombatQueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		StringTokenizer tokenizer(arguments.toString());
		if (!tokenizer.hasMoreTokens())
			return INVALIDPARAMETERS;

		try {

			uint64 weaponID = tokenizer.getLongToken();
			Reference<WeaponObject*> weapon = server->getZoneServer()->getObject(weaponID).castTo<WeaponObject*>();
			if (weapon == nullptr || !weapon->isHeavyWeapon())
				return INVALIDPARAMETERS;

			if (!weapon->isASubChildOf(creature))
				return GENERALERROR;

			ManagedReference<TangibleObject*> targetObject = server->getZoneServer()->getObject(target).castTo<TangibleObject*>();
			if (targetObject == nullptr)
				return GENERALERROR;

			/* D20 System - Start
			if (!(targetObject->isAttackableBy(creature)))
				return GENERALERROR;
			D20 System - End*/

			SharedObjectTemplate* templateData = TemplateManager::instance()->getTemplate(weapon->getServerObjectCRC());

			if (templateData == nullptr)
				return GENERALERROR;

			SharedWeaponObjectTemplate* weaponData = cast<SharedWeaponObjectTemplate*>(templateData);

			if (weaponData == nullptr)
				return GENERALERROR;

			UnicodeString args = "combatSpam=" + weaponData->getCombatSpam() + ";";

			//int result = doCombatAction(creature, target, args, weapon);

			String animName = getAnimation(creature, targetObject, weapon, 0x01, 0x00);
			uint32 animCRC = animName.hashCode();

			CombatAction* combatAction = new CombatAction(creature, targetObject, animCRC, 0x01, CombatManager::DEFAULTTRAIL, weapon->getObjectID());
			creature->broadcastMessage(combatAction,true);

			ManagedReference<CreatureObject*> targetCreature = targetObject->asCreatureObject();

			BorCombat::fireHeavyWeapon(creature, targetCreature, creature, weapon);

			// We need to give some time for the combat animation to start playing before destroying the tano
			Core::getTaskManager()->scheduleTask([weapon] {
				Locker lock(weapon);
				weapon->decreaseUseCount();
			}, "FireHeavyWeaponTanoDecrementTask", 100);

			return SUCCESS;

		} catch (Exception& e) {

		}

		return GENERALERROR;
	}

	String getAnimation(TangibleObject* attacker, TangibleObject* defender, WeaponObject* weapon, uint8 hitLocation, int damage) const {
		SharedWeaponObjectTemplate* weaponData = cast<SharedWeaponObjectTemplate*>(weapon->getObjectTemplate());

		if (weaponData == nullptr) {
			warning("Null weaponData in FireHeavyWeapon::getAnimation");
			return "";
		}

		return "fire_heavy_" + weaponData->getAnimationType() + getIntensity(weapon->getMinDamage() * weapon->getMaxDamage() + weapon->getBonusDamage()/ 2.0f, damage);
	}

	float getCommandDuration(CreatureObject *object, const UnicodeString& arguments) const {
		StringTokenizer tokenizer(arguments.toString());
		uint64 weaponID = tokenizer.getLongToken();
		ManagedReference<WeaponObject*> weapon = server->getZoneServer()->getObject(weaponID).castTo<WeaponObject*>();

		if (weapon != nullptr)
			return CombatManager::instance()->calculateWeaponAttackSpeed(object, weapon, speedMultiplier);
		else
			return defaultTime * speedMultiplier;
	}

};

#endif //FIREHEAVYWEAPONCOMMAND_H_
