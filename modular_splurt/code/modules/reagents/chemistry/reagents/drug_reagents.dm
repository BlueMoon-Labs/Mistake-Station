#define QUIRK_ESTROUS_ACTIVE /datum/quirk/estrous_active

//aphrodisiac & anaphrodisiac

/datum/reagent/drug/aphrodisiac
	name = "Crocin"
	description = "Naturally found in the crocus and gardenia flowers, this drug acts as a natural and safe aphrodisiac."
	taste_description = "strawberries"
	color = "#FFADFF"//PINK, rgb(255, 173, 255)

/datum/reagent/drug/aphrodisiac/on_mob_life(mob/living/M)
	if(M && M.client?.prefs.arousable && (M.client?.prefs.read_preference(/datum/preference/toggle/erp/aphro)))
		if((prob(min(current_cycle/2,5))))
			M.emote(pick("moan","blush"))
		if(prob(min(current_cycle/4,10)))
			var/aroused_message = pick("Вам немного жарко.", "Вы испытываете сильное сексуальное влечение.", "Вы чувствуете себя в хорошем настроении.", "Вы готовы напрыгнуть на кого-то.")
			to_chat(M, "<span class='userlove'>[aroused_message]</span>")
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			var/list/genits = H.adjust_arousal(current_cycle, "crocin", aphro = TRUE) // redundant but should still be here
			for(var/g in genits)
				var/obj/item/organ/genital/G = g
				to_chat(M, "<span class='userlove'>[G.arousal_verb]!</span>")
	..()

/datum/reagent/drug/aphrodisiacplus
	name = "Hexacrocin"
	description = "Chemically condensed form of basic crocin. This aphrodisiac is extremely powerful and addictive in most animals.\
					Addiction withdrawals can cause brain damage and shortness of breath. Overdosage can lead to brain damage and a \
					permanent increase in libido (commonly referred to as 'bimbofication')."
	taste_description = "liquid desire"
	color = "#FF2BFF"//dark pink
	overdose_threshold = 20

/datum/reagent/drug/aphrodisiacplus/on_mob_life(mob/living/M)
	if(M && M.client?.prefs.arousable && (M.client?.prefs.read_preference(/datum/preference/toggle/erp/aphro)))
		if(prob(10))
			if(prob(current_cycle))
				M.say(pick("Ох-мхх...", "Ахх-р...", "Амрфпф...", "Мрр-ах..."))
			else
				M.emote(pick("moan","blush"))
		if(prob(5))
			var/aroused_message
			if(current_cycle>25)
				aroused_message = pick("Тебе нужно кого-нибудь трахнуть!", "В вас бурлит сильное сексуальное напряжение!", "Вы не можете выбросить секс из головы!")
			else
				aroused_message = pick("Вам немного жарко.", "Вы испытываете сильное сексуальное влечение.", "Вы чувствуете себя в хорошем настроении.", "Вы готовы напрыгнуть на кого-то.")
			to_chat(M, "<span class='userlove'>[aroused_message]</span>")
			REMOVE_TRAIT(M,TRAIT_NEVERBONER,APHRO_TRAIT)
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			var/list/genits = H.adjust_arousal(100, "hexacrocin", aphro = TRUE) // redundant but should still be here
			for(var/g in genits)
				var/obj/item/organ/genital/G = g
				to_chat(M, "<span class='userlove'>[G.arousal_verb]!</span>")
	..()

/datum/reagent/drug/aphrodisiacplus/overdose_process(mob/living/M)
	if(M && M.client?.prefs.arousable && (M.client?.prefs.read_preference(/datum/preference/toggle/erp/aphro) && prob(33)))
		if(prob(5) && ishuman(M) && M.has_dna() && (M.client?.prefs?.read_preference(/datum/preference/toggle/erp/bimbofication)))
			if(!HAS_TRAIT(M,TRAIT_PERMABONER))
				to_chat(M, "<span class='userlove'>Ваше либидо сходит с ума!</span>")
				M.log_message("Made perma-horny by hexacrocin.",LOG_EMOTE)
				ADD_TRAIT(M,TRAIT_PERMABONER,APHRO_TRAIT)
				ADD_TRAIT(M, TRAIT_BIMBO, LEWDCHEM_TRAIT)
	..()

