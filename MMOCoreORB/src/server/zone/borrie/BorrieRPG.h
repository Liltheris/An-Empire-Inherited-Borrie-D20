#ifndef SOVEREIGNTY_H_
#define SOVEREIGNTY_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/creature/ai/AiAgent.h"
#include "server/zone/objects/player/sui/messagebox/SuiMessageBox.h"
#include "server/zone/packets/player/PlayMusicMessage.h"
#include "server/zone/Zone.h"
#include "server/zone/managers/creature/CreatureManager.h"
#include "server/zone/packets/chat/ChatSystemMessage.h"
#include "templates/customization/AssetCustomizationManagerTemplate.h"
#include "templates/customization/CustomizationIdManager.h"
#include "server/zone/managers/name/NameManager.h"

#include "server/zone/managers/crafting/CraftingManager.h"

#include "server/zone/objects/player/sui/listbox/SuiListBox.h"
#include "server/zone/objects/player/sui/inputbox/SuiInputBox.h"

#include "server/ServerCore.h"

#include "server/zone/managers/player/PlayerManager.h"
#include "server/zone/managers/player/PlayerMap.h"
#include "server/chat/ChatManager.h"

#include "server/login/account/Account.h"

#include "server/zone/objects/creature/sui/SetDMStatusSuiCallback.h"

#include "engine/engine.h"

#include "server/zone/borrie/BorString.h"

class BorrieRPG : public Logger {
public:
	static void SetPassiveExpBanStatus(CreatureObject* creature, CreatureObject* dm, bool banned) {
		creature->setStoredInt("exp_banned", banned ? 1 : 0);
		if(banned) {
			dm->sendSystemMessage(creature->getFirstName() + " will no longer gain passive experience points.");
		} else {
			dm->sendSystemMessage(creature->getFirstName() + " can once more recieve passive experience points");
		}
	}

	static void SwitchWeaponType(CreatureObject* creature) {
        WeaponObject* weapon = creature->getWeapon();

        if(weapon == nullptr) {
            creature->sendSystemMessage("You don't have a weapon equipped!");
            return;
        }

		Locker locker(weapon);

        String alternateGripTemplate = weapon->getAlternateGrip();

        if(alternateGripTemplate == "") {
            creature->sendSystemMessage("This weapon does not have an alternative grip.");
            return;
        }

        if (!alternateGripTemplate.contains("object/tangible") && !alternateGripTemplate.contains("object/weapon")) {
			creature->sendSystemMessage("This weapon does not have a valid alternative grip.");
			return;
		}

        Reference<SharedObjectTemplate*> shot = TemplateManager::instance()->getTemplate(alternateGripTemplate.hashCode());
        if (shot == nullptr || !shot->isSharedTangibleObjectTemplate()) {
			creature->sendSystemMessage("The alternate grip template, for whatever reason, is not a valid tangible object. Please contact a developer.");
			return;
		}

        ManagedReference<TangibleObject*> object = (creature->getZoneServer()->createObject(shot->getServerObjectCRC(), 1)).castTo<TangibleObject*>();
		if (object == nullptr) {
			creature->sendSystemMessage("This weapon's alternate grip template is invalid. Please contact a developer.");
			return;
		}

        ManagedReference<SceneObject*> inventory = creature->getSlottedObject("inventory");

        if(inventory == nullptr) {
            creature->sendSystemMessage("Error. You somehow do not have an inventory. Cannot grip switch.");
			return;
        }

        Locker olocker(object);
		object->createChildObjects();

		if(weapon->getCustomObjectName().toString() != "")
			object->setCustomObjectName(weapon->getCustomObjectName(), true);

        String craftersName = weapon->getCraftersName();
        object->setCraftersName(craftersName);
        String serialNumber = weapon->getSerialNumber();
        object->setSerialNumber(serialNumber);
        object->setStoredString("dm_creator", weapon->getStoredString("dm_creator"));
		object->setStoredString("rp_description", weapon->getStoredString("rp_description"));

        //Move Items to new Object
        if(weapon->isJediWeapon()) {
            ManagedReference<SceneObject*> saberInv = weapon->getSlottedObject("saber_inv");
            ManagedReference<SceneObject*> newSaberInv = object->getSlottedObject("saber_inv");

            if(saberInv != nullptr && newSaberInv != nullptr) {
                int containerSize = saberInv->getContainerObjectsSize();

                for (int j = containerSize - 1; j >= 0; --j) {
		            ManagedReference<SceneObject*> containerObject = saberInv->getContainerObject(j);

		            Locker locker(containerObject);

		            if (newSaberInv->transferObject(containerObject, -1, true)) {
			            newSaberInv->broadcastObject(containerObject, true);
		            } else {
                        if (inventory->transferObject(containerObject, -1, true)) {
			                inventory->broadcastObject(containerObject, true);
		                }  else {
                            containerObject->destroyObjectFromDatabase(true);
			                creature->sendSystemMessage("Error transferring object to inventory.");
                        }			            
		            }
	            }
            }            
        } 

        //Give this new item to the player.
        if (inventory->transferObject(object, -1, true)) {
			inventory->broadcastObject(object, true);
		} else {
			object->destroyObjectFromDatabase(true);
			creature->sendSystemMessage("Error transferring object to inventory.");
		}

        //Equip the new item, destroy the old one.
        inventory->transferObject(weapon, -1, true);
		creature->transferObject(object, 4, true);

        //Goodbye existing Weapon
        weapon->destroyObjectFromWorld(true);
		weapon->destroyObjectFromDatabase(true);
    }

