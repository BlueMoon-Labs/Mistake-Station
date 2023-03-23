/*
/obj/item/clothing/suit/petharness
	name = "Pet Harness"
	desc = "For your pet! Or not! Has a little clip on the back."
	icon_state = "petharness"
	item_state = "petharness"
	body_parts_covered = NONE
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
	allowed = /obj/item/toy/fluff

/obj/item/clothing/suit/petharness/mesh
	name = "Mesh Pet Harness"
	desc = "For your pet! Or not! Has some mesh to cover up your more sensitive bits and a little clip on the back."
	icon_state = "petharness_mesh"
	item_state = "petharness_mesh"
	body_parts_covered = CHEST
*/
/obj/item/food/cookie/dogtreat
	name = "Dog Treat"
	desc = "It's a scooby-snack. Right?"
	icon_state = "dogtreat"
	bite_consumption = 1
	food_reagents = list(/datum/reagent/consumable/nutriment = 4)
	color = "#635444"
	tastes = list("meat" = 1, "dough" = 1)
	foodtypes = GRAIN | MEAT

/obj/item/storage/fancy/treat_box
	name = "treat box"
	desc = "A cardboard box used for holding dog treats."
	icon = 'icons/obj/food/containers.dmi'
	icon_state = "treatbox"
	base_icon_state = "treat"
	spawn_type = /obj/item/food/cookie/dogtreat

/obj/item/storage/fancy/treat_box/Initialize()
	. = ..()
	atom_storage.max_slots = 6
	atom_storage.can_hold = typecacheof(list(/obj/item/food/cookie/dogtreat))

/obj/item/storage/fancy/nugget_box
	name = "nugget box"
	desc = "A cardboard box used for holding chicken nuggies."
	icon = 'icons/obj/food/containers.dmi'
	icon_state = "nuggetbox"
	base_icon_state = "nuggetbox"
	contents_tag = "nugget"
	spawn_type = /obj/item/food/nugget
	spawn_count = 6

/obj/item/storage/fancy/nugget_box/Initialize(mapload)
	. = ..()
	atom_storage.set_holdable(list(/obj/item/food/nugget))

/obj/machinery/vending/barkbox
	name = "Bark Box"
	desc = "For all your pet needs!"
	icon_state = "barkbox"
	product_slogans = "Whuff!;Bark!;Give me a treat!"
	products = list(
				/obj/item/storage/fancy/treat_box = 8,
				/obj/item/clothing/neck/petcollar = 5,
				/obj/item/clothing/neck/human_petcollar/leather = 5,
				//obj/item/clothing/suit/petharness = 4,
				//obj/item/clothing/suit/petharness/mesh = 4,
				/obj/item/toy/tennis = 4,
				/obj/item/toy/tennis/rainbow = 2,
				/obj/item/toy/tennis/red = 4,
				/obj/item/toy/tennis/yellow = 4,
				/obj/item/toy/tennis/green = 4,
				/obj/item/toy/tennis/cyan = 4,
				/obj/item/toy/tennis/blue = 4,
				/obj/item/toy/tennis/purple = 4
				)
	contraband = list(
				/obj/item/clothing/neck/human_petcollar/locked = 2,
				//obj/item/clothing/neck/human_petcollar/locked/ribbon = 2,
				/obj/item/clothing/neck/human_petcollar/locked/leather = 2,
				/obj/item/key/collar = 2,
				/obj/item/dildo/knotted = 3
				)
	premium = list(
				/obj/item/toy/tennis/rainbow/izzy = 1
				)
	refill_canister = /obj/item/vending_refill/barkbox
	default_price = PAYCHECK_CREW * 0.7 //Default of 35.
	extra_price = PAYCHECK_CREW
	payment_department = NO_FREEBIES

/obj/item/vending_refill/barkbox
	machine_name 	= "Bark Box"
	icon_state 		= "refill_barkbox"


/obj/machinery/vending/barkbox/Initialize(mapload)
	var/list/extra_products = list(
		/obj/item/clothing/neck/human_petcollar/spike = 5,
		/obj/item/clothing/neck/human_petcollar/holo = 5,
		/obj/item/clothing/neck/human_petcollar/casino = 5,
		/obj/item/clothing/neck/human_petcollar/handmade = 5
	)
	var/list/extra_contraband = list(
		/obj/item/clothing/neck/human_petcollar/locked/spike = 2,
		/obj/item/clothing/neck/human_petcollar/locked/holo = 2,
		/obj/item/clothing/neck/human_petcollar/locked/casino = 2
	)
	LAZYADD(products, extra_products)
	LAZYADD(contraband, extra_contraband)
	. = ..()

