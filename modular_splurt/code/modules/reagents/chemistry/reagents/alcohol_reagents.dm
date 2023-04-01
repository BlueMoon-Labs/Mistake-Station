//SPLURT drinks

// The Cum Chalice
/datum/reagent/consumable/ethanol/semen
	name = "Натуральная Сперма"
	description = "Она всё ещё тёплая... и кто это будет пить? Безумие!"
	color = "#ffffff"
	boozepwr = 5 //Лол.
	quality = DRINK_VERYGOOD
	taste_description = "something very nutritious"
	glass_price = 6

/datum/glass_style/drinking_glass/semen
	required_drink_type = /datum/reagent/consumable/ethanol/semen
	name = "Натуральная Сперма"
	desc = "Она всё ещё тёплая... и кто это будет пить? Безумие!"
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "cumchalice"

/datum/reagent/consumable/ethanol/panty_dropper
	name = "Liquid Panty Dropper"
	description = "You feel it's not named like that for nothing."
	color = "#ce3b01" // rgb: 206, 59, 1
	boozepwr = 70
	quality = DRINK_VERYGOOD
	taste_description = "cloth ripping and tearing"
	glass_price = 6

/datum/glass_style/drinking_glass/panty_dropper
	required_drink_type = /datum/reagent/consumable/ethanol/panty_dropper
	name = "Liquid Panty Dropper"
	desc = "You feel it's not named like that for no reason."
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "cumchalice"

// Liquid Panty Dropper drink effect
/datum/reagent/consumable/ethanol/panty_dropper/on_mob_life(mob/living/carbon/C)
	// Praise the funny BYOND dots
	. = ..()

	// Check for client
	if(C.client)
		// Check target pref for ERP
		if(C.client?.prefs.erppref == "No")
			// Return without triggering
			return

		// Check target pref for aphrodisiacs
		if(C.client?.prefs.read_preference(/datum/preference/toggle/erp/aphro))
			// Return without triggering
			return

	// Perform drink effect
	C.clothing_burst(C)

/datum/reagent/consumable/ethanol/lean
	name = "Lean"
	description = "The choice drink of space-pop stars, composed of soda, cough syrup and candies."
	color =  "#9109ba"
	boozepwr = 0
	metabolization_rate = 1 * REAGENTS_METABOLISM
	quality = DRINK_VERYGOOD
	taste_description = "cough syrup and space-pop music"

/datum/glass_style/drinking_glass/lean
	required_drink_type = /datum/reagent/consumable/ethanol/lean
	name = "Lean"
	desc = "I LOVE LEAN!!!"
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "lean"

/datum/reagent/consumable/ethanol/lean/on_mob_life(mob/living/carbon/C)
	var/mob/living/carbon/human/M = C
	var/message = "I LOVE LEAN!!"
	M.do_jitter_animation(40)
	M.set_drugginess(50)
	switch(current_cycle)
		if(1)
			M.say(message)
		if(80 to 100)
			M.adjustOrganLoss(ORGAN_SLOT_LIVER, 1)
			M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 1) // it's cough syrup what'd you expect?
		if(100 to INFINITY)
			M.adjustOrganLoss(ORGAN_SLOT_LIVER, 2)
			M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 2)
			if(!M.undergoing_cardiac_arrest() && M.can_heartattack() && prob(1))
				M.set_heartattack(TRUE)
				if(M.stat == CONSCIOUS)
					M.visible_message("<span class='userdanger'>[M] clutches at [M.ru_ego()] chest as if [M.ru_ego()] heart stopped!</span>") // too much lean :(
	..()

/datum/reagent/consumable/ethanol/cum_in_a_hot_tub
	name = "Cum in the Hot Tub"
	description = "Doesn't really leave it to the imagination, eh?"
	boozepwr = 80
	color = "#D2D7D9"
	quality = DRINK_VERYGOOD
	taste_description = "smooth cream"

/datum/glass_style/drinking_glass/cum_in_a_hot_tub
	required_drink_type = /datum/reagent/consumable/ethanol/cum_in_a_hot_tub
	name = "Cum in the Hot Tub"
	desc = "Doesn't really leave it to the imagination, eh?"
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "cum_glass"

/datum/reagent/consumable/ethanol/cum_in_a_hot_tub/semen
	boozepwr = 65
	taste_description = "viscous cream"
	description = "The name is probably exactly what it is."

/datum/reagent/consumable/ethanol/mech_rider
	name = "Mech Rider"
	description = "Who would even drink this? "
	boozepwr = 65
	color = rgb(111, 127, 63)
	quality = DRINK_GOOD
	taste_description = "the sweat of a certain Mauler pilot"

