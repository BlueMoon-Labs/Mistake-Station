// removes resricted role for D.A.B. helmets. RIP N.E.E.T. gear as exclusive for assistants (2019-2021).
/datum/loadout_item/head/neethelm
	restricted_roles = list()

// Updates restrictions to accomodate new jobs (mostly trekkie stuff)
/datum/loadout_item/head/brodie
	restricted_roles = list("Security Officer", "Warden", "Head of Security", "Brig Physician", "Blueshield")

/datum/loadout_item/head/trekcapcap
	restricted_roles = list("Captain","Head of Personnel","Blueshield")

/datum/loadout_item/head/trekcapmedisci
	restricted_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Virologist","Paramedic","Geneticist","Research Director","Scientist", "Roboticist", "Brig Physician")

/datum/loadout_item/head/trekcapsec
	restricted_roles = list("Head of Security","Captain","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Quartermaster","Warden","Detective","Security Officer","Brig Physician","Blueshield","Bridge Officer")

/datum/loadout_item/head/orvkepicom
	restricted_roles = list("Head of Security", "Captain", "Head of Personnel", "Chief Engineer", "Research Director", "Chief Medical Officer", "Quartermaster", "Bridge Officer")

/datum/loadout_item/head/orvkepisec
	restricted_roles = list("Warden", "Detective", "Security Officer", "Head of Security", "Brig Physician", "Blueshield")

/datum/loadout_item/head/orvkepimedsci
	restricted_roles = list("Chief Medical Officer", "Medical Doctor", "Chemist", "Virologist", "Paramedic", "Geneticist", "Research Director", "Scientist", "Roboticist", "Brig Physician")

/datum/loadout_item/head/cowboyhat/sec
	restricted_roles = list("Warden","Detective","Security Officer","Head of Security", "Brig Physician", "Blueshield")

// Polychrome GWTB
///datum/loadout_item/head/gonerhelm
//	name = "polychromic trencher helmet"
//	cost = 2
//	item_path = /obj/item/clothing/head/helmet/goner/fake/poly
//	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION | LOADOUT_CAN_COLOR_POLYCHROMIC
//	loadout_initial_colors = list("#D9D9D9")
//
///datum/loadout_item/head/goneroffcap
//	name = "polychromic trencher officer cap"
//	cost = 2
//	item_path = /obj/item/clothing/head/helmet/goner/officer/fake/poly
//	loadout_flags = LOADOUT_CAN_NAME | LOADOUT_CAN_DESCRIPTION | LOADOUT_CAN_COLOR_POLYCHROMIC
//	loadout_initial_colors = list("#F2F2F2")
//
////Adds bowler hats
///datum/loadout_item/head/bowler
//	name = "Bowler-hat"
//	cost = 1
//	item_path = /obj/item/clothing/head/bowler
////
////Adds medical beret
///datum/loadout_item/head/medberet
//	name = "Medical officer's beret"
//	cost = 1
//	item_path = /obj/item/clothing/head/beret/med
////	restricted_roles = list("Chief Medical Officer", "Medical Doctor", "Chemist", "Virologist", "Paramedic", "Geneticist", "Brig Physician")
//	subcategory = LOADOUT_SUBCATEGORY_HEAD_JOBS

//Adds the three basic flowers that can be pinned into the hair
/datum/loadout_item/head/poppy
	name = "Poppy"
	item_path = /obj/item/food/grown/poppy

/datum/loadout_item/head/lily
	name = "Lily"
	item_path = /obj/item/food/grown/poppy/lily

/datum/loadout_item/head/geranium
	name = "Geranium"
	item_path = /obj/item/food/grown/poppy/geranium
