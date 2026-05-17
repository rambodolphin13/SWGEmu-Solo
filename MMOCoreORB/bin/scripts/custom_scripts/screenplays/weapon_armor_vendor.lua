WeaponArmorVendor = ScreenPlay:new { numberOfActs = 1 }

-- Categories and items
WeaponArmorVendor.categories = {
{ name = "Weapons Tier 1", items = {
    { name = "Cdef Carbine", template = "object/weapon/ranged/carbine/carbine_cdef.iff", price = 1000 },
    { name = "Corsec Cdef Carbine", template = "object/weapon/ranged/carbine/carbine_cdef_corsec.iff", price = 1000 },
    { name = "Cdef Pistol", template = "object/weapon/ranged/pistol/pistol_cdef.iff", price = 1000 },
    { name = "Corsec Cdef Pistol", template = "object/weapon/ranged/pistol/pistol_cdef_corsec.iff", price = 1000 },
    { name = "CDEF Rifle", template = "object/weapon/ranged/rifle/rifle_cdef.iff", price = 1000 },
    { name = "D18 Pistol", template = "object/weapon/ranged/pistol/pistol_d18.iff", price = 1000 },
    { name = "DH17 Carbine", template = "object/weapon/ranged/carbine/carbine_dh17.iff", price = 1000 },
    { name = "DLT20 Rifle", template = "object/weapon/ranged/rifle/rifle_dlt20.iff", price = 1000 },
    { name = "Stone Knife", template = "object/weapon/melee/knife/knife_stone.iff", price = 1000 },
    { name = "Survival Knife", template = "object/weapon/melee/knife/knife_survival.iff", price = 1000 },
    { name = "Wooden Staff", template = "object/weapon/melee/polearm/lance_staff_wood_s1.iff", price = 1000 },
    { name = "Heavy Axe", template = "object/weapon/melee/axe/axe_vibroaxe.iff", price = 1000 },
} },

{ name = "Weapons Tier 2", items = {
    { name = "Curved Sword", template = "object/weapon/melee/sword/sword_curved_nyax.iff", price = 5000 },
    { name = "Sword", template = "object/weapon/melee/sword/sword_01.iff", price = 5000 },
    { name = "Gaderiffi Baton", template = "object/weapon/melee/baton/baton_gaderiffi.iff", price = 5000 },
    { name = "Two-Handed Axe", template = "object/weapon/melee/2h_sword/2h_sword_battleaxe.iff", price = 5000 },
    { name = "Metal Staff", template = "object/weapon/melee/polearm/lance_staff_metal.iff", price = 5000 },
    { name = "Reinforced Combat Staff", template = "object/weapon/melee/polearm/lance_staff_metal.iff", price = 5000 },
    { name = "DLTa20 Rifle", template = "object/weapon/ranged/rifle/rifle_dlta20.iff", price = 5000 },
    { name = "DL44 Metal Pistol", template = "object/weapon/ranged/pistol/pistol_dl44_metal.iff", price = 5000 },
    { name = "DL44 Pistol", template = "object/weapon/ranged/pistol/pistol_dl44.iff", price = 5000 },
    { name = "DH17 Subnose Carbine", template = "object/weapon/ranged/carbine/carbine_dh17_subnose.iff", price = 5000 },
} },

{ name = "Weapons Tier 3", items = {
    { name = "Laser Rifle", template = "object/weapon/ranged/rifle/rifle_laser.iff", price = 10000 },
    { name = "SG82 Rifle", template = "object/weapon/ranged/rifle/rifle_sg82.iff", price = 10000 },
    { name = "DH17 Pistol", template = "object/weapon/ranged/pistol/pistol_dh17.iff", price = 10000 },
    { name = "Scout Blaster", template = "object/weapon/ranged/carbine/carbine_scout.iff", price = 10000 },
    { name = "E11 Carbine", template = "object/weapon/ranged/carbine/carbine_e11.iff", price = 10000 },
    { name = "Vibroblade", template = "object/weapon/melee/knife/knife_vibroblade.iff", price = 10000 },
    { name = "Two-Handed Curved Sword", template = "object/weapon/melee/2h_sword/2h_sword_katana.iff", price = 10000 },
    { name = "Vibrolance", template = "object/weapon/melee/polearm/lance_vibrolance.iff", price = 10000 },
} },

    { name = "Bone Armor", items = {
        { name = "Helmet", template = "object/tangible/wearables/armor/bone/armor_bone_s01_helmet.iff", price = 1000 },
        { name = "Chest Plate", template = "object/tangible/wearables/armor/bone/armor_bone_s01_chest_plate.iff", price = 1000 },
        { name = "Gloves", template = "object/tangible/wearables/armor/bone/armor_bone_s01_gloves.iff", price = 1000 },
        { name = "Leggings", template = "object/tangible/wearables/armor/bone/armor_bone_s01_leggings.iff", price = 1000 },
        { name = "Bicep L", template = "object/tangible/wearables/armor/bone/armor_bone_s01_bicep_l.iff", price = 1000 },
        { name = "Bicep R", template = "object/tangible/wearables/armor/bone/armor_bone_s01_bicep_r.iff", price = 1000 },
        { name = "Bracer L", template = "object/tangible/wearables/armor/bone/armor_bone_s01_bracer_l.iff", price = 1000 },
        { name = "Bracer R", template = "object/tangible/wearables/armor/bone/armor_bone_s01_bracer_r.iff", price = 1000 },
        { name = "Boots", template = "object/tangible/wearables/armor/bone/armor_bone_s01_boots.iff", price = 1000 },
    } },

    { name = "Chitin Armor", items = {
        { name = "Helmet", template = "object/tangible/wearables/armor/chitin/armor_chitin_s01_helmet.iff", price = 1000 },
        { name = "Chest Plate", template = "object/tangible/wearables/armor/chitin/armor_chitin_s01_chest_plate.iff", price = 1000 },
        { name = "Gloves", template = "object/tangible/wearables/armor/chitin/armor_chitin_s01_gloves.iff", price = 1000 },
        { name = "Leggings", template = "object/tangible/wearables/armor/chitin/armor_chitin_s01_leggings.iff", price = 1000 },
        { name = "Bicep L", template = "object/tangible/wearables/armor/chitin/armor_chitin_s01_bicep_l.iff", price = 1000 },
        { name = "Bicep R", template = "object/tangible/wearables/armor/chitin/armor_chitin_s01_bicep_r.iff", price = 1000 },
        { name = "Bracer L", template = "object/tangible/wearables/armor/chitin/armor_chitin_s01_bracer_l.iff", price = 1000 },
        { name = "Bracer R", template = "object/tangible/wearables/armor/chitin/armor_chitin_s01_bracer_r.iff", price = 1000 },
        { name = "Boots", template = "object/tangible/wearables/armor/chitin/armor_chitin_s01_boots.iff", price = 1000 },
    } }
}

