#ifndef RPCOMBATANIMSET_H_
#define RPCOMBATANIMSET_H_

#include "engine/engine.h"

namespace server {
namespace zone {
namespace managers {
namespace roleplay {

class RpCombatAnimSet : public Object {
	bool isSimple;

	Vector<String> basicAnims;
	Vector<String> flurryAnims;
	Vector<String> powerAnims;

	Vector<String> basicAnims_weak;
	Vector<String> basicAnims_mid;
	Vector<String> basicAnims_strong;

public:

	RpCombatAnimSet(){
		isSimple = true;
	}

	RpCombatAnimSet(bool simpleAnimSet){
		isSimple = simpleAnimSet;
	}

	bool addBasicAnim(String animName, String type = ""){
		if (isSimple){
			return basicAnims.add(animName);
		} else if (type == ""){
			return false;
		} else {
			if (type == "weak")
				return basicAnims_weak.add(animName);
			else if (type == "mid")
				return basicAnims_mid.add(animName);
			else if (type == "strong")
				return basicAnims_strong.add(animName);
			else return false;
		}

		return true;
	}

	bool addFlurryAnim(String animName){
		return flurryAnims.add(animName);
	}

	bool addPowerAnim(String animName){
		return powerAnims.add(animName);
	}

	String getBasicAnim(int level = 0) const {
		if (isSimple)
			return completeAnim(basicAnims.get(System::random(basicAnims.size()-1)));

		// Non-simple anims are based on a strength level.
		switch (level){
			case 0: return completeWeakAnim(basicAnims_weak.get(System::random(basicAnims_weak.size()-1)));
			case 1: return completeAnim(basicAnims_mid.get(System::random(basicAnims_mid.size()-1)));
			case 2: return completeAnim(basicAnims_strong.get(System::random(basicAnims_strong.size()-1)));
			// return a simple anim if we get a weird value.
			default: return completeAnim(basicAnims_weak.get(System::random(basicAnims_weak.size()-1)));
		}

		return "";
	}

	String completeWeakAnim(String anim) const {
		String intensity = System::random(1) == 1 ? "_medium" : "_light";

		return anim + intensity + "_" + String::valueOf(System::random(3));
	}

	String completeAnim(String anim) const {
		String intensity = System::random(1) == 1 ? "_medium" : "_light";

		return anim + intensity;
	}

	String getPowerAnim(){
		return powerAnims.get(System::random(powerAnims.size()-1));
	}

	String getFlurryAnim(){
		return flurryAnims.get(System::random(flurryAnims.size()-1));
	}
};

}
}
}
}

#endif 