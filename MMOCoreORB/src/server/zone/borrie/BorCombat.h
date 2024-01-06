#ifndef BORCOMBAT_H_
#define BORCOMBAT_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/managers/creature/CreatureManager.h"
#include "server/zone/packets/chat/ChatSystemMessage.h"

#include "server/zone/borrie/BorrieRPG.h"
#include "server/zone/borrie/Utils/BorString.h"
#include "server/zone/borrie/BorCharacter.h"
#include "server/zone/borrie/BorDice.h"
#include "server/zone/borrie/BorEffect.h"

enum RpReactionStance {
    DEFEND = 1,
    PARRY = 2,
    DODGE = 3,
    LIGHTSABERDEFLECT = 4,
    FORCEDEFLECT = 5,
    FORCEABSORB = 6
};

class BorCombat : public Logger {
public:

    // TO DO: Reconsider mechanism for determining overall armour class.
    static int GetCharacterArmourClass(CreatureObject* creature){
        int output = 0;
        for(int i = 1; i > 10; i++){
            ManagedReference<ArmorObject*> armour = BorCharacter::GetArmorAtSlot(creature, GetSlotName(i));
            if(armour == nullptr)
                break;
            int rating = armour->getRating();
            if(rating > output)
                output = rating;
        }
        return output;
    }



    static void AttackTarget(CreatureObject* attacker, CreatureObject* defender, CreatureObject* commander, int bodyPartTarget, bool powerAttack, bool ignoreLOS = false) {
        ManagedReference<WeaponObject*> weapon = attacker->getWeapon();

        if(weapon->isBroken()) {
            commander->sendSystemMessage("Your weapon is broken, and you can't attack with a broken weapon.");
            return;
        }

        if(!ignoreLOS) {
            if (!CollisionManager::checkLineOfSight(attacker, defender)) {
                commander->sendSystemMessage("You don't have a direct line of sight of your target.");
                return;
            }
        }

        // Determine the to hit DC.
        int toHitDC = GetToHitModifier(attacker, defender, weapon) + 10;
        int aimMod = 0;
        bool aimed = false;

        // Aimed attack DC modifier.
        if(bodyPartTarget != -1) {
            // Modify the to Hit DC depending on the part being aimed at.
            // Chest is +2, Head and hands are +10, all other body parts are +5.
            if (bodyPartTarget == 10 || bodyPartTarget == 9)
                toHitDC += 10;
            else if (bodyPartTarget == 1)
                toHitDC += 2;
            else toHitDC += 5;
            aimed = true;
        }

        // Increase the DC by 5 if the attacker is power attacking with a melee weapon.
        if(powerAttack && (weapon->isMeleeWeapon() || weapon->isJediWeapon())){
            toHitDC += 5;
        }

        // Reduce the DC by 5 if the target is currently vulnerable.
        if(defender->getStoredInt("is_vulnerable") > 0){
            toHitDC -= 5;
            defender->setStoredInt("is_vulnerable", 0);
        }

        // Reduce the DC by 2 if the weapon is our own lightsaber.
        // NOTE: In the future this will be replaced for a check for an attuned crystal instead.
        if(weapon->isJediWeapon() && weapon->getCraftersName() == attacker->getFirstName()){
            toHitDC -= 2;
        }

        // Determine and apply the action cost of the attack, if any!
        // Power attack costs 3 action, aimed attack costs 1.
        if(powerAttack){
            DrainActionOrWill(attacker, 3);
        } else if (bodyPartTarget != -1){
            DrainActionOrWill(attacker, 1);
        }

        // Determine the attacker's roll.
        int skillCheck = 0;

        if(weapon->isJediWeapon()) skillCheck = attacker->getSkillMod("rp_lightsaber");
        else if(weapon->isUnarmedWeapon()) skillCheck = attacker->getSkillMod("rp_unarmed");
        else if(weapon->isMeleeWeapon()) skillCheck = attacker->getSkillMod("rp_melee");
        else if(weapon->isRangedWeapon()) skillCheck = attacker->getSkillMod("rp_ranged");

        int toHitRoll = BorDice::Roll(1, 20);

        int result = toHitRoll + skillCheck;

        // We hit if the roll result is greater than the DC or we nat 20. If we nat 1, we miss regardless. Melee weapons are excluded from the nat 20 hit.
        bool hasHit = (result >= toHitDC || (toHitRoll == 20 && weapon->isRangedWeapon())) && toHitRoll != 1;

        // Handling ammo.
        if (weapon->getAmmoPack() != "") {
            // Initialise ammo for new weapons.
			if(weapon->getStoredInt("ammo_used") < 0)
				weapon->setStoredInt("ammo_used", 0);
            
            int ammoUsed = weapon->getStoredInt("ammo_used");
            int maxAmmo = weapon->getMaxAmmo();
            //Check if we're out of ammo, or if we're power attacking that we have at least half the power pack left.
            if(ammoUsed >= maxAmmo || (powerAttack && ammoUsed >= maxAmmo/2)) {
                commander->sendSystemMessage("Your weapon does not have enough ammo! You will have to reload before attacking.");
                return;
            }

            //Remove ammo, emptying the ammo if power attacking, or removing 1 if normal attacking.
            if (powerAttack)
                weapon->setStoredInt("ammo_used", maxAmmo);
            else weapon->setStoredInt("ammo_used", ammoUsed + 1);
        }

        // Lightsaber self-hurt checks.
        if(weapon->isJediWeapon()){
            int lightsaberSkill = attacker->getSkillMod("rp_lightsaber");
            // Must beat a DC of 18 if we're unskilled with a lightsaber!
            if(lightsaberSkill == 0 && result < 18){
                defender = attacker;
                hasHit = true;
            }
            // Must beat a DC of 2 if we're below lightsaber III!
            if(lightsaberSkill < 3 && result < 2){
                defender = attacker;
                hasHit = true;
            }
        }

        // Generate part of the output spam, based on the kind of attack performed
        String attackVerb = powerAttack ? "power attacked" : "attacked";
        if(bodyPartTarget != -1) 
            attackVerb = "aimed at "+BorString::getNiceName(defender)+"'s "+GetSlotDisplayName(bodyPartTarget);
        else
            attackVerb += " " + BorString::getNiceName(defender);

        // Determine the bodypart we're hitting, if it was not already provided.
        if(bodyPartTarget == -1){
            bodyPartTarget = BorDice::Roll(1, 10);
        }

        // Set the attacker vulnerable if they're power attacking with a non-ranged weapon.
        if(powerAttack && !weapon->isRangedWeapon()){
            // 2 stacks, since we will reduce it by 1 on every endturn.
            attacker->setStoredInt("is_vulnerable", 2);
        }

        // Determine damage dealt.
        // We need to do this even if we miss, as ranged weapons reduce condition based on it if power attacking.
        int damageDieCount = weapon->getMinDamage();
        int damageDieType = weapon->getMaxDamage();

        if(powerAttack)
            damageDieCount++;

        int bonusDamage = weapon->getBonusDamage();

        if(weapon->isJediWeapon()) {
            bonusDamage += attacker->getSkillMod("rp_lightsaber");
        }

        int totalDamage = GetDamageRoll(damageDieType, damageDieCount, bonusDamage);

        // Handle missing!
        if(!hasHit){
            BorrieRPG::BroadcastMessage(attacker, BorString::getNiceName(attacker) + " "+attackVerb+ " and missed!  \\#DBDBDB" + rollSpam(toHitRoll, skillCheck, toHitDC) + "\\#FFFFFF");
            BorEffect::PerformReactiveAnimation(defender, attacker, "miss", GetSlotHitlocation(bodyPartTarget), true);

            // Ranged weapons are damaged even if we miss!
            if(weapon->isRangedWeapon()){
                int conditionDamage = 1;
                if(powerAttack)
                    conditionDamage = totalDamage;
                
                weapon->setConditionDamage(weapon->getConditionDamage() + conditionDamage);
            }
            return;
        }

        // Special self-hit handling.
        if (attacker == defender && weapon->isJediWeapon()){
            BorEffect::PerformReactiveAnimation(attacker, attacker, "hit", GetSlotHitlocation(BorDice::Roll(1, 10)), true);
            BorrieRPG::BroadcastMessage(attacker, BorString::getNiceName(attacker) + " accidently hurts themselves with the lightsaber, doing "+String::valueOf(totalDamage)+" damage!");
            BorCharacter::ModPool(attacker, "health", totalDamage * -1, true);
            return;
        }

        // Handle hitting!
        bool criticalHit = false;

        if (bodyPartTarget == 10) {
            totalDamage =  totalDamage * 1.5;
            criticalHit = true;
        }

        //Calculate the Reaction
        String reactionResult = HandleCombatReaction(attacker, defender, totalDamage, toHitRoll + skillCheck, bodyPartTarget, powerAttack, false);

        String toHitString = "\\#DBDBDB" + rollSpam(toHitRoll, skillCheck, toHitDC) + "\\#FFFFFF";
        String combatSpam = "";

        if (criticalHit){
            combatSpam = BorString::getNiceName(attacker) + " "+attackVerb+ " and critically hit!";
        } else {
            combatSpam = BorString::getNiceName(attacker) + " "+attackVerb+ " and hit!";
        }

        if(ignoreLOS) {
            BorrieRPG::BroadcastMessage(attacker, combatSpam + " " + toHitString +  reactionResult + " (Line of Sight Ignored)");
        } else {
            BorrieRPG::BroadcastMessage(attacker, combatSpam + " " + toHitString +  reactionResult);
        }

        //Finally, determine damage done to the used weapon.
        //Ranged weapons take 1 condition damage per attack, or the total attack damage if power attacking.
        int conditionDamage = 1;

        if(weapon->isRangedWeapon() && powerAttack)
        {
            conditionDamage = totalDamage;
        // Melee weapons take the damage as condition damage, 2x if power attacking
        } else if(weapon->isMeleeWeapon() || weapon->isUnarmedWeapon()){
            conditionDamage = totalDamage;

            if(powerAttack)
                conditionDamage = conditionDamage * 2;
        }
        // Apply the damage.
        weapon->setConditionDamage(weapon->getConditionDamage() + conditionDamage);
    }

