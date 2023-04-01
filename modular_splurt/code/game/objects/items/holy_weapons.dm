/obj/item/nullrod/holy_mace
	name = "Holy Mace"
	desc = "Fit for a cleric!"
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	icon_state = "holy_mace"
	icon_state = "holy_mace"
	lefthand_file = 'modular_splurt/icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/weapons/melee_righthand.dmi'
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_BULKY
	attack_verb_simple = list("smacked", "struck", "cracked", "beaten")

/obj/item/nullrod/papal_staff
	name = "papal staff"
	desc = "A staff used by traditional bishops and popes."
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	icon_state = "papal_staff"
	icon_state = "papal_staff"
	lefthand_file = 'modular_splurt/icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/weapons/melee_righthand.dmi'
	w_class = WEIGHT_CLASS_BULKY
	attack_verb_simple = list("smacked", "struck", "cracked", "beaten", "purified")

/obj/item/clothing/head/mitre
	name = "papal mitre"
	desc = "A traditional headdress, worn by bishops and popes in traditional Christianity"
	icon = 'modular_splurt/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/32x48_head.dmi'
	icon_state = "mitre"
	flags_inv = HIDEHAIR | HIDEFACIALHAIR

/obj/item/clothing/suit/chaplain/papal
	name = "papal robe"
	desc = "A short cape over a cassock, worn by bishops and popes in traditional Christianity"
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_splurt/icons/mobs/suits.dmi'
	icon_state = "papalrobe"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/storage/box/holy/papal
	name = "Papal Kit"

/obj/item/storage/box/holy/papal/PopulateContents()
	new /obj/item/clothing/head/mitre(src)
	new /obj/item/clothing/suit/chaplain/papal(src)
