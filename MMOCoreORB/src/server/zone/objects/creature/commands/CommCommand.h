/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef COMMCOMMAND_H_
#define COMMCOMMAND_H_

#include "QueueCommand.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/managers/player/PlayerManager.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/chat/ChatManager.h"

#include "server/zone/borrie/BorrieRPG.h"

class CommCommand : public QueueCommand {
public:

	CommCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (creature == nullptr)
			return GENERALERROR;

		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();
		ManagedReference<CreatureObject*> targetCreature = nullptr;

		if (ghost == nullptr)
			return GENERALERROR;

		// Tokenise our arguments.
		StringTokenizer args(arguments.toString());

		String targetName = "";

		// Obtain the target, if we have one.
		if (target != 0) {
			ManagedReference<SceneObject*> object = server->getZoneServer()->getObject(target, false);
			if (object->isCreatureObject() && target != creature->getTargetID()){
				targetCreature = object->asCreatureObject();
				targetName = targetCreature->getFirstName();
			}
		}

		if (targetCreature == nullptr){
			if(args.hasMoreTokens()){
				targetName = args.getStringToken();
			} else {
				creature->sendSystemMessage("Incorrect syntax! Example: /comm [PlayerName] [Optional:ChatType] [Message].");
			}

			ManagedReference<PlayerManager*> playerManager = server->getPlayerManager();
			targetCreature = playerManager->getPlayer(targetName);

			if (targetCreature == nullptr) {
				creature->sendSystemMessage("The specified player does not exist.");
				return INVALIDTARGET;
			}

			if (targetCreature->getZone() == nullptr) {
				creature->sendSystemMessage("The specified player is not online.");
				return INVALIDTARGET;
			}
		}

		String message = args.getRemainingString();
		int chatType = 0;
		String chatTypeString = "";

		if (args.hasMoreTokens()){
			chatTypeString = args.getStringToken().toLowerCase();

			if (BorrieRPG::GetChatTypeID(chatTypeString) != -1 && chatTypeString != "emote" && chatTypeString != "think" && chatTypeString != "say"){
				ChatManager* chatManager = ServerCore::getZoneServer()->getChatManager();

				//Set our chatType and remove the tag from our command.
				chatType = chatManager->getSpatialChatType(chatTypeString);
				message = args.getRemainingString();
			}
		}

		if (ghost->getLanguageID() == 9) {
			creature->sendSystemMessage("You must use a verbal language to use /comm.");
			return SUCCESS;
		}

		creature->getZoneServer()->getChatManager()->broadcastChatMessage(creature, "<C> " + message, 0, chatType, creature->getMoodID(), 0U, ghost->getLanguageID());
		
		if (!BorCharacter::understandsLanguage(targetCreature, ghost->getLanguageID())){
			message = creature->getDisplayedName()+" speaks in a language you do not understand.";
		}

		// Add our mood if it's not 0.
		if (creature->getMoodID() != 0){
			message = "("+BorrieRPG::Capitalize(creature->getMoodString())+") "+message;
		}

		// Add our chatType if it's not 0.
		if (chatType != 0){
			message = "("+ BorrieRPG::Capitalize(chatTypeString) +") " + message;
		}

		// Add our language when not speaking Basic.
		if (ghost->getLanguageID() != 1 && BorCharacter::understandsLanguage(targetCreature, ghost->getLanguageID())) {
			message = "("+BorCharacter::getLanguageNames().get(ghost->getLanguageID())+") "+message;
		}

		targetCreature->sendSystemMessage("[Comm, " + creature->getFirstName() +"]: " + message);
		targetCreature->playMusicMessage("sound/ui_incoming_im.snd");

		return SUCCESS;
	}

};

#endif //COMMCOMMAND_H_
