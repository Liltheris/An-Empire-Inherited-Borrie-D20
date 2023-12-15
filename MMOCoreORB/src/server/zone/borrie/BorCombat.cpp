#include "BorCombat.h"

void BorCombat::ApplyAdjustedHealthDamage(CreatureObject* creature, WeaponObject* attackerWeapon, int damage, int slot) {
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
                }

                //Apply damage to creature and armour.
                armour->setConditionDamage(armour->getConditionDamage() - armourProtection);
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

// TO DO: Reconsider mechanism for determining overall armour class.
int BorCombat::GetCharacterArmourClass(CreatureObject* creature){
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