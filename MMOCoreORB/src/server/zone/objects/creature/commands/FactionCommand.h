/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef FACTIONCOMMAND_H_
#define FACTIONCOMMAND_H_

#include "server/zone/managers/faction/FactionManager.h"
#include "server/zone/borrie/BorrieRPG.h"
#include "server/zone/borrie/BorCharacter.h"

class FactionCommand : public QueueCommand {

public:
	FactionCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {

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

		StringTokenizer args(arguments.toString());

		try {
			String command, subCommand, subSubCommand;
			if (args.hasMoreTokens()) {
				args.getStringToken(command);
			}

			command = command.toLowerCase();
			ManagedReference<SceneObject*> object;
			ManagedReference<CreatureObject*> creo;
			ManagedReference<PlayerObject*> playerTarget;

			if (target != 0) {
				object = server->getZoneServer()->getObject(target, false);
			}

			if (command == "help") {
				HelpDisplay(creature, adminLevelCheck);
			}

			// DM and Admin commands
			if (adminLevelCheck > 13) { // DM
				if (command == "addrep") {
					if (object == nullptr){
						creature->sendSystemMessage("Invalid target. /faction addrep requires a player target.");
						return SUCCESS;
					}

					creo = object->asCreatureObject();

					if (creo == nullptr){
						creature->sendSystemMessage("Invalid target. /faction addrep requires a player target.");
						return SUCCESS;
					}

					playerTarget = creo->getPlayerObject();

					if (playerTarget == nullptr){
						creature->sendSystemMessage("Invalid target. /faction addrep requires a player target.");
						return SUCCESS;
					}

					if (!args.hasMoreTokens()){
						creature->sendSystemMessage("Invalid arguments. Usage: /faction addrep [faction] [standing]");
						return SUCCESS;
					}

					String faction = args.getStringToken();

					if (!FactionManager::instance()->isFaction(faction)) {
						creature->sendSystemMessage("Invalid arguments. Usage: /faction addrep [faction] [standing]");
						return SUCCESS;
					}

					if (!args.hasMoreTokens()){
						creature->sendSystemMessage("Invalid arguments. Usage: /faction addrep [faction] [standing]");
						return SUCCESS;
					}

					int standingChange = args.getIntToken();

					if(standingChange > 0){
						playerTarget->increaseFactionStanding(faction, standingChange);
					} else {
						playerTarget->decreaseFactionStanding(faction, -standingChange);
					}
					creature->sendSystemMessage(faction + " faction standing set to " + String::valueOf(standingChange) + " for " + creo->getFirstName());
					return SUCCESS;

				} else if (command == "exp") {
					if (object == nullptr){
						creature->sendSystemMessage("Invalid target. /faction exp requires a player target.");
						return SUCCESS;
					}

					creo = object->asCreatureObject();

					if (creo == nullptr){
						creature->sendSystemMessage("Invalid target. /faction exp requires a player target.");
						return SUCCESS;
					}

					playerTarget = creo->getPlayerObject();

					if (playerTarget == nullptr){
						creature->sendSystemMessage("Invalid target. /faction exp requires a player target.");
						return SUCCESS;
					}

					if (!args.hasMoreTokens()){
						creature->sendSystemMessage("Invalid arguments. Usage: /faction exp [amount]");
						return SUCCESS;
					}

					int amount = args.getIntToken();

					BorCharacter::rewardXP(creo, creature, "rp_faction", amount);

				}
			}
			if (adminLevelCheck > 14) { // Admin
				if (command == "set") {
					if (object == nullptr){
						creature->sendSystemMessage("Invalid target. /faction set requires a player target.");
						return SUCCESS;
					}

					creo = object->asCreatureObject();

					if (creo == nullptr){
						creature->sendSystemMessage("Invalid target. /faction set requires a player target.");
						return SUCCESS;
					}

					if (!args.hasMoreTokens()){
						creature->sendSystemMessage("Invalid arguments. Usage: /faction set [faction]");
						return SUCCESS;
					}
					String faction = args.getStringToken();

					creo->setStoredString("faction", faction);
					creature->sendSystemMessage("The target's faction has been set to: "+faction);
					return SUCCESS;

				} else if (command == "setbranch") {
					if (object == nullptr){
						creature->sendSystemMessage("Invalid target. /faction setbranch requires a player target.");
						return SUCCESS;
					}

					creo = object->asCreatureObject();

					if (creo == nullptr){
						creature->sendSystemMessage("Invalid target. /faction setbranch requires a player target.");
						return SUCCESS;
					}

					if (!args.hasMoreTokens()){
						creature->sendSystemMessage("Invalid arguments. Usage: /faction setbranch [branch]");
						return SUCCESS;
					}
					String branch = args.getStringToken();

					creo->setStoredString("faction:branch", branch);
					creature->sendSystemMessage("The target's faction branch has been set to: "+branch);
					return SUCCESS;

				} else if (command == "setrank") {
					if (object == nullptr){
						creature->sendSystemMessage("Invalid target. /faction setbranch requires a player target.");
						return SUCCESS;
					}

					creo = object->asCreatureObject();

					if (creo == nullptr){
						creature->sendSystemMessage("Invalid target. /faction setbranch requires a player target.");
						return SUCCESS;
					}

					if (!args.hasMoreTokens()){
						creature->sendSystemMessage("Invalid arguments. Usage: /faction setrank [rank]");
						return SUCCESS;
					}
					int rank = args.getIntToken();

					creo->setStoredInt("faction:rank", rank);
					creature->sendSystemMessage("The target's faction rank has been set to: "+String::valueOf(rank));
					return SUCCESS;
				}
			}
		} catch (Exception& e) {
			creature->sendSystemMessage("Invalid arguments for faction command. Help: /faction help");
			creature->sendSystemMessage("Error: " + String(e.what()) + " - " + e.getMessage());
		}
		return SUCCESS;
	}

	void HelpDisplay(CreatureObject* creature, int adminLevel) const {
		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();
		StringBuffer text;
		text << "-FACTION COMMAND-------------------" << endl;
		text << "/faction check - Displays information about your current faction, and your position in it." << endl;

		if (adminLevel > 1){
			text << "-DM FACTION COMMAND----------------" << endl;
			text << "/faction addrep [faction] [amount] - Awards reputation with the specified faction. Can be negative to remove standing." << endl;
			text << "/faction exp [amount] - Awards the specified faction favour." << endl;
			
		}
	
		if (adminLevel > 14){
			text << "/faction set [faction] - Sets the faction of the character. Should only be used for setting up NPCs." << endl;
			text << "/faction setbranch [branch] - Sets the faction branch of the character. Should only be used for setting up NPCs." << endl;
			text << "/faction setrank [rank] - Sets the rank of the character. Should only be used for setting up NPCs." << endl;
			
		}

		ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
		box->setPromptTitle("FACTION COMMAND HELP");
		box->setPromptText(text.toString());
		ghost->addSuiBox(box);
		creature->sendMessage(box->generateMessage());
	}

};

#endif 