	static void AlertTurn(CreatureObject* creature) {
		UnicodeString message1("\\#.-- \\#pcontrast1 [ It's " + BorString::getNiceName(creature) + "'s turn! ]\\#. --");
		ChatSystemMessage* msg = new ChatSystemMessage(message1, ChatSystemMessage::DISPLAY_CHATANDSCREEN);
		creature->broadcastMessage(msg, true);
		creature->playEffect("clienteffect/level_granted.cef");
	}

	static void AlertTurn(CreatureObject* self, String name) {
		name = name.subString(10, name.length());
		UnicodeString message1("\\#.-- \\#pcontrast1 [ It's " + name + "'s turn! ]\\#. --");
		ChatSystemMessage* msg = new ChatSystemMessage(message1, ChatSystemMessage::DISPLAY_CHATANDSCREEN);
		self->broadcastMessage(msg, true);
	}

	static void BroadcastMessage(CreatureObject* creature, String Message) {
		UnicodeString message1(BorString::getNameTag(creature) + " " + Message);
		ChatSystemMessage* msg = new ChatSystemMessage(message1, ChatSystemMessage::DISPLAY_CHATANDSCREEN);
		creature->broadcastMessage(msg, true);
	}

	static void BroadcastHoloNetMessage(CreatureObject* creature, String Message) {
		UnicodeString message1("Alert: \\#00FFFFRecieving HoloNet Broadcast From "+ BorString::getNameTag(creature) + ": \\#FFFFFF" + Message + "\\#.");
		ChatSystemMessage* msg = new ChatSystemMessage(message1, ChatSystemMessage::DISPLAY_CHATANDSCREEN);
		creature->broadcastMessage(msg, true);
	}

	static void BroadcastMessageToArea(CreatureObject* creature, String message) {
		UnicodeString message1(message);
		ChatSystemMessage* msg = new ChatSystemMessage(message1, ChatSystemMessage::DISPLAY_CHATANDSCREEN);
		creature->broadcastMessage(msg, true);
	}

	static void broadcastSecretMessage(CreatureObject* creature, String message) {
		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

		ChatManager* chatManager = creature->getZoneServer()->getChatManager();
		Locker chatManagerLocker(chatManager);

		PlayerMap* playerMap = chatManager->getPlayerMap();
		playerMap->resetIterator();

		String finalMessage = BorString::getNameTag(creature) + " " + message;

		creature->sendSystemMessage(finalMessage);

		while (playerMap->hasNext()) {
			ManagedReference<CreatureObject*> playerCreature = playerMap->getNextValue();
			ManagedReference<PlayerObject*> playerObject = playerCreature->getPlayerObject();

			if (playerObject->isPrivileged()) {
				playerCreature->sendSystemMessage(finalMessage);
			}
		}
	}

	static void BroadcastRoll(CreatureObject* creature, String rollMessage, bool secret = false) {
		if (secret) {
			broadcastSecretMessage(creature, rollMessage);
		} else {
			BroadcastMessage(creature, rollMessage);
		}
		
	}

	static void BroadcastRoll(CreatureObject* commander, CreatureObject* creature, String rollMessage, bool secret = false) {
		if(commander != creature) {
			String message1 = " for [\\#FFFF00" + BorString::getNiceName(creature) + "\\#FFFFFF]: " + rollMessage;
			if (secret)
				broadcastSecretMessage(commander, message1);
			else
				BroadcastMessage(commander, message1);
		} else {
			if (secret)
				broadcastSecretMessage(creature, rollMessage);
			else
				BroadcastMessage(creature, rollMessage);
		}		
	}