    /*
    /////////////////////////////////////////////////////////////////
    // Old Implementation
    /////////////////////////////////////////////////////////////////
	static void AttackTarget(CreatureObject* attacker, CreatureObject* defender, CreatureObject* commander, int bodyPartTarget, bool powerAttack, bool ignoreLOS = false) {
        ManagedReference<WeaponObject*> weapon = attacker->getWeapon();
        if(weapon->isBroken()) {
            commander->sendSystemMessage("Your weapon is broken, and you can't attack with a broken weapon.");
            return;
        }

        if(!ignoreLOS) {
            if (!CollisionManager::checkLineOfSight(attacker, defender)) {
                commander->sendSystemMessage("You don't have a direct line of sight of your target.");
                return;
            }
        }
        

        String attackVerb = powerAttack ? "power attacked" : "attacked";
        if(bodyPartTarget != -1) 
            attackVerb = "aimed at "+defender->getFirstName()+"'s "+GetSlotDisplayName(bodyPartTarget);
        else
            attackVerb += " " + defender->getFirstName();

        //To Hit
        int toHitDC = GetToHitModifier(attacker, defender, weapon) + 10;
        int aimMod = 0;
        bool aimed = false;
        if(bodyPartTarget != -1) { //A Body Part was specified.
            // Modify the to Hit DC depending on the part being aimed at.
            // Chest is +2, Head and hands are +10, all other body parts are +5.
            if (bodyPartTarget == 10 || bodyPartTarget == 9)
                toHitDC += 10;
            else if (bodyPartTarget == 1)
                toHitDC += 2;
            else toHitDC += 5;
            aimed = true;
            DrainActionOrWill(attacker, 1);
        }

        int skillCheck = 0;

        if(weapon->isJediWeapon()) skillCheck = attacker->getSkillMod("rp_lightsaber");
        else if(weapon->isUnarmedWeapon()) skillCheck = attacker->getSkillMod("rp_unarmed");
        else if(weapon->isMeleeWeapon()) skillCheck = attacker->getSkillMod("rp_melee");
        else if(weapon->isRangedWeapon()) skillCheck = attacker->getSkillMod("rp_ranged");

        int toHitRoll = BorDice::Roll(1, 20);

        //Dealing with ammo
        if (weapon->getAmmoPack() != "") {
            int ammoUsed = weapon->getStoredInt("ammo_used");
            int maxAmmo = weapon->getMaxAmmo();
            //Check if we're out of ammo, or if we're power attacking that we have at least half the power pack left.
            if(ammoUsed >= maxAmmo || (powerAttack && ammoUsed >= maxAmmo/2)) {
                commander->sendSystemMessage("Your weapon does not have enough ammo! You will have to reload before attacking.");
                return;
            }

            //Remove ammo, emptying the ammo if power attacking, or removing 1 if normal attacking.
            if (powerAttack)
                weapon->setStoredInt("ammo_used", maxAmmo);
            else weapon->setStoredInt("ammo_used", ammoUsed + 1);
        }

        //Lightsaber Hurt self check.
        if(weapon->isJediWeapon()) {
            //Modify toHitDC if its our lightsaber.
            if(weapon->getCraftersName() == attacker->getFirstName()) {
                toHitDC -= 2;
                if(toHitDC < 0)
                    toHitDC = 0;
            }

            bool selfHit = false;
            int saberSkill = attacker->getSkillMod("rp_lightsaber");
            if(saberSkill == 0) {
                if(toHitRoll < 18) {
                    //Ouch
                    selfHit = true;
                    
                } 
            } else if(saberSkill < 3) {
                if(toHitRoll == 1) {
                    selfHit = true;
                }
            }

            if(selfHit) {
                BorEffect::PerformReactiveAnimation(attacker, attacker, "hit", GetSlotHitlocation(BorDice::Roll(1, 10)), true);
                int totalDamage = GetDamageRoll(weapon->getMaxDamage(), weapon->getMinDamage(), weapon->getBonusDamage());
                BorrieRPG::BroadcastMessage(attacker, attacker->getFirstName() + " accidently hurts themselves with the lightsaber, doing "+String::valueOf(totalDamage)+" damage!");
                BorCharacter::ModPool(attacker, "health", totalDamage * -1, true);       
                return;
            }
        }

        //Always Miss on a nat 1.
        if(toHitRoll == 1) {
            BorrieRPG::BroadcastMessage(attacker, attacker->getFirstName() + " "+attackVerb+ " and missed!  \\#DBDBDB" + rollSpam(toHitRoll, skillCheck, toHitDC) + "\\#FFFFFF");
            BorEffect::PerformReactiveAnimation(defender, attacker, "miss", GetSlotHitlocation(bodyPartTarget), true);
            return;
        }

        if(powerAttack) {
            //Power attacks no longer have scaling action costs.
            int powerAttackCost = attacker->getStoredInt("power_attack_count");
            attacker->setStoredInt("power_attack_count", powerAttackCost + 1);
            DrainActionOrWill(attacker, 3 + powerAttackCost); //Changed to 3 from 1 as per rebalancing, 3/8/2023
            if(toHitRoll + skillCheck + (15 - skillCheck) < toHitDC) {
                //Miss
                BorrieRPG::BroadcastMessage(attacker, attacker->getFirstName() + " "+attackVerb+ " and missed!  \\#DBDBDB" + rollSpam(toHitRoll, skillCheck, toHitDC) + "\\#FFFFFF"); 
                BorEffect::PerformReactiveAnimation(defender, attacker, "miss", GetSlotHitlocation(bodyPartTarget), true);
                return;
            } 
        }

        if(toHitRoll + skillCheck >= toHitDC || (toHitRoll == 20 && !(weapon->isMeleeWeapon() || weapon->isJediWeapon()))) {
            if(bodyPartTarget == -1) {
                //Get a random body part.
                bodyPartTarget = BorDice::Roll(1, 10);
            }
        } else {
            //Miss
            BorrieRPG::BroadcastMessage(attacker, attacker->getFirstName() + " "+attackVerb+ " and missed! \\#DBDBDB" + rollSpam(toHitRoll, skillCheck, toHitDC) + "\\#FFFFFF");
            BorEffect::PerformReactiveAnimation(defender, attacker, "miss", GetSlotHitlocation(bodyPartTarget), true);
            return;
        }

        

        //We've hit! Calculate Damage and apply it to the body part. Get the armor of that part. 
        int damageDieCount = weapon->getMinDamage();
        int damageDieType = weapon->getMaxDamage();

        if(powerAttack)
            damageDieCount++;

        int bonusDamage = weapon->getBonusDamage();

        if(weapon->isJediWeapon()) {
            bonusDamage += attacker->getSkillMod("rp_lightsaber");
        }

        int totalDamage = GetDamageRoll(damageDieType, damageDieCount, bonusDamage);

        bool criticalHit = false;

        if (bodyPartTarget == 10) {
            totalDamage =  totalDamage * 1.5;
            criticalHit = true;
        }
        //Calculate the Reaction

        String reactionResult = HandleCombatReaction(attacker, defender, totalDamage, toHitRoll + skillCheck, bodyPartTarget, powerAttack, false);
        
        //Apply Followup as per the reaction.
        String toHitString = "\\#DBDBDB" + rollSpam(toHitRoll, skillCheck, toHitDC) + "\\#FFFFFF";

        String combatSpam = "";

        if (criticalHit){
            combatSpam = attacker->getFirstName() + " "+attackVerb+ " and critically hit!";
        } else {
            combatSpam = attacker->getFirstName() + " "+attackVerb+ " and hit!";
        }
        
        
        if(ignoreLOS) {
            BorrieRPG::BroadcastMessage(attacker, combatSpam + " " + toHitString +  reactionResult + " (Line of Sight Ignored)");
        } else {
            BorrieRPG::BroadcastMessage(attacker, combatSpam + " " + toHitString +  reactionResult);
        }
        
	}*/

