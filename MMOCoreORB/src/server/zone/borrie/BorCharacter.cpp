#include "BorCharacter.h"

bool BorCharacter::HasRequiredArmourSkill(CreatureObject* creature, String slot){
    ManagedReference<ArmorObject*> armour = GetArmorAtSlot(creature, slot);
    if(armour == nullptr)
        return true;
    return creature->getSkillMod("rp_armor") >= armour->getRpSkillLevel();
}

bool BorCharacter::IsWearingArmourUnskilled(CreatureObject* creature){
    if(!HasRequiredArmourSkill(creature, "shoes"))
        return true;
    if(!HasRequiredArmourSkill(creature, "pants1"))
        return true;
    if(!HasRequiredArmourSkill(creature, "bicep_r"))
        return true;
    if(!HasRequiredArmourSkill(creature, "bicep_l"))
        return true;
    if(!HasRequiredArmourSkill(creature, "bracer_upper_r"))
        return true;
    if(!HasRequiredArmourSkill(creature, "bracer_upper_l"))
        return true;
    if(!HasRequiredArmourSkill(creature, "gloves"))
        return true;
    if(!HasRequiredArmourSkill(creature, "hat"))
        return true;
    if(!HasRequiredArmourSkill(creature, "chest"))
        return true;
    // All slots check out!
    return false;
}