	static void BroadcastToAdmins(CreatureObject* creature, String msg) {
		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();
		if (msg == "") {
			creature->sendSystemMessage("Syntax: /dm call <msg>");
			return;
		}
		ChatManager* chatManager = creature->getZoneServer()->getChatManager();
		Locker chatManagerLocker(chatManager);

		PlayerMap* playerMap = chatManager->getPlayerMap();
		playerMap->resetIterator(false);

		String pName = "[\\#FF0000" + creature->getFirstName() + "\\#FFFFFF] DM CALL: ";

		creature->sendSystemMessage("Sent DM Call with message: '" + msg + "'");
		creature->sendSystemMessage("\\#00FFFFNOTE: Please be sure not to spam the DM call function. If a DM is available, they will respond to you ASAP.");

		while (playerMap->hasNext(false)) {
			ManagedReference<CreatureObject*> playerCreature = playerMap->getNextValue(false);
			ManagedReference<PlayerObject*> playerObject = playerCreature->getPlayerObject();

			if (playerObject->isPrivileged()) { // TODO: Check to see if a character is a secret DM.
				playerCreature->sendSystemMessage(pName + msg);
			}
			if(playerCreature->getFirstName() == "Discord") {
				playerCreature->sendSystemMessage("dmcall::" + creature->getFirstName() + "::DM Call - " + msg);
			}
		}
	}

	static void BroadcastAmongAdmins(CreatureObject* creature, String msg) {
		if(creature == nullptr)
			return;

		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();
		if (msg == "") {
			creature->sendSystemMessage("Syntax: /dm lw <msg>");
			return;
		}
		ChatManager* chatManager = creature->getZoneServer()->getChatManager();
		Locker chatManagerLocker(chatManager);

		PlayerMap* playerMap = chatManager->getPlayerMap();
		playerMap->resetIterator();

		String pName = "[DMCHAT][\\#FF6C00" + creature->getFirstName() + "\\#FFFFFF]: ";
		UnicodeString message1(pName + msg);
		ChatSystemMessage* csmsg = new ChatSystemMessage(message1, ChatSystemMessage::DISPLAY_CHATONLY);

		while (playerMap->hasNext()) {
			ManagedReference<CreatureObject*> playerCreature = playerMap->getNextValue();
			if(playerCreature == nullptr)
				continue;

			ManagedReference<PlayerObject*> playerObject = playerCreature->getPlayerObject();
			if(playerObject == nullptr)
				continue;

			if(playerCreature->getFirstName() == "Discord") {
				playerCreature->sendSystemMessage("lw::" + creature->getFirstName() + "::" + msg);
			}

			if (playerObject->isPrivileged()) { // TODO: Check to see if a character is a secret DM.
				//playerCreature->broadcastMessage(csmsg, true);
				playerCreature->sendSystemMessage(pName + msg);
			}
		}
	}

	static String GetPlayerAccountName(CreatureObject* creature) {
		if(creature->isPlayerCreature()) {
			Account* account = creature->getPlayerObject()->getAccount();
			if(account != nullptr) {
				return account->getUsername();
			} else {
				return "UNKNOWN";
			}
		} else {
			return "NPC";
		}
	}

	static void ListOnlineCharacters(CreatureObject* creature, bool showAll) {
		ChatManager* chatManager = creature->getZoneServer()->getChatManager();
		PlayerMap* playerMap = chatManager->getPlayerMap();
		int playerCount = chatManager->getPlayerCount();

		String result;

		playerMap->resetIterator();

		while (playerMap->hasNext()) {
			ManagedReference<CreatureObject*> playerObject = playerMap->getNextValue();

			Account* account = playerObject->getPlayerObject()->getAccount();

			String name = playerObject->getDisplayedName();

			if(showAll) {
				result += "\\#FFFF00" + name + "\\#FFFFFF (" + account->getUsername() +") ";
				if(account->getAdminLevel() > 0) {
					result += " Admin: " + String::valueOf(account->getAdminLevel());
				} 
			} else {
				if(playerObject->getFirstName() == "Discord") {
					playerCount--;
					continue;
				}
				if(account->getAdminLevel() > 1) {
					if(playerObject->getStoredString("rp_dm_status") != "")
						result += "\\#FFFF00DM " + name + "\\#FFFFFF Status: " + playerObject->getStoredString("rp_dm_status");
					else {
						playerCount--;
						continue;
					}						
				} else {
					if(account->getAdminLevel() < 1 ) {
						result += "\\#FFFF00" + name + "\\#FFFFFF";
						if(playerObject->getPlayerObject()->getTitle() == "rp_bg_roleplayer") {
							result += "\\#FFFFFF (OOC)";
						}
					}
				}
			}		

			result += "\n";
		}

		result = "There are " + String::valueOf(playerCount) + " characters online.\n" + result;

		creature->sendSystemMessage(result);	

	}

