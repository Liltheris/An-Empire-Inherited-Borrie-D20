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

		if (ghost == nullptr)
			return GENERALERROR;

		// Tokenise our arguments.
		StringTokenizer args(arguments.toString());

		String targetName = "";

		if(args.hasMoreTokens()){
			targetName = args.getStringToken();
		} else {
			creature->sendSystemMessage("Incorrect syntax! Example: /comm [PlayerName] [Optional:ChatType] [Message].");
		}

		ManagedReference<PlayerManager*> playerManager = server->getPlayerManager();
		ManagedReference<CreatureObject*> targetCreature = playerManager->getPlayer(targetName);

		if (targetCreature == nullptr) {
			creature->sendSystemMessage("The specified player does not exist.");
			return INVALIDTARGET;
		}

		if (targetCreature->getZone() == nullptr) {
			creature->sendSystemMessage("The specified player is not online.");
			return INVALIDTARGET;
		}

		String message = arguments.toString().subString(1 + targetName.length(), arguments.toString().length());
		int chatType = 0;
		String chatTypeString = "";

		if (args.hasMoreTokens()){
			chatTypeString = args.getStringToken().toLowerCase();

			if (BorrieRPG::GetChatTypeID(chatTypeString) != -1 && BorrieRPG::GetChatTypeID(chatTypeString) != 38){
				//Set our chatType and remove the tag from our command.
				chatType = BorrieRPG::GetChatTypeID(chatTypeString);
				message = message.subString(1+ chatTypeString.length(), message.length());
			}
		}

		creature->getZoneServer()->getChatManager()->broadcastChatMessage(creature, "<C> " + message, 0, chatType, creature->getMoodID(), ghost->getLanguageID());
		//Finally, add our chatType into the comm message.
		if (chatType != 0){
			message = "("+ BorrieRPG::Capitalize(chatTypeString) +") " + message;
		}
		targetCreature->sendSystemMessage("[Comm, " + creature->getFirstName() +"]: " + message);
		targetCreature->playMusicMessage("sound/ui_incoming_im.snd");

		return SUCCESS;
	}

};

#endif //COMMCOMMAND_H_
