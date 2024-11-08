/*
 * WeaponObjectImplementation.cpp
 *
 *  Created on: 30/07/2009
 *      Author: victor
 */

#include "server/zone/objects/tangible/weapon/WeaponObject.h"
#include "server/zone/packets/tangible/WeaponObjectMessage3.h"
#include "server/zone/packets/tangible/WeaponObjectMessage6.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/packets/scene/AttributeListMessage.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "templates/tangible/SharedWeaponObjectTemplate.h"
#include "templates/manager/TemplateManager.h"
#include "server/zone/objects/manufactureschematic/craftingvalues/CraftingValues.h"
#include "server/zone/objects/tangible/powerup/PowerupObject.h"
#include "server/zone/objects/tangible/component/lightsaber/LightsaberCrystalComponent.h"
#include "server/zone/packets/object/WeaponRanges.h"
#include "server/zone/ZoneProcessServer.h"
#include "server/zone/managers/objectcontroller/ObjectController.h"

#include "server/zone/borrie/BorString.h"


void WeaponObjectImplementation::initializeTransientMembers() {
	TangibleObjectImplementation::initializeTransientMembers();

	weaponTemplate = dynamic_cast<SharedWeaponObjectTemplate*>(TemplateManager::instance()->getTemplate(serverObjectCRC));

	setLoggingName("WeaponObject");

	if(damageSlice > 1.5 || damageSlice < 1) {
		damageSlice = 1;
	}

	if(speedSlice > 1.0 || speedSlice < .5) {
		speedSlice = 1;
	}

	bool wasModified = getStoredString("dm_last_modified") != "" || getStoredInt("crafterWeapon") > 0;

	if(!wasModified) {
		minDamage = weaponTemplate->getMinDamage();
		maxDamage = weaponTemplate->getMaxDamage();
		bonusDamage = weaponTemplate->getBonusDamage();
	}	
}

void WeaponObjectImplementation::notifyLoadFromDatabase() {
	if (forceCost != 0) {
		saberForceCost = forceCost;
		forceCost = 0;
	}
	// Update object stats from template.
	weaponTemplate = dynamic_cast<SharedWeaponObjectTemplate*>(getObjectTemplate());

	bool wasModified = getStoredString("dm_last_modified") != "" || getStoredInt("crafterWeapon") > 0;

	if(!wasModified) {
		attackType = weaponTemplate->getAttackType();
		weaponEffect =  weaponTemplate->getWeaponEffect();
		weaponEffectIndex = weaponTemplate->getWeaponEffectIndex();
		damageType = weaponTemplate->getDamageType();
		armorPiercing = weaponTemplate->getArmorPiercing();
		healthAttackCost = weaponTemplate->getHealthAttackCost();
		actionAttackCost = weaponTemplate->getActionAttackCost();
		mindAttackCost = weaponTemplate->getMindAttackCost();
		saberForceCost = weaponTemplate->getForceCost();
		pointBlankAccuracy = weaponTemplate->getPointBlankAccuracy();
		pointBlankRange = weaponTemplate->getPointBlankRange();
		idealRange = weaponTemplate->getIdealRange();
		idealAccuracy = weaponTemplate->getIdealAccuracy();
		int templateMaxRange = weaponTemplate->getMaxRange();

		if (templateMaxRange > 5 )
			maxRange = templateMaxRange;

		maxRangeAccuracy = weaponTemplate->getMaxRangeAccuracy();
		minDamage = weaponTemplate->getMinDamage();
		maxDamage = weaponTemplate->getMaxDamage();
		bonusDamage = weaponTemplate->getBonusDamage();
		woundsRatio = weaponTemplate->getWoundsRatio();
		damageRadius = weaponTemplate->getArea();
		rpSkillLevel = weaponTemplate->getRpSkillLevel();
		maxAmmo = weaponTemplate->getMaxAmmo();

		float templateAttackSpeed = weaponTemplate->getAttackSpeed();
		rarity = weaponTemplate->getRarity();
	}

	requiredSkill = weaponTemplate->getRequiredSkill();
	requiredLevel = weaponTemplate->getRequiredLevel();
	
	alternateGrip = weaponTemplate->getAlternateGrip();
	ammoPack = weaponTemplate->getAmmoPack();

	TangibleObjectImplementation::notifyLoadFromDatabase();
}