	static void ShowPlayersWithPlanets(CreatureObject* creature, bool pingLocation = false) {
		ChatManager* chatManager = creature->getZoneServer()->getChatManager();
		PlayerMap* playerMap = chatManager->getPlayerMap();
		int playerCount = chatManager->getPlayerCount();

		String result;

		playerMap->resetIterator();

		while (playerMap->hasNext()) {
			ManagedReference<CreatureObject*> playerObject = playerMap->getNextValue();
			Zone* zone = playerObject->getZone();
			String playerPlanet = zone->getZoneName();

			Account* account = playerObject->getPlayerObject()->getAccount();

			String name = playerObject->getDisplayedName();

			result += "\\#FFFF00" + name + "\\#FFFFFF (" + account->getUsername() +"): ";

			result += GetPlanetName(playerPlanet);

			if(pingLocation) {
				result += " ("+String::valueOf(playerObject->getWorldPositionX())+", "+String::valueOf(playerObject->getWorldPositionY())+")";
			}

			if(account->getAdminLevel() > 0) {
				result += " Admin: " + String::valueOf(account->getAdminLevel());
			} 

			result += "\n";
		}

		result = "There are " + String::valueOf(playerCount) + " characters online.\n" + result;

		creature->sendSystemMessage(result);	
	}

	static void ShowPlanetPopulations(CreatureObject* creature) {
		ChatManager* chatManager = creature->getZoneServer()->getChatManager();
		PlayerMap* playerMap = chatManager->getPlayerMap();
		int playerCount = 0;

		VectorMap<String, int> planetCounts;
		Vector<String> planets;

		playerMap->resetIterator();

		String result;

		while (playerMap->hasNext()) {
			ManagedReference<CreatureObject*> playerObject = playerMap->getNextValue();
			Zone* zone = playerObject->getZone();
			String playerPlanet = zone->getZoneName();

			Account* account = playerObject->getPlayerObject()->getAccount();

			if(account->getAdminLevel() > 1) 
				continue;

			if(playerObject->getFirstName() == "Discord")
				continue;

			playerCount++;

			if(!planets.contains(playerPlanet))
				planets.add(playerPlanet);

			int count = 0;
			if(planetCounts.contains(playerPlanet))
				count = planetCounts.get(playerPlanet);

			planetCounts.drop(playerPlanet);
			planetCounts.put(playerPlanet, count + 1);
		}

		for(int i = 0;i<planets.size();i++) {
			String planetName = planets.get(i);
			int count = planetCounts.get(planetName);
			result += "\\#FFFF00" + GetPlanetName(planetName) + "\\#FFFFFF: " + String::valueOf(count) + "\n";
		}

		result = "There are " + String::valueOf(playerCount) + " characters online.\n" + result;

		creature->sendSystemMessage(result);	
	}

	static void ToggleTargetRolling(CreatureObject* creature) {
		int disabled = creature->getStoredInt("block_target_rolling");
		if(disabled == 0) {
			creature->setStoredInt("block_target_rolling", 1);
			creature->sendSystemMessage("You can no longer roll for others. You will always roll for yourself.");
		} else {
			creature->setStoredInt("block_target_rolling", 0);
			creature->sendSystemMessage("You can roll for others.");
		}
	}

	static String GetPlanetName(String input) {
		if(input == "rp_imp_space") {
			return "Aboard an Imperial Starship";
		} else if(input == "rp_reb_space") {
			return "Aboard a Rebel Starship";
		} else if(input == "rp_space") {
			return "Aboard a Starship";
		} else if(input == "rp_lobby") {
			return "The Lobby";
		} else if(input == "rp_testing") {
			return "Unknown";
		} else if(input == "rp_ship_a" || input == "rp_ship_b" || input == "rp_ship_c" || input == "rp_ship_d") {
			return "Aboard a Personal Starship";
		} else if(input == "rp_dynamic1" || input == "rp_dynamic2" || input == "rp_dynamic3" || input == "rp_dynamic4") {
			return "A Distant Planet";
		}

		String planetName = input.replaceFirst("rp_", "").replaceAll("_", " ");

		planetName = planetName.replaceAll("2", " II");
		planetName = planetName.replaceAll("3", " III");
		planetName = planetName.replaceAll("4", " IV");
		planetName = planetName.replaceAll("5", " V");
		planetName = planetName.replaceAll("6", " VI");
		planetName = planetName.replaceAll("7", " VII");
		planetName = planetName.replaceAll("8", " VIII");
		planetName = planetName.replaceAll("9", " IX");
		planetName = planetName.replaceAll("10", " X");

		NameManager* nameManager = ServerCore::getZoneServer()->getNameManager();
		planetName = nameManager->capitalizeName(planetName);
		return planetName;
	}

