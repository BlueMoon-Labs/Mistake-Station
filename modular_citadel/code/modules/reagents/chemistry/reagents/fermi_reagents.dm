 //Fermichem!!
//Fun chems for all the family

/datum/reagent/fermi
	name = "Fermi" //This should never exist, but it does so that it can exist in the case of errors..
	taste_description	= "the default fermi taste"
	chemical_flags = NONE
	inverse_chem_val 		= 0.25		// If the impurity is below 0.5, replace ALL of the chem with inverse_chemupon metabolising
	inverse_chem			= /datum/reagent/impure/fermiTox

//This should process fermichems to find out how pure they are and what effect to do.
/datum/reagent/fermi/on_mob_add(mob/living/carbon/M, amount)
	. = ..()

//When merging two fermichems, see above
/datum/reagent/fermi/on_merge(data, amount, mob/living/carbon/M, purity)//basically on_mob_add but for merging
	. = ..()

////////////////////////////////////////////////////////////////////////////////////////////////////
//										FURRANIUM
///////////////////////////////////////////////////////////////////////////////////////////////////
//OwO whats this?
//Makes you nya and awoo
//At a certain amount of time in your system it gives you a fluffy tongue, if pure enough, it's permanent.

/datum/reagent/fermi/furranium
	name = "Furranium"
	description = "OwO whats this?"
	color = "#f9b9bc" // rgb: , 0, 255
	taste_description = "dewicious degenyewacy"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	inverse_chem_val 		= 0
	var/obj/item/organ/internal/tongue/nT
	chemical_flags = REAGENT_DONOTSPLIT
	ph = 5
	var/obj/item/organ/internal/tongue/T
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/reagent/fermi/furranium/expose_mob(mob/living/carbon/human/M, method=INJECT, reac_volume)
	if(method == INJECT)
		var/turf/T = get_turf(M)
		M.adjustOxyLoss(15)
		M.Stun(50)
		M.emote("cough")
		var/obj/item/toy/plush/P = pick(subtypesof(/obj/item/toy/plush))
		new P(T)
		M.visible_message("<span class='warning'>[M] suddenly coughs up a [P.name]!</b></span>",\
						"<span class='warning'>You feel a lump form in your throat, as you suddenly cough up what seems to be a hairball?</b></span>")
		var/T2 = get_random_station_turf()
		P.throw_at(T2, 8, 1)
	..()

/datum/reagent/fermi/furranium/on_mob_life(mob/living/carbon/M)

	switch(current_cycle)
		if(1 to 9)
			if(prob(20))
				to_chat(M, "<span class='notice'>Your tongue feels... fluffy</span>")
		if(10 to 15)
			if(prob(10))
				to_chat(M, "You find yourself unable to supress the desire to meow!")
				M.emote("nya")
			if(prob(10))
				to_chat(M, "You find yourself unable to supress the desire to howl!")
				M.emote("awoo")
			if(prob(20))
				var/list/seen = M.fov_view() - M //Sound and sight checkers
				for(var/victim in seen)
					if(isanimal(victim) || !isliving(victim))
						seen -= victim
				if(LAZYLEN(seen))
					to_chat(M, "You notice [pick(seen)]'s bulge [pick("OwO!", "uwu!")]")
		if(16)
			T = M.getorganslot(ORGAN_SLOT_TONGUE)
			var/obj/item/organ/internal/tongue/nT = new /obj/item/organ/internal/tongue/fluffy
			T.Remove()
			nT.Insert(M)
			T.moveToNullspace()//To valhalla
			to_chat(M, "<span class='big warning'>Your tongue feels... weally fwuffy!!</span>")
		if(17 to INFINITY)
			if(prob(5))
				to_chat(M, "You find yourself unable to supress the desire to meow!")
				M.emote("nya")
			if(prob(5))
				to_chat(M, "You find yourself unable to supress the desire to howl!")
				M.emote("awoo")
			if(prob(5))
				var/list/seen = M.fov_view() - M //Sound and sight checkers
				for(var/victim in seen)
					if(isanimal(victim) || !isliving(victim))
						seen -= victim
				if(LAZYLEN(seen))
					to_chat(M, "You notice [pick(seen)]'s bulge [pick("OwO!", "uwu!")]")
	..()

/datum/reagent/fermi/furranium/on_mob_delete(mob/living/carbon/M)
	if(creation_purity < 0.95)//Only permanent if you're a good chemist.
		nT = M.getorganslot(ORGAN_SLOT_TONGUE)
		nT.Remove()
		qdel(nT)
		T.Insert(M)
		to_chat(M, "<span class='notice'>You feel your tongue.... unfluffify...?</span>")
		M.say("Pleh!")
	else
		log_reagent("FERMICHEM: [M] ckey: [M.key]'s tongue has been made permanent")


