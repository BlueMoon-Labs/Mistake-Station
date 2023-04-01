/**
 * Get the organ object from the mob matching the passed in typepath
 *
 * Arguments:
 * * typepath The typepath of the organ to get
 */
/mob/proc/get_organ_by_type(typepath)
	return

/**
 * Get organ objects by zone
 *
 * This will return a list of all the organs that are relevant to the zone that is passedin
 *
 * Arguments:
 * * zone [a BODY_ZONE_X define](https://github.com/tgstation/tgstation/blob/master/code/__DEFINES/combat.dm#L187-L200)
 */
/mob/proc/get_organs_for_zone(zone)
	return

/**
 * Returns a list of all organs in specified slot
 *
 * Arguments:
 * * slot Slot to get the organs from
 */
/mob/proc/get_organ_slot(slot)
	return

/mob/living/carbon/get_organ_by_type(typepath)
	return (locate(typepath) in organs)

/mob/living/carbon/get_organs_for_zone(zone, include_children = FALSE)
	var/valid_organs = list()
	for(var/obj/item/organ/organ as anything in organs)
		if(zone == organ.zone)
			valid_organs += organ
		else if(include_children && zone == deprecise_zone(organ.zone))
			valid_organs += organ
	return valid_organs

/mob/living/carbon/get_organ_slot(slot)
	. = organs_slot[slot]

/mob/living/carbon/get_bodypart(zone)
	RETURN_TYPE(/obj/item/bodypart)

	if(!zone)
		zone = BODY_ZONE_CHEST
	for(var/X in bodyparts)
		var/obj/item/bodypart/L = X
		if(L.body_zone == zone)
			return L

/mob/living/carbon/get_active_hand()
	var/which_hand = BODY_ZONE_PRECISE_L_HAND
	if(!(active_hand_index % 2))
		which_hand = BODY_ZONE_PRECISE_R_HAND
	return get_bodypart(check_zone(which_hand))

/mob/living/carbon/has_hand_for_held_index(i)
	if(i)
		var/obj/item/bodypart/L = hand_bodyparts[i]
		if(L && !L.bodypart_disabled)
			return L
	return FALSE

/mob/living/carbon/has_left_hand(check_disabled = TRUE)
	for(var/obj/item/bodypart/L in hand_bodyparts)
		if(L.held_index % 2)
			if(!check_disabled || !L.bodypart_disabled)
				return TRUE
	return FALSE

/mob/living/carbon/alien/larva/has_left_hand()
	return TRUE

/mob/living/carbon/has_right_hand(check_disabled = TRUE)
	for(var/obj/item/bodypart/L in hand_bodyparts)
		if(!(L.held_index % 2))
			if(!check_disabled || !L.bodypart_disabled)
				return TRUE
	return FALSE

/mob/living/carbon/alien/larva/has_right_hand()
	return TRUE

/mob/proc/has_left_leg()
	return TRUE

/mob/living/carbon/has_left_leg()
	var/obj/item/bodypart/l_leg = get_bodypart(BODY_ZONE_L_LEG)
	if(l_leg)
		return TRUE
	else
		return FALSE

/mob/proc/has_right_leg()
	return TRUE

/mob/living/carbon/has_right_leg()
	var/obj/item/bodypart/r_leg = get_bodypart(BODY_ZONE_R_LEG)
	if(r_leg)
		return TRUE
	else
		return FALSE

//Limb numbers
/mob/proc/get_num_arms(check_disabled = TRUE)
	return 2

/mob/living/carbon/get_num_arms(check_disabled = TRUE)
	. = 0
	for(var/X in bodyparts)
		var/obj/item/bodypart/affecting = X
		if(affecting.body_part == ARM_RIGHT)
			if(!check_disabled || !affecting.bodypart_disabled)
				.++
		if(affecting.body_part == ARM_LEFT)
			if(!check_disabled || !affecting.bodypart_disabled)
				.++


//sometimes we want to ignore that we don't have the required amount of arms.
/mob/proc/get_arm_ignore()
	return 0

/mob/living/carbon/alien/larva/get_arm_ignore()
	return 1 //so we can still handcuff larvas.


/mob/proc/get_num_legs(check_disabled = TRUE)
	return 2

/mob/living/carbon/get_num_legs(check_disabled = TRUE)
	. = 0
	for(var/X in bodyparts)
		var/obj/item/bodypart/affecting = X
		if(affecting.body_part == LEG_RIGHT)
			if(!check_disabled || !affecting.bodypart_disabled)
				.++
		if(affecting.body_part == LEG_LEFT)
			if(!check_disabled || !affecting.bodypart_disabled)
				.++

//sometimes we want to ignore that we don't have the required amount of legs.
/mob/proc/get_leg_ignore()
	return FALSE

/mob/living/carbon/get_leg_ignore()
	if(movement_type & (FLYING|FLOATING))
		return TRUE
	return FALSE

/mob/living/carbon/alien/larva/get_leg_ignore()
	return TRUE

///mob/living/carbon/get_missing_limbs(exclude_head = FALSE)
//	var/list/full = list(BODY_ZONE_HEAD, BODY_ZONE_CHEST, BODY_ZONE_R_ARM, BODY_ZONE_L_ARM, BODY_ZONE_R_LEG, BODY_ZONE_L_LEG)
//	for(var/zone in full)
//		if(exclude_head && zone == BODY_ZONE_HEAD) //this is needed in case we don't care for the lack of a dullahan's head or something.
//			full -= zone
//			continue
//		if(get_bodypart(zone))
//			full -= zone
//	return full
//
///mob/living/carbon/alien/larva/get_missing_limbs(exclude_head = FALSE)
//	var/list/full = list(BODY_ZONE_HEAD, BODY_ZONE_CHEST)
//	for(var/zone in full)
//		if(exclude_head && zone == BODY_ZONE_HEAD) //I guess????
//			full -= zone
//			continue
//		if(get_bodypart(zone))
//			full -= zone
//	return full

/mob/living/carbon/proc/get_body_parts_flags()
	for(var/X in bodyparts)
		var/obj/item/bodypart/L = X
		switch(L.body_part)
			if(CHEST)
				. |= GROIN
			if(LEG_LEFT)
				. |= FOOT_LEFT
			if(LEG_RIGHT)
				. |= FOOT_RIGHT
			if(ARM_LEFT)
				. |= HAND_LEFT
			if(ARM_RIGHT)
				. |= HAND_RIGHT
		. |= L.body_part