void WeaponObjectImplementation::loadTemplateData(SharedObjectTemplate* templateData) {
	TangibleObjectImplementation::loadTemplateData(templateData);

	weaponTemplate = dynamic_cast<SharedWeaponObjectTemplate*>(templateData);

	certified = false;

	bool wasModified = getStoredString("dm_last_modified") != "";
	bool craftedWeapon = getStoredInt("crafterWeapon") > 0;

	if(!wasModified || !craftedWeapon) {
		minDamage = weaponTemplate->getMinDamage();
		maxDamage = weaponTemplate->getMaxDamage();
		bonusDamage = weaponTemplate->getBonusDamage();

		damageType = weaponTemplate->getDamageType();

		maxAmmo = weaponTemplate->getMaxAmmo();
		ammoPack = weaponTemplate->getAmmoPack();
	}

	requiredSkill = weaponTemplate->getRequiredSkill();
	requiredLevel = weaponTemplate->getRequiredLevel();

	attackType = weaponTemplate->getAttackType();
	weaponEffect =  weaponTemplate->getWeaponEffect();
	weaponEffectIndex = weaponTemplate->getWeaponEffectIndex();

		

	armorPiercing = weaponTemplate->getArmorPiercing();

	healthAttackCost = weaponTemplate->getHealthAttackCost();
	actionAttackCost = weaponTemplate->getActionAttackCost();
	mindAttackCost = weaponTemplate->getMindAttackCost();
	saberForceCost = weaponTemplate->getForceCost();

	pointBlankAccuracy = weaponTemplate->getPointBlankAccuracy();
	pointBlankRange = weaponTemplate->getPointBlankRange();

	idealRange = weaponTemplate->getIdealRange();
	idealAccuracy = weaponTemplate->getIdealAccuracy();

	int templateMaxRange = weaponTemplate->getMaxRange();

	if (templateMaxRange > 5 )
		maxRange = templateMaxRange;

	maxRangeAccuracy = weaponTemplate->getMaxRangeAccuracy();

		

	woundsRatio = weaponTemplate->getWoundsRatio();

	damageRadius = weaponTemplate->getArea();

	rpSkillLevel = weaponTemplate->getRpSkillLevel();

		

	float templateAttackSpeed = weaponTemplate->getAttackSpeed();

	if (templateAttackSpeed > 1)
		attackSpeed = templateAttackSpeed;

	

	if (!isJediWeapon()) {
		setSliceable(true);
	} else if (isJediWeapon()) {
		setSliceable(false);
	}

	alternateGrip = weaponTemplate->getAlternateGrip();

	int bladeColor = weaponTemplate->getBladeColor();
	if(bladeColor != -1) {
		setCustomizationVariable("/private/index_color_blade", bladeColor, true);
	}
}

void WeaponObjectImplementation::sendContainerTo(CreatureObject* player) {
	if (isJediWeapon()) {

		ManagedReference<SceneObject*> saberInv = getSlottedObject("saber_inv");

		if (saberInv != nullptr) {
			saberInv->sendDestroyTo(player);
			//saberInv->closeContainerTo(player, true);

			saberInv->sendWithoutContainerObjectsTo(player);
			saberInv->openContainerTo(player);
		}

	}
}

void WeaponObjectImplementation::createChildObjects() {
	// Create any child objects in a weapon.
	ZoneServer* zoneServer = server->getZoneServer();

	for (int i = 0; i < templateObject->getChildObjectsSize(); ++i) {
		const ChildObject* child = templateObject->getChildObject(i);

		if (child == nullptr)
			continue;

		ManagedReference<SceneObject*> obj = zoneServer->createObject(
				child->getTemplateFile().hashCode(), getPersistenceLevel());

		if (obj == nullptr)
			continue;

		ContainerPermissions* permissions = obj->getContainerPermissionsForUpdate();
		permissions->setOwner(getObjectID());
		permissions->setInheritPermissionsFromParent(true);
		permissions->setDefaultDenyPermission(ContainerPermissions::MOVECONTAINER);
		permissions->setDenyPermission("owner", ContainerPermissions::MOVECONTAINER);

		if (!transferObject(obj, child->getContainmentType())) {
			obj->destroyObjectFromDatabase(true);
			continue;
		}

		childObjects.put(obj);

		obj->initializeChildObject(_this.getReferenceUnsafeStaticCast());
	}

}

void WeaponObjectImplementation::sendBaselinesTo(SceneObject* player) {
	debug("sending weapon object baselines");

	BaseMessage* weao3 = new WeaponObjectMessage3(_this.getReferenceUnsafeStaticCast());
	player->sendMessage(weao3);

	BaseMessage* weao6 = new WeaponObjectMessage6(_this.getReferenceUnsafeStaticCast());
	player->sendMessage(weao6);

	if (player->isCreatureObject()) {
		BaseMessage* ranges = new WeaponRanges(cast<CreatureObject*>(player), _this.getReferenceUnsafeStaticCast());
		player->sendMessage(ranges);
	}
}

