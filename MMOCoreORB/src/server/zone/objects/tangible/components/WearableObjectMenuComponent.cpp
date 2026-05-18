/*
 * WearableObjectMenuComponent.cpp
 *
 *  Created on: 10/30/2011
 *      Author: kyle
 */

#include "server/zone/objects/creature/CreatureObject.h"
#include "WearableObjectMenuComponent.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "server/zone/managers/radial/RadialOptions.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/objects/player/sui/callbacks/RenameItemSuiCallback.h"
#include "server/zone/objects/player/sui/inputbox/SuiInputBox.h"

static bool hasWearableArrangement(SceneObject* object) {
	if (object == nullptr)
		return false;

	if (object->getArrangementDescriptorSize() <= 0)
		return false;

	for (int i = 0; i < object->getArrangementDescriptorSize(); ++i) {
		const Vector<String>* descriptors = object->getArrangementDescriptor(i);

		if (descriptors != nullptr && descriptors->size() > 0)
			return true;
	}

	return false;
}

static bool sharesWearableArrangement(SceneObject* equippedObject, SceneObject* donorObject) {
	if (equippedObject == nullptr || donorObject == nullptr)
		return false;

	if (!hasWearableArrangement(equippedObject) || !hasWearableArrangement(donorObject))
		return false;

	for (int equippedGroup = 0; equippedGroup < equippedObject->getArrangementDescriptorSize(); ++equippedGroup) {
		const Vector<String>* equippedDescriptors = equippedObject->getArrangementDescriptor(equippedGroup);

		if (equippedDescriptors == nullptr || equippedDescriptors->size() == 0)
			continue;

		for (int donorGroup = 0; donorGroup < donorObject->getArrangementDescriptorSize(); ++donorGroup) {
			const Vector<String>* donorDescriptors = donorObject->getArrangementDescriptor(donorGroup);

			if (donorDescriptors == nullptr || donorDescriptors->size() == 0)
				continue;

			for (int i = 0; i < equippedDescriptors->size(); ++i) {
				const String& equippedSlot = equippedDescriptors->get(i);

				for (int j = 0; j < donorDescriptors->size(); ++j) {
					const String& donorSlot = donorDescriptors->get(j);

					if (equippedSlot == donorSlot)
						return true;
				}
			}
		}
	}

	return false;
}

static SceneObject* findEquippedTransmogTarget(CreatureObject* player, SceneObject* donorObject) {
	if (player == nullptr || donorObject == nullptr)
		return nullptr;

	for (int i = 0; i < player->getSlottedObjectsSize(); ++i) {
		SceneObject* equippedObject = player->getSlottedObject(i);

		if (equippedObject == nullptr || equippedObject == donorObject)
			continue;

		if (!equippedObject->isTangibleObject())
			continue;

		if (sharesWearableArrangement(equippedObject, donorObject))
			return equippedObject;
	}

	return nullptr;
}

static void refreshTransmoggedItemForPlayer(SceneObject* item, CreatureObject* player) {
	if (item == nullptr || player == nullptr)
		return;

	item->sendDestroyTo(player);
	item->sendTo(player, true);
}

void WearableObjectMenuComponent::fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const {
	if (!sceneObject->isTangibleObject())
		return;

	TangibleObject* tano = cast<TangibleObject*>(sceneObject);

	if (tano == nullptr)
		return;

	if (tano->getConditionDamage() > 0 && tano->canRepair(player)) {
		menuResponse->addRadialMenuItem(70, 3, "@sui:repair");
	}

	if (player != nullptr && sceneObject->isASubChildOf(player) && hasWearableArrangement(sceneObject)) {
		ManagedReference<SceneObject*> parent = sceneObject->getParent().get();

		// Donor item in inventory/container.
		if (parent != nullptr && parent != player) {
			menuResponse->addRadialMenuItem(RadialOptions::SERVER_MENU9, 3, "Transmog Equipped Item With This");
			menuResponse->addRadialMenuItem(RadialOptions::SERVER_MENU7, 3, "Clear Matching Equipped Transmog");
		}

		// Equipped item.
		if (parent == player) {
			menuResponse->addRadialMenuItem(RadialOptions::SERVER_MENU10, 3, "Clear Transmog");
		}
	}
	if (player != nullptr && sceneObject->isASubChildOf(player)) {
		ManagedReference<SceneObject*> parent = sceneObject->getParent().get();

		// Rename only inventory/container items, not directly equipped items.
		if (parent != nullptr && parent != player) {
			menuResponse->addRadialMenuItem(RadialOptions::SERVER_MENU8, 3, "Rename Item");
		}
	}

	TangibleObjectMenuComponent::fillObjectMenuResponse(sceneObject, menuResponse, player);
}

int WearableObjectMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const {
	if (!sceneObject->isASubChildOf(player))
		return 0;

	if (selectedID == 70) {
		if (!sceneObject->isTangibleObject())
			return 0;

		TangibleObject* tano = cast<TangibleObject*>(sceneObject);

		if (tano == nullptr)
			return 0;

		tano->repair(player);

		return 1;
	}

	if (selectedID == RadialOptions::SERVER_MENU9) {
		if (player == nullptr || !sceneObject->isTangibleObject())
			return 0;

		ManagedReference<SceneObject*> donor = sceneObject;
		ManagedReference<SceneObject*> donorParent = donor->getParent().get();

		if (donorParent == player) {
			player->sendSystemMessage("The donor item must be in your inventory, not equipped.");
			return 0;
		}

		if (!hasWearableArrangement(donor)) {
			player->sendSystemMessage("This donor item does not appear to be wearable.");
			return 0;
		}

		SceneObject* statItem = findEquippedTransmogTarget(player, donor);

		if (statItem == nullptr) {
			player->sendSystemMessage("No equipped item was found that matches this donor item's wearable slot.");
			return 0;
		}

		uint32 donorClientCRC = donor->getClientObjectCRC();

		if (donorClientCRC == 0) {
			player->sendSystemMessage("Donor item does not have a valid client appearance CRC.");
			return 0;
		}

		// Change only the client-facing visual CRC.
		// Do not copy donor stats, armor values, mods, sockets, attachments, or condition.
		statItem->setClientObjectCRC(donorClientCRC);
		refreshTransmoggedItemForPlayer(statItem, player);

		player->sendSystemMessage("Transmog applied to the matching equipped item. Donor item was kept.");

		return 1;
	}

	if (selectedID == RadialOptions::SERVER_MENU7) {
		if (player == nullptr || !sceneObject->isTangibleObject())
			return 0;

		ManagedReference<SceneObject*> donor = sceneObject;
		ManagedReference<SceneObject*> donorParent = donor->getParent().get();

		if (donorParent == player) {
			player->sendSystemMessage("Use this option from an inventory donor item, not an equipped item.");
			return 0;
		}

		if (!hasWearableArrangement(donor)) {
			player->sendSystemMessage("This item does not appear to match an equipped wearable slot.");
			return 0;
		}

		SceneObject* statItem = findEquippedTransmogTarget(player, donor);

		if (statItem == nullptr) {
			player->sendSystemMessage("No matching equipped item was found to clear.");
			return 0;
		}

		SharedObjectTemplate* originalTemplate = statItem->getObjectTemplate();

		if (originalTemplate == nullptr) {
			player->sendSystemMessage("Could not find the equipped item's original template.");
			return 0;
		}

		statItem->setClientObjectCRC(originalTemplate->getClientObjectCRC());
		refreshTransmoggedItemForPlayer(statItem, player);

		player->sendSystemMessage("Cleared transmog from the matching equipped item.");

		return 1;
	}

	if (selectedID == RadialOptions::SERVER_MENU10) {
		if (player == nullptr || !sceneObject->isASubChildOf(player))
			return 0;

		if (sceneObject->getParent().get() != player) {
			player->sendSystemMessage("Clear Transmog can only be used on equipped items.");
			return 0;
		}

		SharedObjectTemplate* originalTemplate = sceneObject->getObjectTemplate();

		if (originalTemplate == nullptr) {
			player->sendSystemMessage("Could not find the item's original template.");
			return 0;
		}

		sceneObject->setClientObjectCRC(originalTemplate->getClientObjectCRC());
		refreshTransmoggedItemForPlayer(sceneObject, player);

		player->sendSystemMessage("Transmog cleared. Item restored to its original appearance.");

		return 1;
	}

	if (selectedID == RadialOptions::SERVER_MENU8) {
		if (player == nullptr || !sceneObject->isTangibleObject())
			return 0;

		if (!sceneObject->isASubChildOf(player)) {
			player->sendSystemMessage("You can only rename items you own.");
			return 0;
		}

		ManagedReference<SceneObject*> parent = sceneObject->getParent().get();

		if (parent == player) {
			player->sendSystemMessage("Unequip the item before renaming it.");
			return 0;
		}

		ManagedReference<PlayerObject*> ghost = player->getPlayerObject();

		if (ghost == nullptr)
			return 0;

		ManagedReference<SuiInputBox*> inputBox = new SuiInputBox(player, SuiWindowType::OBJECT_NAME);

		inputBox->setUsingObject(sceneObject);
		inputBox->setPromptTitle("Rename Item");
		inputBox->setPromptText("Enter a new custom name for this item.");
		inputBox->setDefaultInput(sceneObject->getDisplayedName());
		inputBox->setMaxInputSize(40);
		inputBox->setCallback(new RenameItemSuiCallback(player->getZoneServer()));
		inputBox->setForceCloseDistance(-1);

		ghost->addSuiBox(inputBox);

		player->sendMessage(inputBox->generateMessage());

		return 1;
	}

	return TangibleObjectMenuComponent::handleObjectMenuSelect(sceneObject, player, selectedID);
}
