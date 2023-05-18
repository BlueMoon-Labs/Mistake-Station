#define GFLUID_ETHANOL_POWER_LIMIT 80
#define GFLUID_RARITY_LIMIT 2.5

/proc/build_genital_fluids_list()
	// Define disallowed reagents
	var/list/blacklisted = list(
		// Base ethanol
		/datum/reagent/consumable/ethanol,

		//
		// Effect drinks
		//

		// Removes dizziness, drowsiness, and sleeping
		/datum/reagent/consumable/ethanol/kahlua,

		// Can cause organ loss and death
		/datum/reagent/consumable/ethanol/thirteenloko,

		// Drugs the user
		/datum/reagent/consumable/ethanol/threemileisland,

		// Causes hallucinations
		/datum/reagent/consumable/ethanol/absinthe,

		// Heals body parts for assistants
		/datum/reagent/consumable/ethanol/hooch,

		// Heals revolutionary antagonists
		/datum/reagent/consumable/ethanol/cuba_libre,

		// Heals radiation for engineers
		/datum/reagent/consumable/ethanol/screwdrivercocktail,

		// Restores blood volume
		/datum/reagent/consumable/ethanol/bloody_mary,

		// Causes the user to emit light
		/datum/reagent/consumable/ethanol/tequila_sunrise,

		// Increases body temperature
		/datum/reagent/consumable/ethanol/toxins_special,

		// Causes hallucinations
		/datum/reagent/consumable/ethanol/beepsky_smash,

		// Heals brute and burn damage for dwarfs
		/datum/reagent/consumable/ethanol/manly_dorf,

		// Drugs the user
		/datum/reagent/consumable/ethanol/manhattan_proj,

		// Increases body temperature
		/datum/reagent/consumable/ethanol/antifreeze,

		// Heals brute damage
		/datum/reagent/consumable/ethanol/barefoot,

		// Increases body temperature
		/datum/reagent/consumable/ethanol/sbiten,

		// Reduces body temperature
		/datum/reagent/consumable/ethanol/iced_beer,

		// Grants points for changeling antagonist
		/datum/reagent/consumable/ethanol/changelingsting,

		// Plays an explosion sound effect
		/datum/reagent/consumable/ethanol/syndicatebomb,

		// Heals body parts for clowns
		/datum/reagent/consumable/ethanol/bananahonk,

		// Heals body parts for mimes
		/datum/reagent/consumable/ethanol/silencer,

		// Attracts nearby ores
		/datum/reagent/consumable/ethanol/fetching_fizz,

		// Heals critical health users 'extremely quickly'
		/datum/reagent/consumable/ethanol/hearty_punch,

		// Causes confusion, dizziness, slurring, sleep, and toxin damage
		/datum/reagent/consumable/ethanol/atomicbomb,

		// Causes dizziness, slurring, confusion, drugging, and toxin damage
		/datum/reagent/consumable/ethanol/gargle_blaster,

		// Causes brain damage, drugging, and dizziness
		/datum/reagent/consumable/ethanol/neurotoxin,

		// Causes slurring, dizziness, drugging, jittering, and toxin damage
		/datum/reagent/consumable/ethanol/hippies_delight,

		// Causes cult sluttering and stuttering
		/datum/reagent/consumable/ethanol/narsour,

		// Heals body part and brute damage for security
		/datum/reagent/consumable/ethanol/quadruple_sec,

		// Heals body part, brute, suffocation, burn, and toxin damage for security
		/datum/reagent/consumable/ethanol/quintuple_sec,

		// Heals brute, burn, toxin, suffocation, and stamina damage
		/datum/reagent/consumable/ethanol/bastion_bourbon,

		// Grants nutrition
		/datum/reagent/consumable/ethanol/squirt_cider,

		// Grants nutrition
		/datum/reagent/consumable/ethanol/sugar_rush,

		// Grants soothed throat effect and increases temperature
		/datum/reagent/consumable/ethanol/peppermint_patty,

		// Removes mighty shield reagent
		/datum/reagent/consumable/ethanol/alexander,

		// Heals brute and burn damage for sleeping users
		/datum/reagent/consumable/ethanol/between_the_sheets,

		// Removes nutrition and causes toxin damage
		/datum/reagent/consumable/ethanol/fernet,

		// Removes nutrition and causes toxin damage
		/datum/reagent/consumable/ethanol/fernet_cola,

		// Removes nutrition and clears overeating duration
		/datum/reagent/consumable/ethanol/fanciulli,

		// Reduces body temperature
		/datum/reagent/consumable/ethanol/branca_menta,

		// Heals body part damage for mimes
		/datum/reagent/consumable/ethanol/blank_paper,

		// Heals body part, suffocation, and toxin damage for wizards
		/datum/reagent/consumable/ethanol/wizz_fizz,

		// Causes toxin damage to insects
		/datum/reagent/consumable/ethanol/bug_spray,

		// Reduces stamina
		/datum/reagent/consumable/ethanol/turbo,

		// Increases age, changes hair color, causes nearsightedness, causes a beard
		/datum/reagent/consumable/ethanol/old_timer,

		// Heals burn damage, removes jittering, and removes stuttering for Chaplain
		/datum/reagent/consumable/ethanol/trappist,

		// Teleports the user
		/datum/reagent/consumable/ethanol/blazaam,

		// Increases temperature, and can cause ignition
		/datum/reagent/consumable/ethanol/mauna_loa,

		// Heals body part, brute, suffocation, fire, foxin, and radiation for the Captain
		/datum/reagent/consumable/ethanol/commander_and_chief,

		// Increases temperature
		/datum/reagent/consumable/ethanol/hellfire,

		// Causes drugging and stamina loss
		/datum/reagent/consumable/ethanol/hotlime_miami,

		// Causes brute damage
		/datum/reagent/consumable/ethanol/crevice_spike,

		/*
		 * The following reagents have effects
		 * But are too mild to warrant blacklisting
		 *
		// Tints the user green
		/datum/reagent/consumable/ethanol/beer/green,

		// Heals radiation
		/datum/reagent/consumable/ethanol/vodka,

		// Heals brute loss
		/datum/reagent/consumable/ethanol/bilk,

		// Plays an explosion sound effect
		/datum/reagent/consumable/ethanol/b52,

		// Displays a chat message
		/datum/reagent/consumable/ethanol/gunfire,
		*/

		//
		// SPLURT effect drinks
		//

		/*
		 * The following reagents have effects
		 * But are allowed for humor purposes
		 *
		// Causes clothing loss
		/datum/reagent/consumable/ethanol/panty_dropper,

		// Causes brain damage
		/datum/reagent/consumable/ethanol/lean,
		*/

		// Contains morphine
		/datum/reagent/consumable/ethanol/isloation_cell/morphine,

		// Contains hexacrocin, morphine, and enthrall
		/datum/reagent/consumable/ethanol/chemical_ex,

		// Captain drink
		/datum/reagent/consumable/ethanol/heart_of_gold,

		// Captain drink
		/datum/reagent/consumable/ethanol/moth_in_chief,

		// Replaces the tongue
		/datum/reagent/consumable/ethanol/skullfucker_deluxe,

		// Heals brute, burn, and toxin or suffocation damage
		/datum/reagent/consumable/ethanol/ionstorm,

		//
		// Effect drink reagents
		//

		// Causes toxin damage
		/datum/reagent/consumable/poisonberryjuice,

		// Heals body parts for clown
		/datum/reagent/consumable/banana,

		// Heals body parts for mime
		/datum/reagent/consumable/nothing,

		// Causes forced laughter emote and mood event
		/datum/reagent/consumable/laughter,

		// Causes stun and mood event
		/datum/reagent/consumable/superlaughter,

		// Heals brute, fire, toxin, and suffocation damage, and reduces nutrition for non-doctors
		/datum/reagent/consumable/doctor_delight,

		// Reduces size
		/datum/reagent/consumable/red_queen,

		// Causes stamina loss, forced emote, chat messages, and arousal
		/datum/reagent/consumable/catnip_tea,

		// Heals toxin damage
		/datum/reagent/consumable/aloejuice,

		/*
		 * The following reagents have effects
		 * But are allowed for humor purposes
		 *

		// Heals body part and brute damage, removes capsaicin, and heals body parts for calcium healers
		/datum/reagent/consumable/milk,

		// Heals body parts
		/datum/reagent/consumable/soymilk,

		// Heals body parts
		/datum/reagent/consumable/coconutmilk,

		// Heals body parts
		/datum/reagent/consumable/cream,
		*/

		/*
		 * The following reagents have effects
		 * But are too mild to warrant blacklisting
		 *

		// Heals suffocation damage
		/datum/reagent/consumable/orangejuice,

		// Heals burn damage
		/datum/reagent/consumable/tomatojuice,

		// Heals body parts
		/datum/reagent/consumable/tomatojuice,

		// Heals blurred vision, blindness, and nearsightedness
		/datum/reagent/consumable/carrotjuice,

		// Removes dizziness, drowsiness, and sleeping, increases temperature, and removes frost oil
		/datum/reagent/consumable/coffee,

		// Reduces dizziness, drowsiness, jittering, and sleeping, heals toxin damage, and increases temperature
		/datum/reagent/consumable/tea,

		// Reduces nutrition, dizziness, drowsiness, and jittering, and increases temperature
		/datum/reagent/consumable/tea/red,

		// Heals liver damage, reduces dizziness, drowsiness, and jittering, and increases temperature
		/datum/reagent/consumable/tea/green,

		// Heals toxin damage, reduces dizziness, drowsiness, and jittering, and increases temperature
		/datum/reagent/consumable/tea/forest,

		// Causes drugging and dizziness, removes all disgust
		/datum/reagent/consumable/tea/mush,

		// Displays chat messages
		/datum/reagent/consumable/tea/arnold_palmer,

		// Reduces dizziness, drowsiness, jittering, and sleeping, and reduces temperature
		/datum/reagent/consumable/icecoffee,

		// Reduces dizziness, drowsiness, and sleeping, heals toxin damage, and reduces temperature
		/datum/reagent/consumable/icetea,

		// Reduces drowsiness and temperature
		/datum/reagent/consumable/space_cola,

		// Causes jittering, drugging, and dizziness, removes drowsiness, reduces sleeping and temperature
		/datum/reagent/consumable/nuka_cola,

		// Reduces drowsiness, sleeping, and temperature, and causes jittering
		/datum/reagent/consumable/spacemountainwind,

		// Reduces temperature
		/datum/reagent/consumable/space_up,

		// Reduces temperature
		/datum/reagent/consumable/lemon_lime,

		// Reduces temperature
		/datum/reagent/consumable/pwr_game,

		// Reduces temperature
		/datum/reagent/consumable/shamblers,

		// Adds sugar or honey
		/datum/reagent/consumable/buzz_fuzz,

		// Causes jittering, and dizziness, removes drowsiness, reduces sleeping and temperature
		/datum/reagent/consumable/grey_bull,

		// Reduces dizziness, and drowsiness, and temperature
		/datum/reagent/consumable/sodawater,

		// Reduces dizziness, and drowsiness, and temperature
		/datum/reagent/consumable/tonic,

		// Reduces dizziness and drowsiness, removes sleeping, increases temperature and jittering, heals body parts
		/datum/reagent/consumable/soy_latte,

		// Reduces dizziness and drowsiness, removes sleeping, increases temperature and jittering, heals body parts
		/datum/reagent/consumable/cafe_latte,

		// Reduces temperature
		/datum/reagent/consumable/grape_soda,

		// Causes throat soothed effect
		/datum/reagent/consumable/menthol,

		// Reduces temperature
		/datum/reagent/consumable/cream_soda,

		// Reduces disgust
		/datum/reagent/consumable/sol_dry,

		// Causes chat messages
		/datum/reagent/consumable/milk/pinkmilk,

		// Causes chat messages
		/datum/reagent/consumable/tea/pinktea,

		// Causes jittering, and dizziness, removes drowsiness, reduces sleeping and temperature
		/datum/reagent/consumable/monkey_energy,
		*/

		//
		// Effect standard reagents
		//

		// Grants nutrition
		/datum/reagent/consumable/nutriment/vitamin,

		// Can cause hyperglycemic shock (sleeping)
		/datum/reagent/consumable/sugar,

		// Increases temperature
		/datum/reagent/consumable/capsaicin,

		// Reduces temperature
		/datum/reagent/consumable/frostoil,

		// Causes coughing, and can be used for stuns
		/datum/reagent/consumable/condensedcapsaicin,

		// Heals the cook, but damages vampires
		/datum/reagent/consumable/garlic,

		// Heals body part damage
		/datum/reagent/consumable/sprinkles,

		// Increases temperature
		/datum/reagent/consumable/hot_ramen,

		// Increases temperature
		/datum/reagent/consumable/hell_ramen,

		// Adds sugar reagent
		/datum/reagent/consumable/corn_syrup,

		// Adds sugar, heals brute, burn, suffocation, and toxin
		/datum/reagent/consumable/honey,

		// Causes temporary blindness and blurred vision
		/datum/reagent/consumable/tearjuice,

		// Causes unconsciousness, breath loss, brain damage, toxin damage, stamina loss, and blurred vision
		/datum/reagent/consumable/entpoly,

		// Heals brute and burn damage
		/datum/reagent/consumable/vitfro,

		// Causes electrocution
		/datum/reagent/consumable/liquidelectricity,

		// Causes forced speech
		/datum/reagent/consumable/char,

		// Secret reagent, makes all food max quality
		/datum/reagent/consumable/secretsauce,

		// Used for making most food
		/datum/reagent/consumable/enzyme,

		/*
		 * The following reagents have effects
		 * But are too mild to warrant blacklisting
		 *
		// Increases temperature
		/datum/reagent/consumable/hot_coco,
		*/
	)

	// Define base list
	var/list/consumable_list = subtypesof(/datum/reagent/consumable)

	// Define additional allowed reagents
	var/list/whitelist_list = list(
		// Just water
		/datum/reagent/water,

		// Causes arousal
		// Allowed for ERP reasons
		/datum/reagent/drug/aphrodisiac,

		// Causes positive mood bonus
		// On overdose: Causes negative mood penalty and disgust
		/datum/reagent/drug/space_drugs,

		// Restores blood volume
		/datum/reagent/blood,
	)

	// Add whitelisted entries to main list
	LAZYADD(consumable_list, whitelist_list)

	// Define final list
	var/list/reagent_list

	// Define final type-based list
	var/list/reagent_list_paths

	for(var/reagent in consumable_list)
		// Define reagent
		var/datum/reagent/instance = find_reagent_object_from_type(reagent)

		// Check if reagent exists
		if(!instance)
			continue

		// Check if reagent is non-liquid
		if(instance.reagent_state != LIQUID)
			// Ignore reagent
			continue

		// Check if reagent is blacklisted
		if(reagent in blacklisted)
			// Ignore reagent
			continue

		// Check if reagent is manually whitelisted
		if(reagent in whitelist_list)
			// Add immediately
			LAZYADD(reagent_list, instance)
			LAZYADD(reagent_list_paths, reagent)

			// Skip further processing
			continue

		// Check if reagent is an ethanol sub-type
		if(istype(instance, /datum/reagent/consumable/ethanol))
			// Define ethanol reagent
			var/datum/reagent/consumable/ethanol/drink = instance

			// Check if booze power exceeds the defined limit
			if(drink.boozepwr > GFLUID_ETHANOL_POWER_LIMIT)
				// Ignore reagent
				continue

		// Add reagent to final list
		LAZYADD(reagent_list, instance)

		// Add reagent to type list
		LAZYADD(reagent_list_paths, reagent)

	// Define readable GLOB
	GLOB.genital_fluids_list = reagent_list

	// Define type-path GLOB
	GLOB.genital_fluids_paths = reagent_list_paths

