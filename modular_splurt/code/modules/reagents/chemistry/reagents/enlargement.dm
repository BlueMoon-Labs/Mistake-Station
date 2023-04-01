//Main code edits
/datum/reagent/fermi/breast_enlarger/overdose_process(mob/living/carbon/M)
	if(M.client?.prefs.read_preference(/datum/preference/toggle/erp/breast_enlargement))
		var/obj/item/organ/genital/breasts/tity = M.get_organ_slot(ORGAN_SLOT_BREASTS)
		tity?.fluid_id = tity?.original_fluid_id
	. = ..()

/datum/reagent/fermi/penis_enlarger/overdose_process(mob/living/carbon/human/M)
	if(M.client?.prefs.read_preference(/datum/preference/toggle/erp/penis_enlargement))
		var/obj/item/organ/genital/penis/pp = M.get_organ_slot(ORGAN_SLOT_PENIS)
		var/obj/item/organ/genital/testicles/balls = M.get_organ_slot(ORGAN_SLOT_TESTICLES)
		pp?.fluid_id = pp?.original_fluid_id
		balls?.fluid_id = balls?.original_fluid_id
	. = ..()

/datum/reagent/fermi/butt_enlarger/overdose_process(mob/living/M)
	if(M.client?.prefs?.read_preference(/datum/preference/toggle/erp/butt_enlargement))
		var/obj/item/organ/genital/butt/ass = M.get_organ_slot(ORGAN_SLOT_BUTT)
		ass?.fluid_id = ass?.original_fluid_id
	. = ..()

//Own stuff

//Belly inflator yes
/datum/reagent/fermi/belly_inflator
	name = "Belladine nectar"
	description = "It will give you the lewdest tummy ache you've ever had"
	color = "#01ff63"
	taste_description = "blueberry gum"
	overdose_threshold = 17

/datum/reagent/fermi/belly_inflator/on_mob_metabolize(mob/living/carbon/M)
	. = ..()
	if(!ishuman(M))
		if(volume >= 15)
			var/turf/T = get_turf(M)
			var/obj/item/organ/genital/belly/B = new /obj/item/organ/genital/belly(T)
			M.visible_message("<span class='warning'>A belly suddenly flies out of [M]!")
			var/T2 = get_random_station_turf()
			M.adjustBruteLoss(25)
			M.Stun(50)
			B.throw_at(T2, 8, 1)
		M.reagents.del_reagent(type)
		return
	var/mob/living/carbon/human/H = M
	if(!H.get_organ_slot(ORGAN_SLOT_BELLY) && H.emergent_genital_call())
		H.genital_override = TRUE

/datum/reagent/fermi/belly_inflator/on_mob_life(mob/living/carbon/M)
	. = ..()
	if(!ishuman(M))
		return ..()
	var/mob/living/carbon/human/H = M
	if(!(H.client?.prefs?.read_preference(/datum/preference/toggle/erp/belly_enlargement)))
		return ..()
	var/obj/item/organ/genital/belly/B = M.get_organ_slot(ORGAN_SLOT_BELLY)
	if(!B)
		B = new
		B.Insert(M)
		if(B)
			if(M.dna.species.use_skintones && M.dna.features["genitals_use_skintone"])
				B.color = SKINTONE2HEX(H.skin_tone)
			else if(M.dna.features["belly_color"])
				B.color = "#[M.dna.features["belly_color"]]"
			else
				B.color = SKINTONE2HEX(H.skin_tone)
			B.size = 1
			B.size_cached = B.size
			to_chat(M, "<span class='warning'>You feel your midsection get warmer... bubbling softly as it seems to start distending</b></span>")
			M.reagents.remove_reagent(type, 5)
	//If they have, increase size.
	if(B.size_cached < BELLY_SIZE_MAX) //just in case
		B.modify_size(0.1)
	..()

/datum/reagent/fermi/GEsmaller_hypo
	name = "Super Antacid"
	color = "#fca3d4"
	taste_description = "Milky strawberries"
	description = "A medicine used to treat a patient's heavily bloated stomach"
	metabolization_rate = 0.5

/datum/reagent/fermi/GEsmaller_hypo/on_mob_metabolize(mob/living/M)
	. = ..()
	if(!ishuman(M))
		return
	var/mob/living/carbon/human/H = M
	if(!H.get_organ_slot(ORGAN_SLOT_BELLY) && H.dna.features["has_belly"])
		H.give_genital(/obj/item/organ/genital/belly)

/datum/reagent/fermi/GEsmaller_hypo/on_mob_life(mob/living/carbon/M)
	var/obj/item/organ/genital/belly/B = M.get_organ_slot(ORGAN_SLOT_BELLY)
	if(!B)
		return ..()
	var/optimal_size = M.dna.features["belly_size"]
	if(!optimal_size)//Fast fix for those who don't want it.
		B.modify_size(-0.2)
	else if(B.size > optimal_size)
		B.modify_size(-0.1, optimal_size)
	else if(B.size < optimal_size)
		B.modify_size(0.1, 0, optimal_size)
	return ..()

/datum/reagent/fermi/butt_enlarger/overdose_process(mob/living/M)
	if(M.client?.prefs?.read_preference(/datum/preference/toggle/erp/belly_enlargement))
		var/obj/item/organ/genital/belly/gut = M.get_organ_slot(ORGAN_SLOT_BELLY)
		gut?.fluid_id = gut?.original_fluid_id
	. = ..()
