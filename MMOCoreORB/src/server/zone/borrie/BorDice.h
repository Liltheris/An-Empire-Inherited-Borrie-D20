#ifndef BORDICE_H_
#define BORDICE_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/managers/creature/CreatureManager.h"
#include "server/zone/packets/chat/ChatSystemMessage.h"
#include "server/zone/borrie/BorrieRPG.h"
#include "server/zone/borrie/BorString.h"

//#include "templates/roleplay/RoleplayManager.h"

class BorDice : public Logger {
public:
	static bool GetCommandIsDie(String command) {
		if (GetDiceNum(command) == 0)
			return false;
		else if (GetDiceValue(command) == 0)
			return false;
		else
			return true;
	}

	static int GetDiceNum(String roll) {
		String sNumDice;
		StringTokenizer args(roll);
		args.setDelimeter("d");
		if (!args.hasMoreTokens())
			return 0;
		else {
			args.getStringToken(sNumDice);
			return Integer::valueOf(sNumDice);
		}
	}

	static int GetDiceValue(String roll) {
		String sDiceValue;
		StringTokenizer args(roll);
		args.setDelimeter("d");
		if (!args.hasMoreTokens())
			return 0;
		else {
			if (args.hasMoreTokens()) {
				args.getStringToken(sDiceValue);
				return Integer::valueOf(sDiceValue);
			} else
				return 0;
		}
	}

	static bool parseDiceString(String roll, int &number, int &type, int &bonus){
		StringTokenizer main(roll);
		main.setDelimeter("+");
		if (!main.hasMoreTokens())
			return false;
		
		//split our roll from our bonus.
		roll = main.getStringToken();

		// Set our roll bonus. No need to return false if we don't have a bonus though.
		bonus = 0;
		if (main.hasMoreTokens())
			bonus = main.getIntToken();

		StringTokenizer dice(roll);
		dice.setDelimeter("d");

		// Get the number of dice thrown.
		if (!dice.hasMoreTokens())
			return false;
		number = dice.getIntToken();

		// Get our dice type.
		if (!dice.hasMoreTokens())
			return false;
		type = dice.getIntToken();

		return true;
	}

	static String RollRPDie(CreatureObject* creature, String roll, int mod = 0) {
		int numDice, diceValue, bonus, nTempResult, nResult = 0;
		String sNumDice, sDiceValue, DiceRollString;

		if (!parseDiceString(roll, numDice, diceValue, bonus)){
			return "fail";
		}

		if (numDice > 10 || numDice < 1){
			creature->sendSystemMessage("You cannot roll more than 1 - 10 dice.");
			return "fail";
		}

		if (diceValue > 100 || diceValue < 2){
			creature->sendSystemMessage("Accepted die are d2 - 100");
			return "fail";
		}

		if (numDice > 1){
			for (int i = 0; i < numDice; i++){
				nTempResult = System::random(diceValue - 1) + 1;
				DiceRollString += BorString::rollColour(nTempResult, diceValue, "\\#FFFFFF");
				nResult += nTempResult;
				if (i == numDice - 1){
					DiceRollString += " = ";
					DiceRollString += String::valueOf(nResult);
				} else {
					DiceRollString += " + ";
				}
			}
		} else {
			nResult = System::random(diceValue - 1) + 1;
			DiceRollString += BorString::rollColour(nResult, diceValue, "\\#FFFFFF");
		}

		if (bonus != 0)
			return "Roll "+String::valueOf(numDice)+"d"+String::valueOf(diceValue)+": "+DiceRollString+" + Modifier: "+String::valueOf(bonus)+". Result: "+String::valueOf(nResult + bonus);
		else
			return "Roll "+String::valueOf(numDice)+"d"+String::valueOf(diceValue)+": "+DiceRollString+" Result: "+String::valueOf(nResult);
	}

	/*THIS FUNCTION IS DEPRECATED. USE BorDice::rollSkill() instead!*/
	static String RollSkill(CreatureObject* creature, String skillName) {
		int value = creature->getSkillMod("rp_" + skillName);
		int Roll = System::random(19) + 1;
		return BorrieRPG::Capitalize(skillName) + " check : 1d20 = " + BorString::rollColour(Roll, 20, "\\#FFFFFF") + " + Modifier: " + String::valueOf(value) +
			   ". Result: " + String::valueOf(value + Roll);
	}

	/*Rolls a skill normally, with advantage, or with disadvantage. Returns a roll string in the following formats: 
	[skillName] check : 1d20 = <roll> + Modifier: <modifier>. Result = <roll + modifier>
	[skillName] check : (Advantage!) 2d20 = <roll1>, <roll2>: <finalRoll> + Modifier: <modifier>. Result = <finalRoll + modifier>
	[skillName] check : (Disadvantage!) 2d20 = <roll1>, <roll2>: <finalRoll> + Modifier: <modifier>. Result = <finalRoll + modifier>
	*/
	static String rollSkill(CreatureObject* creature, String skillName, int advantage = 0){
		int value = creature->getSkillMod("rp_" + skillName);
		int roll1 = System::random(19) + 1;
		int roll2 = System::random(19) + 1;
		String output = BorString::capitalise(skillName) + " check : ";


		if (advantage > 0){
			//We're rolling with advantage! Happy us!
			output += "(Advantage!) 2d20 = "+BorString::rollColour(roll1, 20, "\\#FFFFFF")+", "+BorString::rollColour(roll2, 20, "\\#FFFFFF")+": ";
			int finalRoll = 0;
			if (roll1 > roll2)
				finalRoll = roll1;
			else
				finalRoll = roll2;
			
			output += String::valueOf(finalRoll);
		} else if (advantage < 0){
			//We're rolling with disadvantage. Oh no!
			output += "(Disadvantage!) 2d20 = "+BorString::rollColour(roll1, 20, "\\#FFFFFF")+", "+BorString::rollColour(roll2, 20, "\\#FFFFFF")+": ";
			int finalRoll = 0;
			if (roll1 < roll2)
				finalRoll = roll1;
			else
				finalRoll = roll2;
			
			output += String::valueOf(finalRoll);
		} else {
			//We're just rolling. This is fine.
			output += "1d20 = " + BorString::rollColour(roll1, 20, "\\#FFFFFF");
		}

		output += " + Modifier: "+String::valueOf(value)+". Result: " + String::valueOf(value + roll1);

		return output;
	}

	static int Roll(int dieCount, int dieType) {
		int total = 0;
		for(int i = 0;i<dieCount;i++) {
			int roll = System::random(dieType - 1) + 1;
			total += roll;
		}
		return total;
	}



	/*
	static String RollStat(CreatureObject* creature, String statName) {
		RPStatData* statData = RoleplayManager::instance()->getStatDataByEither(statName);
		String statValue = creature->getLocalData(statData->getName());
		if (statValue == "XXERRORXX")
			return "fail";
		int statNum = Integer::valueOf(statValue);
		if (statData->isAffectedByArmor()) {
			statNum - SovCharacter::GetArmorStatModifier(creature);
		}
		int Roll = System::random(19) + 1;
		return Sovereignty::Capitalize(statName) + " check: 1d20 = " + String::valueOf(Roll) + " + Modifier: " + String::valueOf(statNum) +
			   ". Result: " + String::valueOf(Roll + statNum);
	} */

};

#endif /*BORDICE_H_*/