	static void ReportPlayerCountToDiscord(CreatureObject* discordBot) {
		try {
			Account* account = discordBot->getPlayerObject()->getAccount();
			if(account->getUsername() != "discord" && account->getUsername() != "discord2") return;
			ChatManager* chatManager = discordBot->getZoneServer()->getChatManager();
			PlayerMap* playerMap = chatManager->getPlayerMap();
			int playerCount = chatManager->getPlayerCount() - 1;
			
			int dmCount = 0;

			playerMap->resetIterator();

			while (playerMap->hasNext()) {
				ManagedReference<CreatureObject*> playerObject = playerMap->getNextValue();
				ManagedReference<PlayerObject*> ghost = playerObject->getPlayerObject();
				if(ghost->getAdminLevel() > 1) {
					playerCount--;
					if(playerObject->getStoredString("rp_dm_status") != "") {
						dmCount++;
					}
				}
				
			}

			if(playerCount < 0) playerCount = 0;

			discordBot->sendSystemMessage("who::" + String::valueOf(playerCount) + "::" + String::valueOf(dmCount));
		} catch (Exception& e) {
			
		}
		
	}

	static void NotifyAdminsAboutPlayerStatus(String name, bool isOnline) {
		ChatManager* chatManager = ServerCore::getZoneServer()->getChatManager();
		PlayerMap* playerMap = chatManager->getPlayerMap();

		playerMap->resetIterator();
		while (playerMap->hasNext()) {
			ManagedReference<CreatureObject*> playerObject = playerMap->getNextValue();
			
			if(playerObject->getStoredInt("dm_alert_incoming") == 1) {
				playerObject->sendSystemMessage("!\\#FFFF00***" + name + (isOnline ? " is now online." : " has gone offline."));
			}
		}
	}

	static void SetDMStatus(CreatureObject* creature) {
		ManagedReference<SuiInputBox*> sui = new SuiInputBox(creature);
		sui->setCallback(new SetDMStatusSuiCallback(creature->getZoneServer()));
		sui->setUsingObject(creature);
		sui->setPromptTitle("Set DM Status"); //Confirm Structure Deletion
		sui->setPromptText("Set your DM Status!");
		sui->setCancelButton(true, "@cancel");
		sui->setMaxInputSize(9999);

		creature->getPlayerObject()->addSuiBox(sui);
		creature->sendMessage(sui->generateMessage());
	}

	static int GetChatTypeID(String chatType) {
		ChatManager* chatManager = ServerCore::getZoneServer()->getChatManager();
		
		int chatID = chatManager->getSpatialChatType(chatType);
		if (chatID == 0 && !(chatType == "say" || chatType == "." || chatType == ":"))
			return -1;
		// Special handling for the ":" chatType
		if (chatType == ":")
			return 38;
		
		return chatID;
	}