String WeaponObjectImplementation::getWeaponType() const {
	int weaponObjectType = getGameObjectType();

	String weaponType;

	switch (weaponObjectType) {
	case SceneObjectType::ONEHANDMELEEWEAPON:
		weaponType = "onehandmelee";
		break;
	case SceneObjectType::TWOHANDMELEEWEAPON:
		weaponType = "twohandmelee";
		break;
	case SceneObjectType::WEAPON:
	case SceneObjectType::MELEEWEAPON:
		weaponType = "unarmed";
		break;
	case SceneObjectType::RIFLE:
		weaponType = "rifle";
		break;
	case SceneObjectType::PISTOL:
		weaponType = "pistol";
		break;
	case SceneObjectType::CARBINE:
		weaponType = "carbine";
		break;
	case SceneObjectType::POLEARM:
		weaponType = "polearm";
		break;
	case SceneObjectType::THROWNWEAPON:
		weaponType = "thrownweapon";
		break;
	case SceneObjectType::MINE:
	case SceneObjectType::SPECIALHEAVYWEAPON:
	case SceneObjectType::HEAVYWEAPON:
		weaponType = "heavyweapon";
		break;
	default:
		weaponType = "unarmed";
		break;
	}

	if (isJediOneHandedWeapon()) weaponType = "onehandlightsaber";
	if (isJediTwoHandedWeapon()) weaponType = "twohandlightsaber";
	if (isJediPolearmWeapon()) weaponType = "polearmlightsaber";

	return weaponType;
}

float WeaponObjectImplementation::getDamageTypePriceMod() const {
	if(damageType == SharedWeaponObjectTemplate::KINETIC) {
		return 1.05;
	} else if(damageType == SharedWeaponObjectTemplate::ENERGY) {
		return 1;
	} else if(damageType == SharedWeaponObjectTemplate::ELECTRICITY) {
		return 1.5;
	} else if(damageType == SharedWeaponObjectTemplate::STUN) {
		return 1.8;
	} else if(damageType == SharedWeaponObjectTemplate::BLAST) {
		return 2;
	} else if(damageType == SharedWeaponObjectTemplate::HEAT) {
		return 1.3;
	} else if(damageType == SharedWeaponObjectTemplate::COLD) {
		return 1.2;
	} else if(damageType == SharedWeaponObjectTemplate::ACID) {
		return 3;
	} else if(damageType == SharedWeaponObjectTemplate::LIGHTSABER) {
		return 10;
	} else {
		return 1;
	}
}