/datum/glass_style/drinking_glass/mech_rider
	required_drink_type = /datum/reagent/consumable/ethanol/mech_rider
	name = "Mech Rider"
	desc = "Doesn't really leave it to the imagination, eh?"
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "mech_rider_bottle"

/datum/reagent/consumable/ethanol/isloation_cell
	name = "Isolation Cell"
	description = "Ice cubes in a padded Cell."
	color = "#b4b4b4"
	quality = DRINK_FANTASTIC
	taste_description = "cloth dissolved in sulphuric acid."

/datum/glass_style/drinking_glass/isloation_cell
	required_drink_type = /datum/reagent/consumable/ethanol/isloation_cell
	name = "Isolation Cell"
	desc = "Ice cubes in a padded Cell"
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "isolationcell"

/datum/reagent/consumable/ethanol/isloation_cell/on_mob_life(mob/living/carbon/C)
	. = ..()
	if(!(current_cycle % 10)) //Every 10 cycles
		C.reagents.add_reagent(/datum/reagent/drug/aphrodisiac, 2)

/datum/reagent/consumable/ethanol/isloation_cell/morphine
	description = "It has a distinct, sour smell, much like morphine."
	taste_description = "cloth dissolved in sulphuric acid. Something feels off about it."

/datum/reagent/consumable/ethanol/isloation_cell/morphine/on_mob_life(mob/living/carbon/C)
	. = ..()
	if(!(current_cycle % 10)) //Every 10 cycles
		C.reagents.add_reagent_list(list(/datum/reagent/medicine/morphine = 2, /datum/reagent/consumable/ethanol/hippies_delight = 1))

/datum/reagent/consumable/ethanol/chemical_ex
	name = "Chemical Ex"
	description = "Date rape in a glass, a mixture courtesy of the Chief Witchdoctor. The stench of cigar smoke permeates the air wherever it goes."
	color = rgb(14, 14, 14)
	quality = DRINK_FANTASTIC
	taste_description = "ghost peppers, carbonated water and oil. Burns your tongue."

/datum/glass_style/drinking_glass/chemical_ex
	required_drink_type = /datum/reagent/consumable/ethanol/chemical_ex
	name = "Chemical Ex"
	desc = "Date rape in a glass, a mixture courtesy of the Chief Witchdoctor. The stench of cigar smoke permeates the air wherever it goes."
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "chemicalex"

/datum/reagent/consumable/ethanol/chemical_ex/on_mob_life(mob/living/carbon/C)
	. = ..()
	if(!(current_cycle % 10)) //Every 10 cycles
		C.reagents.add_reagent_list(list(/datum/reagent/drug/aphrodisiacplus = 2, /datum/reagent/medicine/morphine = 4))

/datum/reagent/consumable/ethanol/heart_of_gold
	name = "Heart Of Gold"
	description = "The Captain's Ambrosia. Something about it just feels divine."
	boozepwr = 15
	color = "#fc56e6"
	quality = DRINK_FANTASTIC
	taste_description = "a fruit punch-like blend with a little fruity kick at the back of your throat, with an aftertaste of pineapple."

/datum/glass_style/drinking_glass/heart_of_gold
	required_drink_type = /datum/reagent/consumable/ethanol/heart_of_gold
	name = "Heart Of Gold"
	desc = "The Captain's Ambrosia. Something about it just feels divine."
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "heartofgold"

/datum/reagent/consumable/ethanol/moth_in_chief
	name = "Moth in Chief"
	description = "A simple yet elegant drink, inspires confidence in even the most pessimistic of men. The mantle rests well upon your shoulders."
	boozepwr = 50
	color = "#0919be"
	quality = DRINK_FANTASTIC
	glass_price = DRINK_PRICE_HIGH
	taste_description = "fuzz, warmth and comfort"

/datum/glass_style/drinking_glass/moth_in_chief
	required_drink_type = /datum/reagent/consumable/ethanol/moth_in_chief
	name = "Moth in Chief"
	desc = "A simple yet elegant drink, inspires confidence in even the most pessimistic of men. The mantle rests well upon your shoulders."
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "mothinchief"

