#ifndef BORSTRING_H_
#define BORSTRING_H_

#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/managers/roleplay/RoleplayManager.h"
#include "engine/engine.h"

/*Class dealing with the manipulation and formatting of strings for output in system messages and broadcasts.*/
class BorString : public Logger {
public:
    /*Outputs the number coloured for natural min and max rolls, or uncoloured for all other rolls.*/
    static String rollColour(int result, int dieType, String colour = "\\#DBDBDB"){
        if (result == 1)
            return "\\#FF0000"+String::valueOf(result)+colour;
        else if (result == dieType)
            return "\\#00FF00"+String::valueOf(result)+colour;
        else 
            return String::valueOf(result);
    }

    /*Outputs a generic roll in the following format: ([count]d[type]: [result])*/
    static String rollSpam(int dieCount, int dieType, int result, String colour = "\\#DBDBDB"){
        return colour+"("+String::valueOf(dieCount)+"d"+String::valueOf(dieType)+": "+rollColour(result, dieType, colour);
    }

    /*Outputs a generic roll in the following format: ([count]d[type]: [result] vs DC: [dc])*/
    static String rollSpam(int dieCount, int dieType, int result, int dc, String colour = "\\#DBDBDB"){
        return colour+"(" + String::valueOf(dieCount) + "d" + String::valueOf(dieType) + ": " + rollColour(result, dieType, colour) + " vs DC: "+String::valueOf(dc)+")";
    }

    /*Outputs a skill roll in the following format: (1d20: [roll] + [bonus] = [result])*/
    static String skillSpam(int bonus, int roll, int result, String colour = "\\#DBDBDB"){
        return colour+"(1d20: "+ rollColour(roll, 20, colour) + " + "+ String::valueOf(bonus) + " = " + String::valueOf(result) + ")";
    }

    /*Outputs a skill roll in the following format: (1d20: [roll] + [bonus] = [result] vs DC: [dc])*/
    static String skillSpam(int bonus, int roll, int result, int dc, String colour = "\\#DBDBDB"){
        return colour+"(1d20: "+ rollColour(roll, 20, colour) + " + "+ String::valueOf(bonus) + " = " + String::valueOf(result) + " vs DC: "+String::valueOf(dc)+")";
    }

    /*Outputs a skill roll in the following format: (1d20: [roll] + [bonus] + [force] = [result] vs DC: [dc])*/
    static String skillSpam(int bonus, int roll, int force, int result, int dc, String colour = "\\#DBDBDB"){
        String output = colour+"(1d20: "+ rollColour(roll, 20, colour) + " + "+ String::valueOf(bonus);

        if (force > 0)
            output += " + \\#FF00FF"+String::valueOf(force)+colour;

        return output + " = " + String::valueOf(result) + " vs DC: "+String::valueOf(dc)+")";
    }

    /*Outputs a damage roll in the following format: [count]d[type]: [roll] + [bonus] = [result] damage*/
    static String damageSpam(int count, int type, int bonus, int roll, int result, String colour = "\\#FFFFFF"){
        return String::valueOf(count)+"d"+String::valueOf(type)+": "+String::valueOf(roll)+" + "+String::valueOf(bonus) +" = \\#FF9999"+String::valueOf(result)+colour+" damage";
    }

    /*Outputs the creature's first name, or full name if non-standard.*/
    static String getNiceName(CreatureObject* creature){
		String result = creature->getFirstName();
        RoleplayManager* rp = RoleplayManager::instance();

		if (rp->isNameExcluded(result.toLowerCase())){
			result = creature->getDisplayedName();
		}
		return result;
	}

    static String getNameTag(CreatureObject* creature, String color = "\\#00FFFF"){
        return "\\#FFFFFF[" + color + getNiceName(creature) + "\\#FFFFFF]";
    }

    static String capitalise(String input) {
		return input.subString(0, 1).toUpperCase() + input.subString(1, input.length());
	}
};

#endif