	static void copyTarget(CreatureObject* creature, SceneObject* target, bool overrideFlag = false) {
		if(target == nullptr) return;
		ManagedReference<TangibleObject*> tanoTarget = target->asTangibleObject();
		String objectTemplate = target->getObjectTemplate()->getFullTemplateString();
		objectTemplate = objectTemplate.replaceAll("shared_", "");
		creature->sendSystemMessage("Cloning Object: " + objectTemplate);
		ManagedReference<CraftingManager*> craftingManager = creature->getZoneServer()->getCraftingManager();
		if (!objectTemplate.contains("object/tangible") && !objectTemplate.contains("object/weapon")) {
			creature->sendSystemMessage("Templates must be a tangible or weapon object.");
			return;
		}
		if (craftingManager == nullptr) {
			return;
		}
		Reference<SharedObjectTemplate*> shot = TemplateManager::instance()->getTemplate(objectTemplate.hashCode());
		if (shot == nullptr || !shot->isSharedTangibleObjectTemplate()) {
			creature->sendSystemMessage("Templates must be tangible objects, or descendants of tangible objects, only.");
			return;
		}
		ManagedReference<SceneObject*> inventory = creature->getSlottedObject("inventory");
		if (inventory == nullptr || inventory->isContainerFullRecursive()) {
			creature->sendSystemMessage("Your inventory is full, so the item could not be created.");
			return;
		}
		ManagedReference<TangibleObject*> object = (creature->getZoneServer()->createObject(shot->getServerObjectCRC(), 1)).castTo<TangibleObject*>();
		if (object == nullptr) {
			creature->sendSystemMessage("The object '" + objectTemplate + "' could not be created because the template could not be found.");
			return;
		}

		if (!object->isCopyable()) {
			if (!overrideFlag) {
				creature->sendSystemMessage("You are not able to copy this object.");
				return;
			}
		}
		Locker locker(object);
		object->createChildObjects();

		// Set Crafter name and generate serial number
		String name = "Unknown";
		object->setCraftersName(name);
		String serial = object->getSerialNumber(); //We're going to use the same serial as the primary object. This can help with tracking, too.
		object->setSerialNumber(serial);
		object->setStoredString("dm_creator", creature->getFirstName());		

		//Copy Customization Values
		if(tanoTarget != nullptr) {
			CustomizationVariables* itemCustomVars = tanoTarget->getCustomizationVariables();
        	int itemVarSize = itemCustomVars->getSize();

        	for(int j = 0;j<itemVarSize; j++) {
            	uint8 key = itemCustomVars->elementAt(j).getKey();
		    	int16 value = itemCustomVars->elementAt(j).getValue();
		    	String valueType = CustomizationIdManager::instance()->getCustomizationVariable(key);
				object->setCustomizationVariable(valueType, value, true);
        	} 
		}

		bool wasModified = tanoTarget->getStoredString("dm_last_modified") != "";

		if(wasModified) {
			if(tanoTarget->isWeaponObject()) {
				WeaponObject* wepo = object.castTo<WeaponObject*>();
				WeaponObject* origWep = tanoTarget.castTo<WeaponObject*>();
				wepo->setMinDamage(origWep->getMinDamage());
        		wepo->setMaxDamage(origWep->getMaxDamage());
				wepo->setBonusDamage(origWep->getBonusDamage());
        		wepo->setStoredString("dm_last_modified", creature->getFirstName());
			} else if(tanoTarget->isArmorObject()) {
				ArmorObject* armo = object.castTo<ArmorObject*>();
				armo->setStoredString("dm_last_modified", creature->getFirstName());
			}
		}	

		if (inventory->transferObject(object, -1, true)) {
			inventory->broadcastObject(object, true);
		} else {
			object->destroyObjectFromDatabase(true);
			creature->sendSystemMessage("Error transferring object to inventory.");
		}
	}

	static void DeleteCreature(CreatureObject* creature) {
		if(creature != nullptr) {
			if(creature->isAiAgent()) {
				ManagedReference<AiAgent*> agent = creature->asAiAgent();
				Locker locker(agent);
				agent->scheduleDespawn(1);
			}
		}
	}

	static void setCopyable(CreatureObject* creature, SceneObject* target) {
		ManagedReference<TangibleObject*> tano = target->asTangibleObject();
		if (tano != nullptr) {
			bool wasCopyable = tano->isCopyable();
			tano->setCopyable(!wasCopyable);
			if (wasCopyable)
				creature->sendSystemMessage("Target no longer copyable");
			else
				creature->sendSystemMessage("Target is now copyable.");
		} else {
			creature->sendSystemMessage("Error: Target is not tangible.");
		}
	}

	static void IncreaseLots(CreatureObject* creature, int num) {
		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();
		ghost->setMaximumLots(num + 10);
	}

	static void teleportObject(CreatureObject* creature, SceneObject* object, float x, float z, float y, long parent = -1) {
		if (object == nullptr) {
			creature->sendSystemMessage("You need an object targeted in order to teleport it.");
			throw Exception();
		}
		ManagedReference<SceneObject*> objParent = object->getParent().get();
		if(parent == -1) {
			if (objParent != nullptr)
				object->teleport(x, z, y, objParent->getObjectID());
			else
				object->teleport(x, z, y);
		} else if(parent == -2) {
			object->teleport(x, z, y);
		} else {
			object->teleport(x, z, y, parent);
		}
		
	}