void WeaponObjectImplementation::fillAttributeList(AttributeListMessage* alm, CreatureObject* object) {
	TangibleObjectImplementation::fillAttributeList(alm, object);

	bool res = isCertifiedFor(object);

	/*
	if (res) {
		alm->insertAttribute("weapon_cert_status", "Yes");
	} else {
		alm->insertAttribute("weapon_cert_status", "No");
	} */

	//if (usesRemaining > 0)
	//	alm->insertAttribute("count", usesRemaining);

	if(rpSkillLevel > 0) {
		alm->insertAttribute("skill_level", rpSkillLevel);
	}
		

	for(int i = 0; i < wearableSkillMods.size(); ++i) {
		const String& key = wearableSkillMods.elementAt(i).getKey();
		String statname = "cat_skill_mod_bonus.@stat_n:" + key;
		int value = wearableSkillMods.get(key);

		if (value > 0)
			alm->insertAttribute(statname, value);
	}

	String ap;

	switch (armorPiercing) {
	case SharedWeaponObjectTemplate::NONE:
		ap = "None";
		break;
	case SharedWeaponObjectTemplate::LIGHT:
		ap = "Light";
		break;
	case SharedWeaponObjectTemplate::MEDIUM:
		ap = "Medium";
		break;
	case SharedWeaponObjectTemplate::HEAVY:
		ap = "Heavy";
		break;
	default:
		ap = "Unknown";
		break;
	}

	//alm->insertAttribute("wpn_armor_pierce_rating", ap);

	//alm->insertAttribute("wpn_attack_speed", Math::getPrecision(getAttackSpeed(), 1));

	String ammoType = "";
	StringBuffer ammoCount;

	if (ammoPack != ""){

		if (ammoPack == "ammo_powerpack_small")
			ammoType = "Powerpack, small";
		else if (ammoPack == "ammo_powerpack_medium")
			ammoType = "Powerpack, medium";
		else if (ammoPack == "ammo_powerpack_large")
			ammoType = "Powerpack, large";
		else if (ammoPack == "ammo_kinetic")
			ammoType = "Kinetic Slugs";
		else if (ammoPack == "ammo_missile")
			ammoType = "Missiles";

		// Initialise data if not already set.
		if (getStoredInt("ammo_used") < 0)
			setStoredInt("ammo_used", 0);

		ammoCount << maxAmmo - getStoredInt("ammo_used") << "/" << maxAmmo;

		alm->insertAttribute("wpn_ammo_count", ammoCount);
		alm->insertAttribute("wpn_ammo_type", ammoType);
	}

	//Damage Information
	StringBuffer dmgtxt;

	switch (damageType) {
	case SharedWeaponObjectTemplate::KINETIC:
		dmgtxt << "Kinetic";
		break;
	case SharedWeaponObjectTemplate::ENERGY:
		dmgtxt << "Energy";
		break;
	case SharedWeaponObjectTemplate::ELECTRICITY:
		dmgtxt << "Electricity";
		break;
	case SharedWeaponObjectTemplate::STUN:
		dmgtxt << "Stun";
		break;
	case SharedWeaponObjectTemplate::BLAST:
		dmgtxt << "Blast";
		break;
	case SharedWeaponObjectTemplate::HEAT:
		dmgtxt << "Heat";
		break;
	case SharedWeaponObjectTemplate::COLD:
		dmgtxt << "Cold";
		break;
	case SharedWeaponObjectTemplate::ACID:
		dmgtxt << "Acid";
		break;
	case SharedWeaponObjectTemplate::LIGHTSABER:
		dmgtxt << "Lightsaber";
		break;
	default:
		dmgtxt << "Unknown";
		break;
	}

	alm->insertAttribute("damage.wpn_damage_type", dmgtxt);

	float minDmg = round(getMinDamage());
	float maxDmg = round(getMaxDamage());
	int bDamage = getBonusDamage();

	StringBuffer dmg;

	if (bDamage > 0)
		dmg << minDmg << "d" << maxDmg << " + " << bDamage;
	else
		dmg << minDmg << "d" << maxDmg;

	
	int skillDamage = 0;
	if (isMeleeWeapon() || isUnarmedWeapon()){
		skillDamage = object->getSkillMod("rp_melee_bonus");
	}
	
	if (isJediWeapon()) {
		skillDamage = object->getSkillMod("rp_lightsaber");
	}

	if (skillDamage > 0)
		dmg << " + \\#00FF00" << skillDamage << "\\#.";

	alm->insertAttribute("damage.dmgdice", dmg);

	if (getDamageRadius() != 0.0f)
		alm->insertAttribute("damage.radius", Math::getPrecision(getDamageRadius(), 0));

	//alm->insertAttribute("damage.wpn_damage_max", maxDmg);

	//StringBuffer woundsratio;

	//float wnd = round(10 * getWoundsRatio()) / 10.0f;

	//woundsratio << wnd << "%";

	//alm->insertAttribute("damage.wpn_wound_chance", woundsratio);

	// Too close (DC15): 0m - min range
	// Ideal range (DC10): min range - ideal range
	// Too far (DC20): ideal range - max range
	// Out of range (DC99): max range+

	//Accuracy Modifiers
	StringBuffer pblank;
	pblank << " 0m - " << getPointBlankRange() << "m";
	alm->insertAttribute("cat_wpn_rangemods.wpn_range_zero", pblank);

	StringBuffer ideal;
	ideal << getPointBlankRange() << "m - " << getIdealRange() << "m";
	alm->insertAttribute("cat_wpn_rangemods.wpn_range_mid", ideal);

	StringBuffer maxrange;
	maxrange << getIdealRange() << "m - " << getMaxRange() << "m";
	alm->insertAttribute("cat_wpn_rangemods.wpn_range_max", maxrange);

	StringBuffer outofrange;
	outofrange << getMaxRange() << "m+";
	alm->insertAttribute("cat_wpn_rangemods.wpn_range_outofrange", outofrange);

	//Special Attack Costs
	//alm->insertAttribute("cat_wpn_attack_cost.health", getHealthAttackCost());
	//
	//alm->insertAttribute("cat_wpn_attack_cost.action", getActionAttackCost());
	//
	//alm->insertAttribute("cat_wpn_attack_cost.mind", getMindAttackCost());

	//Anti Decay Kit
	//if(hasAntiDecayKit()){
	//	alm->insertAttribute("@veteran_new:antidecay_examine_title", "@veteran_new:antidecay_examine_text");
	//}
	//
	//// Force Cost
	//if (getForceCost() > 0)
	//	alm->insertAttribute("forcecost", (int)getForceCost());
	//

	/*
	for (int i = 0; i < getNumberOfDots(); i++) {

			String dt;

			switch (getDotType(i)) {
			case 1:
				dt = "Poison";
				break;
			case 2:
				dt = "Disease";
				break;
			case 3:
				dt = "Fire";
				break;
			case 4:
				dt = "Bleeding";
				break;
			default:
				dt = "Unknown";
				break;
			}

			StringBuffer type;
			type << "cat_wpn_dot_0" << i << ".wpn_dot_type";
			alm->insertAttribute(type.toString(), dt);

			String da;

			switch (getDotAttribute(i)) {
			case 0:
				da = "Health";
				break;
			case 1:
				da = "Strength";
				break;
			case 2:
				da = "Constitution";
				break;
			case 3:
				da = "Action";
				break;
			case 4:
				da = "Quickness";
				break;
			case 5:
				da = "Stamina";
				break;
			case 6:
				da = "Mind";
				break;
			case 7:
				da = "Focus";
				break;
			case 8:
				da = "Willpower";
				break;
			default:
				da = "Unknown";
				break;
			}

			StringBuffer attrib;
			attrib << "cat_wpn_dot_0" << i << ".wpn_dot_attrib";
			alm->insertAttribute(attrib.toString(), da);

			StringBuffer str;
			str << "cat_wpn_dot_0" << i << ".wpn_dot_strength";
			alm->insertAttribute(str.toString(), getDotStrength(i));

			StringBuffer dotDur;
			dotDur << getDotDuration(i) << "s";
			StringBuffer dur;
			dur << "cat_wpn_dot_0" << i << ".wpn_dot_duration";
			alm->insertAttribute(dur.toString(), dotDur);

			StringBuffer dotPot;
			dotPot << getDotPotency(i) << "%";
			StringBuffer pot;
			pot << "cat_wpn_dot_0" << i << ".wpn_dot_potency";
			alm->insertAttribute(pot.toString(), dotPot);

			StringBuffer use;
			use << "cat_wpn_dot_0" << i << ".wpn_dot_uses";
			alm->insertAttribute(use.toString(), getDotUses(i));
		}

	if (hasPowerup())
		powerupObject->fillWeaponAttributeList(alm, _this.getReferenceUnsafeStaticCast());

	*/
	if (sliced == 1)
		alm->insertAttribute("wpn_attr", "@obj_attr_n:hacked1");

	if(isThrownWeapon()) {
		alm->insertAttribute("restrictions.uses_primary_attribute", "Throwing");
	} else {
		if(weaponTemplate->getUsesPrimaryAttributeOnly()) {
			alm->insertAttribute("restrictions.uses_primary_attribute", "Primary Only");
		} else {
			alm->insertAttribute("restrictions.uses_primary_attribute", "Either");
		}
	}	

	if(requiredSkill != "") {
		alm->insertAttribute("restrictions.requiredSkill", BorString::capitalise(requiredSkill) + " " + String::valueOf(requiredLevel));
	}

	if(weaponTemplate->getPowerAttackIsRestricted()) {
		alm->insertAttribute("restrictions.no_power_attack", "True");
	}

	if(weaponTemplate->getFlurryAttackIsRestricted()) {
		alm->insertAttribute("restrictions.no_flurry_attack", "True");
	}

	if(weaponTemplate->getAimedAttackIsRestricted()) {
		alm->insertAttribute("restrictions.no_aimed_attack", "True");
	}

	if(weaponTemplate->getIsLightsaberResistent()) {
		alm->insertAttribute("restrictions.lightsaber_resistant", "True");
	}

	if(weaponTemplate->getDodgeIsRestricted()) {
		alm->insertAttribute("restrictions.no_dodging", "True");
	}

	if(weaponTemplate->getDefendIsRestricted()) {
		alm->insertAttribute("restrictions.no_defending", "True");
	}

	if(weaponTemplate->getParryIsRestricted()) {
		alm->insertAttribute("restrictions.no_parrying", "True");
	}
}

int WeaponObjectImplementation::getPointBlankAccuracy(bool withPup) const {
	if (powerupObject != nullptr && withPup)
		return pointBlankAccuracy + (abs(pointBlankAccuracy) * powerupObject->getPowerupStat("pointBlankAccuracy"));

	return pointBlankAccuracy;
}

int WeaponObjectImplementation::getPointBlankRange(bool withPup) const {
	if (powerupObject != nullptr && withPup)
		return pointBlankRange + (abs(pointBlankRange) * powerupObject->getPowerupStat("pointBlankRange"));

	return pointBlankRange;
}

int WeaponObjectImplementation::getIdealRange(bool withPup) const {
	if (powerupObject != nullptr && withPup)
		return idealRange + (abs(idealRange) * powerupObject->getPowerupStat("idealRange"));

	return idealRange;
}

int WeaponObjectImplementation::getMaxRange(bool withPup) const {
	if (powerupObject != nullptr && withPup)
		return maxRange + (abs(maxRange) * powerupObject->getPowerupStat("maxRange"));

	return maxRange;
}

int WeaponObjectImplementation::getIdealAccuracy(bool withPup) const {
	if (powerupObject != nullptr && withPup)
		return idealAccuracy + (abs(idealAccuracy) * powerupObject->getPowerupStat("idealAccuracy"));

	return idealAccuracy;
}


