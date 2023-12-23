#ifndef RPREPAIRCOMMANDSUICALLBACK_H_
#define RPREPAIRCOMMANDSUICALLBACK_H_

#include "server/zone/objects/player/sui/SuiCallback.h"
#include "server/zone/objects/scene/SceneObject.h"

#include "server/zone/borrie/BorCombat.h"

class RpRepairCommandSuiCallback : public SuiCallback {
private:

	uint64 target;

	std::vector<int> items = {};

public:
	void setItems(std::vector<int> foundItems){
		items = foundItems;
	}

	RpRepairCommandSuiCallback(ZoneServer* server, uint64 _target) : SuiCallback(server) {

		target = _target;

	}

	void run(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args) {
		bool cancelPressed = (eventIndex == 1);
		int index = Integer::valueOf(args->get(0).toString());

		if (cancelPressed)
			return;

		SceneObject* inventory = player->getSlottedObject("inventory");
        if (inventory == nullptr)
            return;

		TangibleObject* item = nullptr;

		// Retrieving our object to repair
		item = inventory->getContainerObject(items[index])->asTangibleObject();

		if (item == nullptr){
			player->sendSystemMessage("Something went wrong while attempting to repair your item.");
			return;
		}

		// Determine the DC!
		int repairDifficulty = 0;

		if (item->getConditionDamage() >= item->getMaxCondition()){
			// The item is completely destroyed.
			repairDifficulty = 10;
		} else {
			float damageFactor = item->getMaxCondition() - item->getConditionDamage() / item->getMaxCondition();

			if (damageFactor < 0.25)
				repairDifficulty = 8;
			else if (damageFactor < 0.5)
				repairDifficulty = 6;
			else if (damageFactor < 0.75)
				repairDifficulty = 4;
			else repairDifficulty = 2;
		}
		int dc = repairDifficulty + 10;
		int mechanicsSkill = player->getSkillMod("rp_mechanics");
		int roll = BorDice::Roll(1, 20);

		int result = roll + mechanicsSkill;

		String displayName = "";

		// Get the item's custom name, or the template name.
		if(item->getCustomObjectName() != "")
			displayName = item->getCustomObjectName().toString();
		else displayName = item->getObjectTemplate()->getObjectName();

		String repairSpam = player->getFirstName() +" attempts to perform a repair on ["+ displayName +"]";

		if (roll == 1) {
			// Total failure to repair!
			int damage = item->getMaxCondition() / 4;

			repairSpam += " and fails catastrophically! The item has taken an additional "+ BorCombat::damageNumber(damage) +" damage! ("+ BorCombat::rollSpam(roll, mechanicsSkill, dc) +")";
			item->setConditionDamage(item->getConditionDamage() + damage);
		} else if (result < dc) {
			// Failure to repair!
			repairSpam += " and fails! ("+ BorCombat::rollSpam(roll, mechanicsSkill, dc) +")";

		} else if (roll == 20) {
			// Critical success!
			repairSpam += " and succeeds! The item has been restored to perfect condition! ("+ BorCombat::rollSpam(roll, mechanicsSkill, dc) +")";
			item->setConditionDamage(0);
		} else {
			// Normal success!
			int repairRoll = BorDice::Roll(5, 20);
			repairSpam += " and succeeds! The item has been repaired by (5d20) = "+ String::valueOf(repairRoll) +" points! ("+ BorCombat::rollSpam(roll, mechanicsSkill, dc) +")";
			
			int newCondition = item->getConditionDamage() - repairRoll;
			if (newCondition < 0)
				newCondition = 0;

			item->setConditionDamage(newCondition);
		}
	}
};

#endif