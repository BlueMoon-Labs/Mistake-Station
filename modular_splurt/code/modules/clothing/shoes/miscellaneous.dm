/obj/item/clothing/shoes/clown_shoes/jester
	unique_reskin = list(
		"Original" = list(
			"icon_state" = "jester_shoes",
			"icon" = 'icons/obj/clothing/shoes.dmi',
			"worn_icon" = null
		),
		"Stripped" = list(
			"icon_state" = "striped_jester_shoes",
			"icon" = 'modular_splurt/icons/obj/clothing/shoes.dmi',
			"worn_icon" = 'modular_splurt/icons/mob/clothing/shoes.dmi'
		)
	)

/obj/item/clothing/shoes/footwraps
	name = "cloth footwraps"
	desc = "A roll of treated canvas used for wrapping claws or paws."
	icon = 'modular_splurt/icons/obj/clothing/shoes.dmi'
	icon_state = "foot_wraps"
	worn_icon = 'modular_splurt/icons/mob/clothing/shoes.dmi'
	worn_icon_digi = 'modular_splurt/icons/mob/clothing/shoes_digi.dmi'

/obj/item/clothing/shoes/invisiboots
	name = "invisifiber footwraps"
	desc = "A set of transparent fibers used for wrapping claws or paws."
	icon = 'modular_splurt/icons/obj/clothing/shoes.dmi'
	icon_state = "foot_wraps_transparent"
	// No overlay, because they're invisible!

/obj/item/clothing/shoes/jackboots/toeless
	name = "toe-less jackboots"
	desc = "Modified pair of jackboots, particularly friendly to those species whose toes hold claws."
	icon = 'modular_splurt/icons/obj/clothing/shoes.dmi'
	icon_state = "jackboots-toeless"
	worn_icon = 'modular_splurt/icons/mob/clothing/shoes.dmi'
	worn_icon_digi = 'modular_splurt/icons/mob/clothing/shoes_digi.dmi'

/obj/item/clothing/shoes/jackboots/tall
	name = "tall jackboots"
	desc = "A pair of knee-high jackboots, complete with heels. All style, all the time."
	icon = 'modular_splurt/icons/obj/clothing/shoes.dmi'
	icon_state = "jackboots-tall"
	worn_icon = 'modular_splurt/icons/mob/clothing/shoes.dmi'
	worn_icon_digi = 'modular_splurt/icons/mob/clothing/shoes_digi.dmi'

/obj/item/clothing/shoes/jackboots/tall/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, list('modular_splurt/sound/effects/footstep/highheel1.ogg' = 1,'modular_splurt/sound/effects/footstep/highheel2.ogg' = 1), 20)

/obj/item/clothing/shoes/workboots/toeless
	name = "toe-less workboots"
	desc = "A pair of toe-less work boots designed for use in industrial settings. Modified for species whose toes have claws."
	icon = 'modular_splurt/icons/obj/clothing/shoes.dmi'
	icon_state = "workboots-toeless"
	worn_icon = 'modular_splurt/icons/mob/clothing/shoes.dmi'
	worn_icon_digi = 'modular_splurt/icons/mob/clothing/shoes_digi.dmi'

/obj/item/clothing/shoes/jackboots/cbrn
	name = "CBRN boots"
	desc = "Chemical, Biological, Radiological and Nuclear. Thick black boots design for working in hazardous environments."
	icon = 'modular_splurt/icons/obj/clothing/shoes.dmi'
	icon_state = "cbrnboots"
	worn_icon = 'modular_splurt/icons/mob/clothing/shoes.dmi'
	worn_icon_digi = 'modular_splurt/icons/mob/clothing/shoes_digi.dmi'
	resistance_flags = ACID_PROOF
	is_edible = 0

/obj/item/clothing/shoes/jackboots/cbrn/Initialize()
	. = ..()
	AddElement(/datum/element/radiation_protected_clothing)

/obj/item/clothing/shoes/jackboots/cbrn/mopp
	name = "MOPP boots"
	desc = "Mission Oriented Protective Posture. Thick black boots design for working in hazardous combat environments."

/obj/item/clothing/shoes/jackboots/cbrn/mopp/advance
	name = "advance MOPP boots"
	desc = "Mission Oriented Protective Posture. Thick black boots design for working in hazardous combat environments. Used by CentCom Officer and ERT staff."
	clothing_flags = NOSLIP

//research nods
/datum/design/cbrn/cbrnboots
	name = "CBRN Boots"
	desc = "A pair CBRN boots."
	id = "cbrn_boots"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 200, /datum/material/uranium = 50, /datum/material/iron = 200)
	build_path = /obj/item/clothing/shoes/jackboots/cbrn
	category = list("Equipment")
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY | DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_SERVICE | DEPARTMENT_BITFLAG_CARGO | DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cbrn/moppboots
	name = "MOPP Boots"
	desc = "A pair MOPP boots"
	id = "mopp_boots"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 200, /datum/material/uranium = 50, /datum/material/iron = 200)
	build_path = /obj/item/clothing/shoes/jackboots/cbrn/mopp
	category = list("Equipment")
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

/obj/item/clothing/shoes/highheel_sandals
	name = "high-heel sandals"
	desc = "A pair of high-heel sandals"
	icon = 'modular_splurt/icons/obj/clothing/shoes.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/shoes.dmi'
	worn_icon_digi = 'modular_splurt/icons/mob/clothing/shoes_digi.dmi'
	icon_state = "highheel_sandals"

/obj/item/clothing/shoes/highheel_sandals/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, list('modular_splurt/sound/effects/footstep/highheel1.ogg' = 1,'modular_splurt/sound/effects/footstep/highheel2.ogg' = 1), 20)
