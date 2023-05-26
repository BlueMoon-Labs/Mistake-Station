/obj/machinery/vending/security/Initialize()
	var/list/extra_products = list(
		/obj/item/ammo_box/magazine/e45/taser = 10,

	)
	var/list/extra_contraband = list(
		/obj/item/storage/belt/slut = 5,
		/obj/item/clothing/suit/armor/vest/stripper = 5,
		/obj/item/clothing/suit/armor/vest/stripper/bikini = 5,
		/obj/item/clothing/mask/leatherwhip/ridingcrop = 3,
		/obj/item/electropack/shockcollar/security = 5,
		/obj/item/grenade/secbed = 3,
		/obj/item/dildo/flared/gigantic = 3
	)
	LAZYADD(products, extra_products)
	LAZYADD(contraband, extra_contraband)
	. = ..()

/obj/machinery/vending/wardrobe/sec_wardrobe/Initialize()
	var/list/extra_products = list(
		/obj/item/clothing/head/hats/sec/peacekeeper/cap = 5,
		/obj/item/clothing/mask/balaclava/breath = 5,
		/obj/item/clothing/under/rank/security/officer/peacekeeper = 5,
		/obj/item/clothing/head/helmet/metrocop = 3,
		/obj/item/clothing/suit/armor/vest/metrocop = 3,
		/obj/item/clothing/under/rank/security/officer/metrocop = 3,
		/obj/item/clothing/head/hats/sec/bitch = 5,
		/obj/item/clothing/under/rank/security/skirt/slut = 5,
		/obj/item/clothing/under/rank/security/skirt/slut/pink = 5,
		/obj/item/clothing/under/rank/security/stripper = 5,
		/obj/item/clothing/suit/hooded/corpus/s = 5
	)
	var/list/extra_premium = list(
		/obj/item/clothing/gloves/latexsleeves/security = 5,
		/obj/item/clothing/shoes/jackboots/tall = 5,
		/obj/item/clothing/under/custom/mw2_russian_para = 5
	)
	LAZYADD(products, extra_products)
	LAZYADD(premium, extra_premium)
	. = ..()

/obj/structure/closet/secure_closet/bridgesec
	name = "bridge officer's locker"
	req_access = list(ACCESS_BRIDGE_OFFICER)
	icon_state = "bridge"
	icon = 'modular_splurt/icons/obj/closet.dmi'

/obj/structure/closet/secure_closet/bridgesec/PopulateContents()
	..()
	new /obj/item/radio/headset/headset_bo(src)
	new /obj/item/radio/headset/headset_bo(src)
	new /obj/item/radio/headset/headset_bo/bowman(src)
	new /obj/item/radio/headset/headset_bo/bowman(src)
	new /obj/item/clipboard(src)
	new /obj/item/clipboard(src)
	new /obj/item/clothing/neck/petcollar(src)
	new /obj/item/clothing/neck/petcollar(src)

//do not map these in anywhere but if you do, Central command only!!! These are for Admin spawn only!!!!

/obj/structure/closet/secure_closet/mopp
	name = "advance MOPP locker"
	req_access = list(ACCESS_CENT_GENERAL)
	icon_state = "goodies"

/obj/structure/closet/secure_closet/mopp/PopulateContents()
	..()
	new /obj/item/tank/internals/plasmamandouble(src)
	new /obj/item/tank/internals/doubleoxygen(src)
	new /obj/item/clothing/head/helmet/cbrn/mopp/advance(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/clothing/suit/cbrn/mopp/advance(src)
	new /obj/item/clothing/gloves/cbrn/mopp/advance(src)
	new /obj/item/clothing/shoes/jackboots/cbrn/mopp/advance (src)
	new /obj/item/clothing/mask/gas/cbrn/mopp/advance(src)

/obj/structure/closet/secure_closet/commandmopp
	name = "advance MOPP locker 'Commander'"
	req_access = list(ACCESS_CENT_GENERAL)
	icon_state = "goodies"

/obj/structure/closet/secure_closet/commandmopp/PopulateContents()
	..()
	new /obj/item/tank/internals/plasmamandouble(src)
	new /obj/item/tank/internals/doubleoxygen(src)
	new /obj/item/clothing/head/helmet/cbrn/mopp/advance(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/clothing/suit/cbrn/mopp/advance/commander(src)
	new /obj/item/clothing/gloves/cbrn/mopp/advance(src)
	new /obj/item/clothing/shoes/jackboots/cbrn/mopp/advance (src)
	new /obj/item/clothing/mask/gas/cbrn/mopp/advance(src)

/obj/structure/closet/secure_closet/secmopp
	name = "advance MOPP locker 'secuirity'"
	req_access = list(ACCESS_CENT_GENERAL)
	icon_state = "goodies"

/obj/structure/closet/secure_closet/secmopp/PopulateContents()
	..()
	new /obj/item/tank/internals/plasmamandouble(src)
	new /obj/item/tank/internals/doubleoxygen(src)
	new /obj/item/clothing/head/helmet/cbrn/mopp/advance(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/clothing/suit/cbrn/mopp/advance/security(src)
	new /obj/item/clothing/gloves/cbrn/mopp/advance(src)
	new /obj/item/clothing/shoes/jackboots/cbrn/mopp/advance (src)
	new /obj/item/clothing/mask/gas/cbrn/mopp/advance(src)

/obj/structure/closet/secure_closet/medmopp
	name = "advance MOPP locker 'medical'"
	req_access = list(ACCESS_CENT_GENERAL)
	icon_state = "goodies"

/obj/structure/closet/secure_closet/medmopp/PopulateContents()
	..()
	new /obj/item/tank/internals/plasmamandouble(src)
	new /obj/item/tank/internals/doubleoxygen(src)
	new /obj/item/clothing/head/helmet/cbrn/mopp/advance(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/clothing/suit/cbrn/mopp/advance/medical(src)
	new /obj/item/clothing/gloves/cbrn/mopp/advance(src)
	new /obj/item/clothing/shoes/jackboots/cbrn/mopp/advance (src)
	new /obj/item/clothing/mask/gas/cbrn/mopp/advance(src)

/obj/structure/closet/secure_closet/engimopp
	name = "advance MOPP locker 'engineering'"
	req_access = list(ACCESS_CENT_GENERAL)
	icon_state = "goodies"

/obj/structure/closet/secure_closet/engimopp/PopulateContents()
	..()
	new /obj/item/tank/internals/plasmamandouble(src)
	new /obj/item/tank/internals/doubleoxygen(src)
	new /obj/item/clothing/head/helmet/cbrn/mopp/advance(src)
	new /obj/item/flashlight/seclite(src)
	new /obj/item/clothing/suit/cbrn/mopp/advance/engi(src)
	new /obj/item/clothing/gloves/cbrn/mopp/advance(src)
	new /obj/item/clothing/shoes/jackboots/cbrn/mopp/advance (src)
	new /obj/item/clothing/mask/gas/cbrn/mopp/advance(src)
