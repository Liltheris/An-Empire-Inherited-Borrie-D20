#ifndef BORCHARACTER_H_
#define BORCHARACTER_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/managers/creature/CreatureManager.h"
#include "server/zone/packets/chat/ChatSystemMessage.h"
#include "server/zone/managers/stringid/StringIdManager.h"

//#include "templates/roleplay/RoleplayManager.h"

#include "server/zone/borrie/BorString.h"
#include "server/zone/borrie/BorrieRPG.h"
#include "server/zone/borrie/BorSkill.h"
#include "server/zone/borrie/BorDice.h"

#include "server/db/ServerDatabase.h"

#include "server/zone/objects/creature/sui/ForceSensitivePromptSuiCallback.h"

#include "server/zone/objects/tangible/pharmaceutical/StimPack.h"
#include "server/zone/objects/area/CampSiteActiveArea.h"

#include "templates/params/creature/CreatureAttribute.h"
#include "templates/params/creature/CreaturePosture.h"


class BorCharacter : public Logger {
public:
	static bool GetStringIsPool(String pool) {
		if (pool == "health")
			return true;
		else if (pool == "action")
			return true;
		else if (pool == "force")
			return true;
		else if (pool == "will")
			return true;
		else
			return false;
	}

	static int getAvailableAction(CreatureObject* creature) {
        if(creature->getHAM(3) == 0)
            return creature->getHAM(6);
        else return creature->getHAM(3) + creature->getHAM(6);
    }

    static int getAvailableForce(CreatureObject* creature) {
        if(creature->isPlayerCreature()) {
            return creature->getPlayerObject()->getForcePower();
        } else {
            return 99; //TODO: Should be an actual pool on NPCs.
        }
    }

	static void drainActionOrWill(CreatureObject* creature, int amount) {
        if(creature->getHAM(3) >= amount)
            BorCharacter::ModPool(creature, "action", -amount, true);
        else {
            int remainingAction = creature->getHAM(3);
            BorCharacter::ModPool(creature, "action", -remainingAction, true);
            BorCharacter::ModPool(creature, "will", -(amount - remainingAction), true);
        }
    }

    static void drainForce(CreatureObject* creature, int amount) {
        if(creature->isPlayerCreature()) {
            BorCharacter::ModPool(creature, "force", -amount, true);
        } else {
            //TODO: Handle NPC force pool.
        }
    }

	static bool HasRequiredArmourSkill(CreatureObject* creature, String slot){
		ManagedReference<ArmorObject*> armour = GetArmorAtSlot(creature, slot);
		if(armour == nullptr)
			return true;
		// Bypass this check for NPCs to simplify setup.
		return creature->getSkillMod("rp_armor") >= armour->getRpSkillLevel() || !creature->isPlayerCreature();
	}

	static bool IsWearingArmourUnskilled(CreatureObject* creature){
		if(!HasRequiredArmourSkill(creature, "shoes"))
			return true;
		if(!HasRequiredArmourSkill(creature, "pants1"))
			return true;
		if(!HasRequiredArmourSkill(creature, "bicep_r"))
			return true;
		if(!HasRequiredArmourSkill(creature, "bicep_l"))
			return true;
		if(!HasRequiredArmourSkill(creature, "bracer_upper_r"))
			return true;
		if(!HasRequiredArmourSkill(creature, "bracer_upper_l"))
			return true;
		if(!HasRequiredArmourSkill(creature, "gloves"))
			return true;
		if(!HasRequiredArmourSkill(creature, "hat"))
			return true;
		if(!HasRequiredArmourSkill(creature, "chest"))
			return true;
		// All slots check out!
		return false;
	}

	static ManagedReference<ArmorObject*> GetArmorAtSlot(CreatureObject* creature, String slot) {
		if (creature->isPlayerCreature()){
			// Easy way to quickly retrive from a player!
			return creature->getWearablesDeltaVector()->getArmorAtSlot(slot);
		} else {
			int size = creature->getSlottedObjectsSize();

			for (int i = 0; i < size; i++) {
				SceneObject* sceo = creature->getSlottedObject(slot);
				ManagedReference<ArmorObject*> item = cast<ArmorObject*>(sceo);

				if (item != nullptr)
					return item;
			}
		}
		return nullptr;
	}

	static void SetChatPrefix(CreatureObject* creature, String prefix) {
		creature->sendSystemMessage("All of your messages sent in spatial will be preceded with: \""+prefix+"\"");
		creature->setStoredString("chat_prefix", prefix);
	}

	static void ClearChatPrefix(CreatureObject* creature) {
		creature->sendSystemMessage("You will no longer speak with a prefix to your chat.");
		creature->deleteStoredString("chat_prefix");
	}

	static void ToggleJedi(CreatureObject* dm, CreatureObject* creature) {
		Locker clocker(dm, creature);

		ManagedReference<PlayerObject*> targetGhost = creature->getPlayerObject();
		if(targetGhost == nullptr)
			return;

		int jediState = targetGhost->getJediState();

		if(jediState > 1)
			jediState = 0;
		else if(jediState == 0) 
			jediState = 2;

		targetGhost->setJediState(jediState);

		if(jediState == 2)
			dm->sendSystemMessage("You've enabled " + creature->getFirstName() + " to be Force Sensitive");
		else 
			dm->sendSystemMessage("You've disabled " + creature->getFirstName() + " from being Force Sensitive");
	}

	static void PromptForceQuestion(CreatureObject* creature) {
		int hasDecided = creature->getStoredInt("fs_chosen");

		if(hasDecided != 1) {
			if (creature->hasSkill("species_miraluka") || creature->hasSkill("always_force_sensitive")) {
				//Miraluka are always Force Sensitive.
				hasDecided = 1;

				SkillManager* skillManager = SkillManager::instance();

				ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();
				if(ghost == nullptr)
					return;

				ghost->setJediState(1);
				skillManager->awardSkill("rp_force_prog_novice", creature, true, true, true);
				creature->setStoredInt("fs_chosen", 1);

			} else {
				ManagedReference<SuiListBox*> box = new SuiListBox(creature, SuiWindowType::JUKEBOX_SELECTION);
				box->setCancelButton(true, "Decide Later");
				box->setCallback(new ForceSensitivePromptSuiCallback(creature->getZoneServer()));
				box->setPromptTitle("Force Sensitivity");
				String message = "You must choose whether or not this character is sensitive to the Force. ";
				message += "If you choose to be Force Sensitive, you will have the option to train your ability in the Force, becoming Jedi, Sith, or something else. ";
				message += "If you opt not to be Force Sensitive, you will not be able to train in the Force, but are safe from persecution by the Inquisitorius. ";
				message += "WARNING: Once you've made this decision, it is final. So choose carefully.";
				box->setPromptText(message);
				box->setOkButton(false, "@");
				box->addMenuItem("I am Force Sensitive");
				box->addMenuItem("I am NOT Force Sensitive");
				box->addMenuItem("Surprise me!");
				creature->getPlayerObject()->addSuiBox(box);
				creature->sendMessage(box->generateMessage());
			}
		}
	}

