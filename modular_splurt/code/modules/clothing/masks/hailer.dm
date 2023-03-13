/obj/item/clothing/mask/gas/sechailer/slut
	name = "Slutcurity Hailer"
	desc = "A modified Security gas mask designed for softer apprehension, now with a hot pink paintjob!"
	icon = 'modular_splurt/icons/obj/clothing/masks.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/lewd_clothing/head/lewd_masks.dmi'
	worn_icon_muzzled = 'modular_splurt/icons/mob/clothing/lewd_clothing/head/lewd_masks-digi.dmi'
	icon_state = "sluthailer"
	icon_state = "sluthailer"
	aggressiveness = 0 //can't have your pets being mean!
	actions_types = list(/datum/action/item_action/halt)

/obj/item/clothing/mask/gas/sechailer/slut/MouseDrop(atom/over_object)

/obj/item/clothing/mask/gas/sechailer/slut/attack_hand(mob/user)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		if(src == C.wear_mask)
			to_chat(user, "<span class='warning'>The mask is fastened tight! You'll need help taking this off!</span>")
			return
	..()
