#ifndef TRAINCOMMANDSUICALLBACK_H_
#define TRAINCOMMANDSUICALLBACK_H_

#include "server/zone/objects/player/sui/SuiCallback.h"
#include "server/zone/objects/player/sui/transferbox/SuiTransferBox.h"

#include "server/zone/managers/roleplay/RoleplayManager.h"

class TrainCommandSuiCallback : public SuiCallback {
private:
	int state;
	int selection;

public:
	TrainCommandSuiCallback(ZoneServer* server, int _state, int _selection) : SuiCallback(server) {
		state = _state;
		selection = _selection;
	}

	void run(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args) {
		bool cancelPressed = (eventIndex == 1);

		PlayerManager* playerManager = player->getZoneServer()->getPlayerManager();

		if (playerManager == nullptr)
			return;

		if (args->size() < 1)
			return;

		int index = Integer::valueOf(args->get(0).toString());

		int freeSkillPoints = player->getStoredInt("starter_skill_points");
		int freeAttrPoints = player->getStoredInt("starter_attr_points");

		if (state == -1) {//Top Menu
			OpenTopMenu(player, suiBox, eventIndex, args, state, selection);
		} else if (state == 0) { //Primary Menu		
			if (cancelPressed) {
				return;
			} else if(index == 0) {
				OpenAttributeSelectionMenu(player, suiBox, eventIndex, args, state, selection);
			} else if(index == 1) {
				OpenSkillSelectionMenu(player, suiBox, eventIndex, args, state, selection);
			} else if(index == 2) {

			}
		} else if (state == 1) { //Select Attribute
			if (cancelPressed) {
				OpenTopMenu(player, suiBox, eventIndex, args, state, selection);
				return;
			}				

			OpenConfirmAttributeSelectionWindow(player, suiBox, eventIndex, args, state, selection);
		} else if (state == 2) { //Select Skill
			if (cancelPressed) {
				OpenTopMenu(player, suiBox, eventIndex, args, state, selection);
				return;
			}				
			
			OpenConfirmSkillSelectionWindow(player, suiBox, eventIndex, args, state, selection);			
		} else if (state == 3) { //Train a Attribute
			if (cancelPressed) {
				OpenAttributeSelectionMenu(player, suiBox, eventIndex, args, state, selection);
				return;
			}				
			
			TrainAttribute(player, suiBox, eventIndex, args, state, selection);

			OpenAttributeSelectionMenu(player, suiBox, eventIndex, args, state, selection);
		} else if (state == 4) { //Train a Skill
			if (cancelPressed) {
				OpenSkillSelectionMenu(player, suiBox, eventIndex, args, state, selection);
				return;
			}			
			
			TrainSkill(player, suiBox, eventIndex, args, state, selection);

			OpenSkillSelectionMenu(player, suiBox, eventIndex, args, state, selection);
		} else if (state == 5) { //Convert Exp: Show possiblities
			if (cancelPressed) {
				OpenTopMenu(player, suiBox, eventIndex, args, state, selection);
				return;
			}
		}
	}

	String GetAttributeStringFromID(int id) {
		RoleplayManager* rp = RoleplayManager::instance();
		return rp->getRpSkill(id,RpSkillType::ATTRIBUTE).getName();
	}

	String GetSkillStringFromID(int id) {
		RoleplayManager* rp = RoleplayManager::instance();
		return rp->getRpSkill(id,RpSkillType::SKILL).getName();
	}

	String GetSkillNumeral(int value) {
		if(value == 0) return "[None]";
		else if(value == 1) return "I";
		else if(value == 2) return "II";
		else if(value == 3) return "III";
		else if(value == 4) return "IV";
		else if(value == 5) return "V";
		else if(value == 6) return "VI";
		else if(value == 7) return "VII";
		else if(value == 8) return "VIII";
		else if(value == 9) return "IX";
		else if(value == 10) return "X";
		else if(value > 10) return "[MAXED OUT]";
		else return "[Unknown]";
	}

