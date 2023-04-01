/datum/gear/wrists/steam_watch
	name = "steampunk watch"
	category = LOADOUT_CATEGORY_WRISTS
	subcategory = LOADOUT_SUBCATEGORY_WATCHES
	slot = ITEM_SLOT_WRISTS
	path = /obj/item/clothing/wrists/clockwork_watch
	cost = 0

/obj/item/clothing/wrists/clockwork_watch
	name = "Часы в стиле Стимпанк"
	desc = "Стильные часы в стиле Стимпанк, сделанные из тысяч крошечных зубчатых колес."
	gender = MALE
	icon_state = "clockwork_slab"
	inhand_icon_state = "clockwork_slab"
	body_parts_covered = HAND_LEFT | ARM_LEFT
	attack_verb_simple = list("показывает время")

/obj/item/clothing/wrists/clockwork_watch
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