    //TO DO: When full refactor is done, this either needs to be folded into the main attack command, or sections of the attack command need to be compartmentalised into functions, to be reused here.
    static void FlurryAttackTarget(CreatureObject* attacker, CreatureObject* defender, CreatureObject* commander, bool ignoreLOS = false) {
        ManagedReference<WeaponObject*> weapon = attacker->getWeapon();
        if(weapon->isBroken()) {
            commander->sendSystemMessage("Your weapon is broken, and you can't attack with a broken weapon.");
            return;
        }

        if(!ignoreLOS) {
            if (!CollisionManager::checkLineOfSight(attacker, defender)) {
                commander->sendSystemMessage("You don't have a direct line of sight of your target.");
                return;
            }
        }

        // Apply the action cost.
        DrainActionOrWill(attacker, 1);

        // Determine the to hit DC.
        int toHitDC = GetToHitModifier(attacker, defender, weapon) + 10;
        int aimMod = 0;
        bool aimed = false;

        // Reduce the DC by 5 if the target is currently vulnerable.
        if(defender->getStoredInt("is_vulnerable") > 0){
            toHitDC -= 5;
            defender->setStoredInt("is_vulnerable", 0);
        }

        // Reduce the DC by 2 if the weapon is our own lightsaber.
        // NOTE: In the future this will be replaced for a check for an attuned crystal instead.
        if(weapon->isJediWeapon() && weapon->getCraftersName() == attacker->getFirstName()){
            toHitDC -= 2;
        }

        // Determine the attacker's rolls.
        int skillCheck = 0;

        if(weapon->isJediWeapon()) skillCheck = attacker->getSkillMod("rp_lightsaber");
        else if(weapon->isUnarmedWeapon()) skillCheck = attacker->getSkillMod("rp_unarmed");
        else if(weapon->isMeleeWeapon()) skillCheck = attacker->getSkillMod("rp_melee");
        else if(weapon->isRangedWeapon()) skillCheck = attacker->getSkillMod("rp_ranged");

        int roll1 = BorDice::Roll(1, 20);
        int roll2 = BorDice::Roll(1, 20);
        int roll3 = BorDice::Roll(1, 20);

        int result1 = roll1 + skillCheck;
        int result2 = roll2 + skillCheck;
        int result3 = roll3 + skillCheck;

        // We hit if the roll result is greater than the DC or we nat 20. If we nat 1, we miss regardless. Melee weapons are excluded from the nat 20 hit.
        bool hit1 = (result1 >= toHitDC || (roll1 == 20 && weapon->isRangedWeapon())) && roll1 != 1;
        bool hit2 = (result2 >= toHitDC +5 || (roll2 == 20 && weapon->isRangedWeapon())) && roll2 != 1;
        bool hit3 = (result3 >= toHitDC +10 || (roll3 == 20 && weapon->isRangedWeapon())) && roll3 != 1;

        int lowestResult = std::min(std::min(result1, result2), result3);

        // Handling ammo
        if (weapon->getAmmoPack() != "") {
            // Initialise ammo for new weapons.
			if(weapon->getStoredInt("ammo_used") < 0)
				weapon->setStoredInt("ammo_used", 0);

            int ammoUsed = weapon->getStoredInt("ammo_used");
            int maxAmmo = weapon->getMaxAmmo();
            //Check if we're out of ammo, or if we're power attacking that we have at least half the power pack left.
            if(ammoUsed + 2 >= maxAmmo) {
                commander->sendSystemMessage("Your weapon does not have enough ammo! You will have to reload before flurry attacking!");
                return;
            }

            //Remove ammo, emptying the ammo if power attacking, or removing 1 if normal attacking.
            weapon->setStoredInt("ammo_used", ammoUsed + 3);
        }

        // Lightsaber self-hurt checks.
        bool hasSelfHit = false;

        if(weapon->isJediWeapon()){
            int lightsaberSkill = attacker->getSkillMod("rp_lightsaber");
            // Must beat a DC of 18 if we're unskilled with a lightsaber!
            if(lightsaberSkill == 0 && lowestResult < 18){
                defender = attacker;
                hasSelfHit = true;
            }
            // Must beat a DC of 2 if we're below lightsaber III!
            if(lightsaberSkill < 3 && lowestResult < 2){
                defender = attacker;
                hasSelfHit = true;
            }
        }

        //Absolute Miss
        if(!hit1 && !hit2 && !hit3) {
            BorrieRPG::BroadcastMessage(attacker, BorString::getNiceName(attacker) + " flurry attacked " +  BorString::getNiceName(defender) + " and missed! \\#DBDBDB" + GenerateFlurryOutputSpam(roll1, roll2, roll3, skillCheck, toHitDC) + "\\#FFFFFF");
            BorEffect::PerformReactiveAnimation(defender, attacker, "miss", GetSlotHitlocation(BorDice::Roll(1, 10)), true);
            BorEffect::PerformReactiveAnimation(defender, attacker, "miss", GetSlotHitlocation(BorDice::Roll(1, 10)), true);
            BorEffect::PerformReactiveAnimation(defender, attacker, "miss", GetSlotHitlocation(BorDice::Roll(1, 10)), true);

            //Ranged weapons take damage even if missing.
            if(weapon->isRangedWeapon()){
                weapon->setConditionDamage(weapon->getConditionDamage() + 3);
            }
            return;
        }
        
        int damageDieCount = weapon->getMinDamage();
        int damageDieType = weapon->getMaxDamage();
        int bonusDamage = weapon->getBonusDamage();

        if(weapon->isJediWeapon()) {
            bonusDamage += attacker->getSkillMod("rp_lightsaber");
        }

        int damage1 = GetDamageRoll(damageDieType, damageDieCount, bonusDamage) / 2;
        int damage2 = GetDamageRoll(damageDieType, damageDieCount, bonusDamage) / 2;
        int damage3 = GetDamageRoll(damageDieType, damageDieCount, bonusDamage) / 2;

        int totalDamage = 0;
        if(hit1) totalDamage += damage1;
        if(hit2) totalDamage += damage2;
        if(hit3) totalDamage += damage3;

        if(totalDamage < 1) totalDamage = 1;

        int hitCount = 0;
        if(hit1) hitCount++;
        if(hit2) hitCount++;
        if(hit3) hitCount++;

        int highestRoll = roll1;
        if(roll2 > highestRoll) highestRoll = roll2;
        if(roll3 > highestRoll) highestRoll = roll3; 

        String reactionResult = HandleCombatReaction(attacker, defender, totalDamage, highestRoll + skillCheck, BorDice::Roll(1, 10), false, true);

        //Apply Followup as per the reaction.
        String toHitString = "\\#DBDBDB" + GenerateFlurryOutputSpam(roll1, roll2, roll3, skillCheck, toHitDC) + "\\#FFFFFF";

        String combatSpam = BorString::getNiceName(attacker) + " flurry attacked " +  BorString::getNiceName(defender);
        
        if(hitCount == 1) {
            combatSpam += " and hit once!";
        } else {
            combatSpam += " and hit " + String::valueOf(hitCount) + " times!";
        }


        if(ignoreLOS) {
            BorrieRPG::BroadcastMessage(attacker, combatSpam + " " + toHitString +  reactionResult + " (Line of Sight Ignored)");
        } else {
            BorrieRPG::BroadcastMessage(attacker, combatSpam + " " + toHitString +  reactionResult);
        }

        //Condition stuff.
        doFlurryConditionChange(attacker, damage1, hit1);
        doFlurryConditionChange(attacker, damage2, hit2);
        doFlurryConditionChange(attacker, damage3, hit3);
    }

    static void doFlurryConditionChange(CreatureObject* attacker, int damage, bool hasHit){
        ManagedReference<WeaponObject*> weapon = attacker->getWeapon();

        if(hasHit){
            // Handle weapon condition.
            if(weapon->isRangedWeapon()){
                // Ranged weapons take 1 condition damage per attack.
                weapon->setConditionDamage(weapon->getConditionDamage() + 1);
            } else {
                // Melee weapons take weapon damage as condition damage.
                weapon->setConditionDamage(weapon->getConditionDamage() + damage);
            }
        } else {
            if(weapon->isRangedWeapon()){
                weapon->setConditionDamage(weapon->getConditionDamage() + 1);
            }
        }
    }
    /*
    /////////////////////////////////////////////////////////////////
    // Old Implementation
    /////////////////////////////////////////////////////////////////
    static void FlurryAttackTarget(CreatureObject* attacker, CreatureObject* defender, CreatureObject* commander, bool ignoreLOS = false) {
        ManagedReference<WeaponObject*> weapon = attacker->getWeapon();
        if(weapon->isBroken()) {
            commander->sendSystemMessage("Your weapon is broken, and you can't attack with a broken weapon.");
            return;
        }

        if(!ignoreLOS) {
            if (!CollisionManager::checkLineOfSight(attacker, defender)) {
                commander->sendSystemMessage("You don't have a direct line of sight of your target.");
                return;
            }
        }
        
        //Dealing with ammo
        if (weapon->getAmmoPack() != "") {
            int ammoUsed = weapon->getStoredInt("ammo_used");
            int maxAmmo = weapon->getMaxAmmo();
            //Check if we're out of ammo, or if we're power attacking that we have at least half the power pack left.
            if(ammoUsed + 2 >= maxAmmo) {
                commander->sendSystemMessage("Your does not have enough ammo! You will have to reload before flurry attacking!");
                return;
            }

            //Remove ammo, emptying the ammo if power attacking, or removing 1 if normal attacking.
            weapon->setStoredInt("ammo_used", ammoUsed + 3);
        }

        //Dark Rebellion Rulebook Edition I, on Flurry Attack
        Instead of simply one attack, you’ll roll three to-hit to determine three different attacks, each providing half damage if they succeed. 
        If the target is using a combat stance that uses action points, they’ll have to spend twice as many action points to counter your attack, 
        though they’ll only need to defeat your highest to-hit roll in order to counter all three attacks. 

        int toHitDC = GetToHitModifier(attacker, defender, weapon) + 10;
        int roll1 = BorDice::Roll(1, 20); 
        int roll2 = BorDice::Roll(1, 20); 
        int roll3 = BorDice::Roll(1, 20); 

        int lowestRoll = std::min(std::min(roll1, roll2), roll3);

        int skillCheck = 0;
        if(weapon->isJediWeapon()) skillCheck = attacker->getSkillMod("rp_lightsaber");
        else if(weapon->isUnarmedWeapon()) skillCheck = attacker->getSkillMod("rp_unarmed");
        else if(weapon->isMeleeWeapon()) skillCheck = attacker->getSkillMod("rp_melee");
        else if(weapon->isRangedWeapon()) skillCheck = attacker->getSkillMod("rp_ranged");
        

        //Lightsaber Hurt self check.
        if(weapon->isJediWeapon()) {
            //Modify toHitDC if its our lightsaber.
            if(weapon->getCraftersName() == attacker->getFirstName()) {
                toHitDC -= 2;
                if(toHitDC < 0)
                    toHitDC = 0;
            }
            
            bool selfHit = false;
            int saberSkill = attacker->getSkillMod("rp_lightsaber");
            if(saberSkill == 0) {
                if(lowestRoll < 18) {
                    //Ouch
                    selfHit = true;
                    
                } 
            } else if(saberSkill < 3) {
                if(lowestRoll == 1) {
                    selfHit = true;
                }
            }

            if(selfHit) {
                BorEffect::PerformReactiveAnimation(attacker, attacker, "hit", GetSlotHitlocation(BorDice::Roll(1, 10)), true);
                int totalDamage = GetDamageRoll(weapon->getMaxDamage(), weapon->getMinDamage(), weapon->getBonusDamage());
                BorrieRPG::BroadcastMessage(attacker, attacker->getFirstName() + " accidently hurts themselves with the lightsaber, doing "+String::valueOf(totalDamage)+" damage!");
                BorCharacter::ModPool(attacker, "health", totalDamage * -1, true);       
                return;
            }
        }

        bool hit1 = roll1 + skillCheck >= toHitDC;
        bool hit2 = roll2 + skillCheck >= toHitDC + 5;
        bool hit3 = roll3 + skillCheck >= toHitDC + 10;

        DrainActionOrWill(attacker, 1);

        //Absolute Miss
        if(!hit1 && !hit2 && !hit3) {
            BorrieRPG::BroadcastMessage(attacker, attacker->getFirstName() + " flurry attacked " +  defender->getFirstName() + " and missed! \\#DBDBDB" + GenerateFlurryOutputSpam(roll1, roll2, roll3, skillCheck, toHitDC) + "\\#FFFFFF");
            BorEffect::PerformReactiveAnimation(defender, attacker, "miss", GetSlotHitlocation(BorDice::Roll(1, 10)), true);
            BorEffect::PerformReactiveAnimation(defender, attacker, "miss", GetSlotHitlocation(BorDice::Roll(1, 10)), true);
            BorEffect::PerformReactiveAnimation(defender, attacker, "miss", GetSlotHitlocation(BorDice::Roll(1, 10)), true);
            return;
        }

        int damageDieCount = weapon->getMinDamage();
        int damageDieType = weapon->getMaxDamage();
        int bonusDamage = weapon->getBonusDamage();

        if(weapon->isJediWeapon()) {
            bonusDamage += attacker->getSkillMod("rp_lightsaber");
        }

        int damage1 = GetDamageRoll(damageDieType, damageDieCount, bonusDamage) / 2;
        int damage2 = GetDamageRoll(damageDieType, damageDieCount, bonusDamage) / 2;
        int damage3 = GetDamageRoll(damageDieType, damageDieCount, bonusDamage) / 2;

        int totalDamage = 0;
        if(hit1) totalDamage += damage1;
        if(hit2) totalDamage += damage2;
        if(hit3) totalDamage += damage3;

        if(totalDamage < 1) totalDamage = 1;

        int hitCount = 0;
        if(hit1) hitCount++;
        if(hit2) hitCount++;
        if(hit3) hitCount++;

        int highestRoll = roll1;
        if(roll2 > highestRoll) highestRoll = roll2;
        if(roll3 > highestRoll) highestRoll = roll3; 

        String reactionResult = HandleCombatReaction(attacker, defender, totalDamage, highestRoll + skillCheck, BorDice::Roll(1, 10), false, true);

        //Apply Followup as per the reaction.
        String toHitString = "\\#DBDBDB" + GenerateFlurryOutputSpam(roll1, roll2, roll3, skillCheck, toHitDC) + "\\#FFFFFF";

        String combatSpam = attacker->getFirstName() + " flurry attacked " +  defender->getFirstName();
        
        if(hitCount == 1) {
            combatSpam += " and hit once!";
        } else {
            combatSpam += " and hit " + String::valueOf(hitCount) + " times!";
        }


        if(ignoreLOS) {
            BorrieRPG::BroadcastMessage(attacker, combatSpam + " " + toHitString +  reactionResult + " (Line of Sight Ignored)");
        } else {
            BorrieRPG::BroadcastMessage(attacker, combatSpam + " " + toHitString +  reactionResult);
        }
        
    }*/

    static int GetDamageRoll(int dieType, int dieCount, int bonusDamage) {
        int totalDamage = bonusDamage;
        for(int i = 0;i<dieCount;i++) {
            totalDamage += BorDice::Roll(1, dieType);
        }

        return totalDamage;
    }

    static String rollSpam(int roll, int skillMod) {
        return "(1d20: " + String::valueOf(roll) + " + " + String::valueOf(skillMod) + ") = " + String::valueOf(roll + skillMod);
    }

    static String rollSpam(int roll, int skillMod, int diceCheck) {
        return "(1d20: " + String::valueOf(roll) + " + " + String::valueOf(skillMod) + ") = " + String::valueOf(roll + skillMod) + " vs. DC: " + String::valueOf(diceCheck) + " ";
    }

    static String damageNumber(int damage) {
        return "\\#FF9999" + String::valueOf(damage) + "\\#FFFFFF";
    }

    static String damageNumber(int damage, String colourCode) {
        return "\\#FF9999" + String::valueOf(damage) + colourCode;
    }

    static String GenerateFlurryOutputSpam(int roll1, int roll2, int roll3, int skillMod, int diceCheck) {
        String result = "(3d20: "+ String::valueOf(roll1) + ", ";
        result += String::valueOf(roll2) + ", ";
        result += String::valueOf(roll3) + " ";
        result += "+ " + String::valueOf(skillMod) + ") vs. DC: " + String::valueOf(diceCheck) + ", " + String::valueOf(diceCheck+5)+", " + String::valueOf(diceCheck+10) +" ) "; 
        return result;
    }