	void OpenTopMenu(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args, int state, int selection) {
		int freeSkillPoints = player->getStoredInt("starter_skill_points");
		int freeAttrPoints = player->getStoredInt("starter_attr_points");
		ManagedReference<SuiListBox*> box = new SuiListBox(player, SuiWindowType::JUKEBOX_SELECTION);
		box->setCallback(new TrainCommandSuiCallback(server, 0, 0));
		box->setPromptTitle("Training Menu");
		if(freeSkillPoints > 0 || freeAttrPoints > 0) {
			box->setPromptText("What would you like to do?\n\nFree Attribute Boxes: " + String::valueOf(freeAttrPoints) + "\nFree Skill Boxes: " + String::valueOf(freeSkillPoints));
		} else box->setPromptText("What would you like to do?");	
		box->setCancelButton(true, "@cancel");
		//box->setOkButton(false, "@");
		box->addMenuItem("Train an Attribute");
		box->addMenuItem("Train a Skill");
		//box->addMenuItem("Convert General Roleplay XP");
		player->getPlayerObject()->addSuiBox(box);
		player->sendMessage(box->generateMessage());
	}

	void OpenAttributeSelectionMenu(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args, int state, int selection) {
		int freeSkillPoints = player->getStoredInt("starter_skill_points");
		int freeAttrPoints = player->getStoredInt("starter_attr_points");
		int index = Integer::valueOf(args->get(0).toString());
		ManagedReference<SuiListBox*> box = new SuiListBox(player, SuiWindowType::JUKEBOX_SELECTION);
		box->setCancelButton(true, "Back");
		box->setCallback(new TrainCommandSuiCallback(server, 1, index));

		box->setPromptTitle("Training Attribute Menu");
		if(freeAttrPoints > 0) {
			box->setPromptText("What attribute would you like to rank up?\n\nFree Attribute Boxes: " + String::valueOf(freeAttrPoints));
		} else box->setPromptText("What attribute would you like to rank up?");

		RoleplayManager* rp = RoleplayManager::instance();
		Vector<RpSkillData> data = rp->getRpSkillList(RpSkillType::ATTRIBUTE);

		for (int i = 0; i < data.size(); i++){
			RpSkillData skill = data.get(i);

			box->addMenuItem(BorrieRPG::Capitalize(skill.getName())+" "+GetSkillNumeral(BorSkill::GetRealSkillLevel(player, skill.getName())+1));
		}
		
		player->getPlayerObject()->addSuiBox(box);
		player->sendMessage(box->generateMessage());
	}

	void OpenSkillSelectionMenu(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args, int state, int selection) {
		int freeSkillPoints = player->getStoredInt("starter_skill_points");
		int freeAttrPoints = player->getStoredInt("starter_attr_points");
		int index = Integer::valueOf(args->get(0).toString());
		ManagedReference<SuiListBox*> box = new SuiListBox(player, SuiWindowType::JUKEBOX_SELECTION);
		box->setCancelButton(true, "Back");
		box->setCallback(new TrainCommandSuiCallback(server, 2, index));

		box->setPromptTitle("Training Skill Menu");
		if(freeSkillPoints > 0) {
			box->setPromptText("What skill would you like to rank up? Remember that skills can only go as high as their associated attribute's max rank.\n\nFree Skill Boxes: " + String::valueOf(freeSkillPoints));
		} else {
			box->setPromptText("What skill would you like to rank up? Remember that skills can only go as high as their associated attribute's max rank.");
		}

		RoleplayManager* rp = RoleplayManager::instance();
		Vector<RpSkillData> data = rp->getRpSkillList(RpSkillType::SKILL);

		for (int i = 0; i < data.size(); i++){
			RpSkillData skill = data.get(i);

			int parentLevel = BorSkill::GetRealSkillLevel(player, skill.getParent());
			int skillLevel = BorSkill::GetRealSkillLevel(player, skill.getName());

			String colour = "\\#.";

			if (parentLevel <= skillLevel && skillLevel != 10)
				colour = (parentLevel + 3 <= skillLevel) ? "\\#FF0000" : "\\#FFFF00";

			if (skillLevel == 10)
				colour = "\\#DBDBDB";

			box->addMenuItem(colour + BorrieRPG::Capitalize(skill.getName())+" "+GetSkillNumeral(BorSkill::GetRealSkillLevel(player, skill.getName())+1));
		}

		player->getPlayerObject()->addSuiBox(box);
		player->sendMessage(box->generateMessage());
	}