	static void AddState(CreatureObject* creature, String state, bool alertEveryone = false) {
		Locker clocker(creature);
		if (state == "stunned" || state == "stun") {
			creature->setState(CreatureState::STUNNED);
			if (alertEveryone)
				BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " has been stunned!");
		} else if (state == "blinded" || state == "blind") {
			creature->setState(CreatureState::BLINDED);
			if (alertEveryone)
				BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " has been blinded!");
		} else if (state == "immobilized" || state == "immobile") {
			creature->setState(CreatureState::IMMOBILIZED);
			if (alertEveryone)
				BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " has been immobilized!");
		} else if (state == "knockeddown" || state == "knockdown" || state == "kd") {
			if (alertEveryone)
				BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " has been knocked down!");
		} else if (state == "burning" || state == "onfire" || state == "fire" || state == "burn") {
			creature->setState(CreatureState::ONFIRE);
			if (alertEveryone)
				BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " has set on fire!");
		} else if (state == "bleeding" || state == "bleed" || state == "bleeding") {
			creature->setState(CreatureState::BLEEDING);
			if (alertEveryone)
				BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " has started bleeding!");
		} else {
			creature->sendSystemMessage("ERROR: Invalid state specified. Try stun, blind, immobile, knockdown, fire, or bleed.");
		}
	}

	static void RemoveAllStates(CreatureObject* creature, bool allStates) {
		Locker clocker(creature);
		creature->clearState(CreatureState::STUNNED);
		creature->clearState(CreatureState::BLINDED);
		creature->clearState(CreatureState::IMMOBILIZED);
		if(allStates) {
			creature->clearState(CreatureState::ONFIRE);
			creature->clearState(CreatureState::BLEEDING);
		}
	}

	static void ApplyEndTurnStateDamages(CreatureObject* creature) {
		StringBuffer text;
		int damageToTake = 0;
		if(creature->hasState(CreatureState::ONFIRE)) {
			int roll = (System::random(4) + 1) + (System::random(4) + 1);
			text << " has taken " << roll << " damage for being on fire!";
			damageToTake += roll;
		}

		if(creature->hasState(CreatureState::BLEEDING)) {
			int roll = (System::random(4) + 1);
			text << " has taken " << roll << " damage from bleeding!";
			damageToTake += roll;
		}

		if(damageToTake != 0) {
			ModPool(creature, "health", damageToTake * -1);
			creature->sendSystemMessage(text.toString());
		}
	}

	static void RemoveState(CreatureObject* creature, String state, bool alertEveryone = false) {
		Locker clocker(creature);
		if (state == "stunned" || state == "stun") {
			creature->clearState(CreatureState::STUNNED);
			if (alertEveryone)
				BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " is no longer stunned.");
		} else if (state == "blinded" || state == "blind") {
			creature->clearState(CreatureState::BLINDED);
			if (alertEveryone)
				BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " is no longer blind.");
		} else if (state == "immobilized" || state == "immobile") {
			creature->clearState(CreatureState::IMMOBILIZED);
			if (alertEveryone)
				BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " is no longer immobilized.");
		} else if (state == "burning" || state == "onfire" || state == "fire" || state == "burn") {
			creature->clearState(CreatureState::ONFIRE);
			if (alertEveryone)
				BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " is no longer on fire.");
		} else if (state == "bleeding" || state == "bleed" || state == "bleeding") {
			creature->clearState(CreatureState::BLEEDING);
			if (alertEveryone)
				BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " is no longer bleeding.");
		} else {
			creature->sendSystemMessage("ERROR: Invalid state specified. Try stun, blind, immobile, knockdown, fire, or bleed.");
		}
	}

	static void ClearStates(CreatureObject* creature, bool alertEveryone = false) {
		Locker clocker(creature);
		creature->clearState(CreatureState::STUNNED);
		creature->clearState(CreatureState::BLINDED);
		creature->clearState(CreatureState::IMMOBILIZED);
		creature->clearState(CreatureState::ONFIRE);
		creature->clearState(CreatureState::BLEEDING);
		if (alertEveryone)
				BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " has been cleared of all states.");
	}

	static void ModPool(CreatureObject* creature, String pool, int mod, bool suppressMessage = false) {
		Locker clocker(creature);
		int max = 0;
		int current = 0;
		int finalPool = 0;
		int poolID = GetHAMFromPool(pool);
		if (poolID == -1) {
			creature->sendSystemMessage("ERROR: You've not specified an actual pool. Valid pools are: health, action, will, and force.");
			return;
		}
		if (poolID > 8) { //If above 8, its a force pool.
			if (creature->isPlayerCreature()) {
				max = creature->getPlayerObject()->getForcePowerMax();
				current = creature->getPlayerObject()->getForcePower();
				if (current + mod <= 0)
					finalPool = 0;
				else if (current + mod > max)
					finalPool = max;
				else
					finalPool = current + mod;

				if(finalPool < 0) finalPool = 0;

				creature->getPlayerObject()->setForcePower(finalPool, true);
				if(!suppressMessage)
					BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + "'s " + pool + " pool has changed by " + String::valueOf(mod) + "! (Was: " + String::valueOf(current) + ")");
			} 
		} else {
			max = creature->getMaxHAM(poolID);
			current = creature->getHAM(poolID);
			if (current + mod <= 0)
				finalPool = 0;
			else if (current + mod > max)
				finalPool = max;
			else
				finalPool = current + mod;

			if(finalPool < 0) finalPool = 0;

			creature->setHAM(poolID, finalPool, true);	
			if(!suppressMessage)
				BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + "'s " + pool + " pool has changed by " + String::valueOf(mod) + "! (Was: " + String::valueOf(current) + ")");
			if (poolID == 0 && finalPool == 0) {
				BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " has run out of health!");
			}
			if (poolID == 6 && finalPool == 0) {
				BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " has run out of will!");
			}
		}			
	}

	static void FillPool(CreatureObject* creature, String pool, bool suppressMessage = false) {
		Locker clocker(creature);
		int max = 0;
		int current = 0;
		int poolID = GetHAMFromPool(pool);
		if (poolID != -1) {
			if (poolID > 8) { //Force Power
				if(creature->getPlayerObject() != nullptr) {
					max = creature->getPlayerObject()->getForcePowerMax();
					current = creature->getPlayerObject()->getForcePower();
					creature->getPlayerObject()->setForcePower(max, true);
					if (!suppressMessage)
						BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + "'s " + pool + " pool has been filled! (Was: " + String::valueOf(current) + ")");
				}
				
			} else {
				max = creature->getMaxHAM(poolID);
				current = creature->getHAM(poolID);
				creature->setHAM(poolID, max, true);	
				if (!suppressMessage)
					BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + "'s " + pool + " pool has been filled! (Was: " + String::valueOf(current) + ")");
			}
		} else {
			creature->sendSystemMessage("ERROR: You've not specified an actual pool. Valid pools are: health, action, will, and force.");
		}
	}

	static void FillAllPools(CreatureObject* creature,  bool suppressMessage = false) {
		Locker clocker(creature);
		int lastHealth = creature->getHAM(0);
		int lastAction = creature->getHAM(3);
		int lastWill = creature->getHAM(6);
		int lastForce = 0;
		if (creature->isPlayerCreature()) {
			lastForce = creature->getPlayerObject()->getForcePower(); 
		}

		FillPool(creature, "health", true);
		FillPool(creature, "action", true);
		FillPool(creature, "will", true);
		FillPool(creature, "force", true);

		creature->setStoredInt("stim_will_cost", 0);

		String report = creature->getFirstName() + " has fully rested, filling all of their pools.";

		//Send the message without the pool counts for players to see.
		if (!suppressMessage)
			BorrieRPG::BroadcastMessage(creature, report);
		
		report += " (Was H:" + String::valueOf(lastHealth);
		report += ", A:" + String::valueOf(lastAction);
		report += ", W:" + String::valueOf(lastWill);

		if (creature->isPlayerCreature()) {
			if (creature->getPlayerObject()->getForcePowerMax() > 0) {
				report += ", F:" + String::valueOf(lastForce) + ")";
			} else {
				report += ")";
			}
		} else {
			report += ")";
		}		

		//Send the pool counts to all DMs.
		if (!suppressMessage)
			BorrieRPG::BroadcastAmongAdmins(creature, report);
	}

	static void PerformShortRest(CreatureObject* creature) {
		Locker clocker(creature);
		int lastHealth = creature->getHAM(0);
		int lastAction = creature->getHAM(3);
		int lastWill = creature->getHAM(6);
		if(lastWill < 2) {
			creature->sendSystemMessage("You don't have enough will points to perform a short rest.");
			return;
		}

		int lastForce = 0;
		if (creature->isPlayerCreature()) {
			lastForce = creature->getPlayerObject()->getForcePower(); 
		}

		creature->setStoredInt("stim_will_cost", 0);

		ModPool(creature, "health", creature->getSkillMod("rp_health") / 2);
		FillPool(creature, "action", true);
		//Short Rests don't fill the Force pool.
		//FillPool(creature, "force", true);
		ModPool(creature, "will", -2);
	}

	static int GetHAMFromPool(String pool) {
		if (pool == "health" || pool == "hp")
			return 0;
		else if (pool == "action" || pool == "ap")
			return 3;
		else if (pool == "will" || pool == "wp")
			return 6;
		else if (pool == "force" || pool == "fp")
			return 999;
		else
			return -1;
	}

	static bool HealWithStimpack(StimPack* stim, CreatureObject* creature, CreatureObject* targetCreature) {
		int medicineDC = stim->getDieCheck();
		int medicSkill = creature->getSkillMod("rp_medicine");
		int roll = BorDice::Roll(1, 20);

		if(roll == 20 || roll + medicSkill >= medicineDC) {
			int dieCount = stim->getDieCount();
			int dieType = stim->getDieType();
			int bonusHealing = stim->getBonusHealing();
			int healRoll = BorDice::Roll(dieCount, dieType) + bonusHealing;
			ModPool(targetCreature, "health", healRoll, true);
			if(creature->getHAM(CreatureAttribute::ACTION) < 1)
				ModPool(creature, "will", -1, true);
			else 
				ModPool(creature, "action", -1, true);
			BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " successfully heals " + targetCreature->getFirstName() + " for " + String::valueOf(healRoll) + " damage! (1d20 Result: " + String::valueOf(roll) + " + " + String::valueOf(medicSkill) + " = " +  String::valueOf(roll + medicSkill) + " vs. DC:" + String::valueOf(medicineDC) + ")"); 
			return true;
		} else {
			if(creature->getHAM(CreatureAttribute::ACTION) < 1)
				ModPool(creature, "will", -1, true);
			else 
				ModPool(creature, "action", -1, true);
			BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " fails to heal " + targetCreature->getFirstName() + " (1d20 Result: " + String::valueOf(roll) + " + " + String::valueOf(medicSkill) + " = " +  String::valueOf(roll + medicSkill) + " vs. DC:" + String::valueOf(medicineDC) + ")");
			return false;
		}
	}

	static bool useActionStim(StimPack* stim, CreatureObject* creature, CreatureObject* targetCreature) {
		int medicSkill = creature->getSkillMod("rp_medicine");
		int medicRoll = BorDice::Roll(1, 20);

		int willCost = targetCreature->getStoredInt("stim_will_cost");

		// Determine the will to be deducted from the target.
		if (willCost < 1){
			targetCreature->setStoredInt("stim_will_cost", 1);
			willCost = 1;
		} else {
			willCost = willCost + 1;
			targetCreature->setStoredInt("stim_will_cost", willCost);
		}

		ModPool(targetCreature, "will", -willCost, true);
		ModPool(targetCreature, "action", -1, true);

		return true;

	}

	static bool PerformImprovHeal(CreatureObject* creature, CreatureObject* targetCreature) {
		int medicineDC = 10;
		int medicSkill = creature->getSkillMod("rp_medicine");
		int roll = BorDice::Roll(1, 20);
		if(roll == 20 || roll + medicSkill >= medicineDC) {
			int dieCount = 1;
			int dieType = 2 + medicSkill;
			int healRoll = BorDice::Roll(dieCount, dieType);
			ModPool(targetCreature, "health", healRoll, true);
			if(creature->getHAM(CreatureAttribute::ACTION) < 1)
				ModPool(creature, "will", -1, true);
			else 
				ModPool(creature, "action", -1, true);

			BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " successfully improvise heals " + targetCreature->getFirstName() + " for " + String::valueOf(healRoll) + " damage! (1d20 Result: " + String::valueOf(roll) + " + " + String::valueOf(medicSkill) + " = " +  String::valueOf(roll + medicSkill) + " vs. DC:" + String::valueOf(medicineDC) + ")");
			return true;
		} else {
			if(creature->getHAM(CreatureAttribute::ACTION) < 1)
				ModPool(creature, "will", -1, true);
			else 
				ModPool(creature, "action", -1, true);

			BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " fails to improvise heal " + targetCreature->getFirstName() + " (1d20 Result: " + String::valueOf(roll) + " + " + String::valueOf(medicSkill) + " = " +  String::valueOf(roll + medicSkill) + " vs. DC:" + String::valueOf(medicineDC) + ")");
			return false;
		}
	}

	static void InspectPlayer(CreatureObject* dm, CreatureObject* target) {
		if(dm == nullptr)
			return;

		if(target == nullptr)
			return;

		ManagedReference<SuiMessageBox*> suiBox = new SuiMessageBox(dm, SuiWindowType::NONE);
		suiBox->setPromptTitle(target->getDisplayedName()); 
		StringBuffer infoText;

		if(!target->isPlayerCreature()) {
			dm->sendSystemMessage("Target is not a player creature.");
			return;
		}

		String factionTag = target->getStoredString("faction_current");

		ManagedReference<PlayerObject*> ghost = target->getPlayerObject();


		int forceImmersionLevel = GetForceImmersionLevel(target);

		infoText << "\\#FF7000[INFO]\\#." << endl;
		if (target->getStoredString("original_first_name") != target->getFirstName()){
			infoText << "Original Name: " << target->getStoredString("original_name") << endl;
		}
		infoText << "Account: " << BorrieRPG::GetPlayerAccountName(target) << endl;
		infoText << "Level: " << GetPlayerLevel(target) << endl;

		String dmStatus = target->getStoredString("rp_dm_status");
		if(dmStatus != "") {
			infoText << "DM Status: " << dmStatus << endl;
		}

		if(ghost->getAdminLevel() > 0) {
			infoText << "Admin Level: " << ghost->getAdminLevel() << endl;
		}

		if(!target->checkCooldownRecovery("long_rest")){
			const Time* timeremaining = target->getCooldownTime("long_rest");
			infoText << "Rest Cooldown: " << ceil(timeremaining->miliDifference() / -3600000.f) << " hours" << endl;
		}

		if(forceImmersionLevel == 0)
			infoText << "Not Force Sensitive" << endl;
		else {
			infoText << "Force Sensitivity Level: " << forceImmersionLevel << endl;
			int corruptionLevel = target->getShockWounds();
			infoText << "Corruption: " << corruptionLevel;

			if(corruptionLevel < 1)
				infoText << " (Pure)" << endl;
			else if(corruptionLevel < 50)
				infoText << " Tier I (Touched)" << endl;
			else if(corruptionLevel < 75)
				infoText << " Tier II (Fallen)" << endl;
			else if(corruptionLevel < 90)
				infoText << " Tier III (Dark)" << endl;
			else if(corruptionLevel < 100)
				infoText << " Tier IV (Malevolent)" << endl;
			else if(corruptionLevel == 100)
				infoText << " Tier V (Insane)" << endl;
		}		

		infoText << "Experience: " << ghost->getExperience("rp_general") << endl;

		if(factionTag != "") {
			infoText << "\\#FF7000[FACTION]\\#." << endl;
			infoText << "Faction: " << target->getStoredString("faction_current") << endl;
			infoText << "Rank: " << target->getStoredInt("rank_" + factionTag) << endl;
		}
		
		infoText << "\\#FF7000[CURRENCY]\\#." << endl;
		infoText << "Cash: " << target->getCashCredits() << endl;
		infoText << "Bank: " << target->getBankCredits() << endl;
		infoText << "\\#FF7000[ATTRIBUTES]\\#." << endl;
		infoText << "Awareness: " << target->getSkillMod("rp_awareness") << endl; 
		infoText << "Charisma: " << target->getSkillMod("rp_charisma") << endl; 
		infoText << "Constitution: " << target->getSkillMod("rp_constitution") << endl; 
		infoText << "Dexterity: " << target->getSkillMod("rp_dexterity") << endl; 
		infoText << "Intelligence: " << target->getSkillMod("rp_intelligence") << endl; 
		infoText << "Mindfulness: " << target->getSkillMod("rp_mindfulness") << endl; 
		infoText << "Precision: " << target->getSkillMod("rp_precision") << endl; 
		infoText << "Strength: " << target->getSkillMod("rp_strength") << endl; 
		infoText << "\\#FF7000[SKILLS]\\#." << endl;
		infoText << "Armor: " << target->getSkillMod("rp_armor") << endl; 
		infoText << "Athletics: " << target->getSkillMod("rp_athletics") << endl; 
		infoText << "Bluff: " << target->getSkillMod("rp_bluff") << endl; 
		infoText << "Command: " << target->getSkillMod("rp_command") << endl; 
		infoText << "Composure: " << target->getSkillMod("rp_composure") << endl; 
		infoText << "Computers: " << target->getSkillMod("rp_computers") << endl; 
		infoText << "Defending: " << target->getSkillMod("rp_defending") << endl; 
		infoText << "Demolitions: " << target->getSkillMod("rp_demolitions") << endl; 
		infoText << "Engineering: " << target->getSkillMod("rp_engineering") << endl; 
		infoText << "Intimidation: " << target->getSkillMod("rp_intimidation") << endl; 
		infoText << "Investigation: " << target->getSkillMod("rp_investigation") << endl; 
		infoText << "Larceny: " << target->getSkillMod("rp_larceny") << endl; 
		infoText << "Maneuverability: " << target->getSkillMod("rp_maneuverability") << endl; 
		infoText << "Mechanics: " << target->getSkillMod("rp_mechanics") << endl; 
		infoText << "Medicine: " << target->getSkillMod("rp_medicine") << endl; 
		infoText << "Melee: " << target->getSkillMod("rp_melee") << endl; 
		infoText << "Performance: " << target->getSkillMod("rp_performance") << endl; 
		infoText << "Persuasion: " << target->getSkillMod("rp_persuasion") << endl; 
		infoText << "Piloting: " << target->getSkillMod("rp_piloting") << endl; 
		infoText << "Ranged: " << target->getSkillMod("rp_ranged") << endl; 
		infoText << "Resolve: " << target->getSkillMod("rp_resolve") << endl; 
		infoText << "Science: " << target->getSkillMod("rp_science") << endl; 
		infoText << "Slicing: " << target->getSkillMod("rp_slicing") << endl; 
		infoText << "Stealth: " << target->getSkillMod("rp_stealth") << endl; 
		infoText << "Survival: " << target->getSkillMod("rp_survival") << endl; 
		infoText << "Throwing: " << target->getSkillMod("rp_throwing") << endl; 
		infoText << "Unarmed: " << target->getSkillMod("rp_unarmed") << endl; 
		if(forceImmersionLevel > 0) {
			infoText << "\\#FF7000[FORCE]\\#." << endl;
			infoText << "Alter: " << target->getSkillMod("rp_alter") << endl; 
			infoText << "Control: " << target->getSkillMod("rp_control") << endl; 
			infoText << "Inward: " << target->getSkillMod("rp_inward") << endl; 
			infoText << "Lightning: " << target->getSkillMod("rp_lightning") << endl; 
			infoText << "Lightsaber: " << target->getSkillMod("rp_lightsaber") << endl; 
			infoText << "Sense: " << target->getSkillMod("rp_sense") << endl; 
			infoText << "Telekinesis: " << target->getSkillMod("rp_telekinesis") << endl; 
		}
		infoText << "\\#FF7000[POOLS]\\#." << endl;
		infoText << "Health: " << target->getHAM(CreatureAttribute::HEALTH) << "/" << target->getSkillMod("rp_health") << endl; 
		infoText << "Action: " << target->getHAM(CreatureAttribute::ACTION) << "/" << target->getSkillMod("rp_action") << endl; 
		infoText << "Will: " << target->getHAM(CreatureAttribute::MIND) << "/" << target->getSkillMod("rp_will") << endl; 
		if(forceImmersionLevel > 0) {
			infoText << "Force: " << ghost->getForcePower() << "/" << target->getSkillMod("rp_force") << endl; 
		}
		

		infoText << "\\#FF7000[FREE POINTS]\\#." << endl;
		infoText << "Attributes: " << target->getStoredInt("starter_attr_points") << endl;
		infoText << "Skills: " << target->getStoredInt("starter_skill_points")  << endl;

		SkillManager* skillManager = target->getZoneServer()->getSkillManager();

		if (skillManager == nullptr)
			return;

		int trainingSkillCount = skillManager->getTrainingSkillCount(target);

		if(trainingSkillCount > 0) {
			infoText << "\\#FF7000[TRAINING]\\#." << endl;
			int count = 1;

			if(target->hasSkill("rp_training_jedi_novice")) {
				infoText << count << ". " << getTrainingString(target, "jedi") << endl;
				count++;
			}

			if(target->hasSkill("rp_training_sith_novice")) {
				infoText << count << ". " << getTrainingString(target, "sith") << endl;
				count++;
			}

			if(target->hasSkill("rp_training_military_novice")) {
				infoText << count << ". " << getTrainingString(target, "military") << endl;
				count++;
			}

			if(target->hasSkill("rp_training_mando_novice")) {
				infoText << count << ". " << getTrainingString(target, "mando") << endl;
				count++;
			}

			if(target->hasSkill("rp_training_medical_novice")) {
				infoText << count << ". " << getTrainingString(target, "medical") << endl;
				count++;
			}

			if(target->hasSkill("rp_training_engineer_novice")) {
				infoText << count << ". " << getTrainingString(target, "engineer") << endl;
				count++;
			}

			if(target->hasSkill("rp_training_spy_novice")) {
				infoText << count << ". " << getTrainingString(target, "spy") << endl;
				count++;
			}

			if(target->hasSkill("rp_training_criminal_novice")) {
				infoText << count << ". " << getTrainingString(target, "criminal") << endl;
				count++;
			}
		}

		suiBox->setPromptText(infoText.toString());

		dm->sendMessage(suiBox->generateMessage());
	}

	static String getTrainingString(CreatureObject* target, String tree) {
		
		StringBuffer output;
		String branch = "";

		// Jedi Training
		if (tree == "jedi") {
			output << "Jedi ";
			String rank = "";

			if (target->hasSkill("rp_training_jedi_guardian_01"))
				branch = "guardian";
			else if (target->hasSkill("rp_training_jedi_consular_01")) 
				branch = "consular";
			else if (target->hasSkill("rp_training_jedi_sentinel_01")) 
				branch = "sentinel";

			if  (branch != "")
				rank = BorrieRPG::Capitalize(branch) + getTrainingBranchRank(target, "rp_training_jedi_" + branch);

			if (target->hasSkill("rp_training_mastery_jedi")){
				output << "Master";
			} else if (target->hasSkill("rp_training_jedi_master")){
				output << "Knight";
			} else {
				output << "Padawan";
			}

			if (rank != ""){
				output << " ("+rank+")";
			}

			return output.toString();
		}
		//Sith Training
		if (tree == "sith") {
			String rank = "";

			if (target->hasSkill("rp_training_sith_sorcerer_01"))
				branch = "sorcerer";
			else if (target->hasSkill("rp_training_sith_warrior_01"))
				branch = "warrior";

			if  (branch != "")
				rank = BorrieRPG::Capitalize(branch) + getTrainingBranchRank(target, "rp_training_sith_" + branch);

			if (target->hasSkill("rp_training_mastery_sith")){
				output << "Dark Lord of the Sith";
			} else if (target->hasSkill("rp_training_sith_master")){
				output << "Sith Lord";
			} else {
				output << "Sith Acolyte";
			}

			if (rank != ""){
				output << " ("+rank+")";
			}

			return output.toString();
		}
		//Military Training
		if (tree == "military") {
			output << "Military (";

			if (target->hasSkill("rp_training_military_officer_01"))
				branch = "officer";

			else if (target->hasSkill("rp_training_military_trooper_01"))
				branch = "trooper";

			else branch = "novice";

			if (target->hasSkill("rp_training_trooper_master")) {
				output << "Veteran " << branch << ")";
			} else {
				output << BorrieRPG::Capitalize(branch) << getTrainingBranchRank(target, "rp_training_military_" + branch) << ")";
			}

			return output.toString();
		}
		//Spy Training
		if (tree == "spy") {
			branch = "novice";
			output << "Espionage (";

			if (target->hasSkill("rp_training_spy_spy_01"))
				branch = "spy";

			else if (target->hasSkill("rp_training_spy_assassin_01"))
				branch = "assassin";

			else if (target->hasSkill("rp_training_spy_saboteur_01"))
				branch = "saboteur";

			else branch = "novice";

			if (target->hasSkill("rp_training_spy_master")) {
				output << "Master " << branch << ")";
			} else {
				output << BorrieRPG::Capitalize(branch) << getTrainingBranchRank(target, "rp_training_spy_" + branch) << ")";
			}

			return output.toString();
		}
		//Mandalorian
		if (tree == "mando") {
			branch = "novice";
			String styledBranch = "novice";
			output << "Mandalorian (";

			if (target->hasSkill("rp_training_mando_kandosii_01")) {
				branch = "kandosii";
				styledBranch = "kandosii";

			} else if (target->hasSkill("rp_training_mando_goran_01")) {
				branch = "goran";
				styledBranch = "beskar'goran";
			}

			else {
				branch = "novice";
			}

			if (target->hasSkill("rp_training_mando_master")) {
				output << "Mando'ad " << styledBranch << ")";
			} else {
				output << BorrieRPG::Capitalize(styledBranch) << getTrainingBranchRank(target, "rp_training_mando_" + branch) << ")";
			}

			return output.toString();
		}
		//Engineer Training
		if (tree == "engineer") {
			String styledBranch = "Novice";
			output << "Engineering (";

			if (target->hasSkill("rp_training_engineer_ship_01")) {
				branch = "ship";
				styledBranch = "starships";

			} else if (target->hasSkill("rp_training_engineer_weapon_01")) {
				branch = "weapon";
				styledBranch = "weapons";

			}
			else if (target->hasSkill("rp_training_engineer_electronics_01")) {
				branch = "electronics";
				styledBranch = "electronics";

			}
			else if (target->hasSkill("rp_training_engineer_droid_01")) {
				branch = "droid";
				styledBranch = "droids";
			}
			if (target->hasSkill("rp_training_engineer_master")) {
				output << "Master " << styledBranch << ")";
			} else {
				output << BorrieRPG::Capitalize(styledBranch) << getTrainingBranchRank(target, "rp_training_engineer_" + branch) << ")";
			}

			return output.toString();
		}
		//Criminal Training
		if (tree == "criminal") {
			branch = "novice";
			output << "Criminal (";

			if (target->hasSkill("rp_training_criminal_thief_01"))
				branch = "thief";

			else if (target->hasSkill("rp_training_criminal_smuggler_01"))
				branch = "smuggler";

			else if (target->hasSkill("rp_training_criminal_conartist_01"))
				branch = "conartist";

			else if (target->hasSkill("rp_training_criminal_enforcer_01"))
				branch = "enforcer";

			if (target->hasSkill("rp_training_criminal_master")) {
				output << "Master " << branch << ")";
			} else {
				output << BorrieRPG::Capitalize(branch) << getTrainingBranchRank(target, "rp_training_criminal_" + branch) << ")";
			}

			return output.toString();
		}
		//Medical
		if (tree == "medical") {
			branch = "novice";
			output << "Medical (";

			if (target->hasSkill("rp_training_medical_medic_01"))
				branch = "medic";

			else if (target->hasSkill("rp_training_medical_surgeon_01"))
				branch = "surgeon";

			else if (target->hasSkill("rp_training_medical_researcher_01"))
				branch = "researcher";

			if (target->hasSkill("rp_training_medical_master")) {
				output << "Master " << branch << ")";
			} else {
				output << BorrieRPG::Capitalize(branch) << getTrainingBranchRank(target, "rp_training_medical_" + branch) << ")";
			}

			return output.toString();
		}

		return "";
	}

	static String getTrainingBranchRank(CreatureObject* target, String trainingBranch) {

		if (target->hasSkill(trainingBranch + "_04"))
			return " IV";
		else if (target->hasSkill(trainingBranch + "_03"))
			return " III";
		else if (target->hasSkill(trainingBranch + "_02"))
			return " II";
		else if (target->hasSkill(trainingBranch + "_01"))
			return " I";
		else
			return "";
	}

	static void ShowSkillCounts(CreatureObject* creature, CreatureObject* target) {
		


	}

	static void ShowAlternateBiography(CreatureObject* creature, CreatureObject* target) {
		if(target == nullptr)
			return;
		
		if(!target->isPlayerCreature())
			return;

		ManagedReference<SuiMessageBox*> suiBox = new SuiMessageBox(creature, SuiWindowType::NONE);
		suiBox->setPromptTitle(target->getDisplayedName() + "'s Hidden Biography"); 
		StringBuffer infoText;

		infoText << target->getPlayerObject()->getAlternateBiography();

		suiBox->setPromptText(infoText.toString());
		creature->sendMessage(suiBox->generateMessage());		
	}

	static int GetForceImmersionLevel(CreatureObject* creature) {
		if(creature->hasSkill("rp_force_prog_master")) 
			return 6;
		else if(creature->hasSkill("rp_force_prog_rank_04")) 
			return 5;
		else if(creature->hasSkill("rp_force_prog_rank_03")) 
			return 4;
		else if(creature->hasSkill("rp_force_prog_rank_02")) 
			return 3;
		else if(creature->hasSkill("rp_force_prog_rank_01")) 
			return 2;
		else if(creature->hasSkill("rp_force_prog_novice")) 
			return 1;
		else
			return 0;
	}

	static bool GetSkillIsTrainable(String skill) {
		if (skill.contains("admin_"))
			return false;
		else if (skill.contains("rp_char"))
			return false;
		else if (skill.contains("rp_force_prog")) 
			return false;
		else if (skill == "rp_training_jedi_rank_master")
			return false;
		else if (skill == "rp_training_sith_rank_master")
			return false;
		else if (skill.contains("rp_training_mastery"))
			return false;
		else
			return true;		
	}

	static int GetPlayerLevel(CreatureObject* creature) {
		int level = 1;

		level += GetSkillLevelValue(creature, "melee");
		level += GetSkillLevelValue(creature, "intimidation");
		level += GetSkillLevelValue(creature, "unarmed");
		level += GetSkillLevelValue(creature, "lightsaber");
		level += GetSkillLevelValue(creature, "ranged");
		level += GetSkillLevelValue(creature, "mechanics");
		level += GetSkillLevelValue(creature, "demolitions");
		level += GetSkillLevelValue(creature, "engineering");
		level += GetSkillLevelValue(creature, "larceny");
		level += GetSkillLevelValue(creature, "stealth");
		level += GetSkillLevelValue(creature, "maneuverability");
		level += GetSkillLevelValue(creature, "throwing");
		level += GetSkillLevelValue(creature, "investigation");
		level += GetSkillLevelValue(creature, "piloting");
		level += GetSkillLevelValue(creature, "survival");
		level += GetSkillLevelValue(creature, "sense");
		level += GetSkillLevelValue(creature, "slicing");
		level += GetSkillLevelValue(creature, "computers");
		level += GetSkillLevelValue(creature, "medicine");
		level += GetSkillLevelValue(creature, "science");
		level += GetSkillLevelValue(creature, "persuasion");
		level += GetSkillLevelValue(creature, "bluff");
		level += GetSkillLevelValue(creature, "composure");
		level += GetSkillLevelValue(creature, "resolve");
		level += GetSkillLevelValue(creature, "athletics");
		level += GetSkillLevelValue(creature, "lightning");
		level += GetSkillLevelValue(creature, "armor");
		level += GetSkillLevelValue(creature, "defending");
		level += GetSkillLevelValue(creature, "telekinesis");
		level += GetSkillLevelValue(creature, "control");
		level += GetSkillLevelValue(creature, "alter");
		level += GetSkillLevelValue(creature, "inward");

		return level;
	}

	static int GetSkillLevelValue(CreatureObject* creature, String skill) {
		int level = 0;
		int skillMod = creature->getSkillMod("rp_" + skill);
		if (skillMod >= 5 && skillMod < 10)
			level += 1;
		else if (skillMod == 10)
			level += 2;
		return level;
	}

	static void RewardGeneralRPExperience(CreatureObject* creature, CreatureObject* dm, int amount, bool playMusic = false) {
		creature->getZoneServer()->getPlayerManager()->awardExperience(creature, "rp_general", amount, true, false, false);
		dm->sendSystemMessage("Rewarded " + creature->getFirstName() + " " + String::valueOf(amount) + " roleplay experience.");

		if(creature->checkCooldownRecovery("exp_music") && playMusic) {
			creature->updateCooldownTimer("exp_music", 60 * 1000);
			creature->playMusicMessage("sound/music_acq_thespian.snd");
		}
	}

	static void rewardXP(CreatureObject* creature, CreatureObject* dm, String type, int amount){
		StringIdManager* sidman = StringIdManager::instance();

		String expname = sidman->getStringId(String("@exp_n:" + type).hashCode()).toString();

		creature->getZoneServer()->getPlayerManager()->awardExperience(creature, type, amount, true, false, false);
		dm->sendSystemMessage("Rewarded "+creature->getFirstName()+" "+String::valueOf(amount) +" "+expname+" experience.");
	}

	static void ModifyDailyFactionContribution(CreatureObject* creature, CreatureObject* dm, int amount) {
		if(creature->isPlayerCreature()) {

			PlayerObject* targetPlayer = creature->getPlayerObject();
			if(targetPlayer == nullptr) {
				dm->sendSystemMessage("Target is not a player creature.");
			}

			if(amount == 0) {
				dm->sendSystemMessage("You need to input a negative or positive value to change the target's faction contribution.");
				return;
			}
		
			if(creature->getStoredString("faction_current") != "") {
				int currentFood = targetPlayer->getFoodFilling();
				int maxFood = targetPlayer->getFoodFillingMax();
				int foodAddScore = currentFood + amount;
				//Prevent overflow
				if(foodAddScore > maxFood) {
					foodAddScore = maxFood;
				}
				targetPlayer->setFoodFilling(foodAddScore, true);
				if(amount > 0) {
					creature->sendSystemMessage("You've gained " + String::valueOf(amount) + " points toward your daily faction contribution.");
					dm->sendSystemMessage("You've given " + String::valueOf(amount) + " daily faction contribution points to " + creature->getFirstName());
				} else {
					creature->sendSystemMessage("You've lost " + String::valueOf(amount) + " points toward your daily faction contribution.");
					dm->sendSystemMessage("You've removed " + String::valueOf(amount) + " daily faction contribution points from " + creature->getFirstName());
				}			
			} else {
				dm->sendSystemMessage("Target is not in a faction.");
			}
		} else {
			dm->sendSystemMessage("Target is not a player creature.");
		}
	}

	static void ModifyOverallFactionLoyalty(CreatureObject* creature, CreatureObject* dm, int amount) {
		if(creature->isPlayerCreature()) {

			PlayerObject* targetPlayer = creature->getPlayerObject();
			if(targetPlayer == nullptr) {
				dm->sendSystemMessage("Target is not a player creature.");
			}

			if(amount == 0) {
				dm->sendSystemMessage("You need to input a negative or positive value to change the target's faction loyalty.");
				return;
			}
		
			if(creature->getStoredString("faction_current") != "") {
				int currentDrink = targetPlayer->getDrinkFilling();
				int maxDrink = targetPlayer->getDrinkFillingMax();
				int drinkAddScore = currentDrink + amount;
				//Prevent overflow
				if(drinkAddScore > maxDrink) {
					drinkAddScore = maxDrink;
				}
				targetPlayer->setDrinkFilling(drinkAddScore, true);
				if(amount > 0) {
					creature->sendSystemMessage("You've gained " + String::valueOf(amount) + " points toward your overall faction loyalty.");
					dm->sendSystemMessage("You've given " + String::valueOf(amount) + " overall faction loyalty points to " + creature->getFirstName());
				} else {
					creature->sendSystemMessage("You've lost " + String::valueOf(amount) + " points toward your overall faction loyalty.");
					dm->sendSystemMessage("You've removed " + String::valueOf(amount) + " overall faction loyalty points from " + creature->getFirstName());
				}				
			} else {
				dm->sendSystemMessage("Target is not in a faction.");
			}
		} else {
			dm->sendSystemMessage("Target is not a player creature.");
		}
	}

	static void DisplayFactionValues(CreatureObject* creature) {
        if(creature->isPlayerCreature()) {
			PlayerObject* targetPlayer = creature->getPlayerObject();
			if(targetPlayer == nullptr) {
				creature->sendSystemMessage("Target is not a player creature.");
			}
			//Daily
			int currentFood = targetPlayer->getFoodFilling();
			int maxFood = targetPlayer->getFoodFillingMax();
			//Overall
            int currentDrink = targetPlayer->getDrinkFilling();
			int maxDrink = targetPlayer->getDrinkFillingMax();

			creature->sendSystemMessage("Daily Faction Loyalty: " + String::valueOf(currentFood) +"/" + String::valueOf(maxFood));
			creature->sendSystemMessage("Overall Faction Loyalty: " + String::valueOf(currentDrink) +"/" + String::valueOf(maxDrink));
        } 
    }

	static void ResetFactionReportCooldown(CreatureObject* creature, CreatureObject* dm) {
		if(creature->isPlayerCreature()) {
			PlayerObject* targetPlayer = creature->getPlayerObject();
			if(targetPlayer == nullptr) {
				dm->sendSystemMessage("Target is not a player creature.");
			}

			if(creature->getStoredString("faction_current") == "") {
				dm->sendSystemMessage("Target is not in a faction.");
				return;
			}

			targetPlayer->deleteScreenPlayData("BorFactionManager", "ReportDelay");
			dm->sendSystemMessage("The target is now able to report in to their faction.");
		} else {
			dm->sendSystemMessage("Target is not a player creature.");
		}
	}

	static void RewardXPForLastRoll(CreatureObject* creature, CreatureObject* dm) {
		int roll = creature->getLastSkillRoll();
		String skill = creature->getLastRolledSkill();
		String skillParent = BorSkill::GetSkillParent(skill);
		if (skillParent != "") { //Skill was rolled.
			//Reward Parent 10%
			int parentReward = roll / 10;
			creature->getZoneServer()->getPlayerManager()->awardExperience(creature, skill, roll, true); 
			creature->getZoneServer()->getPlayerManager()->awardExperience(creature, skillParent, parentReward, true); 
			dm->sendSystemMessage("Rewarded " + creature->getFirstName() + " " + String::valueOf(roll) + " @skl_n:" + skill + " experience.");
		} else { //Attribute was rolled.
			int reward = roll / 10;
			creature->getZoneServer()->getPlayerManager()->awardExperience(creature, skill, reward, true); 
			dm->sendSystemMessage("Rewarded " + creature->getFirstName() + " " + String::valueOf(reward) + " @skl_n:" + skill + " experience.");
		}
	}

	static void RewardXPForRoll(CreatureObject* creature, CreatureObject* dm, String skill, int roll) {
		String skillParent = BorSkill::GetSkillParent(skill);
		if (skillParent != "") { // Skill was rolled.
			// Reward Parent 10%
			int parentReward = roll / 10;
			creature->getZoneServer()->getPlayerManager()->awardExperience(creature, "rp_" + skill, roll, true);
			creature->getZoneServer()->getPlayerManager()->awardExperience(creature, "rp_" + skillParent, parentReward, true);
			dm->sendSystemMessage("Rewarded " + creature->getFirstName() + " " + String::valueOf(roll) + " @skl_n:rp_" + skill + " experience.");
		} else { // Attribute was rolled.
			int reward = roll / 10;
			creature->getZoneServer()->getPlayerManager()->awardExperience(creature, "rp_" + skill, reward, true);
			dm->sendSystemMessage("Rewarded " + creature->getFirstName() + " " + String::valueOf(reward) + " @skl_n:rp_" + skill + " experience.");
		}
	}

	static void RewardCreditsByLevel(CreatureObject* creature, CreatureObject* dm, int multiplier = 100) {
		int playerLevel = GetPlayerLevel(creature);
		int credits = playerLevel * multiplier;
		if(credits < 1) return;
		creature->addCashCredits(credits);
		creature->sendSystemMessage("You've been awarded " + String::valueOf(credits) + " credits!");
		dm->sendSystemMessage("You've rewarded " + creature->getFirstName() + " " + String::valueOf(credits) + " credits.");
	}

	static void ModifyFreePoints(CreatureObject* creature, CreatureObject* target, String type, int amount) { 
		int currentPoints = target->getStoredInt("starter_" + type + "_points");
		target->setStoredInt("starter_" + type + "_points", currentPoints + amount);
		if(type == "attr") {
			if(amount > 0) {
				creature->sendSystemMessage("You've granted " + target->getFirstName() + " " + String::valueOf(amount) + " free attribute points.");
				target->sendSystemMessage("You've been granted " + String::valueOf(amount) + " free attribute points! Apply them using the '/train' command.");
			} else {
				creature->sendSystemMessage("You've removed from " + target->getFirstName() + " " + String::valueOf(amount) + " free attribute points.");
				target->sendSystemMessage(String::valueOf(amount) + " free attribute points have been removed.");
			}			
		} else if(type == "skill") {
			if(amount > 0) {
				creature->sendSystemMessage("You've granted " + target->getFirstName() + " " + String::valueOf(amount) + " free skill points.");
				target->sendSystemMessage("You've been granted " + String::valueOf(amount) + " free skill points! Apply them using the '/train' command.");
			} else {
				creature->sendSystemMessage("You've removed from " + target->getFirstName() + " " + String::valueOf(amount) + " free skill points.");
				target->sendSystemMessage(String::valueOf(amount) + " free skill points have been removed.");
			}			
		}
	}

	static int GetTargetDistance(CreatureObject* creature, SceneObject* object) {
		if (object == nullptr)
			return -1;
		return (int)(creature->getDistanceTo(object) + 0.5f);
	}

	static void LowerPosture(CreatureObject* creature) {
		if(creature->isStanding()) {
			//Kneel
			creature->setPosture(CreaturePosture::CROUCHED, true, true);
		} else if(creature->isKneeling()) {
			//Prone
			creature->setPosture(CreaturePosture::PRONE, true, true);
		}
	}
	
	static int GetDistance(CreatureObject* creature, float x, float z, float y) {
		Coordinate coord;
		coord.setPositionX(x);
		coord.setPositionZ(z);
		coord.setPositionY(y);
		return (int)(creature->getDistanceTo(&coord));
	}
	

	static void InitializeRoleplayMove(CreatureObject* creature) {
		//Roll Athletics to get bonus movement. Base movement is 10 meters. 
		//int roll = System::random(9) + 1;
		int athletics = creature->getSkillMod("rp_athletics");
		int maneuverability = creature->getSkillMod("rp_maneuverability");
		int piloting = creature->getSkillMod("rp_piloting");

		PlayerObject* ghost = creature->getPlayerObject();
		if (ghost == nullptr)
			return;

		ManagedReference<WaypointObject*> newwaypoint = nullptr;

		// Get previous movement waypoint
		ManagedReference<WaypointObject*> waypoint = ghost->getSurveyWaypoint();

		// Create new waypoint
		if (waypoint == nullptr)
			newwaypoint = (creature->getZoneServer()->createObject(0xc456e788, 1)).castTo<WaypointObject*>();
		else {
			ghost->removeWaypoint(waypoint->getObjectID(), true, false);
			newwaypoint = waypoint.get();
		}

		if(newwaypoint != nullptr) {
			Locker locker(newwaypoint);
			auto worldPosition = creature->getWorldPosition();
			
			newwaypoint->setCustomObjectName(UnicodeString("Last Position"), false);
			newwaypoint->setPlanetCRC(creature->getZone()->getZoneCRC());
			newwaypoint->setPosition(worldPosition.getX(), worldPosition.getZ(), worldPosition.getY());
			newwaypoint->setColor(WaypointObject::COLOR_PURPLE);
			newwaypoint->setSpecialTypeID(WaypointObject::SPECIALTYPE_RESOURCE);
			newwaypoint->setActive(true);

			ghost->addWaypoint(newwaypoint, false, true); 
		}

		//BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " has begun to move. Their range is " + String::valueOf(roll + athletics) +
		//							"m. (Roll: 1d10 = " + String::valueOf(roll) + ")");

		int maxDistance = 6;

		if (creature->isRidingMount()) {
			maxDistance = piloting + 22;
			BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " has begun to move on their mount. Their enhanced range is " + String::valueOf(maxDistance) + "m. ");
		} else {
			//Minimum movement distance of 10m, max of 25m
			maxDistance = maneuverability + athletics + 10;
			if (maxDistance > 25)
				maxDistance = 25;

			// Reduce movement distance if the character has armour equipped that they are not qualified for.
			if (IsWearingArmourUnskilled(creature)) {
				maxDistance = maxDistance * 0.75;
				creature->sendSystemMessage("Due to wearing armour you are unskilled for, your maximum movement distance was reduced by 25%!");
			}

			byte posture = creature->getPosture();

			switch(posture) {
				case CreaturePosture::CROUCHED: {
					//Two-thirds movement speed when crouched.
					maxDistance = maxDistance*0.666;
					BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " has begun to move while crouched. Their range is " + String::valueOf(maxDistance) + "m. ");
					break;
				}
				case CreaturePosture::PRONE: {
					//One-Fifth movement speed when prone.
					maxDistance = maxDistance*0.2;
					BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " has begun to move while prone. Their range is " + String::valueOf(maxDistance) + "m. ");
					break;
				}
				default:{
					BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " has begun to move. Their range is " + String::valueOf(maxDistance) + "m. ");
					break;
				}
			}
		}	

		creature->setStoredInt("remaining_move_distance",  maxDistance);
		creature->setStoredInt("distance_moved",  0);
		creature->sendSystemMessage("Move to your desired destination, using the Last Position waypoint to keep track of your distance. Use the move (rpmove) ability to confirm your movement.");
	}

	static void moveWaypoint(CreatureObject* creature) {
		PlayerObject* ghost = creature->getPlayerObject();
		if (ghost == nullptr)
			return;

		ManagedReference<WaypointObject*> waypoint = ghost->getSurveyWaypoint();
		if(waypoint == nullptr) {
			BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " has moved.");
		} else {
			Locker locker(waypoint);
			auto worldPosition = waypoint->getWorldPosition();
			int distance = GetDistance(creature, worldPosition.getX(), worldPosition.getZ(), worldPosition.getY());

			int remainingDistance = creature->getStoredInt("remaining_move_distance") - distance;

			if (remainingDistance <= 0) {
				creature->deleteStoredInt("remaining_move_distance");
				ConfirmRoleplayMove(creature);
				return;
			}

			creature->setStoredInt("remaining_move_distance",  remainingDistance);
			creature->setStoredInt("distance_moved",  creature->getStoredInt("distance_moved") + distance);

			BorrieRPG::BroadcastMessage(creature, creature->getFirstName() +" moved "+String::valueOf(distance)+" meters. They have "+String::valueOf(remainingDistance)+" meters left to move.");

			// Reset the waypoint.
			if(waypoint != nullptr) {
				auto worldPosition = creature->getWorldPosition();

				waypoint.get()->setPosition(worldPosition.getX(), worldPosition.getZ(), worldPosition.getY());
			}
		}
	}

	static void ConfirmRoleplayMove(CreatureObject* creature) {
		PlayerObject* ghost = creature->getPlayerObject();
		if (ghost == nullptr)
			return;

		// Get previous movement waypoint
		ManagedReference<WaypointObject*> waypoint = ghost->getSurveyWaypoint();
		if(waypoint == nullptr) {
			BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " has moved.");
		} else {
			Locker locker(waypoint);
			auto worldPosition = waypoint->getWorldPosition();
			int distance = GetDistance(creature, worldPosition.getX(), worldPosition.getZ(), worldPosition.getY()) + creature->getStoredInt("distance_moved");
			BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " moved " + String::valueOf(distance) + " meters from their last position.");
		// Remove the waypoint after move.
			ghost->removeWaypoint(waypoint->getObjectID(), true, false);
			waypoint = waypoint.get();
		}
		
	}

	static void AddDarksidePoints(CreatureObject* creature, int amount, bool playMusic) {
		float points = creature->getShockWounds();

		float totalPoints = points + amount;
		if(totalPoints > 100)
			totalPoints = 100;

		creature->setShockWounds(totalPoints);

		creature->sendSystemMessage("You have gained " + String::valueOf(amount) + " points of dark side corruption!");

		if(creature->checkCooldownRecovery("darkside_music") && playMusic) {
			creature->updateCooldownTimer("darkside_music", 60 * 1000);
			creature->playMusicMessage("sound/music_short_darkside.snd");
		}		
	}

	static void RemoveDarksidePoints(CreatureObject* creature, int amount) {
		float points = creature->getShockWounds();
		float totalPoints = points - amount;

		if(points == 100) 
			return;
		else if(points >= 90) {
			if(totalPoints <= 90)
				totalPoints = 90;
		} else if(points >= 75) {
			if(totalPoints <= 75)
				totalPoints = 75;
		} else if(points >= 50) {
			if(totalPoints <= 50)
				totalPoints = 50;
		} else if(points > 0) {
			if(totalPoints < 1)
				totalPoints = 1;
		}

		if(totalPoints < 0) {
			totalPoints = 0;
		}

		creature->setShockWounds(totalPoints);
	}

	static int GetDarksidePoints(CreatureObject* creature) {
		return creature->getShockWounds();
	}

	static void HandleDarksideFading(CreatureObject* creature) {
		if(GetDarksidePoints(creature) > 1) {
			if(creature->checkCooldownRecovery("darkside_decay")) {
				creature->updateCooldownTimer("darkside_decay", 6 * 60 * 60 * 1000);
				RemoveDarksidePoints(creature, 1);
				creature->sendSystemMessage("Your dark corruption has faded slightly.");
			}
		}
		
	}

	static void doLongRest(CreatureObject* creature) {
		uint64 time = Time::currentNanoTime() / 1000000;

		//Check if they are still on rest cooldown.
		if(time < creature->getStoredLong("long_rest_time")){
			uint64 timeRemaining = creature->getStoredLong("long_rest_time") - time;
			BorrieRPG::BroadcastMessage(creature, BorString::getNiceName(creature) + " was unable to rest, as they have rested too recently.");
			creature->sendSystemMessage("You can rest again in " +String::valueOf(timeRemaining / 3600000)+ " hours.");
			return;
		}

		bool isCamping = false;
		// Check if we are within 20m of a camp.
		if(creature->getCurrentCamp() != nullptr){
			// Make sure our camp is in the same zone before testing for distance.
			if (creature->getCurrentCamp()->getZone() == creature->getZone()){
				int distance = creature->getDistanceTo(creature->getCurrentCamp()->getCamp());
				isCamping = distance < 20;
			}
		}

		//Check if they are in a safe location.
		if(creature->getActiveRegion() == nullptr){
			String zoneName = creature->getZone()->getZoneName();

			if (zoneName != "tutorial" && zoneName != "rp_space" && zoneName != "rp_ship_a" && !isCamping){
				creature->sendSystemMessage("You must be in a safe location to rest.");
				return;
			}
		}

		//Execute the long rest!
		FillAllPools(creature);
		creature->setStoredInt("power_attack_count", 0);
		creature->setStoredInt("is_vulnerable", 0);
		creature->setStoredInt("force_skill_learned", 0);
		creature->setStoredInt("force_defense", 0);
		creature->setStoredInt("rp_heropoint", 1);

		//18 hour cooldown.
		creature->setStoredLong("long_rest_time", time + 18 * 60 * 60 * 1000); 
	}

	static bool attuneForceCrystal(CreatureObject* creature, SceneObject* crystal){
		// No idea how a non-player would ever get here, but better safe than sorry.
		if(!creature->isPlayerCreature()){
			return false;
		}

		// Check that the person trying to attune the crystal meets the requirements!
		if (!creature->hasSkill("rp_inward_a02")){
			creature->sendSystemMessage("You try to focus on the crystal, but cannot reach it. You require more meditation practice!");
			return false;
		}

		// Check if we're trying to attune someone else's crystal.
		if (crystal->getStoredString("attuned_id") != ""){
			creature->sendSystemMessage("You can't attune a crystal that is already attuned!");
			return false;
		}

		// Check if they have enough Force available to attune the crystal!
		if (creature->getPlayerObject()->getForcePower() != creature->getPlayerObject()->getForcePowerMax()){
			creature->sendSystemMessage("You attempt to focus the Force within you on the crystal, but your concentration fails. Your connection to the Force is too strained.");
			return false;
		}

		int inwardSkill = creature->getSkillMod("rp_inward");
		int inwardRoll = BorDice::Roll(1, 20);
		int result = inwardSkill + inwardRoll;

		if (crystal->getStoredInt("attunement_cost") <= 0){
			crystal->setStoredInt("attunement_cost", 15); 
		}

		String msg = "";

		int dc = crystal->getStoredInt("attunement_cost");

		msg = BorString::getNiceName(creature)+" attempts to attune a lightsaber crystal! \\#DBDBDB";
		msg += BorString::skillSpam(inwardSkill, inwardRoll, result, dc)+"\\#FFFFFF ";

		ModPool(creature, "force", -creature->getPlayerObject()->getForcePowerMax(), true);
		ModPool(creature, "will", -2, true);

		if (inwardSkill + inwardRoll >= dc && inwardRoll != 1){
			// Attune the crystal!
			crystal->setStoredString("attuned_id", String::valueOf(creature->getObjectID()));
			crystal->setStoredString("attuned_name", creature->getFirstName());
			crystal->setCustomObjectName(creature->getFirstName()+"'s Crystal", true);

			msg += "and succeeds! They pour their presence into the crystal, and it is now attuned to them, and resonates with their presence.";
			BorrieRPG::BroadcastMessage(creature, msg);
		} else {
			// Reduce the DC for next time!
			crystal->setStoredInt("attunement_cost", dc-2);
			msg += "and fails. They pour their presence into the crystal, and the crystal resonates briefly, but does not hold on.";
			BorrieRPG::BroadcastMessage(creature, msg);
			creature->sendSystemMessage("The DC was reduced by 2!");
		}
		return true;
	}
};

#endif /*BORCHARACTER_H_*/