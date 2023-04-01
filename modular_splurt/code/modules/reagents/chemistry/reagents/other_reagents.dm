//body bluids
/datum/reagent/consumable/semen
	name = "Semen"
	description = "Sperm from some animal. Useless for anything but insemination, really."
	taste_description = "something salty"
	taste_mult = 2 //Not very overpowering flavor
	data = list("donor"=null,"viruses"=null,"donor_DNA"=null,"blood_type"=null,"resistances"=null,"trace_chem"=null,"mind"=null,"ckey"=null,"gender"=null,"real_name"=null)
	reagent_state = LIQUID
	color = "#FFFFFF" // rgb: 255, 255, 255
	// you know i wouldn't
	// boiling_point = T0C + 100
	nutriment_factor = 0.5 * REAGENTS_METABOLISM
	var/decal_path = /obj/effect/decal/cleanable/semen

/datum/reagent/consumable/semen/expose_turf(turf/T, reac_volume)
	..()
	if(!istype(T))
		return
	if(reac_volume < 10)
		return

	var/obj/effect/decal/cleanable/semen/S = locate() in T
	if(!S)
		S = new decal_path(T)
	if(data["blood_DNA"])
		S.add_blood_DNA(list(data["blood_DNA"] = data["blood_type"]))

/obj/effect/decal/cleanable/semen
	name = "semen"
	desc = null
	gender = PLURAL
	density = 0
	layer = ABOVE_NORMAL_TURF_LAYER
	icon = 'icons/obj/genitals/effects.dmi'
	icon_state = "semen1"
	random_icon_states = list("semen1", "semen2", "semen3", "semen4")

/obj/effect/decal/cleanable/semen/Initialize(mapload)
	. = ..()
	dir = GLOB.cardinals
	add_blood_DNA(list("Non-human DNA" = "A+"))

/obj/effect/decal/cleanable/semen/replace_decal(obj/effect/decal/cleanable/semen/S)
	if(S.blood_DNA)
		blood_DNA |= S.blood_DNA
	return ..()

/datum/reagent/consumable/semen/femcum
	name = "Female Ejaculate"
	description = "Vaginal lubricant found in most mammals and other animals of similar nature. Where you found this is your own business."
	taste_description = "something with a tang" // wew coders who haven't eaten out a girl.
	color = "#AAAAAA77"
	decal_path = /obj/effect/decal/cleanable/semen/femcum

/obj/effect/decal/cleanable/semen/femcum
	name = "female ejaculate"
	icon_state = "fem1"
	random_icon_states = list("fem1", "fem2", "fem3", "fem4")
	blood_state = null
	bloodiness = null

/datum/reagent/consumable/semen/on_mob_add(mob/living/carbon/M)
	. = ..()

	// Check for D4C quirk
	if(HAS_TRAIT(M,TRAIT_DUMB_CUM))
		// Define quirk entry
		var/datum/quirk/dumb4cum/quirk_target = locate() in M.quirks

		// Remove reset timer
		quirk_target.uncrave()

/datum/reagent/consumable/ethanol/cum_in_a_hot_tub/semen/on_mob_add(mob/living/carbon/M)
	. = ..()

	// Check for D4C quirk
	if(HAS_TRAIT(M,TRAIT_DUMB_CUM))
		// Define quirk entry
		var/datum/quirk/dumb4cum/quirk_target = locate() in M.quirks

		// Remove reset timer
		quirk_target.uncrave()

//incubus and succubus additions below
/datum/reagent/consumable/semen/on_mob_life(mob/living/carbon/M)
	. = ..()
	if(HAS_TRAIT(M,TRAIT_SUCCUBUS))
		M.adjust_nutrition(1)

/datum/reagent/consumable/ethanol/cum_in_a_hot_tub/semen/on_mob_life(mob/living/carbon/M)
	. = ..()
	if(HAS_TRAIT(M,TRAIT_SUCCUBUS))
		M.adjust_nutrition(0.5)

/datum/reagent/consumable/milk/on_mob_life(mob/living/carbon/M)
	. = ..()
	if(HAS_TRAIT(M,TRAIT_INCUBUS))
		M.adjust_nutrition(1.5)

/datum/reagent/blood/on_mob_life(mob/living/carbon/C)
	. = ..()
	if(HAS_TRAIT(C,TRAIT_BLOODFLEDGE))
		C.adjust_nutrition(6)
		C.adjust_disgust(-2) // Negates the chapel's disgust effect
		C.adjustStaminaLoss(1) // Mitigates the chapel's stamina effect

/datum/reagent/water/holywater/on_mob_life(mob/living/carbon/M)
	. = ..()
	// Cursed blood effect moved here
	if(HAS_TRAIT(M, TRAIT_CURSED_BLOOD))
		M.adjust_jitter_up_to(4 SECONDS, 20 SECONDS)
		return

	// Escape clause: 12% chance to continue
	if(!prob(24))
		return

	// Character speaks nonsense
	M.say(pick("Somebody help me...","Unshackle me please...","Anybody... I've had enough of this dream...","The night blocks all sight...","Oh, somebody, please..."), forced = "holy water")

	// Escape clause: 10% chance to continue
	if(!prob(10))
		return

	// Character has a seisure
	M.visible_message("<span class='danger'>[M] starts having a seizure!</span>", "<span class='userdanger'>You have a seizure!</span>")
	M.Unconscious(120)
	to_chat(M, "<span class='cultlarge'>[pick("The moon is close. It will be a long hunt tonight.", "Ludwig, why have you forsaken me?", \
	"The night is near its end...", "Fear the blood...")]</span>")

	// Apply damage
	M.adjustToxLoss(1, 0)
	M.adjustFireLoss(1, 0)

	// Escape clause: 25% chance to continue
	if(!prob(25))
		return

	// Spontaneous combustion
	M.ignite_mob()
