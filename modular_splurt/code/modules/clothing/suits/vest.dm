/obj/item/clothing/suit/press
	name = "press 'armored' vest"
	desc = "A lightweight vest for reporting on security. It makes you feel protected, even if the armor plates are missing."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	icon_state = "press_armor"
	icon_state = "press_armor"
	armor_type = /datum/armor/suit_armor
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
	dog_fashion = null

/obj/item/clothing/suit/armor/vest/metrocop // ГОШАНЫ, ЕБАТЬ.
	name = "civil protection armored vest"
	desc = "You feel like this may not stop a scientist armed with nothing but a crowbar."
	icon_state = "metrocop_armor"
	icon_state = "metrocop_armor"
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	dog_fashion = null

/obj/item/clothing/head/helmet/metrocop
	name = "civil protection helmet"
	desc = "Sadly lacks a working voice encoder."
	icon_state = "metrocop_helmet"
	worn_icon_state = "metrocop_helmet"
	icon = 'modular_splurt/icons/obj/clothing/head.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/head.dmi'
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	flags_inv = HIDEHAIR | HIDEEYES | HIDEFACE | HIDEFACIALHAIR

/obj/item/clothing/under/rank/security/officer/metrocop
	name = "civil protection jumpsuit"
	desc = "Pick up that can."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	worn_icon_digi = 'modular_splurt/icons/mob/clothing/uniform_digi.dmi'
	icon_state = "metrocop_s"
	icon_state = "metrocop_s"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION|STYLE_TAUR_ALL
