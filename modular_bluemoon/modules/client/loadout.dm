/datum/loadout_item/shirt
	category = LOADOUT_SUBCATEGORY_SHIRT

/datum/loadout_item/shirt/pre_equip_item(datum/outfit/outfit, datum/outfit/outfit_important_for_life, mob/living/carbon/human/equipper, visuals_only = FALSE)
	if(initial(outfit_important_for_life.shirt))
		.. ()
		return TRUE

/datum/loadout_item/shirt/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE, override_items = LOADOUT_OVERRIDE_BACKPACK)
	if(override_items == LOADOUT_OVERRIDE_BACKPACK && !visuals_only)
		if(outfit.shirt)
			LAZYADD(outfit.backpack_contents, outfit.shirt)
		outfit.shirt = item_path
	else
		outfit.shirt = item_path

/datum/loadout_item/underwear
	category = LOADOUT_SUBCATEGORY_UNDERWEAR

/datum/loadout_item/underwear/pre_equip_item(datum/outfit/outfit, datum/outfit/outfit_important_for_life, mob/living/carbon/human/equipper, visuals_only = FALSE)
	if(initial(outfit_important_for_life.underwear))
		.. ()
		return TRUE

/datum/loadout_item/underwear/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE, override_items = LOADOUT_OVERRIDE_BACKPACK)
	if(override_items == LOADOUT_OVERRIDE_BACKPACK && !visuals_only)
		if(outfit.underwear)
			LAZYADD(outfit.backpack_contents, outfit.underwear)
		outfit.underwear = item_path
	else
		outfit.underwear = item_path

/datum/loadout_item/socks
	category = LOADOUT_SUBCATEGORY_SOCKS

/datum/loadout_item/socks/pre_equip_item(datum/outfit/outfit, datum/outfit/outfit_important_for_life, mob/living/carbon/human/equipper, visuals_only = FALSE)
	if(initial(outfit_important_for_life.socks))
		.. ()
		return TRUE

/datum/loadout_item/socks/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE, override_items = LOADOUT_OVERRIDE_BACKPACK)
	if(override_items == LOADOUT_OVERRIDE_BACKPACK && !visuals_only)
		if(outfit.socks)
			LAZYADD(outfit.backpack_contents, outfit.socks)
		outfit.socks = item_path
	else
		outfit.socks = item_path