/proc/allowed_gfluid_paths()
	// Check if paths list exists
	if(!GLOB.genital_fluids_paths)
		// Build list
		build_genital_fluids_list()

	// Return list of valid types
	return GLOB.genital_fluids_paths

// - Crocin -
/obj/item/implant/aphrodisiac_pump
	name = "crocin pumping implant"
	desc = "A pump that injects an aphrodisiac drug into the bloodstream constantly."
	var/reagent = /datum/reagent/drug/aphrodisiac
	var/base_amount = 5
	var/amount
	var/max_amount = 50

/obj/item/implant/aphrodisiac_pump/get_data()
	var/data = {"
		<b>Implant Specifications:</b><br>
		<b>Name:</b> Prudism Treatment Implant<br>
		<b>Function:</b> Official use is for the treatment of prudism but is frequently abused to make crocin-crazed bimbos and prostitutes.<br>
		<i>Will currently synthetize [amount]u upon implantation</i><br>
		"}
	return data

/obj/item/implant/aphrodisiac_pump/Initialize(mapload)
	. = ..()
	amount = base_amount

/obj/item/implant/aphrodisiac_pump/implant(silent = FALSE, force = TRUE)
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/implant/aphrodisiac_pump/removed(source, silent = FALSE, special = 0)
	. = ..()
	STOP_PROCESSING(SSobj, src)

/obj/item/implant/aphrodisiac_pump/proc/pump(amt)
	if(imp_in && iscarbon(imp_in))
		imp_in.reagents.add_reagent(reagent, amt)

/obj/item/implant/aphrodisiac_pump/process()
	if(imp_in.reagents.get_reagent_amount(reagent) < amount)
		pump(amount - imp_in.reagents.get_reagent_amount(reagent))

/obj/item/implanter/aphrodisiac_pump
	name = "implanter (crocin pump)"
	imp_type = /obj/item/implant/aphrodisiac_pump

/obj/item/implantcase/aphrodisiac_pump
	name = "implant case - 'Crocin pump'"
	desc = "A glass case containing a crocin pumping implant."
	imp_type = /obj/item/implant/aphrodisiac_pump

/obj/item/implantcase/aphrodisiac_pump/attack_self(mob/user)
	if(!imp || !istype(imp, /obj/item/implant/aphrodisiac_pump))
		return

	var/obj/item/implant/aphrodisiac_pump/pump = imp
	if(pump.amount >= pump.max_amount)
		pump.amount = pump.base_amount
	else
		pump.amount += 5
	balloon_alert(user, "Now synthesizing [pump.amount]u.")
//

// - Hexacrocin -
/obj/item/implant/aphrodisiac_pump/plus
	name = "hexacrocin pumping implant"
	desc = "A pump that injects a potent aphrodisiac drug into the bloodstream constantly."
	reagent = /datum/reagent/drug/aphrodisiac/crocin/hexacrocin

/obj/item/implant/aphrodisiac_pump/plus/get_data()
	var/data = {"
		<b>Implant Specifications:</b><BR>
		<b>Name:</b> Severe Prudism Treatment<BR>
		<b>Function:</b> Official use is for the treatment of severe prudism but is frequently abused to make hexacrocin-crazed bimbos and prostitutes.<BR>
		<i>Will currently synthetize [amount]u upon implantation</i><br>
		<hr>
		<u><b>WARNING: 20u is the overdose threshold, please do not set past that limit without consulting your medical team!</b></u>
		"}
	return data

/obj/item/implanter/aphrodisiac_pump/plus
	name = "implanter (hexacrocin pump)"
	imp_type = /obj/item/implant/aphrodisiac_pump/plus

/obj/item/implantcase/aphrodisiac_pump/plus
	name = "implant case - 'Hexacrocin pump'"
	desc = "A glass case containing a hexacrocin pumping implant."
	imp_type = /obj/item/implant/aphrodisiac_pump/plus
//

/obj/item/storage/box/aphrodisiac_pump
	name = "crocin pump box"
	desc = "Comes with an implanter and an implant case for quick application!"
	icon = 'modular_sand/icons/obj/fleshlight.dmi'
	icon_state = "box"

/obj/item/storage/box/aphrodisiac_pump/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Click the implant case while with the implant inside to change the desired dosage amounts.</span>"

/obj/item/storage/box/aphrodisiac_pump/Initialize()
	. = ..()

	atom_storage.max_total_storage = 2

/obj/item/storage/box/aphrodisiac_pump/PopulateContents()
	new /obj/item/implanter(src)
	new /obj/item/implantcase/aphrodisiac_pump(src)

/obj/item/storage/box/aphrodisiac_pump/plus
	name = "hexacrocin pump box"

/obj/item/storage/box/aphrodisiac_pump/plus/PopulateContents()
	new /obj/item/implanter(src)
	new /obj/item/implantcase/aphrodisiac_pump/plus(src)
