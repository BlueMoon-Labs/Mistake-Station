/obj/machinery/vending/kink
	name = "KinkMate"
	desc = "A vending machine for all your unmentionable desires."
	icon_state = "kink"
	product_slogans = "Kinky!;Sexy!;Check me out, big boy!"
	vend_reply = "Have fun, you shameless pervert!"
	products = list(
				/obj/item/genital_equipment/condom = 10,
				/obj/item/clothing/head/maid = 5,
				/obj/item/clothing/under/costume/maid = 5,
				/obj/item/clothing/under/rank/civilian/janitor/maid = 5,
				/obj/item/clothing/gloves/evening = 5,
				/obj/item/clothing/neck/petcollar = 5,
				/obj/item/clothing/neck/petcollar/choker = 5,
				/obj/item/clothing/neck/petcollar/leather = 5,
				/obj/item/clothing/neck/necklace/cowbell = 5,
				/obj/item/clothing/neck/stole = 2,
				/obj/item/clothing/neck/stole/black = 2,
				/obj/item/restraints/handcuffs/fake/kinky = 5,
				/obj/item/clothing/glasses/sunglasses/blindfold = 4,
				/obj/item/clothing/mask/muzzle = 4,
				/obj/item/clothing/shoes/highheels = 3,
				/obj/item/clothing/under/misc/stripper = 3,
				/obj/item/clothing/under/misc/stripper/green = 3,
				/obj/item/clothing/under/dress/corset = 3,
				/obj/item/clothing/under/latex/half = 3,
				//redundent /obj/item/clothing/under/latex = 3,
				/obj/item/clothing/under/misc/gear_harness = 10,
				/obj/item/dildo/custom = 5,
				/obj/item/electropack/shockcollar = 3,
				/obj/item/assembly/signaler = 3,
				/obj/item/assembly/timer = 3,
				/obj/item/clothing/under/shorts/polychromic/pantsu = 3,
				/obj/item/clothing/under/misc/poly_bottomless = 3,
				/obj/item/clothing/under/misc/poly_tanktop = 3,
				/obj/item/clothing/under/misc/poly_tanktop/female = 3,
				/obj/item/autosurgeon/penis = 3,
				/obj/item/autosurgeon/testicles = 3,
				/obj/item/storage/pill_bottle/penis_enlargement = 10,
				/obj/item/storage/pill_bottle/breast_enlargement = 10,
				/obj/item/storage/pill_bottle/butt_enlargement = 10,
				/obj/item/reagent_containers/glass/bottle/crocin = 10,
				/obj/item/reagent_containers/glass/bottle/camphor = 5,
				/obj/item/storage/daki = 4,
				/obj/item/pregnancytest = 10,
				)
	contraband = list(
				/obj/item/clothing/neck/petcollar/locked = 2,
				/obj/item/key/collar = 2,
				/obj/item/clothing/head/kitty = 3,
				/obj/item/clothing/head/rabbitears = 3,
				/obj/item/clothing/under/misc/keyholesweater = 2,
				/obj/item/clothing/under/misc/stripper/mankini = 2,
				/obj/item/clothing/under/costume/jabroni = 2,
				/obj/item/clothing/gloves/evening/black = 2
        )
	premium = list(
				/obj/item/clothing/accessory/skullcodpiece/fake = 3,
				/obj/item/reagent_containers/glass/bottle/hexacrocin = 10,
				/obj/item/clothing/under/pants/chaps = 5
				)
	refill_canister = /obj/item/vending_refill/kink
	light_color = COLOR_STRONG_VIOLET
	payment_department = NO_FREEBIES

/obj/item/vending_refill/kink
	machine_name 	= "KinkMate"
	icon_state 		= "refill_kink"

/obj/machinery/vending/kink/Initialize()
	var/list/extra_products = list(
		/obj/item/storage/pill_bottle/belly_inflation = 10,
		/obj/item/clothing/head/helmet/space/deprivation_helmet = 5,
		/obj/item/clothing/under/misc/latex_catsuit = 10,
		/obj/item/clothing/shoes/latex_socks = 10,
		/obj/item/clothing/shoes/latexheels = 10,
		/obj/item/clothing/shoes/dominaheels = 10,
		/obj/item/clothing/gloves/latex_gloves = 10,
		/obj/item/electropack/vibrator/small = 2,
		/obj/item/electropack/vibrator = 2,
		/obj/item/leash = 3,
		/obj/item/milking_machine = 5,
		/obj/item/milking_machine/penis = 5,
		/obj/item/clothing/neck/petcollar/spike = 5,
		/obj/item/clothing/neck/petcollar/holo = 5,
		/obj/item/clothing/neck/petcollar/casino = 5,
		/obj/item/clothing/gloves/latexsleeves = 3,
		/obj/item/genital_equipment/sounding = 4,
		/obj/item/clothing/accessory/ring/syntech = 4,
		/obj/item/clothing/wrists/syntech = 4,
		/obj/item/clothing/neck/syntech = 4,
		/obj/item/clothing/neck/syntech/choker = 4,
		/obj/item/clothing/neck/syntech/collar = 4,
		/obj/item/storage/fancy/jellybean_pack = 5,
		/obj/item/storage/box/aphrodisiac_pump = 5,
		/obj/item/storage/box/bulk_condoms = 10,
		/obj/item/strapon_strap = 5,
		/obj/item/restraints/bondage_rope = 5,
		/obj/item/clothing/under/domina = 5,
		/obj/item/clothing/under/performer = 3,
		/obj/item/bdsm_whip = 3,
		/obj/item/bdsm_whip/ridingcrop = 3,
		/obj/item/clothing/suit/chaplainsuit/nun = 5,
		/obj/item/clothing/head/chaplain/nun_hood = 5,
		/obj/item/clothing/shoes/highheel_sandals = 3,
		/obj/item/clothing/shoes/invisiboots = 10, // Added here to go with the Gear Harness
		/obj/item/clothing/neck/petcollar/poly = 5
	)
	var/list/extra_contraband = list(
		//Lewd-Clothes
		/obj/item/dildo/flared/huge = 6,
		/obj/item/clothing/glasses/hypno = 3,
		/obj/item/clothing/neck/mind_collar = 3,
		/obj/item/key/latex = 5,
		/obj/item/clothing/head/dominatrixcap = 3,
		/obj/item/mesmetron = 3,
		/obj/item/clothing/neck/petcollar/locked/holo = 2,
		/obj/item/storage/box/aphrodisiac_pump/plus = 3,
		/obj/item/storage/box/medipens/lewd = 2
	)
	var/list/extra_premium = list(
		/obj/item/clothing/mask/muzzle/ballgag = 3
	)
	LAZYADD(products, extra_products)
	LAZYADD(contraband, extra_contraband)
	LAZYADD(premium, extra_premium)
	. = ..()