	void OpenConfirmAttributeSelectionWindow(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args, int state, int selection) {
		int freeSkillPoints = player->getStoredInt("starter_skill_points");
		int freeAttrPoints = player->getStoredInt("starter_attr_points");
		int index = Integer::valueOf(args->get(0).toString());
		//Get index as skill
		String skillName = GetAttributeStringFromID(index);
		//Check to see what the next level of that skill is
		//See if they quality for that skill
		int currentRank = BorSkill::GetRealSkillLevel(player, skillName);
		// Give them a new SUI box option either confirming, or informing that they can't train that right now. 
		ManagedReference<SuiMessageBox*> suibox = new SuiMessageBox(player, SuiWindowType::TEACH_OFFER);
		if (BorSkill::CanTrainNextSkill(player, currentRank + 1, skillName)) {
			suibox->setPromptTitle("Confirm training?"); 
			//Can train!
			suibox->setPromptText("Are you sure you want to train this attribute?\n\nThis will cost 40,000 Roleplay experience.");
			suibox->setCallback(new TrainCommandSuiCallback(server, 3, index));
			suibox->setOkButton(true, "Confirm");
			suibox->setCancelButton(true, "Go Back");
		} else {
			suibox->setPromptTitle("Not eligible for training.");
			//Failure. Can't train.
			suibox->setPromptText("You are not currently eligible to train this attribute. You do not have enough experience points.");
			suibox->setCallback(new TrainCommandSuiCallback(server, -1, state));
			suibox->setCancelButton(true, "Go Back");
		}	
		player->getPlayerObject()->addSuiBox(suibox);
		player->sendMessage(suibox->generateMessage());
	}

	void OpenConfirmSkillSelectionWindow(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args, int state, int selection) {
		int freeSkillPoints = player->getStoredInt("starter_skill_points");
		int freeAttrPoints = player->getStoredInt("starter_attr_points");
		int index = Integer::valueOf(args->get(0).toString());

		String skillName = GetSkillStringFromID(index);
		String skillParent = BorSkill::GetSkillParent(skillName);
		String skillAltParent = BorSkill::GetSkillAltParent(skillName);

		int currentRank = BorSkill::GetRealSkillLevel(player, skillName);

		ManagedReference<SuiMessageBox*> suibox = new SuiMessageBox(player, SuiWindowType::TEACH_OFFER);
		if (BorSkill::CanTrainNextSkill(player, currentRank + 1, skillName, skillParent, skillAltParent)) {
			int xp = BorSkill::getFinalXpCost(player, "rp_"+skillName+"_"+BorSkill::GetSkillSuffixFromValue(currentRank+1));

			suibox->setPromptTitle("Confirm training?"); 
			//Can train!
			suibox->setPromptText("Are you sure you want to train this skill?\n\nThis will cost "+String::valueOf(xp)+" Roleplay experience.");
			suibox->setCallback(new TrainCommandSuiCallback(server, 4, index));
			suibox->setOkButton(true, "Confirm");
			suibox->setCancelButton(true, "Go Back");
		} else {
			suibox->setPromptTitle("Not eligible for training.");
			//Failure. Can't train.
			suibox->setPromptText("You are not currently eligible to train this skill. You do not have enough experience points.");
			suibox->setCallback(new TrainCommandSuiCallback(server, -1, state));
			suibox->setCancelButton(true, "Go Back");
		}	
		player->getPlayerObject()->addSuiBox(suibox);
		player->sendMessage(suibox->generateMessage());
	}

	void TrainAttribute(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args, int state, int selection) {
		String skillName = GetAttributeStringFromID(selection);
		BorSkill::trainAttribute(player, skillName);
	}

	void TrainSkill(CreatureObject* player, SuiBox* suiBox, uint32 eventIndex, Vector<UnicodeString>* args, int state, int selection) {
		String skillName = GetSkillStringFromID(selection);
		BorSkill::trainSkill(player, skillName);
	}
};

#endif /* TRAINCOMMANDSUICALLBACK_H_ */