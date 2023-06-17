// removes resricted role for D.A.B. suits. RIP N.E.E.T. gear as exclusive for assistants (2019-2021).
/datum/loadout_item/suit/neetsuit
	restricted_roles = list()

// Suggestion #183
///datum/loadout_item/suit/dracula
//	name = "dracula coat"
//	item_path = /obj/item/clothing/suit/dracula

// Suggestion #3279
/datum/loadout_item/suit/apron
	name = "apron, blue"
	item_path = /obj/item/clothing/suit/apron

/datum/loadout_item/suit/overalls
	name = "overalls"
	item_path = /obj/item/clothing/suit/apron/overalls

// Fixes "Fed (Modern) uniform, White" being in general suit loadout section.
/datum/loadout_item/suit/trekcmdcapmod
	category = LOADOUT_SUBCATEGORY_SUIT_JOBS

// Updates restrictions to accomodate new jobs (mostly trekkie stuff)
/datum/loadout_item/suit/trekds9_coat
	restricted_roles = list("Head of Security","Captain","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Quartermaster","Blueshield","Bridge Officer",
							"Medical Doctor","Chemist","Virologist","Paramedic","Geneticist","Scientist", "Roboticist",
							"Atmospheric Technician","Station Engineer","Warden","Detective","Security Officer","Brig Physician",
							"Cargo Technician", "Shaft Miner")

/datum/loadout_item/suit/trekcmdcap
	restricted_roles = list("Captain","Head of Personnel","Blueshield")

/datum/loadout_item/suit/trekcmdmov
	restricted_roles = list("Head of Security","Captain","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Quartermaster","Warden","Detective","Security Officer","Brig Physician","Blueshield","Bridge Officer")

/datum/loadout_item/suit/trekmedscimov
	restricted_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Virologist","Paramedic","Geneticist","Research Director","Scientist", "Roboticist", "Brig Physician")

/datum/loadout_item/suit/trekcmdmod
	restricted_roles = list("Head of Security","Captain","Head of Personnel","Chief Engineer","Research Director","Chief Medical Officer","Quartermaster","Warden","Detective","Security Officer","Brig Physician","Blueshield","Bridge Officer")

/datum/loadout_item/suit/trekmedscimod
	restricted_roles = list("Chief Medical Officer","Medical Doctor","Chemist","Virologist","Paramedic","Geneticist","Research Director","Scientist", "Roboticist", "Brig Physician")

/datum/loadout_item/suit/jacketyellow
	name = "Yellow Jacket"
	item_path = /obj/item/clothing/suit/toggle/rp_jacket

/datum/loadout_item/suit/jacketorange
	name = "Orange Jacket"
	item_path = /obj/item/clothing/suit/toggle/rp_jacket/orange

/datum/loadout_item/suit/jacketred
	name = "Red Jacket"
	item_path = /obj/item/clothing/suit/toggle/rp_jacket/red

/datum/loadout_item/suit/jacketpurple
	name = "Purple Jacket"
	item_path = /obj/item/clothing/suit/toggle/rp_jacket/purple

/datum/loadout_item/suit/jacketwhite
	name = "White Jacket"
	item_path = /obj/item/clothing/suit/toggle/rp_jacket/white

/datum/loadout_item/suit/baroness
	name = "Baroness Dress"
	item_path = /obj/item/clothing/suit/baroness

/datum/loadout_item/suit/ladyballat
	name = "Green Ball Dress"
	item_path = /obj/item/clothing/suit/baroness/ladyballat

// Polychrome GWTB
/datum/loadout_item/suit/gonersuit
	name = "trencher coat"
	item_path = /obj/item/clothing/suit/goner/fake/poly

/datum/loadout_item/suit/gonersuit/classic
	name = "trencher coat (classic)"
	item_path = /obj/item/clothing/suit/goner/fake/poly/classic

/datum/loadout_item/suit/tunnelfox
	name = "tunnel fox jacket"
	item_path = /obj/item/clothing/suit/toggle/tunnelfox
