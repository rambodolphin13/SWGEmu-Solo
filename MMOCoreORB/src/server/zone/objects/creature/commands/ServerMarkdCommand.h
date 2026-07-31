#ifndef SERVERMARKDCOMMAND_H_
#define SERVERMARKDCOMMAND_H_

#include <fstream>

class ServerMarkdCommand {
public:
	static int executeCommand(CreatureObject* creature, uint64 target, const UnicodeString& arguments) {
		if (creature == nullptr || !creature->isPlayerCreature())
			return 1;

		PlayerObject* ghost = creature->getPlayerObject();
		if (ghost == nullptr || !ghost->isPrivileged()) {
			creature->sendSystemMessage("You do not have permission to mark entertainer locations.");
			return 1;
		}

		Zone* zone = creature->getZone();
		if (zone == nullptr) {
			creature->sendSystemMessage("Unable to determine the current zone.");
			return 1;
		}

		StringBuffer entry;
		entry << "{ role = \"dancer\", planet = \"" << zone->getZoneName()
			  << "\", x = " << creature->getPositionX()
			  << ", z = " << creature->getPositionZ()
			  << ", y = " << creature->getPositionY()
			  << ", heading = " << creature->getDirectionAngle()
			  << ", cellID = " << creature->getParentID() << " },";

		String line = entry.toString();
		creature->sendSystemMessage("Dancer location marked:");
		creature->sendSystemMessage(line);

		std::ofstream logFile("log/entertainer_locations.log", std::ios::out | std::ios::app);
		if (!logFile.is_open()) {
			creature->sendSystemMessage("Could not open log/entertainer_locations.log; copy the line from chat.");
			return 1;
		}

		logFile << line.toCharArray() << std::endl;
		logFile.close();
		creature->sendSystemMessage("Saved to log/entertainer_locations.log");
		return 0;
	}

	static void sendSyntax(CreatureObject* player) {
		if (player != nullptr)
			player->sendSystemMessage("Syntax: /server markd");
	}
};

#endif // SERVERMARKDCOMMAND_H_
