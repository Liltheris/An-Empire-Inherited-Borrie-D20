/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef TRAINCOMMAND_H_
#define TRAINCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/creature/ai/AiAgent.h"

#include "server/zone/borrie/BorCharacter.h"
#include "server/zone/borrie/BorSkill.h"

#include "server/zone/objects/creature/sui/TrainCommandSuiCallback.h"

class TrainCommand : public QueueCommand {

public:
	TrainCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (!creature->isPlayerCreature())
			return GENERALERROR;

		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

		if (ghost == nullptr)
			return GENERALERROR;

		int adminLevelCheck = ghost->getAdminLevel();

		StringTokenizer args(arguments.toString());

		String skill;

		// Check if we have arguments for skill training, and train the attribute / skill if we can.
		if (args.hasMoreTokens()){
			args.getStringToken(skill);

			if (BorSkill::GetStringIsSkill(skill)){
				// 
				if (!BorSkill::GetStringIsForceSkill(skill)){
					TrainSkill(creature, skill);
				}
				return SUCCESS;

			} else if (BorSkill::GetStringIsAttribute(skill)){
				TrainAttribute(creature, skill);
				return SUCCESS;
			}
		}
		
		// Open a SUI box instead.
		try {
			int freeSkillPoints = creature->getStoredInt("starter_skill_points");
			int freeAttrPoints = creature->getStoredInt("starter_attr_points");
			ManagedReference<SuiListBox*> box = new SuiListBox(creature, SuiWindowType::JUKEBOX_SELECTION);
			box->setCallback(new TrainCommandSuiCallback(creature->getZoneServer(), 0, 0));
			box->setPromptTitle("Training Menu");
			if(freeSkillPoints > 0 || freeAttrPoints > 0) {
				box->setPromptText("What would you like to do?\n\nFree Attribute Boxes: " + String::valueOf(freeAttrPoints) + "\nFree Skill Boxes: " + String::valueOf(freeSkillPoints));
			} else box->setPromptText("What would you like to do?");			
			box->setCancelButton(true, "@cancel");
			box->setOkButton(false, "@");
			box->addMenuItem("Train an Attribute");
			box->addMenuItem("Train a Skill");
			//box->addMenuItem("Convert General Roleplay XP");
			creature->getPlayerObject()->addSuiBox(box);
			creature->sendMessage(box->generateMessage());
		} catch (Exception& e) {
			creature->sendSystemMessage("Error encountered when using train command.");
		}

		return SUCCESS;
	}

	void TrainAttribute(CreatureObject* player, String skill) const {
		int currentRank = BorSkill::GetRealSkillLevel(player, skill);
		if (BorSkill::CanTrainNextSkill(player, currentRank + 1, skill)) {
			//Train it
			SkillManager* skillManager = SkillManager::instance();
			int freePoints = player->getStoredInt("starter_attr_points");
			if(freePoints > 0) {
				player->setStoredInt("starter_attr_points", freePoints - 1);
				skillManager->awardSkill("rp_" + skill + "_" + BorSkill::GetSkillSuffixFromValue(currentRank + 1), player, true, false, true);
				player->sendSystemMessage("You've gained a point in " + skill + ". You have " + String::valueOf(freePoints - 1) + " remaining free attribute points.");
			} else {
				skillManager->awardSkill("rp_" + skill + "_" + BorSkill::GetSkillSuffixFromValue(currentRank + 1), player, true, false, false);
				player->sendSystemMessage("You've gained a point in " + skill + ".");
			}
		} else {
			//Something happened
			player->sendSystemMessage("ERROR: Something happened. You were eligible for the attribute you selected when you selected it, but you are no longer eligible.");
		}
	}

	void TrainSkill(CreatureObject* player, String skill) const {
		String skillParent = BorSkill::GetSkillParent(skill);
		String skillAltParent = BorSkill::GetSkillAltParent(skill);
		int currentRank = BorSkill::GetRealSkillLevel(player, skill);
		if (BorSkill::CanTrainNextSkill(player, currentRank + 1, skill, skillParent, skillAltParent)) {
			//Train it
			SkillManager* skillManager = SkillManager::instance();
			
			int freePoints = player->getStoredInt("starter_skill_points");
			if(freePoints > 0) {
				player->setStoredInt("starter_skill_points", freePoints - 1);
				skillManager->awardSkill("rp_" + skill + "_" + BorSkill::GetSkillSuffixFromValue(currentRank + 1), player, true, false, true);
				player->sendSystemMessage("You've gained a point in " + skill + "! You have " + String::valueOf(freePoints - 1) + " remaining free skill points.");
			} else {
				skillManager->awardSkill("rp_" + skill + "_" + BorSkill::GetSkillSuffixFromValue(currentRank + 1), player, true, false, false);
				player->sendSystemMessage("You've gained a point in " + skill + "!");
			}
		} else {
			//Something happened
			player->sendSystemMessage("ERROR: Something happened. You were eligible for the skill you selected when you selected it, but you are no longer eligible.");
		}
	}

};

#endif 
