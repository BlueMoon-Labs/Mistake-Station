// Boatcloaks
/obj/item/clothing/neck/cloak/alt/boatcloak
	name = "boatcloak"
	desc = "A simple, short-ish boatcloak."
	icon = 'modular_splurt/icons/obj/clothing/neck.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'
	icon_state = "boatcloak"
	body_parts_covered = CHEST|ARMS

/obj/item/clothing/neck/cloak/alt/boatcloak/command
	name = "command boatcloak"
	desc = "A boatcloak with gold ribbon."
	icon_state = "boatcloak_com"
	body_parts_covered = CHEST|LEGS|ARMS

/obj/item/clothing/neck/cloak/centcom
	name = "central command's cloak"
	desc = "Worn by High-Ranking Central Command Personnel. I guess they needed one too."
	icon_state = "centcomcloak"
	icon = 'modular_splurt/icons/obj/clothing/neck.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'
	armor_type = /datum/armor/mod_theme_corporate
	body_parts_covered = CHEST|ARMS

/obj/item/clothing/neck/cloak/binary
	name = "Binary cloak"
	icon_state = "binarycloak"
	desc = "A fluffy dark cloak with hexagonal golden patterns covering its right side."
	icon = 'modular_splurt/icons/obj/clothing/neck.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'

/* //doesn't work
/obj/item/clothing/neck/cloak/binary/equipped(mob/user, slot)
	if(slot != ITEM_SLOT_NECK || !isdullahan(user))
		icon_state = "binarycloak"
		return ..()

	icon_state = "binarycloak_dull"

	. = ..()
*/
