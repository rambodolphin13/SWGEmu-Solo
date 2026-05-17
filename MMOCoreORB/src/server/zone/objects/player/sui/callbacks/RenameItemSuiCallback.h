/*
 * RenameItemSuiCallback.h
 *
 * Custom solo-server item rename callback.
 */

#ifndef RENAMEITEMSUICALLBACK_H_
#define RENAMEITEMSUICALLBACK_H_

#include "server/zone/objects/player/sui/SuiCallback.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/ZoneProcessServer.h"
#include "server/zone/managers/name/NameManager.h"
#include "server/zone/objects/player/sui/inputbox/SuiInputBox.h"

class RenameItemSuiCallback : public SuiCallback {
public:
	RenameItemSuiCallback(ZoneServer* serv) : SuiCallback(serv) {
	}

	void run(CreatureObject* player, SuiBox* sui, uint32 eventIndex, Vector<UnicodeString>* args) {
		if (player == nullptr || sui == nullptr)
			return;

		bool cancelPressed = (eventIndex == 1);

		if (!sui->isInputBox() || cancelPressed || args->size() < 1)
			return;

		ManagedReference<SceneObject*> object = sui->getUsingObject().get();

		if (object == nullptr)
			return;

		if (!object->isASubChildOf(player)) {
			player->sendSystemMessage("You can only rename items you own.");
			return;
		}

		if (!object->isTangibleObject()) {
			player->sendSystemMessage("Only tangible inventory items can be renamed.");
			return;
		}

		// Keep this inventory-focused for safety.
		if (object->getParent().get() == player) {
			player->sendSystemMessage("Unequip the item before renaming it.");
			return;
		}

		String newName = args->get(0).toString();

		if (newName.isEmpty()) {
			player->sendSystemMessage("Item name cannot be blank.");
			return;
		}

		if (newName.length() > 40) {
			player->sendSystemMessage("Item name is too long. Use 40 characters or fewer.");
			return;
		}

		ZoneProcessServer* zoneProcess = player->getZoneProcessServer();

		if (zoneProcess == nullptr)
			return;

		NameManager* nameManager = zoneProcess->getNameManager();

		if (nameManager != nullptr && nameManager->checkNamingFilter(newName) != NameManagerResult::ACCEPTED) {
			player->sendSystemMessage("That item name was rejected by the name filter.");
			return;
		}

		Locker locker(object, player);

		String oldName = object->getDisplayedName();

		object->setCustomObjectName(newName, true);

		player->sendSystemMessage("Item renamed from '" + oldName + "' to '" + newName + "'.");
	}
};

#endif // RENAMEITEMSUICALLBACK_H_
