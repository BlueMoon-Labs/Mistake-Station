/mob/living/carbon/human
	var/arousal = 0
	var/pleasure = 0
	var/pain = 0

	var/pain_limit = 0
	var/arousal_status = AROUSAL_NONE

	// Add variables for slots to the human class
	var/obj/item/vagina = null
	var/obj/item/anus = null
	var/obj/item/nipples = null
	var/obj/item/penis = null

// For tracking arousal and fluid regen.
/mob/living/carbon/human/Initialize(mapload)
	. = ..()
	if(!istype(src, /mob/living/carbon/human/species/monkey))
		apply_status_effect(/datum/status_effect/aroused)
		apply_status_effect(/datum/status_effect/body_fluid_regen)

/mob/living/carbon/human/proc/is_hands_uncovered()
	return (gloves?.body_parts_covered & ARMS)

/mob/living/carbon/human/proc/is_head_uncovered()
	return (head?.body_parts_covered & HEAD)

/// Returns true if the human has a accessible feet for the parameter, returning the number of feet the human has if they do. Accepts any of the `REQUIRE_GENITAL_` defines.
/mob/living/carbon/human/proc/has_arms(required_state = REQUIRE_GENITAL_ANY)
	var/hand_count = 0
	var/covered = 0
	var/is_covered = FALSE
	for(var/obj/item/bodypart/arm/left/left_arm in bodyparts)
		hand_count++
	for(var/obj/item/bodypart/arm/right/right_arm in bodyparts)
		hand_count++
	if(get_item_by_slot(ITEM_SLOT_HANDS))
		var/obj/item/clothing/gloves/worn_gloves = get_item_by_slot(ITEM_SLOT_HANDS)
		covered = worn_gloves.body_parts_covered
	if(covered & HANDS)
		is_covered = TRUE
	switch(required_state)
		if(REQUIRE_GENITAL_ANY)
			return hand_count
		if(REQUIRE_GENITAL_EXPOSED)
			if(is_covered)
				return FALSE
			else
				return hand_count
		if(REQUIRE_GENITAL_UNEXPOSED)
			if(!is_covered)
				return FALSE
			else
				return hand_count
		else
			return hand_count

/// Sets the gender of the human, respecting prefs unless it's forced. Do not force in non-admin operations.
/mob/living/carbon/human/proc/set_gender(ngender = NEUTER, silent = FALSE, update_icon = TRUE, forced = FALSE)
	var/bender = gender != ngender
	if((!client?.prefs?.read_preference(/datum/preference/toggle/erp/gender_change) && !forced) || !dna || !bender)
		return FALSE

	if(ngender == MALE || ngender == FEMALE)
		dna.features["body_model"] = ngender
		if(!silent)
			var/adj = ngender == MALE ? "masculine" : "feminine"
			visible_message(span_boldnotice("[src] suddenly looks more [adj]!"), span_boldwarning("You suddenly feel more [adj]!"))
	else if(ngender == NEUTER)
		dna.features["body_model"] = MALE
	gender = ngender
	if(update_icon)
		update_body()

/*
*	MISC LOGIC
*/

// Handles breaking out of gloves that restrain people.
/mob/living/carbon/human/resist_restraints()
	if(gloves?.breakouttime)
		changeNext_move(CLICK_CD_BREAKOUT)
		last_special = world.time + CLICK_CD_BREAKOUT
		cuff_resist(gloves)
	else
		..()

/// Checks if the human is wearing a condom, and also hasn't broken it.
/mob/living/carbon/human/proc/is_wearing_condom()
	if(!penis || !istype(penis, /obj/item/clothing/sextoy/condom))
		return FALSE

	var/obj/item/clothing/sextoy/condom/condom = penis
	return condom.condom_state == CONDOM_BROKEN

// For handling things that don't already have handcuff handlers.
/mob/living/carbon/human/set_handcuffed(new_value)
	if(wear_suit && istype(wear_suit, /obj/item/clothing/suit/straight_jacket/kinky_sleepbag))
		return FALSE
	..()
