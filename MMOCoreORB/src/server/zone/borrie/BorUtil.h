#ifndef BORUTIL_H_
#define BORUTIL_H_

//I don't know how it knows what these are ¯\_(ツ)_/¯
//class CreatureObject;
//class TangibleObject;

class BorUtil : public Logger {
public:

    static void SaveStructureContents(CreatureObject* creature, String name, String path = "custom_scripts/structure_prefabs/");

    static void LoadStructureContents(CreatureObject* creature, String name);

    static String getRandomBaseTemplate(Vector<String>* baseTemplate, Vector<int> baseTemplateWeight){
        int weightSum = 0;

        // Determine the sum of our weights.
        for (int i = 0; i < baseTemplateWeight.size(); i++){
            weightSum += baseTemplateWeight.get(i);
        }

        int roll = System::random(weightSum);

        int checkWeight = 0;

        // run through the weights to determine our winner!
        for (int i = 0; i < baseTemplateWeight.size(); i++){
            checkWeight += baseTemplateWeight.get(i);
            if (roll <= checkWeight) {
                return baseTemplate->get(i);
            }
        }
        // Somehow, we failed to find a template, just return the first one.
        return baseTemplate->get(0);
    }

    static CreatureObject* CreateTemplatedRoleplayNPC(CreatureObject* creature, String rtemplate, String conversationTemplate = "") {
        float posX = creature->getPositionX(), posY = creature->getPositionY(), posZ = creature->getPositionZ();
		uint64 parID = creature->getParentID();
        return CreateTemplatedRoleplayNPC(rtemplate, posX, posZ, posY, parID, creature->getZone()->getZoneName(), conversationTemplate);
    }

    static CreatureObject* CreateTemplatedRoleplayNPC(String rtemplate, float x, float z, float y, long parentID, String zoneID, String conversationTemplate = "");

    static CreatureObject* CreateTemplatedRoleplayNPC(String rtemplate, float x, float z, float y, long parentID, String zoneID, String conversationTemplate = "");

    static void CreateRoleplayNPCArray(CreatureObject* creature, String baseTemplate, String skillTemplate, String equipmentTemplate, String customizeTemplate, String conversationTemplate = "", int width = 1, int height = 1) {
        float posX = creature->getPositionX(), posY = creature->getPositionY(), posZ = creature->getPositionZ();
		uint64 parID = creature->getParentID();

        int x = 0;
        int y = 0;

        for(x = 0;x<width;x++) {
            for(y = 0;y<height;y++) {
                float newX = posX + (1 * x);
                float newY = posY + (1 * y);
                CreateRoleplayNPC("rp_base_npc", baseTemplate, newX, posZ, newY, parID, creature->getZone()->getZoneName(), skillTemplate, equipmentTemplate, customizeTemplate, conversationTemplate);
            }
        }
    }

    static CreatureObject* CreateRoleplayNPC(CreatureObject* creature, String baseTemplate, String skillTemplate, String equipmentTemplate, String customizeTemplate, String conversationTemplate = "") {
        float posX = creature->getPositionX(), posY = creature->getPositionY(), posZ = creature->getPositionZ();
		uint64 parID = creature->getParentID();

        return CreateRoleplayNPC("rp_base_npc", baseTemplate, posX, posZ, posY, parID, creature->getZone()->getZoneName(), skillTemplate, equipmentTemplate, customizeTemplate, conversationTemplate);

    }

    static CreatureObject* CreateRoleplayNPC(String baseTemplate, String appearanceTemplate, float x, float z, float y, long parentID, String zoneid, String skillTemplate, String equipmentTemplate, String customizeTemplate, String conversationTemplate = "");

    static void ApplySkillTemplateToNPC(CreatureObject* creature, CreatureObject* target, String skillTemplate);

    static void ApplyEquipmentTemplateToNPC(CreatureObject* creature, CreatureObject* target, String equipmentTemplate);

    static void SaveEquipmentToTemplate(CreatureObject* creature, const uint64& target, String name);

    static void ApplyCustomizationTemplateToNPC(CreatureObject* creature, CreatureObject* target, String customizeTemplate);

    static void ApplyRandomCustomizationToNPC(CreatureObject* creature, CreatureObject* target);

    static void SaveCustomizationToTemplate(CreatureObject* creature, const uint64& target, String name);

    static void SaveRandomizationTemplate(CreatureObject* creature, const uint64& target, String name);

    static void PlaceStructureFromTemplate(CreatureObject* creature, String templateFile, String structureName = "");

    static void CallScreenplayFunction(CreatureObject* creature, String screenPlay, String function);

    static void TogglePublicContainer(CreatureObject* creature, const uint64& target);

    static void ToggleDispenserContainer(CreatureObject* creature, const uint64& target);

    static void SetDispenserContainer(SceneObject* object, bool isDispenser);

    static void SetPublicContainer(SceneObject* object, bool isPublic);

    static void ScreenplaySpoutCreature(CreatureObject* creature, SceneObject* target, String fileName);

    static void ScreenplaySpoutRoleplayMobile(CreatureObject* creature, SceneObject* target, String fileName);

    static void ScreenplaySpoutCivPoint(CreatureObject* creature, SceneObject* target, String tag, String fileName);

    static void ScreenplaySpoutBasePoint(CreatureObject* creature, SceneObject* target, String tag, String fileName);

    static void ScreenplaySpoutCivPointWithMarker(CreatureObject* creature, String tag, String fileName);

    static void ScreenplaySpoutCivPatrolPoint(CreatureObject* creature, bool delay, String animGroup, String fileName);

    static void ScreenplaySpoutObject(CreatureObject* creature, SceneObject* object, String fileName);

    static void NoLoadscreenTeleport(CreatureObject* creature, const UnicodeString& arguments);

    static void NoLoadscreenTeleportTo(CreatureObject* creature, const UnicodeString& arguments);

    static void PopulateObjectContents(CreatureObject* creature, SceneObject* target, String contentListTemplate);

    static void CreateTravelBeacon(CreatureObject* creature, String code);

    static void CreateContentListFromInventory(CreatureObject* creature, SceneObject* target, String contentListTemplate);

    static TangibleObject* CreateLootbox(CreatureObject* creature, String objectTemplate, String contentList, bool noResell = true);

    static void SaveLocalArea(CreatureObject* creature, String fileName, int range);

    static void LoadLocalArea(CreatureObject* creature, String fileName, bool snap);

    static void ListAllStructures(CreatureObject* creature, String targetName);

    static void ListAllStructures(CreatureObject* creature, CreatureObject* target);

    static void DeleteStructureByID(CreatureObject* creature, uint64 oid);

    static void SaveCharacterDataToFile(CreatureObject* creature, CreatureObject* targetMob);

};

#endif 