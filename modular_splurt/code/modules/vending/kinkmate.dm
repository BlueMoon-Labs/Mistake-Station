//		STYLE_NO_ANTHRO_ICON — CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
//		STYLE_DIGITIGRADE — CLOTHING_DIGITIGRADE_VARIATION
//		supports_variations_flags — supports_variations_flags

/obj/item/clothing/under/pants/chaps
	name = "Black Chaps"
	body_parts_covered = LEGS
	desc = "Yeehaw"
	icon_state = "chaps"

/obj/item/clothing/gloves/evening/black
	name = "midnight gloves"
	desc = "Thin, pretty gloves intended for use in sexy feminine attire. A tag on the hem claims they pair great with black stockings."
	icon_state = "eveningblack"
	worn_icon_state = "eveningblack"

/obj/item/clothing/accessory/talisman/fake
	name = "bone talisman"
	desc = "A hunter's talisman, some say the old gods smile on those who wear it."
	icon_state = "talisman"
	armor_type = 0

/obj/item/clothing/accessory/skullcodpiece/fake
	name = "false codpiece"
	desc = "A plastic ornament, intended to protect the important things in life. It's not very good at it."
	icon_state = "skull"
	above_suit = TRUE
	armor_type = 0

/obj/item/clothing/under/misc/durathread/skirt
	name = "durathread jumpskirt"
	desc = "A jumpsuit made from durathread, its resilient fibres provide some protection to the wearer. Being a short skirt, it naturally doesn't protect the legs."
	icon_state = "duraskirt"
	worn_icon_state = "duraskirt"
	can_adjust = FALSE
	body_parts_covered = CHEST|GROIN|ARMS
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/misc/keyholesweater
	name = "keyhole sweater"
	desc = "What is the point of this, anyway?"
	icon_state = "keyholesweater"
	worn_icon_state = "keyholesweater"
	can_adjust = FALSE
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/misc/stripper
	name = "pink stripper outfit"
	icon_state = "stripper_p"
	worn_icon_state = "stripper_p"
	body_parts_covered = CHEST|GROIN
	can_adjust = FALSE
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/misc/stripper/green
	name = "green stripper outfit"
	icon_state = "stripper_g"
	worn_icon_state = "stripper_g"

/obj/item/clothing/under/misc/stripper/mankini
	name = "pink mankini"
	icon_state = "mankini"
	worn_icon_state = "mankini"

/obj/item/restraints/handcuffs/fake/kinky
	name = "kinky handcuffs"
	desc = "Fake handcuffs meant for erotic roleplay."
	icon_state = "handcuffgag"
	inhand_icon_state = "kinkycuff"

/obj/item/autosurgeon/penis
	desc = "A single use autosurgeon that contains a penis. A screwdriver can be used to remove it, but implants can't be placed back in."
	uses = 1
	starting_organ = /obj/item/organ/external/genital/penis

/obj/item/autosurgeon/testicles
	desc = "A single use autosurgeon that contains a set of testicles. A screwdriver can be used to remove it, but implants can't be placed back in."
	uses = 1
	starting_organ = /obj/item/organ/external/genital/testicles

/obj/item/autosurgeon/vagina
	desc = "A single use autosurgeon that contains a vagina. A screwdriver can be used to remove it, but implants can't be placed back in."
	uses = 1
	starting_organ = /obj/item/organ/external/genital/vagina

/obj/item/autosurgeon/breasts
	desc = "A single use autosurgeon that contains a set of breasts. A screwdriver can be used to remove it, but implants can't be placed back in."
	uses = 1
	starting_organ = /obj/item/organ/external/genital/breasts

/obj/item/autosurgeon/womb
	desc = "A single use autosurgeon that contains a womb. A screwdriver can be used to remove it, but implants can't be placed back in."
	uses = 1
	starting_organ = /obj/item/organ/external/genital/womb