registerScreenPlay("WeaponArmorVendor", true)

function WeaponArmorVendor:start()
end

function WeaponArmorVendor:openCategoryMenu(pPlayer, pNpc)
    if (pPlayer == nil) then
        return
    end

    local sui = SuiListBox.new("WeaponArmorVendor", "handleCategorySelection")
    sui.setTargetNetworkId(SceneObject(pNpc):getObjectID())
    sui.setTitle("Weapon & Armor Dealer")
    sui.setPrompt("Choose a weapon or armor category.")

    for i = 1, #self.categories, 1 do
        sui.add(self.categories[i].name, tostring(i - 1))
    end

    sui.sendTo(pPlayer)
end

function WeaponArmorVendor:handleCategorySelection(pPlayer, pSui, eventIndex, args)
    if (pPlayer == nil or args == nil or args == "") then
        return
    end

    local selectedIndex = tonumber(args)

    if (selectedIndex == nil) then
        CreatureObject(pPlayer):sendSystemMessage("Invalid weapon or armor category selection.")
        return
    end

    local categoryIndex = selectedIndex + 1

    if (self.categories[categoryIndex] == nil) then
        CreatureObject(pPlayer):sendSystemMessage("Invalid weapon or armor category.")
        return
    end

    self:openItemMenu(pPlayer, categoryIndex)
end

function WeaponArmorVendor:openItemMenu(pPlayer, categoryIndex)
    if (pPlayer == nil) then
        return
    end

    local category = self.categories[categoryIndex]

    if (category == nil) then
        CreatureObject(pPlayer):sendSystemMessage("Invalid weapon or armor category.")
        return
    end

    writeData(SceneObject(pPlayer):getObjectID() .. ":weaponArmorVendorCategory", categoryIndex)

    local sui = SuiListBox.new("WeaponArmorVendor", "handleItemSelection")
    sui.setTitle(category.name)
    sui.setPrompt("Select an item to buy. Prices are shown beside each item.")

    for i = 1, #category.items, 1 do
        local item = category.items[i]
        sui.add(item.name .. " - " .. item.price .. " credits", tostring(i - 1))
    end

    sui.sendTo(pPlayer)
end

function WeaponArmorVendor:handleItemSelection(pPlayer, pSui, eventIndex, args)
    if (pPlayer == nil or args == nil or args == "") then
        return
    end

    local categoryIndex = readData(SceneObject(pPlayer):getObjectID() .. ":weaponArmorVendorCategory")
    deleteData(SceneObject(pPlayer):getObjectID() .. ":weaponArmorVendorCategory")

    if (categoryIndex == nil or categoryIndex == 0 or self.categories[categoryIndex] == nil) then
        CreatureObject(pPlayer):sendSystemMessage("Invalid weapon or armor category.")
        return
    end

    local selectedIndex = tonumber(args)

    if (selectedIndex == nil) then
        CreatureObject(pPlayer):sendSystemMessage("Invalid weapon or armor item selection.")
        return
    end

    local itemIndex = selectedIndex + 1
    local category = self.categories[categoryIndex]

    if (category.items[itemIndex] == nil) then
        CreatureObject(pPlayer):sendSystemMessage("Invalid weapon or armor item.")
        return
    end

    self:buyItem(pPlayer, category.items[itemIndex])
end

function WeaponArmorVendor:buyItem(pPlayer, item)
    if (pPlayer == nil or item == nil) then
        return
    end

    local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")

    if (pInventory == nil) then
        CreatureObject(pPlayer):sendSystemMessage("Unable to locate your inventory.")
        return
    end

    if (SceneObject(pInventory):isContainerFullRecursive()) then
        CreatureObject(pPlayer):sendSystemMessage("Your inventory is full.")
        return
    end

    local price = item.price or 0

    if (CreatureObject(pPlayer):getCashCredits() < price) then
        CreatureObject(pPlayer):sendSystemMessage("You need " .. price .. " credits to buy this item.")
        return
    end

    local pItem = giveItem(pInventory, item.template, -1, true)

    if (pItem == nil) then
        CreatureObject(pPlayer):sendSystemMessage("Unable to create item: " .. item.template)
        return
    end

    CreatureObject(pPlayer):subtractCashCredits(price)
    CreatureObject(pPlayer):sendSystemMessage("Purchased: " .. item.name .. " for " .. price .. " credits.")
end
