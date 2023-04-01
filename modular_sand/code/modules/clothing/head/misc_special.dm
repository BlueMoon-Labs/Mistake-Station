/obj/item/clothing/head/goatpelt
	name = "goat pelt hat"
	desc = "Fuzzy and Warm!"
	icon = 'modular_sand/icons/obj/clothing/hats.dmi'
	icon_state = "goatpelt"
	worn_icon = 'modular_sand/icons/mob/clothing/head.dmi'

	icon_state = "goatpelt"

/obj/item/clothing/head/goatpelt/king
	name = "king goat pelt hat"
	desc = "Fuzzy, Warm and Robust!"
	icon_state = "goatpelt"
	icon_state = "goatpelt"
	color = "#ffd700"
	body_parts_covered = HEAD
	armor_type = /datum/armor/helmet_swat
	dog_fashion = null
	resistance_flags = FIRE_PROOF

/obj/item/clothing/head/goatpelt/king/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		user.faction |= "goat"

/obj/item/clothing/head/goatpelt/king/dropped(mob/living/carbon/human/user)
	if (user.head == src)
		user.faction -= "goat"
	..()

/obj/item/clothing/head/goatpope
	name = "goat pope hat"
	desc = "And on the seventh day King Goat said there will be cabbage!"
	worn_icon = 'modular_sand/icons/mob/large-worn-icons/64x64/head.dmi'

	icon = 'modular_sand/icons/obj/clothing/hats.dmi'
	icon_state = "goatpope"
	icon_state = "goatpope"
	worn_x_dimension = 64
	worn_y_dimension = 64
	resistance_flags = FLAMMABLE

/obj/item/clothing/head/goatpope/equipped(mob/living/carbon/human/user, slot)
	..()
	if (slot == ITEM_SLOT_HEAD)
		user.faction |= "goat"

/obj/item/clothing/head/goatpope/dropped(mob/living/carbon/human/user, slot)
	if (user.head == src)
		user.faction -= "goat"
	..()
