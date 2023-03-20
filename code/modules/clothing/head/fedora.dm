/obj/item/clothing/head/fedora
	name = "fedora"
	icon = 'icons/obj/clothing/head/hats.dmi'
	worn_icon = 'icons/mob/clothing/head/hats.dmi'
	icon_state = "fedora"
	inhand_icon_state = "fedora"
	desc = "A really cool hat if you're a mobster. A really lame hat if you're not."

/obj/item/clothing/head/fedora/Initialize(mapload)
	. = ..()

	create_storage(storage_type = /datum/storage/pockets/small/fedora)

/obj/item/clothing/head/fedora/white
	name = "white fedora"
	icon_state = "fedora_white"
	inhand_icon_state = null

/obj/item/clothing/head/fedora/beige
	name = "beige fedora"
	icon_state = "fedora_beige"
	inhand_icon_state = null

/obj/item/clothing/head/fedora/suicide_act(mob/living/user)
	if(user.gender == FEMALE)
		return
	var/mob/living/carbon/human/H = user
	user.visible_message(span_suicide("[user] is donning [src]! It looks like [user.p_theyre()] trying to be nice to girls."))
	user.say("M'lady.", forced = "fedora suicide")
	sleep(1 SECONDS)
	H.facial_hairstyle = "Neckbeard"
	return BRUTELOSS

/obj/item/clothing/head/fedora/carpskin
	name = "carpskin fedora"
	icon_state = "fedora_carpskin"
	inhand_icon_state = null

/obj/item/clothing/head/sheriff_hat
	name = "Sheriff Hat"
	icon = 'modular_skyrat/master_files/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/head.dmi'
	icon_state = "sheriff_hat"
	worn_icon_state = "sheriff_hat"
	inhand_icon_state = "fedora"
	desc = "A really cool hat if you're a mobster. A really lame hat if you're not."
	supports_variations_flags = CLOTHING_SNOUTED_VARIATION_NO_NEW_ICON
	unique_reskin = list(
		"Black Variant" = list(
			RESKIN_ICON_STATE = "sheriff_hat",
			RESKIN_WORN_ICON_STATE = "sheriff_hat"
		),
		"Brown Variant" = list(
			RESKIN_ICON_STATE = "sheriff_hat_alt",
			RESKIN_WORN_ICON_STATE = "sheriff_hat_alt"
		),
	)

/obj/item/clothing/head/fedora/Initialize(mapload)
	. = ..()

	create_storage(storage_type = /datum/storage/pockets/small/fedora)
