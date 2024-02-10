#ifndef BORSTRING_H_
#define BORSTRING_H_

#include "server/zone/objects/creature/CreatureObject.h"
#include "engine/engine.h"

/*Class dealing with the manipulation and formatting of strings for output in system messages and broadcasts.*/
class BorString : public Logger {
public:
    /*Outputs a generic roll in the following format: ([count]d[type]: [result])*/
    static String rollSpam(int dieCount, int dieType, int result){
        return "(" + String::valueOf(dieCount) + "d" + String::valueOf(dieType) + ": " + String::valueOf(result) + ")";
    }

    /*Outputs a skill roll in the following format: (1d20: [roll] + [bonus] = [result])*/
    static String skillSpam(int bonus, int roll, int result){
        return "(1d20: "+ String::valueOf(roll) + " + "+ String::valueOf(bonus) + " = " + String::valueOf(result) + ")";
    }

    /*Outputs a damage roll in the following format: [count]d[type]: [roll] + [bonus] = [result] damage*/
    static String damageSpam(int count, int type, int bonus, int roll, int result){
        return String::valueOf(count)+"d"+String::valueOf(type)+": "+String::valueOf(roll)+" + "+String::valueOf(bonus) +" = \\#FF9999"+String::valueOf(result)+"\\#FFFFFF damage";
    }

    /*Outputs the creature's first name, or full name if non-standard.*/
    static String getNiceName(CreatureObject* creature){
		String result = creature->getFirstName();

		if (result == "a" || result == "an" || result == "the"){
			result = creature->getDisplayedName();
		}
		return result;
	}

    static String getNameTag(CreatureObject* creature, String color = "\\#00FFFF"){
        return "\\#.[" + color + getNiceName(creature) + "\\#.]";
    }
};

#endif