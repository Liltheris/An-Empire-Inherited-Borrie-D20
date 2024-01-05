#ifndef BORSTRING_H_
#define BORSTRING_H_

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
        return String::valueOf(count) + "d" + String::valueOf(type) + ": " + String::valueOf(roll) + " + " + String::valueOf(bonus) + " = " + String::valueOf(result) + " damage";
    }
};

#endif