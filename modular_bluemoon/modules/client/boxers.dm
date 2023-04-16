GLOBAL_LIST_INIT(loadout_underwear, generate_loadout_items(/datum/loadout_item/underwear))

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

/datum/loadout_item/underwear/plain
	name = "Briefs"
	category = LOADOUT_CATEGORY_GENERAL_UNDER
	item_path = /obj/item/clothing/underwear/briefs

/datum/loadout_item/underwear/jockstrap
	name = "Jockstrap"
	item_path = 	/obj/item/clothing/underwear/briefs/jockstrap

/datum/loadout_item/underwear/mankini
	name = "Mankini"
	item_path = /obj/item/clothing/underwear/briefs/mankini

/datum/loadout_item/underwear/boxers
	name = "Boxers"
	item_path = /obj/item/clothing/underwear/briefs/boxers

/datum/loadout_item/underwear/boxers/heart
	name = "Heart Boxers"
	item_path = /obj/item/clothing/underwear/briefs/boxers/heart

/datum/loadout_item/underwear/boxers/uk
	name = "UK Boxers"
	item_path = /obj/item/clothing/underwear/briefs/boxers/uk

/datum/loadout_item/underwear/boxers/usa
	name = "USA Boxers"
	item_path = /obj/item/clothing/underwear/briefs/boxers/usa

/datum/loadout_item/underwear/boxers/commie
	name = "Commie Boxers"
	item_path = /obj/item/clothing/underwear/briefs/boxers/commie

/datum/loadout_item/underwear/boxers/striped
	name = "Striped Boxers"
	item_path = /obj/item/clothing/underwear/briefs/boxers/striped

/datum/loadout_item/underwear/boxers/bee_shorts
	name = "Bee Shorts"
	item_path = /obj/item/clothing/underwear/briefs/boxers/bee_shorts

/datum/loadout_item/underwear/boxers/boxer_briefs
	name = "Boxer Briefs"
	item_path = /obj/item/clothing/underwear/briefs/boxer_briefs

/datum/loadout_item/underwear/boxers/panties
	name = "Panties"
	item_path = /obj/item/clothing/underwear/briefs/panties

/datum/loadout_item/underwear/boxers/panties/alt
	name = "Panties (alt)"
	item_path = /obj/item/clothing/underwear/briefs/panties/alt

/datum/loadout_item/underwear/boxers/panties/slim
	name = "Slim Panties"
	item_path = /obj/item/clothing/underwear/briefs/panties/slim

/datum/loadout_item/underwear/boxers/panties/thin
	name = "Thin Panties"
	item_path = /obj/item/clothing/underwear/briefs/panties/thin

/datum/loadout_item/underwear/boxers/panties/neko
	name = "Neko Panties"
	item_path = /obj/item/clothing/underwear/briefs/panties/neko

/datum/loadout_item/underwear/boxers/panties/thong
	name = "Thong"
	item_path = /obj/item/clothing/underwear/briefs/panties/thong

/datum/loadout_item/underwear/boxers/panties/thong/babydoll
	name = "Babydoll Thong"
	item_path = /obj/item/clothing/underwear/briefs/panties/thong/babydoll

/datum/loadout_item/underwear/boxers/panties/swimming
	name = "Swimming Panties"
	item_path = /obj/item/clothing/underwear/briefs/panties/swimming

/datum/loadout_item/underwear/boxers/panties/kinky
	name = "Kinky Panties"
	item_path = /obj/item/clothing/underwear/briefs/panties/kinky

/datum/loadout_item/underwear/boxers/panties/beekini
	name = "Bee-kini Panties"
	item_path = /obj/item/clothing/underwear/briefs/panties/beekini

/datum/loadout_item/underwear/boxers/panties/usa
	name = "USA Panties"
	item_path = /obj/item/clothing/underwear/briefs/panties/usa

/datum/loadout_item/underwear/boxers/panties/commie
	name = "Commie Panties"
	item_path = /obj/item/clothing/underwear/briefs/panties/commie

/datum/loadout_item/underwear/boxers/panties/uk
	name = "UK Panties"
	item_path = /obj/item/clothing/underwear/briefs/panties/uk

/datum/loadout_item/underwear/boxers/panties/striped
	name = "Striped Panties"
	item_path = /obj/item/clothing/underwear/briefs/panties/striped

/datum/loadout_item/underwear/boxers/panties/fishnet
	name = "Fishnet Panties"
	item_path = /obj/item/clothing/underwear/briefs/panties/fishnet

/datum/loadout_item/underwear/boxers/long
	name = "Long Boxers"
	item_path = /obj/item/clothing/underwear/briefs/boxers/long