////////////////////////////////////////////////////////////////////////////////////////////////////
//										PLUSHMIUM
///////////////////////////////////////////////////////////////////////////////////////////////////
//A chemical you can spray on plushies to turn them into a 'shell'
//Hugging the plushie turns yourself into the plushie!
/datum/reagent/fermi/plushmium
	name = "Plushmium"
	description = "A strange chemical, seeming almost fluffy, if it were not for it being a liquid. Known to have a strange effect on plushies."
	color = "#fbcbd7"
	taste_description = "the soft feeling of a plushie"
	ph = 5
	chemical_flags = REAGENT_CAN_BE_SYNTHESIZED

/datum/reagent/fermi/plushmium/reaction_obj(obj/O, reac_volume)
	if(istype(O, /obj/item/toy/plush) && reac_volume >= 5)
		O.loc.visible_message("<span class='warning'>The plushie seems to be staring back at you.</span>")
		var/obj/item/toy/plushie_shell/new_shell = new /obj/item/toy/plushie_shell(O.loc)
		new_shell.name = O.name
		new_shell.icon = O.icon
		new_shell.icon_state = O.icon_state
		new_shell.stored_plush = O
		O.forceMove(new_shell)

//Extra interaction for which spraying it on an existing sentient plushie aheals them, so they can be revived!
/datum/reagent/fermi/plushmium/expose_mob(mob/living/M, method=TOUCH, reac_volume)
	if(istype(M, /mob/living/simple_animal/pet/plushie) && reac_volume >= 1)
		M.revive(full_heal = 1, admin_revive = 1)

///////////////////////////////////////////////////////////////////////////////////////////////
//Nanite removal
//Writen by Trilby!! Embellsished a little by me.

/datum/reagent/fermi/nanite_b_gone
	name = "Nanite bane"
	description = "A stablised EMP that is highly volatile, shocking small nano machines that will kill them off at a rapid rate in a patient's system."
	color = "#708f8f"
	overdose_threshold = 15
	inverse_chem_val 		= 0.25
	inverse_chem		= /datum/reagent/fermi/nanite_b_goneTox //At really impure vols, it just becomes 100% inverse
	taste_description = "what can only be described as licking a battery"
	ph = 9
	chemical_flags = NONE
	var/react_objs = list()

/datum/reagent/fermi/nanite_b_gone/on_mob_life(mob/living/carbon/C)
	var/datum/component/nanites/N = C.GetComponent(/datum/component/nanites)
	if(isnull(N))
		return ..()
	if(HAS_TRAIT(C, TRAIT_ROBOTIC_ORGANISM))
		C.adjustToxLoss(1, toxins_type = TOX_SYSCORRUPT) //Interferes with robots. Rare chem, so, pretty good at that too.
	N.adjust_nanites(-creation_purity*5) //0.5 seems to be the default to me, so it'll neuter them.
	..()

/datum/reagent/fermi/nanite_b_gone/overdose_process(mob/living/carbon/C)
	var/datum/component/nanites/N = C.GetComponent(/datum/component/nanites)
	if(prob(5))
		to_chat(C, "<span class='warning'>The residual voltage from the nanites causes you to seize up!</b></span>")
		C.electrocute_act(10, (get_turf(C)), 1, SHOCK_ILLUSION)
	if(prob(10))
		var/atom/T = C
		T.emp_act(80)
		to_chat(C, "<span class='warning'>You feel a strange tingling sensation come from your core.</b></span>")
	if(isnull(N))
		return ..()
	N.adjust_nanites(-10*creation_purity)
	..()

/datum/reagent/fermi/nanite_b_gone/reaction_obj(obj/O, reac_volume)
	for(var/active_obj in react_objs)
		if(O == active_obj)
			return
	react_objs += O
	O.emp_act(80)

/datum/reagent/fermi/nanite_b_goneTox
	name = "Electromagnetic crystals"
	description = "Causes items upon the patient to sometimes short out, as well as causing a shock in the patient, if the residual charge between the crystals builds up to sufficient quantities"
	taste_description = "shocking pain"
	metabolization_rate = 0.5
	chemical_flags = REAGENT_INVISIBLE