/obj/machinery/vending/kink
	name = "KinkMate"
	desc = "A vending machine for all your unmentionable desires."
	icon_state = "kink"
	product_slogans = "Kinky!;Sexy!;Check me out, big boy!"
	vend_reply = "Have fun, you shameless pervert!"
	products = list(
				/obj/item/genital_equipment/condom = 10,
				/obj/item/clothing/head/costume/maidheadband = 5,
				/obj/item/clothing/under/costume/maid = 5,
				/obj/item/clothing/under/rank/civilian/janitor/maid = 5,
				/obj/item/clothing/gloves/evening = 5,
				/obj/item/clothing/neck/human_petcollar = 5,
				/obj/item/clothing/neck/human_petcollar/choker = 5,
				/obj/item/clothing/neck/human_petcollar/leather = 5,
				/obj/item/clothing/neck/human_petcollar/locked/cow = 5,
				/obj/item/clothing/neck/stole = 2,
				/obj/item/clothing/neck/stole/black = 2,
				/obj/item/restraints/handcuffs/fake/kinky = 5,
				/obj/item/clothing/glasses/blindfold = 4,
				/obj/item/clothing/mask/muzzle = 4,
				/obj/item/clothing/shoes/highheels = 3,
				/obj/item/clothing/under/misc/stripper = 3,
				/obj/item/clothing/under/misc/stripper/green = 3,
				/obj/item/clothing/underwear/shirt/corset = 3,
				/obj/item/clothing/under/latex/half = 3,
				/obj/item/clothing/under/misc/gear_harness = 10,
				/obj/item/dildo/custom = 5,
				/obj/item/electropack/shockcollar = 3,
				/obj/item/assembly/signaler = 3,
				/obj/item/assembly/timer = 3,
				/obj/item/autosurgeon/penis = 3,
				/obj/item/autosurgeon/testicles = 3,
				/obj/item/storage/pill_bottle/penis_enlargement = 10,
				/obj/item/storage/pill_bottle/breast_enlargement = 10,
				/obj/item/storage/pill_bottle/butt_enlargement = 10,
				/obj/item/reagent_containers/cup/bottle/crocin = 10,
				/obj/item/reagent_containers/cup/bottle/camphor = 5,
				/obj/item/storage/daki = 4,
				/obj/item/pregnancytest = 10,
				)
	contraband = list(
				/obj/item/clothing/neck/human_petcollar/locked = 2,
				/obj/item/key/collar = 2,
				/obj/item/clothing/head/costume/kitty = 3,
				/obj/item/clothing/head/costume/rabbitears = 3,
				/obj/item/clothing/under/misc/keyholesweater = 2,
				/obj/item/clothing/under/misc/stripper/mankini = 2,
				/obj/item/clothing/under/costume/jabroni = 2,
				/obj/item/clothing/gloves/evening/black = 2
        )
	premium = list(
				/obj/item/clothing/accessory/skullcodpiece/fake = 3,
				/obj/item/reagent_containers/cup/bottle/hexacrocin = 10,
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
		/obj/item/clothing/head/deprivation_helmet = 5,
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
		/obj/item/clothing/neck/human_petcollar/spike = 5,
		/obj/item/clothing/neck/human_petcollar/holo = 5,
		/obj/item/clothing/neck/human_petcollar/casino = 5,
		/obj/item/clothing/gloves/latexsleeves = 3,
		/obj/item/genital_equipment/sounding = 4,
		/obj/item/clothing/gloves/ring/syntech = 4,
		/obj/item/clothing/wrists/syntech = 4,
		/obj/item/clothing/neck/syntech = 4,
		/obj/item/clothing/neck/syntech/choker = 4,
		/obj/item/clothing/neck/syntech/collar = 4,
		/obj/item/storage/box/aphrodisiac_pump = 5,
		/obj/item/storage/box/bulk_condoms = 10,
		/obj/item/strapon_strap = 5,
		/obj/item/restraints/bondage_rope = 5,
		/obj/item/clothing/under/domina = 5,
		/obj/item/clothing/under/performer = 3,
		/obj/item/clothing/mask/leatherwhip = 3,
		/obj/item/clothing/mask/leatherwhip/ridingcrop = 3,
		/obj/item/clothing/suit/chaplainsuit/nun = 5,
		/obj/item/clothing/head/chaplain/nun_hood = 5,
		/obj/item/clothing/shoes/highheel_sandals = 3,
		/obj/item/clothing/shoes/invisiboots = 10 // Added here to go with the Gear Harness
	)
	var/list/extra_contraband = list(
		//Lewd-Clothes
		/obj/item/dildo/flared/huge = 6,
		/obj/item/clothing/glasses/hypno = 3,
		/obj/item/clothing/neck/mind_collar = 3,
		/obj/item/key/latex = 5,
		/obj/item/clothing/head/dominatrixcap = 3,
		/obj/item/mesmetron = 3,
		/obj/item/clothing/neck/human_petcollar/locked/holo = 2,
		/obj/item/storage/box/aphrodisiac_pump/plus = 3,
		/obj/item/storage/box/medipens/lewd = 2,
		/datum/reagent/drug/labebium = 1
	)
	var/list/extra_premium = list(
		/obj/item/clothing/mask/muzzle/ballgag = 3
	)
	LAZYADD(products, extra_products)
	LAZYADD(contraband, extra_contraband)
	LAZYADD(premium, extra_premium)
	. = ..()