//This drink gives the combined benefits of Stimulants, Regenerative Jelly, and Commander and Chief, and a mood buff similar to Copium; at least to an extent.
/datum/reagent/consumable/ethanol/commander_and_chief/on_mob_life(mob/living/carbon/M)
	if(M.mind && HAS_TRAIT(M.mind, TRAIT_ROYAL_METABOLISM))
		M.heal_bodypart_damage(6,6,6)
		M.adjustBruteLoss(-7,0)
		M.adjustOxyLoss(-7,0)
		M.adjustFireLoss(-7,0)
		M.adjustToxLoss(-7,0,TRUE) //Heals Toxin Lovers
		. = 1
	else
		//Commander and Chief Effects, no need to be captain to receive the effect
		M.heal_bodypart_damage(2,2,2)
		M.adjustBruteLoss(-3.5,0)
		M.adjustOxyLoss(-3.5,0)
		M.adjustFireLoss(-3.5,0)
		M.adjustToxLoss(-3.5,0,TRUE) //Heals Toxin Lovers

	//Stimulant Effects
	M.AdjustAllImmobility(-60, FALSE)
	M.AdjustUnconscious(-60, FALSE)
	M.adjustStaminaLoss(-20*REAGENTS_EFFECT_MULTIPLIER, FALSE)
	..()
	. = 1

/datum/reagent/medicine/stimulants/on_mob_metabolize(mob/living/L)
	..()
	L.add_movespeed_modifier(/datum/movespeed_modifier/reagent/stimulants)
	ADD_TRAIT(L, TRAIT_BATON_RESISTANCE, type)

/datum/reagent/medicine/stimulants/on_mob_end_metabolize(mob/living/L)
	L.remove_movespeed_modifier(/datum/movespeed_modifier/reagent/stimulants)
	REMOVE_TRAIT(L, TRAIT_BATON_RESISTANCE, type)
	..()

/datum/reagent/consumable/ethanol/skullfucker_deluxe
	name = "Skullfucker Deluxe"
	description = "The Rosewater secret to becoming psychotically retarded. It has many warning labels."
	boozepwr = 75
	color = "#cb4d8b"
	quality = DRINK_VERYGOOD
	taste_description = "being violated by a tiny fish with crayons"
	overdose_threshold = 25

/datum/glass_style/drinking_glass/skullfucker_deluxe
	required_drink_type = /datum/reagent/consumable/ethanol/skullfucker_deluxe
	name = "Skullfucker Deluxe"
	desc = "It has many warning labels, you might want to read them."
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "skullfucker"

/datum/reagent/consumable/ethanol/skullfucker_deluxe/on_mob_life(mob/living/carbon/C)
	. = ..()
	//Do nothing if they haven't metabolized enough
	if(!current_cycle >= 15)
		return
	//Make them giggle
	if(prob(40))
		C.emote("giggle")
	//Make them jitter
	if(prob(20))
		C.jitteriness = max(C.jitteriness, 30)
	if(prob(20))
		C.adjustOrganLoss(ORGAN_SLOT_BRAIN, 10)

/datum/reagent/consumable/ethanol/skullfucker_deluxe/overdose_process(mob/living/M)
	. = ..()
	//Do nothing if they're already fwuffy OwO
	var/obj/item/organ/internal/tongue/T = M.getorganslot(ORGAN_SLOT_TONGUE)
	if(istype(T, /obj/item/organ/internal/tongue/fluffy))
		return

	//Replace their tongue with a fwuffy one
	var/obj/item/organ/internal/tongue/nT = new /obj/item/organ/internal/tongue/fluffy
	T.Remove()
	nT.Insert(M)
	T.moveToNullspace()//To valhalla
	to_chat(M, span_big_warning("Your tongue feels... weally fwuffy!!"))

/datum/reagent/consumable/ethanol/ionstorm
	name = "Ion Storm"
	description = "A highly chaotic mixture that looks like it may react violently at any moment, but is surprisingly stable"
	color = "#3fd2ff"
	taste_description = "a scorching taste of strong alcohol and good brew going down your throat, making you feel warm inside"
	ph = 6.5
	glass_price = DRINK_PRICE_HIGH
	boozepwr = 30
	quality = DRINK_FANTASTIC

/datum/glass_style/drinking_glass/ionstorm
	required_drink_type = /datum/reagent/consumable/ethanol/ionstorm
	name = "Glass of Ion Storm"
	desc = "You're not sure how this mixture is stable or even if it's drinkable, but it does remind you of a hot cup of apple cider on a cold winter morning."
	icon = 'modular_splurt/icons/obj/drinks.dmi'
	icon_state = "ionstorm"

/datum/reagent/consumable/ethanol/ionstorm/on_mob_life(mob/living/carbon/C)
	C.adjustBruteLoss(-0.5,0)
	C.adjustFireLoss(-0.5,0)
	if (C.reagents.has_reagent(/datum/reagent/medicine/epinephrine))
		C.adjustToxLoss(0.25)
	else
		C.adjustOxyLoss(0.25)
	. = 1
	return ..()
