/datum/design/board/autodoc
	name = "Machine Design (Autodoc)"
	desc = "The circuit board for an Autodoc."
	id = "autodoc"
	build_path = /obj/item/circuitboard/machine/autodoc
	category = list(
		RND_CATEGORY_MACHINE + RND_SUBCATEGORY_MACHINE_MEDICAL
	)
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL

//Cryptocurrency Miners
/datum/design/board/cryptominer
	name = "Machine Design (Cryptocurrency Miner)"
	desc = "The circuit board for a Cryptocurrency Miner."
	id = "cryptominer"
	build_path = /obj/item/circuitboard/machine/cryptominer
	category = list(RND_SUBCATEGORY_EQUIPMENT_MISC)
	departmental_flags = DEPARTMENT_BITFLAG_CARGO | DEPARTMENT_BITFLAG_ENGINEERING

/datum/design/board/cryptominer/syndie
	name = "Machine Design (Syndicate Cryptocurrency Miner)"
	desc = "The circuit board for a Syndicate Cryptocurrency Miner."
	id = "cryptominersyndie"
	build_path = /obj/item/circuitboard/machine/cryptominer/syndie
	category = list(
		RND_CATEGORY_MACHINE + RND_SUBCATEGORY_MACHINE_CARGO
	)
	departmental_flags = DEPARTMENT_BITFLAG_CARGO | DEPARTMENT_BITFLAG_ENGINEERING

//BS miner
/datum/design/board/bluespace_miner
	name = "Machine Design (Bluespace Miner)"
	desc = "The circuit board for a Bluespace Miner."
	id = "bluespace_miner"
	build_path = /obj/item/circuitboard/machine/bluespace_miner
	category = list(
		RND_CATEGORY_MACHINE + RND_SUBCATEGORY_MACHINE_ENGINEERING
	)
	departmental_flags = DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_CARGO | DEPARTMENT_BITFLAG_ENGINEERING
