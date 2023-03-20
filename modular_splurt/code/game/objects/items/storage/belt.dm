/obj/item/storage/belt/slut
	name = "slutcurity belt"
	desc = "Holds a variety of gear for \"alternative\" peacekeeping."
	icon = 'modular_splurt/icons/obj/clothing/belts.dmi'
	icon_state = "slutbelt"
	icon_state = "security"

/obj/item/storage/belt/slut/Initialize()
	. = ..()
	atom_storage.max_total_storage = 5
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL
	atom_storage.set_holdable(list(
		/obj/item/ammo_box,
		/obj/item/ammo_casing/shotgun,
		/obj/item/assembly/flash/handheld,
		/obj/item/clothing/glasses,
		/obj/item/clothing/gloves,
		/obj/item/flashlight/seclite,
		/obj/item/food/donut,
		/obj/item/grenade,
		/obj/item/gun, //SKYRAT EDIT ADDITION
		/obj/item/holosign_creator/security,
		/obj/item/knife/combat,
		/obj/item/melee/baton,
		/obj/item/radio,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/restraints/handcuffs,
		/obj/item/restraints/legcuffs/bola,
		/obj/item/stock_parts/cell/microfusion, //SKYRAT EDIT ADDITION
		/obj/item/dildo,
		/obj/item/leash,
		/obj/item/genital_equipment/condom,
		/obj/item/clothing/mask/leatherwhip,
		/obj/item/clothing/mask/gas/sechailer/slut
		))

/obj/item/storage/belt/cummerbund
	name = "cummerbund" //I swear to god if you people aren't mature enough to handle this I'm just gonna call it a sash.
	desc = "A pleated sash that pairs well with a suit jacket."
	icon = 'modular_splurt/icons/obj/clothing/belts.dmi'
	icon_state = "cummerbund"
	icon_state = "cummerbund"

