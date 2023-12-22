#ifndef RPREPAIRCOMMAND_H_
#define RPREPAIRCOMMAND_H_

#include "QueueCommand.h"

class RpRepairCommand : public QueueCommand {

public:
	RpRepairCommand(const String& name, ZoneProcessServer* serv) : QueueCommand(name, serv) {
		
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		return SUCCESS;
	}
};

#endif

