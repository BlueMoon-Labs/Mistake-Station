// This icon fixes blue-ish tint on the helmet
/obj/item/clothing/head/assu_helmet
	icon = 'modular_splurt/icons/obj/clothing/head.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/head.dmi'

/obj/item/clothing/head/jester
	unique_reskin = list(
		"Original" = list(
			"icon_state" = "jester_hat",
			"icon" = 'icons/obj/clothing/head/costume.dmi',
			"worn_icon" = null,
		),
		"Stripped" = list(
			"icon_state" = "striped_jester_hat",
			"icon" = 'modular_splurt/icons/obj/clothing/head.dmi',
			"worn_icon" = 'modular_splurt/icons/mob/clothing/head.dmi',
		)
	)

/obj/item/clothing/head/bridgeofficer
	name = "bridge officer cap"
	desc = "A generic blue cap for the back ground officer"
	icon_state = "bridgeseccap"
	icon_state = "bridgeseccap"
	icon = 'modular_splurt/icons/obj/clothing/head.dmi'
	worn_icon = 'modular_splurt/icons/mobs/head.dmi'
	strip_delay = 25

	dog_fashion = null

/obj/item/clothing/head/bridgeofficer/beret
	name = "bridge officer beret"
	desc = "A generic blue beret for the back ground officer"
	icon_state = "beret_bridgesec"
	icon_state = "beret_bridgesec"
	worn_icon = 'modular_splurt/icons/mob/clothing/head.dmi'

/obj/item/clothing/head/press_helmet
	name = "press helmet"
	icon_state = "press_helmet"
	icon_state = "press_helmet"
	desc = "A lightweight helmet for reporting on security. You swear up and down it is made of Kevlar and not old cloth and plastic."
	icon = 'modular_splurt/icons/obj/clothing/head.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/head.dmi'
	flags_inv = HIDEHAIR

//CBRN/MOPP helmets

/obj/item/clothing/head/helmet/cbrn
	name = "CBRN hood"
	desc = "Chemical, Biological, Radiological and Nuclear. A hood design for harsh environmental conditions short of no atmosphere"
	icon_state = "cbrnhood"
	icon_state = "cbrnhood"
	icon = 'modular_splurt/icons/obj/clothing/head.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/head.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	strip_delay = 60
	equip_delay_other = 60
	body_parts_covered = HEAD
	clothing_flags = THICKMATERIAL
	flags_inv = HIDEHAIR|HIDEEARS
	resistance_flags = ACID_PROOF

/obj/item/clothing/head/helmet/cbrn/Initialize()
	. = ..()
	AddElement(/datum/element/radiation_protected_clothing)

/obj/item/clothing/head/helmet/cbrn/mopp
	name = "MOPP hood"
	desc = "Mission Oriented Protective Posture. A hood design for harsh combat conditions short of no atmosphere. This one has a helmet towed onto the hood for added protection."
	icon_state = "mopphood"
	icon_state = "mopphood"
/obj/item/clothing/head/helmet/cbrn/mopp/advance
	name = "advance MOPP hood"
	desc = "Mission Oriented Protective Posture. A hood design for harsh combat conditions short of no atmosphere. This is an advance versoin for ERT units and Central Command Staff."
	clothing_flags = NONE

// research nods
/datum/design/cbrn/cbrnhood
	name = "CBRN Hood"
	desc = "A CBRN hood."
	id = "cbrn_hood"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 200, /datum/material/uranium = 50, /datum/material/iron = 200)
	build_path = /obj/item/clothing/head/helmet/cbrn
	category = list("Equipment")
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY | DEPARTMENT_BITFLAG_ENGINEERING | DEPARTMENT_BITFLAG_SERVICE | DEPARTMENT_BITFLAG_CARGO | DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cbrn/mopphood
	name = "MOPP Hood"
	desc = "A MOPP hood with an integrated helmet"
	id = "mopp_hood"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 200, /datum/material/uranium = 50, /datum/material/iron = 200)
	build_path = /obj/item/clothing/head/helmet/cbrn/mopp
	category = list("Equipment")
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY

