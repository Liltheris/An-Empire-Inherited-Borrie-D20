/*
 * SharedWeaponObjectTemplate.h
 *
 *  Created on: 05/05/2010
 *      Author: victor
 */

#ifndef SHAREDWEAPONOBJECTTEMPLATE_H_
#define SHAREDWEAPONOBJECTTEMPLATE_H_

#include "templates/SharedTangibleObjectTemplate.h"

class SharedWeaponObjectTemplate: public SharedTangibleObjectTemplate {
protected:
	StringParam weaponEffect;
	IntegerParam weaponEffectIndex;
	IntegerParam attackType;

	int damageType;

	int armorPiercing;

	int healthAttackCost;
	int actionAttackCost;
	int mindAttackCost;
	float forceCost;

	int pointBlankAccuracy;
	int pointBlankRange;

	int idealRange;
	int idealAccuracy;

	int maxRange;
	int maxRangeAccuracy;

	int minDamage;
	int maxDamage;
	int bonusDamage;

	int rpSkillLevel;

	int maxAmmo;

	float woundsRatio;

	int area;

	float attackSpeed;

	int bladeColor;

	String combatSpam;
	String animationType;

	String alternateGrip;

	String ammoPack;

	String requiredSkill;
	int requiredLevel;

	bool primaryAttributeOnly;
	bool dexOnlyWeapon;
	bool noPowerAttack;
	bool noFlurryAttack;
	bool noAimedAttack;
	bool lightsaberResistant;
	bool noDodgeReaction;
	bool noDefendReaction;
	bool noParryReaction;

	int blastRadius;

	Vector<String> damageModifiers;
	Vector<String> speedModifiers;
	Vector<String> creatureAccuracyModifiers;
	Vector<String> creatureAimModifiers;
	Vector<String> defenderDefenseModifiers;
	Vector<String> defenderSecondaryDefenseModifiers;
	Vector<String> defenderToughnessModifiers;

	String xpType;

	uint32 weaponType;

public:
	enum APType {
		NONE,
		LIGHT,
		MEDIUM,
		HEAVY
	};
	enum DamageType {
		KINETIC = 1,
		ENERGY = 2,
		BLAST = 4,
		STUN = 8,
		LIGHTSABER = 16,
		HEAT = 32,
		COLD = 64,
		ACID = 128,
		ELECTRICITY = 256
	};

	// multiple weapon type scenarios
	enum WeaponClass {
		MELEEWEAPON = 0xF0,
		RANGEDWEAPON = 0x1F0B, // these are all weapons derived from ranged in the client
		JEDIWEAPON = 0xE000,
	};

	enum WeaponAttackType {
		MELEEATTACK = 0,
		RANGEDATTACK = 1,
		FORCEATTACK = 2,
		TRAPATTACK = 3,
		GRENADEATTACK = 4,
		HEAVYACIDBEAMATTACK = 14,
		HEAVYLIGHTNINGBEAMATTACK = 15,
		HEAVYPARTICLEBEAMATTACK = 17,
		HEAVYROCKETLAUNCHERATTACK = 18,
		HEAVYLAUNCHERATTACK = 19
	};

	enum WeaponType {
		ANYWEAPON = 0xFFFFFFFF,
		THROWNWEAPON = 0x1,
		HEAVYWEAPON = 0x2,
		MINEWEAPON = 0x4,
		SPECIALHEAVYWEAPON = 0x8,
		UNARMEDWEAPON = 0x10,
		ONEHANDMELEEWEAPON = 0x20,
		TWOHANDMELEEWEAPON = 0x40,
		POLEARMWEAPON = 0x80,
		PISTOLWEAPON = 0x100,
		CARBINEWEAPON = 0x200,
		RIFLEWEAPON = 0x400,
		GRENADEWEAPON = 0x800,
		LIGHTNINGRIFLEWEAPON = 0x1000,
		ONEHANDJEDIWEAPON = 0x2000,
		TWOHANDJEDIWEAPON = 0x4000,
		POLEARMJEDIWEAPON = 0x8000
	};


	SharedWeaponObjectTemplate() {
		damageType = 0;

		armorPiercing = 0;

		healthAttackCost = 0;
		actionAttackCost = 0;
		mindAttackCost = 0;
		forceCost = 0.0;

		pointBlankAccuracy = 0;
		pointBlankRange = 0;

		idealRange = 0;
		idealAccuracy = 0;

		maxRange = 0;
		maxRangeAccuracy = 0;

		minDamage = 0;
		maxDamage = 0;
		bonusDamage = 0;

		woundsRatio = 0;

		area = 0;

		attackSpeed = 0;

		weaponType = 0xFFFFFFFF;

		rpSkillLevel = 1;

		maxAmmo = -1;

		bladeColor = -1;

		alternateGrip = "";

		ammoPack = "";

		primaryAttributeOnly = false;
		dexOnlyWeapon = false;
		noPowerAttack = false;
		noFlurryAttack = false;
		noAimedAttack = false;
		lightsaberResistant = false;
		noDodgeReaction = false;
		noDefendReaction = false;
		noParryReaction = false;

		blastRadius = 0;
	}

