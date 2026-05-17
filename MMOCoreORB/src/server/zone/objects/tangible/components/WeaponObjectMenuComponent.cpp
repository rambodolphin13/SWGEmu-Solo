/*
 * WeaponObjectMenuComponent.cpp
 *
 *  Created on: 3/11/2012
 *      Author: kyle
 */

#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/tangible/powerup/PowerupObject.h"
#include "server/zone/objects/tangible/weapon/WeaponObject.h"
#include "WeaponObjectMenuComponent.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "server/zone/objects/player/sessions/SlicingSession.h"
#include "server/zone/managers/radial/RadialOptions.h"
#include "server/zone/objects/player/sui/inputbox/SuiInputBox.h"
#include "server/zone/objects/player/sui/callbacks/RenameItemSuiCallback.h"
#include "server/zone/objects/player/PlayerObject.h"

void WeaponObjectMenuComponent::fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const {

	if (!sceneObject->isTangibleObject())
		return;

	ManagedReference<WeaponObject*> weapon = cast<WeaponObject*>(sceneObject);
	if(weapon == nullptr)
		return;

	if(weapon->isASubChildOf(player)) {

		if(weapon->hasPowerup()) {
			menuResponse->addRadialMenuItem(71, 3, "@powerup:mnu_remove_powerup"); // Remove Powerup
		}

		if(weapon->getConditionDamage() > 0 && weapon->canRepair(player)) {
			menuResponse->addRadialMenuItem(70, 3, "@sui:repair"); // Slice
		}
	}

	if (player != nullptr && sceneObject != nullptr && sceneObject->isASubChildOf(player)) {
		ManagedReference<SceneObject*> parent = sceneObject->getParent().get();

		// Rename only inventory/container weapons, not directly equipped weapons.
		if (parent != nullptr && parent != player) {
			menuResponse->addRadialMenuItem(RadialOptions::SERVER_MENU8, 3, "Rename Item");
		}
	}

	TangibleObjectMenuComponent::fillObjectMenuResponse(sceneObject, menuResponse, player);

}

int WeaponObjectMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const {
	if (!sceneObject->isTangibleObject())
		return 0;

	ManagedReference<WeaponObject*> weapon = cast<WeaponObject*>(sceneObject);
	if(weapon == nullptr)
		return 1;

	if(weapon->isASubChildOf(player)) {

		if (selectedID == 69 && player->hasSkill("combat_smuggler_slicing_02")) {
			if (weapon->isSliced()) {
				player->sendSystemMessage("@slicing/slicing:already_sliced");
				return 0;
			}

			ManagedReference<Facade*> facade = player->getActiveSession(SessionFacadeType::SLICING);
			ManagedReference<SlicingSession*> session = dynamic_cast<SlicingSession*>(facade.get());

			if (session != nullptr) {
				player->sendSystemMessage("@slicing/slicing:already_slicing");
				return 0;
			}

			//Create Session
			session = new SlicingSession(player);
			session->initalizeSlicingMenu(player, weapon);

			return 0;

		}

		if(selectedID == 70) {

			weapon->repair(player);
			return 1;
		}

		if(selectedID == 71) {

			ManagedReference<PowerupObject*> pup = weapon->removePowerup();
			if(pup == nullptr)
				return 1;

			Locker locker(pup);

			pup->destroyObjectFromWorld( true );
			pup->destroyObjectFromDatabase( true );

			StringIdChatParameter message("powerup", "prose_remove_powerup"); //You detach your powerup from %TT.
			message.setTT(weapon->getDisplayedName()); 
			player->sendSystemMessage(message);

			return 1;
		}
	}

	if (selectedID == RadialOptions::SERVER_MENU8) {
		if (player == nullptr || sceneObject == nullptr || !sceneObject->isTangibleObject())
			return 0;

		if (!sceneObject->isASubChildOf(player)) {
			player->sendSystemMessage("You can only rename items you own.");
			return 0;
		}

		ManagedReference<SceneObject*> parent = sceneObject->getParent().get();

		if (parent == player) {
			player->sendSystemMessage("Unequip the weapon before renaming it.");
			return 0;
		}

		ManagedReference<PlayerObject*> ghost = player->getPlayerObject();

		if (ghost == nullptr)
			return 0;

		ManagedReference<SuiInputBox*> inputBox = new SuiInputBox(player, SuiWindowType::OBJECT_NAME);

		inputBox->setUsingObject(sceneObject);
		inputBox->setPromptTitle("Rename Weapon");
		inputBox->setPromptText("Enter a new custom name for this weapon.");
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
