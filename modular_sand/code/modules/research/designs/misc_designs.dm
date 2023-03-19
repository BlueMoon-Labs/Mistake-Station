/datum/design/bluespacespray
	name = "Bluespace Spray"
	desc = "A bluespace sprayer, may be illegal in some places due to honkers."
	id = "bluespacespray"
	build_type = PROTOLATHE
	materials = list(/datum/material/glass = 2250, /datum/material/plasma = 2250, /datum/material/diamond = 185, /datum/material/bluespace = 185)
	build_path = /obj/item/reagent_containers/spray/bluespace
	category = list("Misc", "Medical Designs")
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL | DEPARTMENT_BITFLAG_SCIENCE

/datum/design/dropper
	name = "Dropper"
	desc = "A dropper. Holds up to 5 units."
	id = "dropper"
	build_type = PROTOLATHE | AUTOLATHE
	materials = list(/datum/material/plastic = 500)
	build_path = /obj/item/reagent_containers/dropper
	category = list("Misc", "Medical Designs")
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL | DEPARTMENT_BITFLAG_SCIENCE