int WeaponObjectImplementation::getMaxRangeAccuracy(bool withPup) const {
	if (powerupObject != nullptr && withPup)
		return maxRangeAccuracy + (abs(maxRangeAccuracy) * powerupObject->getPowerupStat("maxRangeAccuracy"));

	return maxRangeAccuracy;
}

float WeaponObjectImplementation::getAttackSpeed(bool withPup) const {
	float speed = attackSpeed;

	if (sliced)
		speed *= speedSlice;

	if (powerupObject != nullptr && withPup)
		speed -= (speed * powerupObject->getPowerupStat("attackSpeed"));

	float calcSpeed = speed + getConditionReduction(speed);

	if (calcSpeed < 0.1f)
		calcSpeed = 0.1f;

	return calcSpeed;
}


float WeaponObjectImplementation::getMaxDamage(bool withPup) const {
	float damage = maxDamage;

	if (sliced)
		damage *= damageSlice;

	if (powerupObject != nullptr && withPup) {
		damage += (damage * powerupObject->getPowerupStat("maxDamage"));
		return damage;
	}

	return damage;
}

float WeaponObjectImplementation::getMinDamage(bool withPup) const {
	float damage = minDamage;

	if (sliced)
		damage *= damageSlice;

	if (powerupObject != nullptr && withPup) {
		damage += (damage * powerupObject->getPowerupStat("minDamage"));
		return damage;
	}

	return damage;
}

float WeaponObjectImplementation::getBonusDamage() const {
	return bonusDamage;
}

int WeaponObjectImplementation::getSkillLevel() const {
	return rpSkillLevel;
}

float WeaponObjectImplementation::getWoundsRatio(bool withPup) const {
	if (powerupObject != nullptr && withPup)
		return woundsRatio + (woundsRatio * powerupObject->getPowerupStat("woundsRatio"));

	return woundsRatio;
}

float WeaponObjectImplementation::getDamageRadius(bool withPup) const {
	if (powerupObject != nullptr && withPup)
		return damageRadius + (damageRadius * powerupObject->getPowerupStat("damageRadius"));

	return damageRadius;
}


int WeaponObjectImplementation::getHealthAttackCost(bool withPup) const {
	if (powerupObject != nullptr && withPup)
		return healthAttackCost - (abs(healthAttackCost) * powerupObject->getPowerupStat("healthAttackCost"));

	return healthAttackCost;
}

int WeaponObjectImplementation::getActionAttackCost(bool withPup) const {
	if (powerupObject != nullptr && withPup)
		return actionAttackCost - (abs(actionAttackCost) * powerupObject->getPowerupStat("actionAttackCost"));

	return actionAttackCost;
}

int WeaponObjectImplementation::getMindAttackCost(bool withPup) const {
	if (powerupObject != nullptr && withPup)
		return mindAttackCost - (abs(mindAttackCost) * powerupObject->getPowerupStat("mindAttackCost"));

	return mindAttackCost;
}

void WeaponObjectImplementation::updateCraftingValues(CraftingValues* values, bool firstUpdate) {
	/*
	 * Incoming Values:					Ranges:
	 * mindamage						Differs between weapons
	 * maxdamage
	 * attackspeed
	 * woundchance
	 * roundsused
	 * hitpoints
	 * zerorangemod
	 * maxrange
	 * maxrangemod
	 * midrange
	 * midrangemod
	 * charges
	 * attackhealthcost
	 * attackactioncost
	 * attackmindcost
	 */
	float value = 0.f;
	//setMinDamage(Math::max(values->getCurrentValue("mindamage"), 0.f));
	//setMaxDamage(Math::max(values->getCurrentValue("maxdamage"), 0.f));
//
	//setAttackSpeed(values->getCurrentValue("attackspeed"));
	//setHealthAttackCost((int)values->getCurrentValue("attackhealthcost"));
	//setActionAttackCost((int)values->getCurrentValue("attackactioncost"));
	//setMindAttackCost((int)values->getCurrentValue("attackmindcost"));

	if (isJediWeapon()) {
		//setForceCost(Math::getPrecision(values->getCurrentValue("forcecost"), 1));
		setBladeColor(31);
	}

	//value = values->getCurrentValue("woundchance");
	//if (value != ValuesMap::VALUENOTFOUND)
	//	setWoundsRatio(value);

	//value = craftingValues->getCurrentValue("roundsused");
	//if(value != DraftSchematicValuesImplementation::VALUENOTFOUND)
		//_this.getReferenceUnsafeStaticCast()->set_______(value);

	//value = values->getCurrentValue("zerorangemod");
	//if (value != ValuesMap::VALUENOTFOUND)
	//	setPointBlankAccuracy((int)value);

	//value = values->getCurrentValue("maxrange");
	//if (value != ValuesMap::VALUENOTFOUND)
	//	setMaxRange((int)value);

	//value = values->getCurrentValue("maxrangemod");
	//if (value != ValuesMap::VALUENOTFOUND)
	//	setMaxRangeAccuracy((int)value);

	//value = values->getCurrentValue("midrange");
	//if (value != ValuesMap::VALUENOTFOUND)
	//	setIdealRange((int)value);

	//value = values->getCurrentValue("midrangemod");
	//if (value != ValuesMap::VALUENOTFOUND)
	//	setIdealAccuracy((int)value);

	//value = craftingValues->getCurrentValue("charges");
	//if(value != CraftingValues::VALUENOTFOUND)
	//	setUsesRemaining((int)value);

	//value = values->getCurrentValue("hitpoints");
	//if (value != ValuesMap::VALUENOTFOUND)
	//	setMaxCondition((int)value);

	setConditionDamage(0);
}

