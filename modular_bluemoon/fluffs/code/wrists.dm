/obj/item/clothing/wrists/donator/bm
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/hands.dmi'
	worn_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/hands.dmi'

/obj/item/clothing/wrists/donator/bm/modern_watch
	name = "modern watch"
	desc = "Original 'Delta-watch XL'. Made in Sol-3."
	gender = MALE
	icon_state = "e_watchdog"
	icon_state = "e_watchdog"
	body_parts_covered = HAND_LEFT | ARM_LEFT
	attack_verb_simple = list("showed the time to")

/obj/item/clothing/wrists/donator/bm/modern_watch/examine(mob/user)
	. = ..()
	. += "<span class='info'>Station Time: [STATION_TIME_TIMESTAMP("hh:mm:ss", world.time)]"

/obj/item/clothing/wrists/donator/bm/modern_watch/attack(mob/target, mob/user)
	. = ..()
	to_chat(target, "<span class='info'>Station Time: [STATION_TIME_TIMESTAMP("hh:mm:ss", world.time)]")
