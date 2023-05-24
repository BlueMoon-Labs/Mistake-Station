//Main code edits
/obj/item/clothing/mask/muzzle/attack_hand(mob/user, act_intent, attackchain_flags)
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		if(src == C.wear_mask)
			to_chat(user, "<span class='warning'>You need help taking this off!</span>")
			return
	..()

//Own stuff

/* I'm sorry nuke but cit added their own
/obj/item/clothing/mask/rat/kitsune
	name = "kitsune mask"
	desc = "A mask made of soft vinyl and latex, representing the head of a mythical kitsune."
	icon = 'modular_splurt/icons/obj/clothing/masks.dmi'
	icon_state = "kitsune"
	icon_state = "kitsune"
*/

/obj/item/clothing/mask/gas/cbrn
	name = "CBRN gas mask"
	desc = "Chemical, Biological, Radiological and Nuclear. A heavy duty gas mask design to be worn in hazardous environments. Actually works like a gas mask as well as can be connected to internal air supply."
	icon_state = "gas_cbrn"
	icon_state = "gas_cbrn"
	icon = 'modular_splurt/icons/obj/clothing/masks.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/mask.dmi'
	worn_icon_digi = 'modular_splurt/icons/mob/clothing/mask_muzzle.dmi'
	flags_cover = MASKCOVERSEYES | MASKCOVERSMOUTH
	resistance_flags = ACID_PROOF
	visor_flags_inv = 0

/obj/item/clothing/mask/gas/cbrn/Initialize()
	. = ..()
	AddElement(/datum/element/radiation_protected_clothing)

/obj/item/clothing/mask/gas/cbrn/mopp
	name = "MOPP gas mask"
	desc = "Mission Oriented Protective Posture. A heavy duty gas mask design to be worn in hazardous combat environments. Actually works like a gas mask as well as can be connected to internal air supply."
	icon_state = "gas_mopp"
	icon_state = "gas_mopp"

/obj/item/clothing/mask/gas/cbrn/mopp/advance
	name = "advance MOPP gas mask"
	desc = "Mission Oriented Protective Posture. A heavy duty gas mask design to be worn in hazardous combat environments. Actually works like a gas mask as well as can be connected to internal air supply. Used by CentCom Staff and ERT teams."

//broken huds for loot

/obj/item/clothing/glasses/brokenhud/security
	name = "broken security HUD"
	desc = "A former heads-up display that scans the humans in view and provides accurate data about their ID status and security records. At least it did. Now its just shorted out"
	icon_state = "securityhud"
	glass_colour_type = /datum/client_colour/glass_colour/red

/obj/item/clothing/glasses/brokenhud/security/sunglasses
	name = "broken security HUDSunglasses"
	desc = "Sunglasses with a broken security HUD."
	icon_state = "sunhudsec"
	flash_protect = 1
	glass_colour_type = /datum/client_colour/glass_colour/darkred

/obj/item/clothing/glasses/brokenhud/security/night
	name = "broken night vision security HUD"
	desc = "An advanced heads-up display which provides id data and vision in complete darkness. However the electronics seem to no longer work."
	icon_state = "securityhudnight"
	glass_colour_type = /datum/client_colour/glass_colour/green

/obj/item/clothing/glasses/brokenhud/health
	name = "borken health scanner HUD"
	desc = "A former heads-up display that scans the humans in view and provides accurate data about their health status. At least it did. Now its just shorted out."
	icon_state = "healthhud"
	glass_colour_type = /datum/client_colour/glass_colour/lightblue

/obj/item/clothing/glasses/brokenhud/health/night
	name = "broken night vision health scanner HUD"
	desc = "An advanced medical heads-up display that allows doctors to find patients in complete darkness. However the electronics seem to no longer work"
	icon_state = "healthhudnight"
	icon_state = "glasses"
	glass_colour_type = /datum/client_colour/glass_colour/green

//research nods
/datum/design/cbrn/cbrnmask
	name = "CBRN Mask"
	desc = "A CBRN mask."
	id = "cbrn_mask"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 200, /datum/material/uranium = 50, /datum/material/iron = 200)
	build_path = /obj/item/clothing/mask/gas/cbrn
	category = list("Equipment")
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY | DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_SERVICE | DEPARTMENT_BITFLAG_CARGO | DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cbrn/moppmask
	name = "MOPP Mask"
	desc = "A MOPP mask."
	id = "mopp_mask"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 200, /datum/material/uranium = 50, /datum/material/iron = 200)
	build_path = /obj/item/clothing/mask/gas/cbrn/mopp
	category = list("Equipment")
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/obj/item/clothing/mask/muzzle/ballgag
	name = "ball gag"
	desc = "To stop that awful noise, but lewder."
	icon = 'modular_splurt/icons/obj/clothing/masks.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/mask.dmi'
	worn_icon_digi = 'modular_splurt/icons/mob/clothing/mask_muzzle.dmi'
	icon_state = "ballgag"
	inhand_icon_state = "ballgag"