bool WeaponObjectImplementation::isCertifiedFor(CreatureObject* object) const {
	ManagedReference<PlayerObject*> ghost = object->getPlayerObject();

	if (ghost == nullptr)
		return false;

	const auto certificationsRequired = weaponTemplate->getCertificationsRequired();

	for (int i = 0; i < certificationsRequired->size(); ++i) {
		const String& cert = certificationsRequired->get(i);

		if (!ghost->hasAbility(cert) && !object->hasSkill(cert)) {
			return false;
		}
	}

	return true;
}

void WeaponObjectImplementation::decreasePowerupUses(CreatureObject* player) {
	if (hasPowerup()) {
		powerupObject->decreaseUses();

		if (powerupObject->getUses() < 1) {
			Locker locker(_this.getReferenceUnsafeStaticCast());
			StringIdChatParameter message("powerup", "prose_pup_expire"); //The powerup on your %TT has expired.
			message.setTT(getDisplayedName());

			player->sendSystemMessage(message);

			ManagedReference<PowerupObject*> pup = removePowerup();

			if (pup != nullptr) {
				Locker plocker(pup);

				pup->destroyObjectFromWorld( true );
				pup->destroyObjectFromDatabase( true );
			}
		}

		sendAttributeListTo(player);
	}
}

String WeaponObjectImplementation::repairAttempt(int repairChance) {
	String message = "@error_message:";

	if(repairChance < 25) {
		message += "sys_repair_failed";
		setMaxCondition(1, true);
		setConditionDamage(0, true);
	} else if(repairChance < 50) {
		message += "sys_repair_imperfect";
		setMaxCondition(getMaxCondition() * .65f, true);
		setConditionDamage(0, true);
	} else if(repairChance < 75) {
		setMaxCondition(getMaxCondition() * .80f, true);
		setConditionDamage(0, true);
		message += "sys_repair_slight";
	} else {
		setMaxCondition(getMaxCondition() * .95f, true);
		setConditionDamage(0, true);
		message += "sys_repair_perfect";
	}

	return message;
}

void WeaponObjectImplementation::decay(CreatureObject* user) {
	if (_this.getReferenceUnsafeStaticCast() == user->getSlottedObject("default_weapon") || user->isAiAgent() || hasAntiDecayKit()) {
		return;
	}

	int roll = System::random(100);
	int chance = 5;

	if (hasPowerup())
		chance += 10;

	if (roll < chance) {
		Locker locker(_this.getReferenceUnsafeStaticCast());

		if (isJediWeapon()) {
			ManagedReference<SceneObject*> saberInv = getSlottedObject("saber_inv");

			if (saberInv == nullptr)
				return;

			// TODO: is this supposed to be every crystal, or random crystal(s)?
			for (int i = 0; i < saberInv->getContainerObjectsSize(); i++) {
				ManagedReference<LightsaberCrystalComponent*> crystal = saberInv->getContainerObject(i).castTo<LightsaberCrystalComponent*>();

				if (crystal != nullptr) {
					crystal->inflictDamage(crystal, 0, 1, true, true);
				}
			}
		} else {
			inflictDamage(_this.getReferenceUnsafeStaticCast(), 0, 1, true, true);

			if (((float)conditionDamage - 1 / (float)maxCondition < 0.75) && ((float)conditionDamage / (float)maxCondition > 0.75))
				user->sendSystemMessage("@combat_effects:weapon_quarter");
			if (((float)conditionDamage - 1 / (float)maxCondition < 0.50) && ((float)conditionDamage / (float)maxCondition > 0.50))
				user->sendSystemMessage("@combat_effects:weapon_half");
		}
	}
}

