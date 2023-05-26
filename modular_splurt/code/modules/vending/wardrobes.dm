/obj/machinery/vending/wardrobe/det_wardrobe/Initialize(mapload)
	var/list/extra_products = list(
		/obj/item/clothing/suit/det_suit/lanyard = 1
	)
	LAZYADD(products, extra_products)
	. = ..()

/obj/machinery/vending/wardrobe/curator_wardrobe/Initialize(mapload)
	var/list/extra_products = list(
		/obj/item/clothing/suit/press = 1,
			/obj/item/clothing/head/press_helmet = 1
	)
	LAZYADD(products, extra_products)
	. = ..()

/obj/machinery/vending/wardrobe/engi_wardrobe/Initialize(mapload)
	var/list/extra_products = list(
		/obj/item/clothing/under/radkini = 2,
		/obj/item/clothing/mask/gas/radmask = 2
	)
	LAZYADD(products, extra_products)
	. = ..()

/obj/machinery/vending/wardrobe/law_wardrobe/Initialize(mapload)
	var/list/extra_products = list(
		/obj/item/clothing/under/rank/civilian/lawyer/galaxy_blue = 3,
		/obj/item/clothing/under/rank/civilian/lawyer/galaxy_red = 3
	)
	LAZYADD(products, extra_products)
	. = ..()

/obj/machinery/vending/wardrobe/bridgeofficer_wardrobe
	name = "\improper CommDrobe"
	desc = "A vending machine for bridge officers and officer-related clothing!"
	icon_state = "commdrobe"
	icon = 'modular_splurt/icons/obj/objects.dmi'
	product_ads = "Make yourself feel important!;Feel good while serving command!;"
	vend_reply = "Thank you for using the BlueDrobe!"
	products = list(/obj/item/clothing/under/rank/bridgeofficer = 2,
					/obj/item/clothing/under/rank/bridgeofficer/skirt = 2,
					/obj/item/clothing/under/rank/bridgeofficer/formal = 2,
					/obj/item/clothing/head/bridgeofficer = 2,
					/obj/item/clothing/head/bridgeofficer/beret = 2,
					/obj/item/clothing/suit/toggle/brigdesec = 2,
					/obj/item/storage/backpack = 2,
					/obj/item/storage/backpack/satchel = 2,
					/obj/item/storage/backpack/duffelbag = 2,
					/obj/item/clothing/gloves/color/black = 2,
					/obj/item/clothing/shoes/sneakers/brown  =2,
					/obj/item/clothing/shoes/sneakers/black = 2,
					/obj/item/clothing/shoes/sneakers/blue = 2,
					/obj/item/clothing/neck/tie/blue = 2,
					/obj/item/clothing/neck/tie/red = 2,
					/obj/item/clothing/neck/tie/black =2)
	refill_canister = /obj/item/vending_refill/wardrobe/bridgeofficer_wardrobe
	payment_department = ACCOUNT_CIV
	light_color = COLOR_STRONG_BLUE

/obj/item/vending_refill/wardrobe/bridgeofficer_wardrobe
	machine_name = "BlueDrobe"