//Increases shock events.
/datum/reagent/fermi/nanite_b_goneTox/on_mob_life(mob/living/carbon/C)//Damages the taker if their purity is low. Extended use of impure chemicals will make the original die. (thus can't be spammed unless you've very good)
	if(prob(15))
		to_chat(C, "<span class='warning'>The residual voltage in your system causes you to seize up!</b></span>")
		C.electrocute_act(10, (get_turf(C)), 1, SHOCK_ILLUSION)
	if(prob(50))
		var/atom/T = C
		T.emp_act(80)
		to_chat(C, "<span class='warning'>You feel your hair stand on end as you glow brightly for a moment!</b></span>")
	..()

//Turns you into a cute catto while it's in your system.
//If you manage to gamble perfectly, makes you have cat ears after you transform back. But really, you shouldn't end up with that with how random it is.
/datum/reagent/fermi/secretcatchem //Should I hide this from code divers? A secret cit chem?
	name = "secretcatchem" //an attempt at hiding it
	description = "An illegal and hidden chem that turns people into cats. It's said that it's so rare and unstable that having it means you've been blessed. If used on someone in crit, it will turn them into a cat permanently, until the cat is killed."
	taste_description = "hairballs and cream"
	color = "#ffc224"
	var/catshift = FALSE
	var/perma = FALSE
	var/mob/living/simple_animal/pet/cat/custom_cat/catto = null
	chemical_flags = NONE

/datum/reagent/fermi/secretcatchem/New()
	name = "Catbalti[pick("a","u","e","y")]m [pick("apex", "prime", "meow")]"//rename

/datum/reagent/fermi/secretcatchem/on_mob_add(mob/living/carbon/human/H)
	. = ..()
	if(creation_purity >= 0.9)//ONLY if purity is high, and given the stuff is random. It's very unlikely to get this to 1.
		//exception(al) handler:
		H.dna.features["ears"]  = "Cat"
		H.dna.features["mam_ears"] = "Cat"
		H.verb_say = "mewls"
		catshift = TRUE
		playsound(get_turf(H), 'modular_citadel/sound/voice/merowr.ogg', 50, 1, -1)
	to_chat(H, "<span class='notice'>You suddenly turn into a cat!</span>")
	catto = new(get_turf(H.loc))
	H.mind.transfer_to(catto)
	catto.name = H.name
	catto.desc = "A cute catto! They remind you of [H] somehow."
	catto.color = "#[H.dna.features["mcolor"]]"
	catto.pseudo_death = TRUE
	H.forceMove(catto)
	log_reagent("FERMICHEM: [H] ckey: [H.key] has been made into a cute catto.")
	SSblackbox.record_feedback("tally", "fermi_chem", 1, "cats")
	if(H.InCritical())
		perma = TRUE
		volume = 5
		H.stat = DEAD
		catto.origin = H

/datum/reagent/fermi/secretcatchem/on_mob_life(mob/living/carbon/H)
	if(!catto)
		metabolization_rate = 5
		return ..()
	if(catto.health <= 0) //So the dead can't ghost
		if(prob(10))
			to_chat(catto, "<span class='notice'>You feel your body start to slowly shift back from it's dead form.</span>")
		perma = FALSE
		metabolization_rate = 1
	else if(prob(5))
		playsound(get_turf(catto), 'modular_citadel/sound/voice/merowr.ogg', 50, 1, -1)
		catto.say("lets out a meowrowr!*")
	..()

/datum/reagent/fermi/secretcatchem/on_mob_delete(mob/living/carbon/H)
	if(perma)
		to_chat(H, "<span class='notice'>You feel your body settle into it's new form. You won't be able to shift back on death anymore.</span>")
		return
	var/words = "Your body shifts back to normal."
	H.forceMove(catto.loc)
	catto.mind.transfer_to(H)
	if(catshift == TRUE)
		words += " ...But wait, are those cat ears?"
		H.say("*wag")//force update sprites.
	to_chat(H, "<span class='notice'>[words]</span>")
	qdel(catto)
	log_reagent("FERMICHEM: [H] ckey: [H.key] has returned to normal")


/datum/reagent/fermi/secretcatchem/expose_mob(var/mob/living/L)
	if(istype(L, /mob/living/simple_animal/pet/cat/custom_cat) && creation_purity >= 0.85)
		var/mob/living/simple_animal/pet/cat/custom_cat/catto = L
		if(catto.origin)
			var/mob/living/carbon/human/H = catto.origin
			H.stat = CONSCIOUS
			log_reagent("FERMICHEM: [catto] ckey: [catto.key] has returned to normal.")
			to_chat(catto, "<span class='notice'>Your body shifts back to normal!</span>")
			H.forceMove(catto.loc)
			catto.mind.transfer_to(H)
			if(!L.mind) //Just in case
				qdel(L)
			else //This should never happen, but just in case, so their game isn't ruined.
				catto.icon_state = "custom_cat"
				catto.health = 50
