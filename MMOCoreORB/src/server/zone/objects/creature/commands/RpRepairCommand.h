#ifndef RPREPAIRCOMMAND_H_
#define RPREPAIRCOMMAND_H_

#include "QueueCommand.h"
#include "server/zone/objects/player/sui/listbox/SuiListBox.h"
#include "server/zone/objects/creature/sui/RpRepairCommandSuiCallback.h"

class RpRepairCommand : public QueueCommand {

public:
	RpRepairCommand(const String& name, ZoneProcessServer* serv) : QueueCommand(name, serv) {
		
	}

	static bool canRepairItem(CreatureObject* creature, TangibleObject* item){
		if (item == nullptr){
			return false;
			creature->sendSystemMessage("FOUND ITEM WAS NULL");
		}

		// Repair difficulty is determined by object rarity, modification and damage.
		String itemRarity = item->getRarity();

		int rarityDifficulty = 0;
		int modDifficulty = 0;

		if (itemRarity == "Uncommon")
			rarityDifficulty = 4;
		else if (itemRarity == "Rare")
			rarityDifficulty = 6;
		else if (itemRarity == "Epic")
			rarityDifficulty = 8;
		else if (itemRarity == "Legendary")
			rarityDifficulty = 10;
		else rarityDifficulty = 2;

		if (item->getStoredInt("player_modified") > 0)
			modDifficulty = 2;
		
		// Engineering difficulty is combined rarity and mod difficulty, capped at 10.
		int engineeringCheck = rarityDifficulty + modDifficulty;
		if (engineeringCheck > 10)
			engineeringCheck = 10;

		return creature->getSkillMod("rp_engineering") >= engineeringCheck;
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (creature == nullptr){
			return GENERALERROR;
		}

		if (!creature->isPlayerObject()){
			creature->sendSystemMessage("NOT A PLAYER.");
			return GENERALERROR;
		}

		SceneObject* inventory = creature->getSlottedObject("inventory");
        if (inventory == nullptr) {
			creature->sendSystemMessage("MISSING INVENTORY");
            return GENERALERROR;
		}
		// Initilising our callback object.
		RpRepairCommandSuiCallback* callback = new RpRepairCommandSuiCallback(creature->getZoneServer(), target);

		TangibleObject* item = nullptr;
		std::vector<int> foundObjects = {};

		// Set up our repair dialogue box.
		ManagedReference<SuiListBox*> box = new SuiListBox(creature, SuiWindowType::JUKEBOX_SELECTION);

		box->setPromptTitle("Repair Menu");
		box->setPromptText("Select an item below to repair.\n\nRepairs may only be performed on items that you understand how to repair, and have taken damage.");
		box->setCancelButton(true, "@cancel");

        for (int i = 0; i < inventory->getContainerObjectsSize(); ++i) {
			item = inventory->getContainerObject(i)->asTangibleObject();

			if (item != nullptr){
				// We only want to list items that we can actually repair, and are damaged.
				if ((item->isArmorObject() || item->isWeaponObject()) && item->getConditionDamage() != 0 && canRepairItem(creature, item))
				{
					creature->sendSystemMessage("FOUND AN ITEM");
					// Found an item we can repair.
					foundObjects.push_back(i);
					String displayName = "";

					// Get the item's custom name, or the template name.
					if(item->getCustomObjectName() != "")
						displayName = item->getCustomObjectName().toString();
					else displayName = item->getObjectTemplate()->getObjectName();

					// Finally add our item to the box.
					box->addMenuItem(displayName);
				}
			}
		}
		callback->setItems(foundObjects);
		box->setCallback(callback);
		creature->getPlayerObject()->addSuiBox(box);
		creature->sendMessage(box->generateMessage());

		return SUCCESS;
	}
};

#endif