/datum/reagent/drug/anaphrodisiac
	name = "Camphor"
	description = "Naturally found in some species of evergreen trees, camphor is a waxy substance. When injested by most animals, it acts as an anaphrodisiac\
					, reducing libido and calming them. Non-habit forming and not addictive."
	taste_description = "dull bitterness"
	taste_mult = 2
	color = "#D9D9D9"//rgb(217, 217, 217)
	reagent_state = SOLID

/datum/reagent/drug/anaphrodisiac/on_mob_life(mob/living/M)
	if(M && M.client?.prefs.arousable && prob(16))
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			var/list/genits = H.adjust_arousal(-100, "camphor", aphro = TRUE)
			if(genits.len)
				to_chat(M, "<span class='notice'>You no longer feel aroused.")
	..()

/datum/reagent/drug/anaphrodisiacplus
	name = "Hexacamphor"
	description = "Chemically condensed camphor. Causes an extreme reduction in libido and a permanent one if overdosed. Non-addictive."
	taste_description = "tranquil celibacy"
	color = "#D9D9D9"//rgb(217, 217, 217)
	reagent_state = SOLID
	overdose_threshold = 20

/datum/reagent/drug/anaphrodisiacplus/on_mob_life(mob/living/M)
	if(M && M.client?.prefs.arousable)
		REMOVE_TRAIT(M,TRAIT_PERMABONER,APHRO_TRAIT)
		REMOVE_TRAIT(M, TRAIT_BIMBO, LEWDCHEM_TRAIT)
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			var/list/genits = H.adjust_arousal(-100, "hexacamphor", aphro = TRUE)
			if(genits.len)
				to_chat(M, "<span class='notice'>You no longer feel aroused.")

	..()

/datum/reagent/drug/anaphrodisiacplus/overdose_process(mob/living/M)
	if(M && M.client?.prefs.arousable && prob(5))
		to_chat(M, "<span class='userlove'>You feel like you'll never feel aroused again...</span>")
		ADD_TRAIT(M,TRAIT_NEVERBONER,APHRO_TRAIT)
	..()


// Hexacrocin
/datum/reagent/drug/aphrodisiacplus/overdose_start(mob/living/M)
	. = ..()

	// Check for mob with client
	if(!(istype(M) && M.client))
		return

	// Check pref for arousable
	if(!M.client?.prefs.arousable)
		// Log interaction and return
		M.log_message("overdosed on [src], but ignored it due to arousal preference.", LOG_EMOTE)
		return

	// Check pref for aphro
	if(M.client?.prefs.read_preference(/datum/preference/toggle/erp/aphro))
		// Log interaction and return
		M.log_message("overdosed on [src], but ignored it due to aphrodisiac preference.", LOG_EMOTE)
		return

	// Check for pre-existing heat trait
	if(!M.has_quirk(QUIRK_ESTROUS_ACTIVE))
		// Add quirk
		M.add_quirk(QUIRK_ESTROUS_ACTIVE, APHRO_TRAIT)

		// Chat message is handled by the quirk

		// Log interaction
		M.log_message("was given the In Estrous quirk by [src] overdose.", LOG_EMOTE)

	// Return normally
	. = ..()

// Hexacamphor
/datum/reagent/drug/anaphrodisiacplus/overdose_start(mob/living/M)
	. = ..()

	// Check for mob with client
	if(!(istype(M) && M.client))
		return

	// Check pref for arousable
	if(!M.client?.prefs.arousable)
		// Log interaction and return
		M.log_message("overdosed on [src], but ignored it due to arousal preference.", LOG_EMOTE)
		return

	// Check for pre-existing heat trait
	if(M.has_quirk(QUIRK_ESTROUS_ACTIVE))
		// Remove quirk
		M.remove_quirk(QUIRK_ESTROUS_ACTIVE)

		// Chat message is handled by the quirk

		// Log interaction
		M.log_message("lost the In Estrous quirk due to [src] overdose.", LOG_EMOTE)

//Own stuff
/datum/reagent/drug/maint/tar
	name = "Maintenance Tar"
	description = "An unknown tar that you most likely gotten from an assistant, a bored chemist... or cooked yourself."
	reagent_state = LIQUID
	color = "#000000"
	overdose_threshold = 30

/datum/reagent/drug/maint/tar/on_mob_life(mob/living/carbon/M, delta_time, times_fired)
	. = ..()

	M.AdjustStun(-10 * REAGENTS_EFFECT_MULTIPLIER * delta_time)
	M.AdjustKnockdown(-10 * REAGENTS_EFFECT_MULTIPLIER * delta_time)
	M.AdjustUnconscious(-10 * REAGENTS_EFFECT_MULTIPLIER * delta_time)
	M.AdjustParalyzed(-10 * REAGENTS_EFFECT_MULTIPLIER * delta_time)
	M.AdjustImmobilized(-10 * REAGENTS_EFFECT_MULTIPLIER * delta_time)
	M.adjustOrganLoss(ORGAN_SLOT_LIVER, 1.5 * REAGENTS_EFFECT_MULTIPLIER * delta_time)

/datum/reagent/drug/maint/tar/overdose_process(mob/living/M, delta_time, times_fired)
	. = ..()

	M.adjustToxLoss(5 * REAGENTS_EFFECT_MULTIPLIER * delta_time)
	M.adjustOrganLoss(ORGAN_SLOT_LIVER, 3 * REAGENTS_EFFECT_MULTIPLIER * delta_time)

/datum/reagent/drug/copium
	name = "Copium"
	description = "Cope and sssethe"
	taste_description = "coping"
	color = "#0f0"
	overdose_threshold = 30
	addiction_types = list(/datum/addiction/hallucinogens = 10)

// Variant of Copium created by genital fluids
/datum/reagent/drug/copium/gfluid

/datum/reagent/drug/copium/on_mob_life(mob/living/carbon/M)
	. = ..()

	if (!ishuman(M))
		return
	var/mob/living/carbon/human/H = M
	if (prob(10))
		to_chat(H, "<span class='notice'>You feel like you can cope!</span>")
		H.adjust_disgust(-10)
		SEND_SIGNAL(H, COMSIG_ADD_MOOD_EVENT, "copium", /datum/mood_event/cope, name)
	. = 1

/datum/reagent/drug/copium/overdose_start(mob/living/M)
	to_chat(M, "<span class='userdanger'>What the fuck.</span>")
	SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "[type]_overdose", /datum/mood_event/overdose, name)

/datum/reagent/drug/copium/overdose_process(mob/living/M)
	var/mob/living/carbon/human/H = M
	if (prob(5))
		H.adjust_disgust(20)
		to_chat(H, "<span class='warning'>I can't stand it anymore!</span>")
	..()

/* bluemoon removal start
/datum/reagent/drug/copium/reaction_obj(obj/O, volume)
	if ((!O) || (!volume))
		return 0
	var/temp = holder ? holder.chem_temp : T20C
	O.atmos_spawn_air("copium=[volume];TEMP=[temp]")

/datum/reagent/drug/expose_turf(turf/open/T, volume)
	if (istype(T))
		var/temp = holder ? holder.chem_temp : T20C
		T.atmos_spawn_air("copium=[volume];TEMP=[temp]")
	return
*/

#undef QUIRK_ESTROUS_ACTIVE
