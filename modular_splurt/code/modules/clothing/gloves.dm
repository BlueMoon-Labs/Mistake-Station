/obj/item/clothing/gloves/cbrn
	name = "CBRN gloves"
	desc = "Chemical, Biological, Radiological and Nuclear. Thick black gloves design for working in hazardous environments. Warning not shock proof."
	icon_state = "black"
	icon_state = "blackgloves"
	siemens_coefficient = 1
	strip_delay = 80
	cold_protection = HANDS
	min_cold_protection_temperature = GLOVES_MIN_TEMP_PROTECT
	heat_protection = HANDS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	resistance_flags = ACID_PROOF
	armor_type = /datum/armor/utility_radiation
	equip_delay_other = 60
	is_edible = 0

/obj/item/clothing/gloves/cbrn/Initialize()
	. = ..()
	AddElement(/datum/element/radiation_protected_clothing)

/obj/item/clothing/gloves/cbrn/engineer
	name = "engineer CBRN gloves"
	siemens_coefficient = 0
	desc = "Chemical, Biological, Radiological and Nuclear. Thick black gloves design for working in hazardous environments. Improved for engineering hazards"

/obj/item/clothing/gloves/cbrn/mopp
	name = "MOPP gloves"
	desc = "Mission Oriented Protective Posture. Thick black gloves design for working in hazardous combat environments. Still not shock proof"
	icon_state = "combat"
	armor_type = /datum/armor/utility_radiation

/obj/item/clothing/gloves/cbrn/mopp/advance
	name = "advance MOPP gloves"
	desc = "Mission Oriented Protective Posture. Thick black gloves design for working in hazardous combat environments. Advance variants for Central Command staff and ERT team. Insulated."
	icon_state = "combat"
	siemens_coefficient = 0
	armor_type = /datum/armor/utility_radiation

// research nods
/datum/design/cbrn/cbrngloves
	name = "CBRN Gloves"
	desc = "A pair of CBRN gloves."
	id = "cbrn_gloves"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 200, /datum/material/uranium = 50, /datum/material/iron = 200)
	build_path = /obj/item/clothing/gloves/cbrn
	category = list("Equipment")
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY | DEPARTMENT_BITFLAG_SERVICE | DEPARTMENT_BITFLAG_CARGO | DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_MEDICAL

/datum/design/cbrn/cbrnglovesengi
	name = "Engineering CBRN Gloves"
	desc = "A pair of engineering CBRN gloves."
	id = "cbrn_glovesengi"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 200, /datum/material/uranium = 55, /datum/material/iron = 200)
	build_path = /obj/item/clothing/gloves/cbrn/engineer
	category = list("Equipment")
	departmental_flags = DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/cbrn/moppgloves
	name = "MOPP Gloves"
	desc = "A pair of MOPP gloves."
	id = "mopp_gloves"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 200, /datum/material/uranium = 50, /datum/material/iron = 200)
	build_path = /obj/item/clothing/gloves/cbrn/mopp
	category = list("Equipment")
	departmental_flags = DEPARTMENT_BITFLAG_SECURITY