	~SharedWeaponObjectTemplate() {

	}

	void readObject(LuaObject* templateData);
	void readObject(IffStream* iffStream);

	void parseVariableData(const String& varName, Chunk* data);
	void parseVariableData(const String& varName, LuaObject* templateData);

	void parseFileData(IffStream* iffStream);

	inline String getXpType() const {
		return xpType;
	}

	inline int getActionAttackCost() const {
		return actionAttackCost;
	}

	inline int getArea() const {
		return area;
	}

	inline int getArmorPiercing() const {
		return armorPiercing;
	}

	float getAttackSpeed() const {
		return attackSpeed;
	}

	inline float getForceCost() const {
		return forceCost;
	}

	inline int getHealthAttackCost() const {
		return healthAttackCost;
	}

	inline int getIdealAccuracy() const {
		return idealAccuracy;
	}

	inline int getIdealRange() const {
		return idealRange;
	}

	inline int getMaxDamage() const {
		return maxDamage;
	}

	inline int getMaxRange() const {
		return maxRange;
	}

	inline int getMaxRangeAccuracy() const {
		return maxRangeAccuracy;
	}

	inline int getMinDamage() const {
		return minDamage;
	}

	inline int getBonusDamage() const {
		return bonusDamage;
	}

	inline int getMindAttackCost() const {
		return mindAttackCost;
	}

	inline int getPointBlankAccuracy() const {
		return pointBlankAccuracy;
	}

	inline int getPointBlankRange() const {
		return pointBlankRange;
	}

	float getWoundsRatio() const {
		return woundsRatio;
	}

	void setActionAttackCost(int actionAttackCost) {
		this->actionAttackCost = actionAttackCost;
	}

	void setArea(int area) {
		this->area = area;
	}

	void setArmorPiercing(int armorPiercing) {
		this->armorPiercing = armorPiercing;
	}

	void setAttackSpeed(float attackSpeed) {
		this->attackSpeed = attackSpeed;
	}

	void setForceCost(float forceCost) {
		this->forceCost = forceCost;
	}

	void setHealthAttackCost(int healthAttackCost) {
		this->healthAttackCost = healthAttackCost;
	}

	void setIdealAccuracy(int idealAccuracy) {
		this->idealAccuracy = idealAccuracy;
	}

	void setIdealRange(int idealRange) {
		this->idealRange = idealRange;
	}

	void setMaxDamage(int maxDamage) {
		this->maxDamage = maxDamage;
	}

	void setMaxRange(int maxRange) {
		this->maxRange = maxRange;
	}

	void setMaxRangeAccuracy(int maxRangeAccuracy) {
		this->maxRangeAccuracy = maxRangeAccuracy;
	}

	void setMinDamage(int minDamage) {
		this->minDamage = minDamage;
	}

	void setBonusDamage(int bonusDamage) {
		this->bonusDamage = bonusDamage;
	}

	void setMindAttackCost(int mindAttackCost) {
		this->mindAttackCost = mindAttackCost;
	}

	void setPointBlankAccuracy(int pointBlankAccuracy) {
		this->pointBlankAccuracy = pointBlankAccuracy;
	}

	void setPointBlankRange(int pointBlankRange) {
		this->pointBlankRange = pointBlankRange;
	}

	void setWoundsRatio(float woundsRatio) {
		this->woundsRatio = woundsRatio;
	}

	const Vector<String>* getCertificationsRequired() const {
		return &certificationsRequired;
	}

	const Vector<String>* getCreatureAccuracyModifiers() const {
		return &creatureAccuracyModifiers;
	}

	const Vector<String>* getCreatureAimModifiers() const {
		return &creatureAimModifiers;
	}

	const Vector<String>* getDamageModifiers() const {
		return &damageModifiers;
	}

	inline int getDamageType() const {
		return damageType;
	}

	inline int getRpSkillLevel() const {
		return rpSkillLevel;
	}

	inline int getMaxAmmo() const {
		return maxAmmo;
	}

	inline int getBlastRadius() const {
		return blastRadius;
	}

	inline int getBladeColor() const {
		return bladeColor;
	}

	inline bool getUsesPrimaryAttributeOnly() const {
		return primaryAttributeOnly;
	}

	inline bool getIsDexOnlyWeapon() const {
		return dexOnlyWeapon;
	}

	inline bool getPowerAttackIsRestricted() const {
		return noPowerAttack;
	}

	inline bool getFlurryAttackIsRestricted() const {
		return noFlurryAttack;
	}

	inline bool getAimedAttackIsRestricted() const {
		return noAimedAttack;
	}

	inline bool getIsLightsaberResistent() const {
		return lightsaberResistant;
	}

	inline bool getDodgeIsRestricted() const {
		return noDodgeReaction;
	}

	inline bool getDefendIsRestricted() const {
		return noDefendReaction;
	}

	inline bool getParryIsRestricted() const {
		return noParryReaction;
	}

	inline String getDamageTypeString() const {
		switch (damageType) {
		case KINETIC:
			return "Kinetic";
		case ENERGY:
			return "Energy";
		case ELECTRICITY:
			return "Electricity";
		case STUN:
			return "Stun";
		case BLAST:
			return "Blast";
		case HEAT:
			return "Heat";
		case COLD:
			return "Cold";
		case ACID:
			return "Acid";
		case LIGHTSABER:
			return "Lightsaber";
		default:
			return "Unknown";
			break;
		}
	}

	inline String getRequiredSkill() const {
		return requiredSkill;
	}

	inline int getRequiredLevel() const {
		return requiredLevel;
	}

	const Vector<String>* getDefenderDefenseModifiers() const {
		return &defenderDefenseModifiers;
	}

	const Vector<String>* getDefenderSecondaryDefenseModifiers() const {
		return &defenderSecondaryDefenseModifiers;
	}

	const Vector<String>* getDefenderToughnessModifiers() const {
		return &defenderToughnessModifiers;
	}

	const Vector<String>* getSpeedModifiers() const {
		return &speedModifiers;
	}

	void setCertificationsRequired(Vector<String> certificationsRequired) {
		this->certificationsRequired = certificationsRequired;
	}

	void setCreatureAccuracyModifiers(Vector<String> creatureAccuracyModifiers) {
		this->creatureAccuracyModifiers = creatureAccuracyModifiers;
	}

	void setCreatureAimModifiers(Vector<String> creatureAimModifiers) {
		this->creatureAimModifiers = creatureAimModifiers;
	}

	void setDamageModifiers(Vector<String> damageModifiers) {
		this->damageModifiers = damageModifiers;
	}

	void setDamageType(int damageType) {
		this->damageType = damageType;
	}

	void setDefenderDefenseModifiers(Vector<String> defenderDefenseModifiers) {
		this->defenderDefenseModifiers = defenderDefenseModifiers;
	}

	void setDefenderSecondaryDefenseModifiers(Vector<String> defenderSecondaryDefenseModifiers) {
		this->defenderSecondaryDefenseModifiers	= defenderSecondaryDefenseModifiers;
	}

	void setDefenderToughnessModifiers(Vector<String> defenderToughnessModifiers) {
		this->defenderToughnessModifiers = defenderToughnessModifiers;
	}

	void setSpeedModifiers(Vector<String> speedModifiers) {
		this->speedModifiers = speedModifiers;
	}

	inline int getAttackType() const {
		return attackType;
	}

	const String& getWeaponEffect() const {
		return weaponEffect.get();
	}

	inline int getWeaponEffectIndex() const {
		return weaponEffectIndex;
	}

	void setAttackType(int attackType) {
		this->attackType = attackType;
	}

	void setWeaponEffect(String weaponEffect) {
		this->weaponEffect = weaponEffect;
	}

	const String& getAlternateGrip() const {
		return alternateGrip;
	}

	void setAlternateGrip(String alternateGrip) {
		this->alternateGrip = alternateGrip;
	}

	const String& getAmmoPack() const {
		return ammoPack;
	}

	void setWeaponEffectIndex(int weaponEffectIndex) {
		this->weaponEffectIndex = weaponEffectIndex;
	}

	const String& getCombatSpam() const {
		return combatSpam;
	}

	const String& getAnimationType() const {
		return animationType;
	}

	uint32 getWeaponType() const {
		return weaponType;
	}

	void setWeaponType(uint32 weaponType) {
		this->weaponType = weaponType;
	}

	bool isWeaponObjectTemplate() {
		return true;
	}

	int getPrice() {
		return price;
		/*
		if(customCostValue)
			return baseCost;
		else {
			float totalMaxDamage = (float)minDamage * (float)maxDamage;
			float damageTypeMod = 1;

			if(damageType == ENERGY)
				damageTypeMod = 1;
			else if(damageType == KINETIC)
				damageTypeMod = 1.05;
			else if(damageType == ELECTRICITY)
				damageTypeMod = 1.5;
			else if(damageType == STUN)
				damageTypeMod = 1.8;
			else if(damageType == BLAST)
				damageTypeMod = 2;
			else if(damageType == HEAT)
				damageTypeMod = 1.3;
			else if(damageType == COLD)
				damageTypeMod = 1.2;
			else if(damageType == ACID)
				damageTypeMod = 3;
			else if(damageType == LIGHTSABER)
				damageTypeMod = 10;

			float bonusDmg = (float)bonusDamage + 1;

			float dmg = (totalMaxDamage * 10) * bonusDmg;

			float skill = (float)rpSkillLevel + 1;

			float mathResult = (dmg * skill) * damageTypeMod;

			return ceil(mathResult);
		}
	*/
	}
	

};

#endif /* SHAREDWEAPONOBJECTTEMPLATE_H_ */
