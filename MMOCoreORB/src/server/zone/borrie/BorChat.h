#ifndef BORCHAT_H_
#define BORCHAT_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/managers/creature/CreatureManager.h"
#include "server/zone/packets/chat/ChatSystemMessage.h"
#include "server/zone/packets/chat/ChatRoomMessage.h"

//#include "templates/roleplay/RoleplayManager.h"

#include "server/chat/ChatManager.h"
#include "server/zone/borrie/BorrieRPG.h"
#include "server/chat/room/ChatRoom.h"



class BorChat : public Logger {
public:
    static void RateOutgoingMessage(CreatureObject* target, const UnicodeString& message, uint32 spatialChatType) {
        if(target->isPlayerCreature()) {
            if(target->getPlayerObject()->isAnonymous())
                return;               

            String msg = message.toString();

            if(msg == "()") {
                target->sendSystemMessage("Intentional attempts to abuse the Immersive Experience System are against the rules.");
                return;
            }

            if(msg.contains("(") || msg.contains(")")) 
                return;

            int messageLength = msg.length();
            if(messageLength == 0) 
                return;

            
            int score = 0;
            if(messageLength >= 3 && messageLength < 10) {
                score = 1;
            } else if(messageLength >= 10 && messageLength < 25) {
                score = 2;
            } else if(messageLength >= 25 && messageLength < 50) {
                score = 3;
            } else if(messageLength >= 100 && messageLength < 150) {
                score = 4;
            } else if(messageLength >= 150) {
                score = 5;
            }

            int existingScore = target->getStoredInt("exp_chat_score");
            int finalScore = 0;
            if(existingScore + score >= 50) {
                finalScore = 50;
            } else {
                finalScore = existingScore + score;
            }

            target->setStoredInt("exp_chat_score", finalScore);
            target->setStoredInt("online_exp_ticks", 0);                
        } 
    }

    static void PrintSpatialChatToDMs(CreatureObject* target, const UnicodeString& message) {
        ChatManager* chatManager = target->getZoneServer()->getChatManager();
        ChatRoom* obsvRoom = chatManager->getChatRoomByFullPath("SWG.An Empire Inherited.Chat.observer");
	    if(obsvRoom != nullptr) {
		    obsvRoom->broadcastMessage(new ChatRoomMessage(target->getFirstName(), target->getZoneServer()->getGalaxyName(), message, obsvRoom->getRoomID()));
	    }	
    }

    static void PrintSpatialChatToDiscord(CreatureObject* target, const UnicodeString& message, String spatialChatType, int languageID, uint32 moodID) {
        ChatManager* chatManager = target->getZoneServer()->getChatManager();
        ChatRoom* obsvRoom = chatManager->getChatRoomByFullPath("SWG.An Empire Inherited.Chat.global");

        String moodName = chatManager->getMoodType(moodID);

        bool anonymous = false;
        if(target->isPlayerCreature()) {
            anonymous = target->getPlayerObject()->isAnonymous();
        }

        StringTokenizer tokens(target->getDisplayedName());

        String name = tokens.getStringToken();
        bool brackets = false;

        while (tokens.hasMoreTokens()){
            String token = tokens.getStringToken();

            if (token.contains("(")){
                if (token.contains(")")){
                    continue;
                } else {
                    brackets = true;
                    continue;
                }
            }
            if (token.contains(")")){
                brackets = false;
                continue;
            }
            if (!brackets){
                name = name+" "+token;
            }
        }

        // Discord bot expects the following format: ChatType::LanguageID::MoodString::message
        String finalMessage = spatialChatType+"::"+String::valueOf(languageID)+"::"+moodName+"::";

        if(!anonymous) {
            obsvRoom->broadcastMessage(new ChatRoomMessage(name, target->getZoneServer()->getGalaxyName(), UnicodeString(finalMessage) + message, obsvRoom->getRoomID(), false));
        }
    }

    static void PrintDMMessageToDiscord(CreatureObject* target, const UnicodeString& message) {
        ChatManager* chatManager = target->getZoneServer()->getChatManager();
        ChatRoom* obsvRoom = chatManager->getChatRoomByFullPath("SWG.An Empire Inherited.Chat.global");

        obsvRoom->broadcastMessage(new ChatRoomMessage("DM " + target->getFirstName(), target->getZoneServer()->getGalaxyName(), "DM::" + message, obsvRoom->getRoomID(), false));
    }
};

#endif /*BORCHAT_H_*/