	static void colorTarget(CreatureObject* creature, SceneObject* object, int paletteType, int index) {
		String appearanceFilename = object->getObjectTemplate()->getAppearanceFilename();
		VectorMap<String, Reference<CustomizationVariable*>> variables;
		AssetCustomizationManagerTemplate::instance()->getCustomizationVariables(appearanceFilename.hashCode(), variables, false);

		String palette;

		if (paletteType == 1) {
			palette = variables.elementAt(0).getKey();
		} else if (paletteType == 2) {
			palette = variables.elementAt(1).getKey();
		} else if (paletteType == 3) {
			palette = variables.elementAt(2).getKey();
		} else
			palette = variables.elementAt(0).getKey();

		ManagedReference<TangibleObject*> armorRehueTano = object->asTangibleObject();
		if (armorRehueTano != nullptr) {
			Locker locker(armorRehueTano, creature);

			armorRehueTano->setCustomizationVariable(palette, index, true);
		}
	}

	static void SaveTarget(CreatureObject* creature, SceneObject* target) {
		creature->setLocalData("storedtarget", String::valueOf(target->getObjectID()));
		creature->sendSystemMessage("Stored Target: " + target->getDisplayedName() + ". This target will attack whoever you have targeted.");
	}

	static void SetName(CreatureObject* creature, SceneObject* object, String newName) {
		if (object->isPlayerObject()) {
			creature->sendSystemMessage("ERROR: Cannot name players.");
			throw Exception();
		}
		object->setCustomObjectName(newName, true);
	}

	static void ToggleJediState(CreatureObject* dm, CreatureObject* target) {

	}

	static void SetRandomName(CreatureObject* creature, SceneObject* object, String nameType) {
		if (object->isPlayerObject()) {
			if(creature != nullptr)
				creature->sendSystemMessage("ERROR: Cannot name players.");
			throw Exception();
		}

		NameManager* nm = creature->getZoneProcessServer()->getNameManager();

		String result = "a Stranger";

		if(nameType == "stormtrooper") {
			result = nm->makeCreatureName(NameManagerType::STORMTROOPER, CreatureObject::HUMAN);
		} else if (nameType == "scouttrooper") {
			result = nm->makeCreatureName(NameManagerType::SCOUTTROOPER, CreatureObject::HUMAN);
		} else if (nameType == "darktrooper") {
			result = nm->makeCreatureName(NameManagerType::DARKTROOPER, CreatureObject::HUMAN);
		} else if (nameType == "swamptrooper") {
			result = nm->makeCreatureName(NameManagerType::SWAMPTROOPER, CreatureObject::HUMAN);
		} else if(nameType == "r2") {
			result = nm->makeCreatureName(NameManagerType::R2, CreatureObject::HUMAN);
		} else if(nameType == "r3") {
			result = nm->makeCreatureName(NameManagerType::R3, CreatureObject::HUMAN);
		} else if(nameType == "r4") {
			result = nm->makeCreatureName(NameManagerType::R4, CreatureObject::HUMAN);
		} else if(nameType == "r5") {
			result = nm->makeCreatureName(NameManagerType::R5, CreatureObject::HUMAN);
		} else if(nameType == "r6") {
			result = "R6-A1";
		} else if(nameType == "r7") {
			result = "R7-A1";
		} else if(nameType == "r8") {
			result = "R8-A1";
		} else if(nameType == "r9") {
			result = "R9-A1";
		} else if(nameType == "3po" || nameType == "3p0") {
			result = nm->makeCreatureName(NameManagerType::DROID_3P0, CreatureObject::HUMAN);
		} else if(nameType == "eg6") {
			result = nm->makeCreatureName(NameManagerType::DROID_EG6, CreatureObject::HUMAN);
		} else if(nameType == "wed") {
			result = nm->makeCreatureName(NameManagerType::DROID_WED, CreatureObject::HUMAN);
		} else if(nameType == "le") {
			result = nm->makeCreatureName(NameManagerType::DROID_LE, CreatureObject::HUMAN);
		} else if(nameType == "ra7") {
			result = nm->makeCreatureName(NameManagerType::DROID_RA7, CreatureObject::HUMAN);
		} else if(nameType == "human") {
			result = nm->makeCreatureName(NameManagerType::GENERIC, CreatureObject::HUMAN);
		} else if(nameType == "rodian") {
			result = nm->makeCreatureName(NameManagerType::GENERIC, CreatureObject::RODIAN);
		} else if(nameType == "trandoshan" || nameType == "doshan") {
			result = nm->makeCreatureName(NameManagerType::GENERIC, CreatureObject::TRANDOSHAN);
		} else if(nameType == "moncal") {
			result = nm->makeCreatureName(NameManagerType::GENERIC, CreatureObject::MONCAL);
		} else if(nameType == "wookiee") {
			result = nm->makeCreatureName(NameManagerType::GENERIC, CreatureObject::WOOKIE);
		} else if(nameType == "bothan") {
			result = nm->makeCreatureName(NameManagerType::GENERIC, CreatureObject::BOTHAN);
		} else if(nameType == "twilek" || nameType == "twi'lek") {
			result = nm->makeCreatureName(NameManagerType::GENERIC, CreatureObject::TWILEK);
		} else if(nameType == "zabrak") {
			result = nm->makeCreatureName(NameManagerType::GENERIC, CreatureObject::ZABRAK);
		} else if(nameType == "ithorian") {
			result = nm->makeCreatureName(NameManagerType::GENERIC, CreatureObject::ITHORIAN);
		} else if(nameType == "sullustan") {
			result = nm->makeCreatureName(NameManagerType::GENERIC, CreatureObject::SULLUSTAN);
		} else if(nameType == "chiss") {
			result = nm->makeCreatureName(NameManagerType::GENERIC, CreatureObject::CHISS);
		} else {
			if(creature != nullptr)
				creature->sendSystemMessage("No valid name group type for: " + nameType);
			throw Exception();
		}

		object->setCustomObjectName(result, true);
	}