bool WeaponObjectImplementation::isEquipped() {
	ManagedReference<SceneObject*> parent = getParent().get();
	if (parent != nullptr && parent->isPlayerCreature())
		return true;

	return false;
}

void WeaponObjectImplementation::applySkillModsTo(CreatureObject* creature) const {
	if (creature == nullptr) {
		return;
	}

	for (int i = 0; i < wearableSkillMods.size(); ++i) {
		const String& name = wearableSkillMods.elementAt(i).getKey();
		int value = wearableSkillMods.get(name);

		if (!SkillModManager::instance()->isWearableModDisabled(name)) {
			creature->addSkillMod(SkillModManager::WEARABLE, name, value, true);
			creature->updateTerrainNegotiation();
		}
	}

	SkillModManager::instance()->verifyWearableSkillMods(creature);
}

void WeaponObjectImplementation::removeSkillModsFrom(CreatureObject* creature) {
	if (creature == nullptr) {
		return;
	}

	for (int i = 0; i < wearableSkillMods.size(); ++i) {
		const String& name = wearableSkillMods.elementAt(i).getKey();
		int value = wearableSkillMods.get(name);

		if (!SkillModManager::instance()->isWearableModDisabled(name)) {
			creature->removeSkillMod(SkillModManager::WEARABLE, name, value, true);
			creature->updateTerrainNegotiation();
		}
	}

	SkillModManager::instance()->verifyWearableSkillMods(creature);
}

bool WeaponObjectImplementation::applyPowerup(CreatureObject* player, PowerupObject* pup) {
	if (hasPowerup())
		return false;

	addMagicBit(true);

	powerupObject = pup;

	if (pup->getParent() != nullptr) {
		Locker clocker(pup, player);
		pup->destroyObjectFromWorld(true);
	}

	sendAttributeListTo(player);

	return true;
}

Reference<PowerupObject*> WeaponObjectImplementation::removePowerup() {
	if (!hasPowerup())
		return nullptr;

	auto pup = powerupObject;
	powerupObject = nullptr;

	removeMagicBit(true);

	return pup;
}

//https://www.empireinflames.com/

void WeaponObjectImplementation::holsterWeapon(CreatureObject* player) {
	String errorDescription;
	if (player->canAddObject(_this.castTo<WeaponObject*>(), 6, errorDescription) != 0) {
		return;
	}

	StringBuffer args;
	args << player->getObjectID() << " 7 0 0 0";
	String stringArgs = args.toString();

	player->executeObjectControllerAction(STRING_HASHCODE("transferitemmisc"), this->getObjectID(), stringArgs);
}

void WeaponObjectImplementation::unholsterWeapon(CreatureObject* player) {

	ManagedReference<SceneObject*> heldWeapon = player->getSlottedObject("hold_r");

	if (heldWeapon != nullptr) {
		SceneObject* playerInventory = player->getSlottedObject("inventory");
		StringBuffer args;
		args << playerInventory->getObjectID() << " -1 0 0 0";
		String stringArgs = args.toString();
		player->executeObjectControllerAction(STRING_HASHCODE("transferitemmisc"), heldWeapon->getObjectID(), stringArgs);
	}

	heldWeapon = player->getSlottedObject("hold_l");

	if (heldWeapon != nullptr) {
		SceneObject* playerInventory = player->getSlottedObject("inventory");
		StringBuffer args;
		args << playerInventory->getObjectID() << " -1 0 0 0";
		String stringArgs = args.toString();
		player->executeObjectControllerAction(STRING_HASHCODE("transferitemmisc"), heldWeapon->getObjectID(), stringArgs);
	}
	
	String errorDescription;
	if (player->canAddObject(_this.castTo<WeaponObject*>(), 4, errorDescription) != 0)
		return;

	StringBuffer args;
	args << player->getObjectID() << " 4 0 0 0";
	String stringArgs = args.toString();

	player->executeObjectControllerAction(STRING_HASHCODE("transferitemweapon"), this->getObjectID(), stringArgs);

}


void WeaponObjectImplementation::npcHolsterWeapon(CreatureObject* npc) {
	String errorDescription;
	if (npc->canAddObject(_this.castTo<WeaponObject*>(), 6, errorDescription) != 0) {
		return;
	}

	ZoneServer* zoneServer = getZoneServer();

	if (zoneServer == nullptr)
		return;

	ObjectController* objectController = zoneServer->getObjectController();

	objectController->transferObject(_this.castTo<WeaponObject*>(), npc, 6, true, true);
}
