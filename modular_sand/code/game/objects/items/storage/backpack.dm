/obj/item/storage/backpack/case
	name = "compartment case"
	desc = "A large compartment case for holding lots of things."
	icon = 'modular_sand/icons/obj/storage.dmi'
	icon_state = "infiltrator_case_basic"
	icon_state = "infiltrator_case_basic"
	slot_flags = null

/obj/item/storage/backpack/case/Initialize()
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL
	atom_storage.max_total_storage = 25

/obj/item/storage/backpack/case/security
	name = "secure compartment case"
	desc = "It's a case for people that wanna hurt people."
	icon_state = "infiltrator_case_security"
	icon_state = "infiltrator_case_security"

/obj/item/storage/backpack/case/command
	name = "command compartment case"
	desc = "It's a special case made exclusively for Nanotrasen officers."
	icon_state = "infiltrator_case_command"
	icon_state = "infiltrator_case_command"

/obj/item/storage/backpack/case/medical
	name = "medical compartment case"
	desc = "It's a case especially designed for keeping everything to save a fellow co-worker."
	icon_state = "infiltrator_case_medical"
	icon_state = "infiltrator_case_medical"

/obj/item/storage/backpack/case/engineering
	name = "industrial compartment case"
	desc = "A large case for holding tools and supplies for large constructions."
	icon_state = "infiltrator_case_engineering"
	icon_state = "infiltrator_case_engineering"

/obj/item/storage/backpack/case/mining
	name = "mining compartment case"
	desc = "A large case for holding both loot and equipment."
	icon_state = "infiltrator_case_mining"
	icon_state = "infiltrator_case_mining"

/obj/item/storage/backpack/case/science
	name = "science compartment case"
	desc = "A large case for holding science supplies."
	icon_state = "infiltrator_case_science"
	icon_state = "infiltrator_case_science"

/obj/item/storage/backpack/case/cosmos
	name = "cosmos compartment case"
	desc = "A large compartment case for holding lots of things.\nThis one has been designed to look like space, neat."
	icon_state = "infiltrator_case_cosmos"
	icon_state = "infiltrator_case_cosmos"