	static void ShowAllStructures(CreatureObject* creature) {
		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();
		StringBuffer body;
		body << "Structures:" << endl;

		for (int i = 0; i < ghost->getTotalOwnedStructureCount(); i++) {
			ManagedReference<StructureObject*> structure = creature->getZoneServer()->getObject(ghost->getOwnedStructure(i)).castTo<StructureObject*>();

			int num = i + 1;
			body << endl << String::valueOf(num) << ". ";

			if (structure == nullptr) {
				body << "NULL Structure" << endl;
				continue;
			}

			body << "Name: " << structure->getCustomObjectName().toString() << endl;
			body << "ID: " << String::valueOf(structure->getObjectID()) << endl;
			body << "    Type: " << structure->getObjectNameStringIdName() << endl;
			body << "    Lots: " << String::valueOf(structure->getLotSize()) << endl;
			body << "    Maintenance Pool: " << String::valueOf(structure->getSurplusMaintenance()) << " credits" << endl;
			body << "    Maintenance Rate: " << String::valueOf(structure->getMaintenanceRate()) << " credits/hr" << endl;

			if (structure->getBasePowerRate() > 0) {
				body << "    Power Reserves: " << String::valueOf(structure->getSurplusPower()) << " units" << endl;
				body << "    Power Consumption: " << String::valueOf(structure->getBasePowerRate()) << " units/hr" << endl;
			}

			body << "    Planet: ";
			Zone* zone = structure->getZone();
			if (zone == nullptr) {
				body << "NULL" << endl;
			} else {
				body << zone->getZoneName() << endl;
				body << "    World Position: " << structure->getWorldPositionX() << ", " << structure->getWorldPositionY() << endl;
			}
			body << endl;
			// if(structure->getObjectID() == 562949976002063) {
			//    structure->destroyObjectFromDatabase(true);
			//}
		}

		ManagedReference<SuiMessageBox*> box = new SuiMessageBox(creature, SuiWindowType::NONE);
		box->setPromptTitle("Structures");
		box->setPromptText(body.toString());
		ghost->addSuiBox(box);
		creature->sendMessage(box->generateMessage());
	}

	static SceneObject* GetStoredObject(CreatureObject* creature) {
		String data = creature->getLocalData("storedtarget");
		if (data != "XXERRORXX") {
			return creature->getZoneServer()->getObject(Long::unsignedvalueOf(data));
		} else
			return nullptr;
	}

	static CreatureObject* GetStoredCreature(CreatureObject* dm) {
		ManagedReference<SceneObject*> object = GetStoredObject(dm);
		if (object != nullptr) {
			if (object->isCreatureObject()) {
				return object->asCreatureObject();
			} else
				return dm;
		} else
			return dm;
	}

	static void ModifyLocalVariable(CreatureObject* modder, CreatureObject* target, String var, int mod) {
		String rawVar = target->getLocalData(var);
		int defaultValue = rawVar == "XXERRORXX" ? 0 : Integer::valueOf(rawVar);
		target->setLocalData(var, String::valueOf(defaultValue + mod));
		modder->sendSystemMessage("Edited " + var + " variable on target to " + String::valueOf(defaultValue + mod) + " (Changing by: " + String::valueOf(mod) +
								  ")");
	}
	
	static String GetPosNegSymbol(int Num) {
		if (Num > -1)
			return "+";
		else
			return "";
	}

	static String Capitalize(String input) {
		return input.subString(0, 1).toUpperCase() + input.subString(1, input.length());
	}

};

#endif /*SOVEREIGNTY_H_*/