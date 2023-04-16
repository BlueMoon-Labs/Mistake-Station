GLOBAL_LIST_INIT(loadout_wrists, generate_loadout_items(/datum/loadout_item/wrists))

/datum/loadout_item/wrists
	category = LOADOUT_CATEGORY_WRISTS

/datum/loadout_item/wrists/pre_equip_item(datum/outfit/outfit, datum/outfit/outfit_important_for_life, mob/living/carbon/human/equipper, visuals_only = FALSE)
	if(initial(outfit_important_for_life.wrists))
		.. ()
		return TRUE

/datum/loadout_item/wrists/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE, override_items = LOADOUT_OVERRIDE_BACKPACK)
	if(override_items == LOADOUT_OVERRIDE_BACKPACK && !visuals_only)
		if(outfit.wrists)
			LAZYADD(outfit.backpack_contents, outfit.wrists)
		outfit.wrists = item_path
	else
		outfit.wrists = item_path

/datum/loadout_item/wrists/syntech/band
	name = "Normalizer Band"
	item_path = /obj/item/clothing/wrists/syntech

/datum/loadout_item/wrists/steam_watch
	name = "steampunk watch"
	category = LOADOUT_CATEGORY_WRISTS
	item_path = /obj/item/clothing/wrists/clockwork_watch

/datum/loadout_item/wrists/red_watch
	name = "Steampunk Watch"
	category = LOADOUT_CATEGORY_WRISTS
	item_path = /obj/item/clothing/wrists/clockwork_watch/red

/obj/item/clothing/wrists/clockwork_watch
	name = "Часы в стиле Стимпанк"
	desc = "Стильные часы в стиле Стимпанк, сделанные из тысяч крошечных зубчатых колес."
	gender = MALE
	icon_state = "clockwork_slab"
	inhand_icon_state = "clockwork_slab"
	body_parts_covered = HAND_LEFT | ARM_LEFT
	attack_verb_simple = list("показывает время")

/obj/item/clothing/wrists/clockwork_watch/red
	name = "Красные Стильные Часы"
	desc = "Особо красивые часы красного цвета. Сидят довольно удобно!"
	gender = MALE
	icon_state = "redwork_slab"
	inhand_icon_state = "redwork_slab"
	body_parts_covered = HAND_LEFT | ARM_LEFT
	attack_verb_simple = list("показывает время")

/obj/item/clothing/wrists/clockwork_watch/examine(mob/user)
	. = ..()
	. += "<span class='info'>Station Time: [station_time_timestamp("hh:mm:ss", world.time)]"

/obj/item/clothing/wrists/clockwork_watch/attack(mob/target, mob/user)
	. = ..()
	to_chat(target, "<span class='info'>Station Time: [station_time_timestamp("hh:mm:ss", world.time)]")
