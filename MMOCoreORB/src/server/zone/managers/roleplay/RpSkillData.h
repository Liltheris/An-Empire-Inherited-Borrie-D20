#ifndef RPSKILLDATA_H_
#define RPSKILLDATA_H_

#include "engine/engine.h"

namespace server {
namespace zone {
namespace managers {
namespace roleplay {

class RpSkillData : public Object {
	String name;
	String parentSkillName;
	String altParentSkill;

public:

	RpSkillData(){
		name, parentSkillName, altParentSkill = "";
	}

	RpSkillData(String newName, String newParent, String newAltParent){
		name = newName;
		parentSkillName = newParent;
		altParentSkill = newAltParent;
	}

	String getName() const {
		return name;
	}

	String getParent() const {
		return parentSkillName;
	}

	String getAltParent() const {
		return altParentSkill;
	}

	void setName(String newName){
		name = newName;
	}

	void setParent(String newParent){
		parentSkillName = newParent;
	}

	void setAltParent(String newParent){
		altParentSkill = newParent;
	}
};

}
}
}
}

#endif 