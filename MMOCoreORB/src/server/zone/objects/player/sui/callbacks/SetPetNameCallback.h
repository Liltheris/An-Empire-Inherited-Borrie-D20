/*
 * SetPetNameCallback.h
 */

#ifndef SETNAMECALLBACK_H_
#define SETNAMECALLBACK_H_
#include "server/zone/objects/player/sui/SuiCallback.h"
#include "server/zone/Zone.h"


class SetPetNameCallback : public SuiCallback {
	ManagedWeakReference<ZoneServer*> server;
	ManagedWeakReference<SceneObject*> target;
	ManagedWeakReference<SceneObject*> targetController;
public:
	SetPetNameCallback(ZoneServer* serv, SceneObject* target, SceneObject* targetController) : SuiCallback(serv) {
		this->server = serv;
		this->target = target;
		this->targetController = targetController;
	}

	void run(CreatureObject* creature, SuiBox* sui, uint32 eventIndex, Vector<UnicodeString>* args) {
		bool cancelPressed = (eventIndex == 1);

		if(cancelPressed || server == nullptr)
			return;

		ManagedReference<SceneObject*> petObject = target.get();
		if(petObject == nullptr)
			return;

		ManagedReference<SceneObject*> controllerObject = targetController.get();
		if(controllerObject == nullptr)
			return;

		ManagedReference<ZoneServer*> zone = this->server.get();
		if (zone == nullptr)
			return;

		PlayerObject* ghost = creature->getPlayerObject();
		if (ghost == nullptr)
			return;

		String name = args->get(0).toString();

        petObject->setCustomObjectName(name, true);
		controllerObject->setCustomObjectName(name, true);

		creature->sendSystemMessage("Your pet as been renamed to '"+name+"' successfully."); 
	}
};




#endif /* SETPETNAMECALLBACK_H_ */