    static String DoDefendReaction(CreatureObject* attacker, CreatureObject* defender, int incomingDamage, int toHit, int slot, int actionPointMod) {
        WeaponObject* attackerWeapon = attacker->getWeapon();
        WeaponObject* defenderWeapon = defender->getWeapon();
        
        String reactionSpam = "";

        int defenseRoll = BorDice::Roll(1, 20);
        int defenseSkill = defender->getSkillMod("rp_defending");

        int rollResult = defenseRoll + defenseSkill;

        DrainActionOrWill(defender, 1 * actionPointMod);

        if(rollResult > toHit) {
            // Success!
            reactionSpam += BorString::getNiceName(defender) + " successfully defends against the attack ("+ rollSpam(defenseRoll, defenseSkill, toHit) +") ";
            if (defenderWeapon->isUnarmedWeapon()){
                // Oh no.
                reactionSpam += ", however, they're unarmed, taking " + damageNumber(incomingDamage) + "damage to their hands!";

                BorEffect::PerformReactiveAnimation(defender, attacker, "defend", GetSlotHitlocation(9), true);
                ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, 9);

            } else if (defenderWeapon->isJediWeapon() && !attackerWeapon->isJediWeapon()) {
                // We've successfully defended!
                reactionSpam += ", destroying "+ BorString::getNiceName(attacker) +"'s weapon in the process!";
                attackerWeapon->setConditionDamage(attackerWeapon->getMaxCondition());

                BorEffect::PerformReactiveAnimation(defender, attacker, "defend", GetSlotHitlocation(9), true);
            
            } else if (!defenderWeapon->isJediWeapon() && attackerWeapon->isJediWeapon()) {
                // We've defended successfully, but there's not much we can do against a lightsaber.
                reactionSpam += ", destroying "+ BorString::getNiceName(defender) +"'s weapon in the process!";
                defenderWeapon->setConditionDamage(defenderWeapon->getMaxCondition());
                BorEffect::PerformReactiveAnimation(defender, attacker, "defend", GetSlotHitlocation(9), true);
                
            } else {
                // We've successfully defended, and nobody's weapon was destroyed in the process!
                if (defenderWeapon->isJediWeapon()){
                    BorEffect::PerformReactiveAnimation(defender, attacker, "defend", GetSlotHitlocation(slot), true);
                } else {
                    // Damage our weapon!
                    reactionSpam += ", absorbing "+ damageNumber(incomingDamage) +" damage into their weapon.";
                    BorEffect::PerformReactiveAnimation(defender, attacker, "defend", GetSlotHitlocation(slot), true);
                    defenderWeapon->setConditionDamage(defenderWeapon->getConditionDamage() + incomingDamage);
                }
            }
        } else {
            // Failure!
            reactionSpam += BorString::getNiceName(defender) + " tries to defend against the attack, but fails ("+ rollSpam(defenseRoll, defenseSkill, toHit) +") ";
            reactionSpam += ", taking "+ damageNumber(incomingDamage) +" damage.";
            BorEffect::PerformReactiveAnimation(defender, attacker, "defend", GetSlotHitlocation(slot), false);
            ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, slot);
        }
        return reactionSpam;
    }

    static String DoParryReaction(CreatureObject* attacker, CreatureObject* defender, int incomingDamage, int toHit, int slot, int actionPointMod) {
        WeaponObject* attackerWeapon = attacker->getWeapon();
        WeaponObject* defenderWeapon = defender->getWeapon();
        
        String reactionSpam = "";

        int meleeRoll = BorDice::Roll(1, 20);
        int meleeSkill = 0;

        if(defenderWeapon->isJediWeapon()) 
            meleeSkill = defender->getSkillMod("rp_lightsaber");
        else if(defenderWeapon->isUnarmedWeapon()) 
            meleeSkill = defender->getSkillMod("rp_unarmed");
        else  
            meleeSkill = defender->getSkillMod("rp_melee");
        
        int rollResult = meleeRoll + meleeSkill;

        DrainActionOrWill(defender, 3 * actionPointMod);

        if(rollResult >= toHit) {
            //Successful Parry
            int returnDamage = incomingDamage / 2;
            ApplyAdjustedHealthDamage(attacker, defenderWeapon, returnDamage, slot);
            BorEffect::PerformReactiveAnimation(defender, attacker, "parry", GetSlotHitlocation(slot), true);
            reactionSpam += ", but " + BorString::getNiceName(defender)+" parries the attack (" + rollSpam(meleeRoll, meleeSkill, toHit) +"), striking back for "+ damageNumber(returnDamage) +" damage!";
        } else {
            //Unsuccessful Parry
            ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, slot);
            BorEffect::PerformReactiveAnimation(defender, attacker, "parry", GetSlotHitlocation(slot), false);
            reactionSpam += ". " + BorString::getNiceName(defender) + " tries to parry the attack, but fails (" + rollSpam(meleeRoll, meleeSkill, toHit) +"), recieving "+ damageNumber(incomingDamage) +" damage!"; 
        }
        return reactionSpam;
    }

    static String DoDodgeReaction(CreatureObject* attacker, CreatureObject* defender, int incomingDamage, int toHit, int slot, int actionPointMod) {
        WeaponObject* attackerWeapon = attacker->getWeapon();
        WeaponObject* defenderWeapon = defender->getWeapon();
        
        String reactionSpam = "";

        int maneuverabilitySkill = defender->getSkillMod("rp_maneuverability");
        int dodgeRoll = BorDice::Roll(1, 20);
        
        int rollResult = dodgeRoll + maneuverabilitySkill;

        // Determine the cost to dodge, based on the armour class.
        int dodgeCost = 1 + GetCharacterArmourClass(defender);
        DrainActionOrWill(defender, dodgeCost * actionPointMod);

        if(rollResult >= toHit) {
            // The defender has successfully dodged!
            reactionSpam += ", but " + BorString::getNiceName(defender) + " dodges out of the way! (" + rollSpam(dodgeRoll, maneuverabilitySkill, toHit) + ") ";
            BorEffect::PerformReactiveAnimation(defender, attacker, "dodge", GetSlotHitlocation(slot), true);
            
        } else if(dodgeRoll + maneuverabilitySkill >= toHit / 2 ) {
            // Partial success, defender stumbles to crouching, and takes half damage.
            reactionSpam += ", " + BorString::getNiceName(defender) + " struggles to dodge out of the way! (" + rollSpam(dodgeRoll, maneuverabilitySkill, toHit) + ") ";
            reactionSpam += BorString::getNiceName(defender) + " stumbles, but only takes "+ damageNumber(incomingDamage / 2) +" damage.";

            ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage / 2, slot);
            BorEffect::PerformReactiveAnimation(defender, attacker, "dodge", GetSlotHitlocation(slot), true);
            
            defender->setPosture(CreaturePosture::CROUCHED, true, true);

        } else {
            // Failed to dodge entirely!
            reactionSpam += ", " + BorString::getNiceName(defender) + " tries to dodge out of the way and fails! (" + rollSpam(dodgeRoll, maneuverabilitySkill, toHit) + ") ";
            reactionSpam += BorString::getNiceName(defender) +" takes "+ damageNumber(incomingDamage) +" damage.";

            ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, slot);
            BorEffect::PerformReactiveAnimation(defender, attacker, "dodge", GetSlotHitlocation(slot), false);
        }
        return reactionSpam;
    }

    static String DoLightsaberDeflectReaction(CreatureObject* attacker, CreatureObject* defender, int incomingDamage, int toHit, int slot, int actionPointMod) {
        WeaponObject* attackerWeapon = attacker->getWeapon();
        WeaponObject* defenderWeapon = defender->getWeapon();

        String reactionSpam = "";

        // Check that the defender has the necessary lightsaber skill, and actually has a lightsaber equipped.
        if(!defender->hasSkill("rp_lightsaber_novice") || !defenderWeapon->isJediWeapon()){
            defender->sendSystemMessage("You must have a lightsaber equipped to use Lightsaber Deflect as your reaction stance!");

            ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, slot);
            BorEffect::PerformReactiveAnimation(defender, attacker, "hit", GetSlotHitlocation(slot), true);
            return ", doing (" + GetWeaponDamageString(attackerWeapon) + ") = "+ damageNumber(incomingDamage) +" damage.";
        }

        // Check if the defender is becoming overwhelmed.
        int deflectionCount = defender->getStoredInt("deflection_count");
        defender->setStoredInt("deflection_count", deflectionCount + 1);

        // Determine the defender roll.
        int deflectRoll = BorDice::Roll(1, 20);
        int lightsaberSkill = defender->getSkillMod("rp_lightsaber");

        int rollResult = deflectRoll + lightsaberSkill;

        // Deflect action cost is determined by 11 - lightsaber skill, capped to at least 1.
        int actionCost = 11 - lightsaberSkill;
        if(actionCost <= 0) actionCost = 1;
        DrainActionOrWill(defender, actionCost * actionPointMod);

        // Defender failed to reflect at all.
        if (rollResult < toHit/2){
            reactionSpam += BorString::getNiceName(defender) + " fails to deflect the attack (1d20 = " + String::valueOf(deflectRoll) + " + " + String::valueOf(lightsaberSkill) + " vs DC: "+String::valueOf(toHit)+")";
            reactionSpam += ", recieving "+ damageNumber(incomingDamage) +" damage!";

            //Apply full damage and output the spam!
            ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, slot);
            BorEffect::PerformReactiveAnimation(attacker, defender, "hit", GetSlotHitlocation(slot), true);
            return reactionSpam;
        }

        // Partial success!
        if (rollResult < toHit){
            if (attackerWeapon->isRangedWeapon()){
                // Sending bolts away!
                reactionSpam += BorString::getNiceName(defender) + " successfully deflects the shot (1d20 = " + String::valueOf(deflectRoll) + " + " + String::valueOf(lightsaberSkill) + " vs DC: "+String::valueOf(toHit/2)+")";
                reactionSpam += ", sending it harmlessly away.";

                BorEffect::PerformReactiveAnimation(defender, attacker, "parry", GetSlotHitlocation(slot), false);

                return reactionSpam;
            }
            if (attackerWeapon->isJediWeapon() || attackerWeapon->isMeleeWeapon()){
                // Taking half damage from lightsaber and melee hits!
                reactionSpam += BorString::getNiceName(defender) + " deflects the attack in partial (1d20 = " + String::valueOf(deflectRoll) + " + " + String::valueOf(lightsaberSkill) + " vs DC: "+String::valueOf(toHit/2)+")";
                reactionSpam += ", still recieving "+ damageNumber(incomingDamage /2) +" damage!";

                // Melee weapons take half their maximum condition as damage!
                if (attackerWeapon->isMeleeWeapon()){
                    reactionSpam += " However, " + BorString::getNiceName(attacker) + "'s weapon is substantially damaged in the process!";
                    attackerWeapon->setConditionDamage(attackerWeapon->getConditionDamage() + attackerWeapon->getMaxCondition()/2);
                }

                BorEffect::PerformReactiveAnimation(attacker, defender, "parry", GetSlotHitlocation(slot), true);
                ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage / 2, slot);

                return reactionSpam;
            }
            if (attackerWeapon->isUnarmedWeapon()){
                // Take partial damage, but also damage the attacker!
                reactionSpam += BorString::getNiceName(defender) + " deflects the attack in partial (1d20 = " + String::valueOf(deflectRoll) + " + " + String::valueOf(lightsaberSkill) + " vs DC: "+String::valueOf(toHit/2)+")";
                reactionSpam += ", still recieving "+ damageNumber(incomingDamage / 2) +" damage!";
                reactionSpam += " However, " + BorString::getNiceName(attacker) + " has hurt themselves in the process, taking "+ damageNumber(incomingDamage / 2) +" damage!";

                BorEffect::PerformReactiveAnimation(attacker, defender, "parry", GetSlotHitlocation(slot), true);
                ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage / 2, slot);
                ApplyAdjustedHealthDamage(attacker, attackerWeapon, incomingDamage / 2, slot);

                return reactionSpam;
            }
        }
        // We've fully deflected the attack!
        if (attackerWeapon->isRangedWeapon()){
            reactionSpam += BorString::getNiceName(defender) + " successfully deflects the shot (1d20 = " + String::valueOf(deflectRoll) + " + " + String::valueOf(lightsaberSkill) + " vs DC: "+String::valueOf(toHit)+")";

            int damageType = attackerWeapon->getDamageType();
            if (damageType == SharedWeaponObjectTemplate::ENERGY || damageType == SharedWeaponObjectTemplate::ELECTRICITY || damageType == SharedWeaponObjectTemplate::STUN || damageType == SharedWeaponObjectTemplate::LIGHTSABER) {
                //Return to sender!
                reactionSpam += ", sending it back to its origin, dealing "+ damageNumber(incomingDamage / 2) +" damage to " + BorString::getNiceName(attacker) +"!";

                BorEffect::PerformReactiveAnimation(defender, attacker, "parry", GetSlotHitlocation(slot), true);
                ApplyAdjustedHealthDamage(attacker, attackerWeapon, incomingDamage / 2, slot);
            } else {
                //Awww, it only fizzled out...
                reactionSpam += ", however, it merely fizzles out as it makes contact with the blade!";

                BorEffect::PerformReactiveAnimation(defender, attacker, "parry", GetSlotHitlocation(slot), false);
            }
            return reactionSpam;
        }
        if (attackerWeapon->isJediWeapon() || attackerWeapon->isMeleeWeapon()){
            //Blocking all damage!
            reactionSpam += ", but " + BorString::getNiceName(defender) + " successfully deflects the attack entirely. (1d20 = " + String::valueOf(deflectRoll) + " + " + String::valueOf(lightsaberSkill) + " vs DC: "+String::valueOf(toHit)+")";

            if (attackerWeapon->isMeleeWeapon()){
                reactionSpam += " " + BorString::getNiceName(attacker) + "'s weapon is not resistant to Lightsabers, and is destroyed in the process!";
                attackerWeapon->setConditionDamage(attackerWeapon->getMaxCondition());
            }
            BorEffect::PerformReactiveAnimation(defender, attacker, "parry", GetSlotHitlocation(slot), true);

            return reactionSpam;
        }
        if (attackerWeapon->isUnarmedWeapon()){
            // Lets face it, taking your fists to a lightsaber fight was never going to work out.
            // Reflect all damage back to the attacker.
            reactionSpam += ", but " + BorString::getNiceName(defender) + " successfully deflects the attack entirely. (1d20 = " + String::valueOf(deflectRoll) + " + " + String::valueOf(lightsaberSkill) + " vs DC: "+String::valueOf(toHit)+")";
            reactionSpam += " " + BorString::getNiceName(attacker) + " hurts themselves on the blade for "+ damageNumber(incomingDamage) +" damage!";

            BorEffect::PerformReactiveAnimation(defender, attacker, "parry", GetSlotHitlocation(slot), true);
            ApplyAdjustedHealthDamage(attacker, attackerWeapon, incomingDamage, slot);

            return reactionSpam;
        }

        return "";
    }

    static String DoForceDeflectReaction(CreatureObject* attacker, CreatureObject* defender, int incomingDamage, int toHit, int slot, int actionPointMod) {
        WeaponObject* attackerWeapon = attacker->getWeapon();
        WeaponObject* defenderWeapon = defender->getWeapon();
        
        String reactionSpam = "";

        int deflectRoll = BorDice::Roll(1, 20);
        int telekineticSkill = defender->getSkillMod("rp_telekinesis");

        int rollResult = deflectRoll + telekineticSkill;

        int forceCost = 11 - telekineticSkill;
        if(forceCost <= 0 ) forceCost = 1;

        DrainForce(defender, forceCost);

        if (rollResult >= toHit) {
            // Full deflection!
            reactionSpam += BorString::getNiceName(defender) + " raises their hand and deflects the attack away ("+ rollSpam(deflectRoll, telekineticSkill, toHit) +")";
            BorEffect::PerformReactiveAnimation(attacker, defender, "parry", GetSlotHitlocation(slot), false);

        } else if (rollResult >= toHit / 2) {
            // Partial deflection!
            reactionSpam += BorString::getNiceName(defender) + " quickly raises their hand, attempting to deflect the attack away ("+ rollSpam(deflectRoll, telekineticSkill, toHit) + ")";
            reactionSpam += ", however, they are a bit too slow, recieving "+ damageNumber(incomingDamage / 2) +" damage!";

            BorEffect::PerformReactiveAnimation(attacker, defender, "parry", GetSlotHitlocation(slot), false);
            ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage/2, slot);
        } else {
            // No deflection!
            reactionSpam += BorString::getNiceName(defender) + " quickly raises their hand, attempting to deflect the attack away ("+ rollSpam(deflectRoll, telekineticSkill, toHit) + ")";
            reactionSpam += ", however, they are too slow, recieving "+ damageNumber(incomingDamage) +" damage!";

            BorEffect::PerformReactiveAnimation(attacker, defender, "parry", GetSlotHitlocation(slot), false);
            ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, slot);
        }              
        return reactionSpam;
    }

    static String DoForceAbsorbReaction(CreatureObject* attacker, CreatureObject* defender, int incomingDamage, int toHit, int slot, int actionPointMod) {
        WeaponObject* attackerWeapon = attacker->getWeapon();
        WeaponObject* defenderWeapon = defender->getWeapon();
        
        String reactionSpam = "";

        int absorbRoll = BorDice::Roll(1, 20);
        int absorbSkill = defender->getSkillMod("rp_inward");

        bool passed = absorbRoll + absorbSkill >= toHit;

        int forceCost = 12 - absorbSkill;
        if(forceCost <= 0) forceCost = 1;

        if(attackerWeapon->isRangedWeapon() || attackerWeapon->isJediWeapon()) {
            DrainForce(defender, forceCost);
            if(passed && attackerWeapon->getDamageType() != SharedWeaponObjectTemplate::KINETIC) {
                reactionSpam += BorString::getNiceName(defender) + " absorbs the attack with their hand ("+ rollSpam(absorbRoll, absorbSkill, toHit) + ")";
            } else {
                reactionSpam += BorString::getNiceName(defender) + " tries to absorb the attack ("+ rollSpam(absorbRoll, absorbSkill, toHit) + ")";
                reactionSpam += ", but fails, recieving "+ damageNumber(incomingDamage) +" damage!";
                ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, slot);   
            }
        } else {
            //Can't block this. Full attack.
            ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, slot);
            BorEffect::PerformReactiveAnimation(defender, attacker, "hit", GetSlotHitlocation(slot), true);
            defender->sendSystemMessage("You cannot absorb this attack. You recieved full damage.");
            return ", doing (" + GetWeaponDamageString(attackerWeapon) + ") = "+ damageNumber(incomingDamage) +" damage.";
        }
        return reactionSpam;
    }

    static String HandleCombatReaction(CreatureObject* attacker, CreatureObject* defender, int incomingDamage, int toHit, int slot, bool powerAttacked, bool flurryAttacked) {
        WeaponObject* attackerWeapon = attacker->getWeapon();
        WeaponObject* defenderWeapon = defender->getWeapon();
        int defenderReactionType = defender->getStoredInt("reaction_stance");

        String reactionSpam = "";

        int actionPointMod = 1;
        if(flurryAttacked)
            actionPointMod = 2;

        if(CanPerformReaction(defender, defenderReactionType, incomingDamage, attackerWeapon, defenderWeapon)) {
            switch(defenderReactionType) {
                case RpReactionStance::DEFEND:
                    return DoDefendReaction(attacker, defender, incomingDamage, toHit, slot, actionPointMod);
                case RpReactionStance::PARRY:
                    return DoParryReaction(attacker, defender, incomingDamage, toHit, slot, actionPointMod);
                case RpReactionStance::DODGE:
                    return DoDodgeReaction(attacker, defender, incomingDamage, toHit, slot, actionPointMod);
                case RpReactionStance::LIGHTSABERDEFLECT:
                    return DoLightsaberDeflectReaction(attacker, defender, incomingDamage, toHit, slot, actionPointMod);
                case RpReactionStance::FORCEDEFLECT:
                    return DoForceDeflectReaction(attacker, defender, incomingDamage, toHit, slot, actionPointMod);
                case RpReactionStance::FORCEABSORB:
                    return DoForceAbsorbReaction(attacker, defender, incomingDamage, toHit, slot, actionPointMod);
            }
        } 
        
        //Simply accept the damage. 
        ApplyAdjustedHealthDamage(defender, attackerWeapon, incomingDamage, slot);
        BorEffect::PerformReactiveAnimation(defender, attacker, "hit", GetSlotHitlocation(slot), true);
        return ", doing (" + GetWeaponDamageString(attackerWeapon) + ") = "+ damageNumber(incomingDamage) +" damage.";
    }

    static void ApplyAdjustedHealthDamage(CreatureObject* creature, WeaponObject* attackerWeapon, int damage, int slot) {
        // Use equipped armour if the creature is a player.
        if(creature->isPlayerCreature()) {
            ManagedReference<ArmorObject*> armour = BorCharacter::GetArmorAtSlot(creature, GetSlotName(slot));
            if(armour != nullptr) {
                if(!armour->isBroken()) {
                    int armourDamage = 0;
                    int healthDamage = 0;
                    String damageType = GetDamageType(attackerWeapon);
                    int armourProtection = GetArmorProtection(armour, GetDamageType(attackerWeapon));

                    if(damageType == "Lightsaber") { 
                        // Special Lightsaber Rules
                        if(armour->getLightSaber() > 0) {
                            // Armour takes x5 damage, health damage is one quarter.
                            armourDamage = damage * 5;
                            healthDamage = damage * 0.25;
                        } else {
                            // Armour is destroyed, damage taken in full.
                            armourDamage = armour->getMaxCondition();
                            healthDamage = damage;
                        }
                    } else {
                        // Standard damage calculation
                        if(armourProtection > 0){
                            //Armour is weak to damage type. Allow all damage through, and increase damage done to the armour itself.
                            armourDamage = damage + armourProtection;
                            healthDamage = damage;
                        } else {
                            //Armour resists damage, or ignores damage type.
                            armourDamage = damage;
                            healthDamage = damage + armourProtection;
                            if (healthDamage < 1) 
                                healthDamage = 1;
                        }
                    }

                    if (!BorCharacter::HasRequiredArmourSkill(creature, GetSlotName(slot))){
                        // Lacking armour skill reduces effectiveness to 1.
                        if(armourProtection < 0){
                            healthDamage = damage - 1;
                            if (healthDamage < 1) 
                                healthDamage = 1;
                        }
                        armourDamage = armourDamage * 2;
                    }

                    //Apply damage to creature and armour.
                    armour->setConditionDamage(armour->getConditionDamage() + armourDamage);
                    BorCharacter::ModPool(creature, "health", -damage, true);

                    // Output spam.
                    String armourName = armour->getCustomObjectName().toString();
                    if(armourName == "") {
                        armourName = armour->getObjectTemplate()->getObjectName();
                    }
                    creature->sendSystemMessage("Your " + armourName + " absorbed " + String::valueOf(armourDamage) + " damage.");
                    return;
                }
            }
            // No armour is equipped in hit slot, apply damage normally.
            BorCharacter::ModPool(creature, "health", -damage, true);
        // NPC handling.
        } else {
            //TO DO: Implement NPC armour.
            BorCharacter::ModPool(creature, "health", -damage, true);
        }
    }
    /*

    //THIS IS AN OLD IMPLEMENTATION KEPT FOR REFERENCE ONLY. WILL BE REMOVED AFTER REFACTOR.

    static void ApplyAdjustedHealthDamage(CreatureObject* creature, WeaponObject* attackerWeapon, int damage, int slot){
        if(creature->isPlayerCreature()) { //Use their equipped armor
            ManagedReference<ArmorObject*> armor = BorCharacter::GetArmorAtSlot(creature, GetSlotName(slot));
            if(armor != nullptr) {
                if(!armor->isBroken()) {
                    String damageType = GetDamageType(attackerWeapon);
                    if(damageType == "Lightsaber") { //Special Lightsaber Rules
                        if(armor->getLightSaber() > 0) { //Can Resist Lightsabers
                            //Take only 10 percent damage.
                            BorCharacter::ModPool(creature, "health", (damage / 10) * -1, true);
                        } else { //Take Full Damage
                            BorCharacter::ModPool(creature, "health", damage * -1, true);
                        }
                    } else {
                        //Armor handling (without penetration)
                        int armorProtection = GetArmorProtection(armor, GetDamageType(attackerWeapon));
                        int finalDamage = damage - armorProtection;
                        if(finalDamage < 1) finalDamage = 1;
                        armor->setConditionDamage(armor->getConditionDamage() + armorProtection);
                        BorCharacter::ModPool(creature, "health", finalDamage * -1, true);    
                        String armorName = armor->getCustomObjectName().toString();
                        if(armorName == "") {
                            armorName = armor->getObjectTemplate()->getObjectName();
                        }
                            
                        creature->sendSystemMessage("Your " + armorName + " absorbed " + String::valueOf(armorProtection) + " damage.");                
                    }
                } else { //Take Full Damage
                    BorCharacter::ModPool(creature, "health", damage * -1, true);
                }
            } else { //Take Full Damage
                BorCharacter::ModPool(creature, "health", damage * -1, true);
            }
        } else { //Use their skill mod armor. 
            String armorSlot = GetSlotName(slot);
            String damageType = GetDamageType(attackerWeapon);
            if(damageType == "Lightsaber") {
                if(creature->getStoredInt("rp_armor_" + armorSlot + "_Lightsaber") > 0) {
                    //Take only 10 percent damage.
                    BorCharacter::ModPool(creature, "health", (damage / 10) * -1, true);
                } else {
                    BorCharacter::ModPool(creature, "health", damage * -1, true);
                }
            } else {
                int armorRating = creature->getStoredInt("rp_armor_rating_" + armorSlot);
                int weaponArmorPiercing = attackerWeapon->getArmorPiercing();
                int damageDivider = GetWeaponPenetrationDivisionModifier(weaponArmorPiercing, armorRating);
                if(damageDivider != 0) {
                    int adjustedDamage = damage / damageDivider;
                    int armorProtection = creature->getStoredInt("rp_armor_" + armorSlot + "_" + GetDamageType(attackerWeapon));
                    int finalDamage = adjustedDamage - armorProtection;
                    BorCharacter::ModPool(creature, "health", finalDamage * -1, true);
                } else { //Take Full Damage
                    BorCharacter::ModPool(creature, "health", damage * -1, true);
                }
            }            
        }
    }
    */

    static int GetArmorProtection(ArmorObject* armor, String damageType) {
        if(damageType == "Kinetic")             return (int)armor->getKinetic();
        else if(damageType == "Energy")         return (int)armor->getEnergy();
        else if(damageType == "Electricity")    return (int)armor->getElectricity();
        else if(damageType == "Stun")           return (int)armor->getStun();
        else if(damageType == "Blast")          return (int)armor->getBlast();
        else if(damageType == "Heat")           return (int)armor->getHeat();
        else if(damageType == "Cold")           return (int)armor->getCold();
        else if(damageType == "Acid")           return (int)armor->getAcid();
        else return 0;
    }

    static int GetWeaponCondition(WeaponObject* weapon) {
        return weapon->getMaxCondition() - weapon->getConditionDamage();
    }

    static int GetWeaponPenetrationDivisionModifier(int weaponPiercing, int armorRating) {
        if(armorRating == 0) {
            if(weaponPiercing == 0) return 1; //None
            else if(weaponPiercing == 1) return 1; //Light
            else if(weaponPiercing == 2) return 0; //Medium
            else if(weaponPiercing == 3) return 0; //Heavy
            else return 1;
        } else if(armorRating == ArmorObject::LIGHT) {
            if(weaponPiercing == 0) return 2; //None
            else if(weaponPiercing == 1) return 1; //Light
            else if(weaponPiercing == 2) return 1; //Medium
            else if(weaponPiercing == 3) return 0; //Heavy
            else return 1;
        } else if(armorRating == ArmorObject::MEDIUM) {
            if(weaponPiercing == 0) return 2; //None
            else if(weaponPiercing == 1) return 2; //Light
            else if(weaponPiercing == 2) return 1; //Medium
            else if(weaponPiercing == 3) return 1; //Heavy
            else return 1;            
        } else if(armorRating == ArmorObject::HEAVY) {
            if(weaponPiercing == 0) return 2; //None
            else if(weaponPiercing == 1) return 2; //Light
            else if(weaponPiercing == 2) return 2; //Medium
            else if(weaponPiercing == 3) return 1; //Heavy
            else return 1;  
        } else return 1;
    }

    static String GetDamageType(WeaponObject* weapon) {
	    String result;

	    switch (weapon->getDamageType()) {
	    case SharedWeaponObjectTemplate::KINETIC:
	    	result = "Kinetic";
	    	break;
	    case SharedWeaponObjectTemplate::ENERGY:
	    	result = "Energy";
	    	break;
	    case SharedWeaponObjectTemplate::ELECTRICITY:
	    	result = "Electricity";
	    	break;
	    case SharedWeaponObjectTemplate::STUN:
	    	result = "Stun";
	    	break;
	    case SharedWeaponObjectTemplate::BLAST:
	    	result = "Blast";
	    	break;
	    case SharedWeaponObjectTemplate::HEAT:
	    	result = "Heat";
	    	break;
	    case SharedWeaponObjectTemplate::COLD:
	    	result = "Cold";
	    	break;
	    case SharedWeaponObjectTemplate::ACID:
	    	result = "Acid";
	    	break;
	    case SharedWeaponObjectTemplate::LIGHTSABER:
	    	result = "Lightsaber";
	    	break;
	    default:
	    	result = "Unknown";
	    	break;
	    }

        return result;
    }

    static String GetSlotName(int slot) {
        if(slot == 1) return "chest2";
        else if(slot == 2) return "chest2";
        else if(slot == 3) return "pants1";
        else if(slot == 4) return "shoes";
        else if(slot == 5) return "bracer_upper_l";
        else if(slot == 6) return "bracer_upper_r";
        else if(slot == 7) return "bicep_l";
        else if(slot == 8) return "bicep_r";
        else if(slot == 9) return "gloves";
        else if(slot == 10) return "hat";
        else return "chest2";
    }

    static String GetSlotDisplayName(int slot) {
        if(slot == 1) return "chest";
        else if(slot == 2) return "chest";
        else if(slot == 3) return "legs";
        else if(slot == 4) return "feet";
        else if(slot == 5) return "left forearm";
        else if(slot == 6) return "right forearm";
        else if(slot == 7) return "left bracer";
        else if(slot == 8) return "right bracer";
        else if(slot == 9) return "hands";
        else if(slot == 10) return "head";
        else return "chest";
    }

    static uint8 GetSlotHitlocation(int slot) {
        if(slot == 1) return CombatManager::HIT_BODY;
        else if(slot == 2) return CombatManager::HIT_BODY;
        else if(slot == 3) return CombatManager::HIT_LLEG;
        else if(slot == 4) return CombatManager::HIT_RLEG;
        else if(slot == 5) return CombatManager::HIT_LARM;
        else if(slot == 6) return CombatManager::HIT_RARM;
        else if(slot == 7) return CombatManager::HIT_LARM;
        else if(slot == 8) return CombatManager::HIT_RARM;
        else if(slot == 9) return CombatManager::HIT_BODY;
        else if(slot == 10) return CombatManager::HIT_HEAD;
        else return CombatManager::HIT_BODY;
    }

    static String GetWeaponDamageString(WeaponObject* weapon) {
        if(weapon->getBonusDamage() > 0)
            return String::valueOf(weapon->getMinDamage()) + "d" + String::valueOf(weapon->getMaxDamage()) + " + " + String::valueOf(weapon->getBonusDamage());
        else
            return String::valueOf(weapon->getMinDamage()) + "d" + String::valueOf(weapon->getMaxDamage());
    }

    static bool CanPerformReaction(CreatureObject* defender, int reactionType, int incomingDamage, WeaponObject* attackerWeapon, WeaponObject* defenderWeapon) {
        int defenderAction = GetAvailableActionPoints(defender);
        if(reactionType == 0) return false; //Returns false so the catch of "none" will use the same code
        //Defend
        else if(reactionType == 1 && defenderAction > 0 && GetWeaponCondition(defenderWeapon) >= incomingDamage && !defenderWeapon->getDefendIsRestricted() && !attackerWeapon->isRangedWeapon()) return true;
        //Parry
        else if(reactionType == 2 && defenderWeapon->isMeleeWeapon() && attackerWeapon->isMeleeWeapon() && defenderAction > 1 && GetWeaponCondition(defenderWeapon) >= incomingDamage && !defenderWeapon->getParryIsRestricted()) return true;
        //Dodge
        else if(reactionType == 3 && defender->isStanding() && defenderAction > 0 && !defenderWeapon->getDodgeIsRestricted() && !BorCharacter::IsWearingArmourUnskilled(defender) && GetCharacterArmourClass(defender) < 3) return true;
        //Special Force
        else if(reactionType == 4 || reactionType == 5 || reactionType == 6 ) {
            int defenderForce = GetAvailableForcePoints(defender);
            if(reactionType == 4) {
                //Deflection Limiter
                int deflectionCount = defender->getStoredInt("deflection_count");
                if(deflectionCount > 3) {
                    return false;
                }
                int lightsaberSkill = defender->getSkillMod("rp_lightsaber");
                int actionCost = 11 - lightsaberSkill;
                if(actionCost <= 0) actionCost = 1;
                if(defenderWeapon->isJediWeapon()) {
                    if(defenderAction >= (actionCost)) {
                        return true;
                    } else return false;
                } else return false;
            } else if(reactionType == 5) {
                int telekineticsSkill = defender->getSkillMod("rp_telekinetics");
                int forceCost = 11 - telekineticsSkill;
                if(forceCost <= 0) forceCost = 1;
                if(defenderForce >= (forceCost)) {
                    return true;
                } else return false;
            } else {
                int inwardSkill = defender->getSkillMod("rp_inward");
                int forcePool = 999;
                if(defender->isPlayerCreature()) {
                    forcePool = defender->getPlayerObject()->getForcePower();
                }
                if(forcePool >= (12 - inwardSkill)) {
                    return true;
                } else return false;
            }
        } else return false;
    }

    static int GetAvailableActionPoints(CreatureObject* creature) {
        if(creature->getHAM(3) == 0)
            return creature->getHAM(6);
        else return creature->getHAM(3) + creature->getHAM(6);
    }

    static int GetAvailableForcePoints(CreatureObject* creature) {
        if(creature->isPlayerCreature()) {
            return creature->getPlayerObject()->getForcePower();
        } else {
            return 99; //TODO: Should be an actual pool on NPCs.
        }
    }

    static void DrainActionOrWill(CreatureObject* creature, int amount) {
        if(creature->getHAM(3) >= amount)
            BorCharacter::ModPool(creature, "action", amount * -1, true);
        else {
            int remainingAction = creature->getHAM(3);
            BorCharacter::ModPool(creature, "action", remainingAction * -1, true);
            BorCharacter::ModPool(creature, "will", (amount - remainingAction) * -1, true);
        }
    }

    static void DrainForce(CreatureObject* creature, int amount) {
        if(creature->isPlayerCreature()) {
            BorCharacter::ModPool(creature, "force", amount * -1, true);
        } else {
            //TODO: Handle NPC force pool.
        }
    }

    static int GetToHitModifier(CreatureObject* attacker, CreatureObject* defender, WeaponObject* attackerWeapon) {
        int distance = BorCharacter::GetTargetDistance(attacker, defender);
        int minRange = attackerWeapon->getPointBlankRange();
        int maxRange = attackerWeapon->getMaxRange();
        int prefRange = attackerWeapon->getIdealRange();

        int distanceModifier = 0;
        bool tooClose = false;
        
        if(distance < minRange) {
            //We're outside of the minimum range!
			distanceModifier = attackerWeapon->getPointBlankAccuracy(); // PointBlankAccuracy is the too close DC mod
            tooClose = true;

        } else if(distance <= prefRange) {
            //We're within preferred range!
            distanceModifier = 0; //There is no configurable mod for this, might be worth fixing down the road.

        } else if(distance <= maxRange) {
            //We're too far!
			distanceModifier = attackerWeapon->getIdealAccuracy(); // idealAccuracy is the too far DC mod

        } else {
            //We're out of range!
            distanceModifier = 89;
            tooClose = true;
        }
        

        int postureModifier = 0;

        if(attacker->isKneeling() && !tooClose) {
            postureModifier -= 2;
        } 

        if(defender->isKneeling() && !tooClose && !attackerWeapon->isMeleeWeapon()) {
            postureModifier += 2;
        } 

        if(attacker->isProne() && !tooClose) {
            postureModifier -= 5;
        }

        if(defender->isProne() && !tooClose && !attackerWeapon->isMeleeWeapon()) {
            postureModifier += 5;
        } 

        return distanceModifier + postureModifier;
    }

    static void ThrowRoleplayGrenade(CreatureObject* attacker, CreatureObject* defender, CreatureObject* commander, WeaponObject* grenade) {
        int toHitDC = GetToHitModifier(attacker, defender, grenade) + 10;

        int demoSkill = attacker->getSkillMod("rp_demolitions");
        int throwSkill = attacker->getSkillMod("rp_throwing");

        int toHitRoll = BorDice::Roll(1, 20);

        SharedObjectTemplate* templateData = TemplateManager::instance()->getTemplate(grenade->getServerObjectCRC());

		if (templateData == nullptr)
			return;

		SharedWeaponObjectTemplate* grenadeData = cast<SharedWeaponObjectTemplate*>(templateData);

		if (grenadeData == nullptr)
			return;

        int skillLevel = grenadeData->getRpSkillLevel();

        int radius = grenade->getDamageRadius();

        bool failedDemoCheck = false;
        CreatureObject* centerTarget = defender;

        if(demoSkill < skillLevel) {
            int failureRoll = BorDice::Roll(1, 20);
            if(failureRoll + demoSkill < 15) {
                //Blow up in your face!
                radius = radius / 4;
                failedDemoCheck = true;
                centerTarget = attacker;
            }
        } 

        if(!failedDemoCheck) {
            //To hit roll will affect radius. 
            if(toHitRoll + throwSkill <= toHitDC / 4) {
                radius = radius / 8;
            } else if(toHitRoll + throwSkill < toHitDC / 2) {
                radius = radius / 4;
            } else if(toHitRoll + throwSkill < toHitDC) {
                radius = radius / 2;
            }
        }

		SortedVector<QuadTreeEntry*> closeObjects;
		Zone* zone = centerTarget->getZone();

		ManagedReference<CreatureObject*> targetCreature = nullptr;

		if (centerTarget->getCloseObjects() == nullptr) {
			zone->getInRangeObjects(centerTarget->getPositionX(), centerTarget->getPositionY(), radius, &closeObjects, true);
		}
		else {
			CloseObjectsVector* closeVector = (CloseObjectsVector*) centerTarget->getCloseObjects();
			closeVector->safeCopyReceiversTo(closeObjects, CloseObjectsVector::CREOTYPE);
		}

        int targetCount = 0; 

        //Yes I know we do this loop twice, but its to accurately report the target count.
        for (int i = 0; i < targetCount; i++) {
			SceneObject* targetObject = static_cast<SceneObject*>(closeObjects.get(i));
			if (targetObject->isCreatureObject() && centerTarget->isInRange(targetObject, radius)) {
				targetCount++;
			}
		}

        String message = "";

        if(!failedDemoCheck) {
            //Attacker throws a grenade toward Defender (roll + skill = result), which explodes in the vicinity of X targets!
            message = BorString::getNiceName(attacker) + " throws a " + grenade->getCustomObjectName().toString() + " toward " + BorString::getNiceName(defender);
            message = message + " (" + String::valueOf(toHitRoll) + " + " + String::valueOf(throwSkill) + " = " + String::valueOf(toHitRoll + throwSkill);
            message = message + " vs DC: " + String::valueOf(toHitDC) + ")";
            message = message + ", which explodes in the vicinity of "+String::valueOf(targetCount)+" targets!";
        } else {
            //Attacker attempts to activate the grenade, but it goes off prematurely! The resulting explosion affects X targets!
            message = BorString::getNiceName(attacker) + " attempts to activate the " + grenade->getCustomObjectName().toString() + ", but it goes off prematurely! The resulting explosion affects \\#FFFF00" + String::valueOf(targetCount) + "\\#. targets!";
        }

        BorrieRPG::BroadcastMessage(attacker, message);

		for (int i = 0; i < targetCount; i++) {
			SceneObject* targetObject = static_cast<SceneObject*>(closeObjects.get(i));
			if (targetObject->isCreatureObject() && centerTarget->isInRange(targetObject, radius)) {
				targetCreature = cast<CreatureObject*>(targetObject);
				Locker locker(targetCreature, centerTarget);

				//Handle Grenade Reaction.
                HandleGrenadeReaction(targetCreature, grenade, BorCharacter::GetTargetDistance(targetCreature, centerTarget));
			}
		}
    }

    static void HandleGrenadeReaction(CreatureObject* victim, WeaponObject* grenade, float distance) {
        String message = victim->getFirstName() + " is in proximity of the grenade's blast radius!";
        //Distance affects the dodge roll. You either dodge, or you use telekinesis. 
        int maneuverabilitySkill = victim->getSkillMod("rp_maneuverability");
        int telekinesisSkill = victim->getSkillMod("rp_telekinesis");
        bool dodgedSuccessfully = false;

        int totalDamage = GetDamageRoll(grenade->getMaxDamage(), grenade->getMinDamage(), grenade->getBonusDamage());

        int diceCheck = (int)(grenade->getDamageRadius() * distance);

        if(diceCheck > 28)
            diceCheck = 28;

        if(diceCheck < 10)
            diceCheck = 10;

        int dodgeRoll = BorDice::Roll(1, 20);

        if(maneuverabilitySkill >= telekinesisSkill) {
            //Dodge
            message = message + " They hurdle to get out of the way ";
            message = message + "("+String::valueOf(dodgeRoll)+" + "+String::valueOf(maneuverabilitySkill)+" vs DC: "+String::valueOf(diceCheck)+")";
            dodgedSuccessfully = maneuverabilitySkill >= diceCheck;
        } else {
            //Stand Ground with the Force.
            message = message + " They brace themselves keenly ";
            message = message + "("+String::valueOf(dodgeRoll)+" + "+String::valueOf(telekinesisSkill)+" vs DC: "+String::valueOf(diceCheck)+")";
            dodgedSuccessfully = telekinesisSkill >= diceCheck;
        }

        if(!dodgedSuccessfully) {
            //Take Damage
            message = message + ", which fails, causing "+ damageNumber(totalDamage) +" damage.";
        } else {
            //Take Minimum Damage. 
            totalDamage = grenade->getMinDamage();
            message = message + ", successfully avoiding most of the blast and taking only "+ damageNumber(totalDamage) +" damage.";
        }

        //TODO: Should randomize what slot it hits. For now its just the chest. 
        ApplyAdjustedHealthDamage(victim, grenade, totalDamage, 1);

        BorrieRPG::BroadcastMessage(victim, message);
    }

    static void reloadWeapon(CreatureObject* creature, CreatureObject* commander, WeaponObject* weapon) {
        if (creature == nullptr || commander == nullptr)
            return;
        
        if (weapon == nullptr){
            commander->sendSystemMessage("You must have a weapon equipped in order to reload your weapon!");
            return;
        }

        // Get the ammo type of the weapon
        String ammo = weapon->getAmmoPack();
        if (ammo == ""){
            commander->sendSystemMessage("Your currently equipped weapon does not use ammo, and therefore cannot be reloaded!");
            return;
        }

        //Player handling
        if (creature->isPlayerCreature()) {
            // Get the player inventory
            SceneObject* inventory = creature->getSlottedObject("inventory");
            if (inventory == nullptr)
                return;
            
            // Loop over the inventory to find ammo of the appropriate type
            SceneObject* item = nullptr;
            for (int i = 0; i < inventory->getContainerObjectsSize(); ++i) {
			    item = inventory->getContainerObject(i);
                
                if (item->getObjectTemplate()->getTemplateFileName() == ammo){
                    ManagedReference<TangibleObject*> ammoItem = item->asTangibleObject();
                    if (ammoItem == nullptr)
                        return;
                    //Reload our weapon with the found ammo!
                    weapon->setStoredInt("ammo_used", 0);
                    ammoItem->decreaseUseCount();

                    //Spam the players that the reload took place
                    BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " has reloaded their weapon!");
                    return;
                }
            }
            // Couldn't find any compatible ammo!
            commander->sendSystemMessage("You do not have any fitting ammo to reload with!");
            return;
        }
        else {
            // NPCs don't have an inventory of ammo to manage, so simply reload the weapon.
            weapon->setStoredInt("ammo_used", 0);
            BorrieRPG::BroadcastMessage(creature, creature->getFirstName() + " has reloaded their weapon!");
            return;
        }
    }

};

#endif /*BORCOMBAT_H_*/