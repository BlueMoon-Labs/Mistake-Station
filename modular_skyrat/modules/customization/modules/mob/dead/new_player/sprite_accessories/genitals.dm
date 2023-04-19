/// The alternative `dimension_x` to use if it's a taur.
#define TAUR_DIMENSION_X 64

/datum/sprite_accessory/genital/penis/get_special_icon(mob/living/carbon/human/target_mob)
	var/taur_mode = target_mob?.get_taur_mode()

	if(!taur_mode || !target_mob.dna.features["penis_taur_mode"] || taur_mode & STYLE_TAUR_SNAKE)
		return icon

	return 'modular_skyrat/master_files/icons/mob/sprite_accessory/genitals/taur_penis_onmob.dmi'

/datum/sprite_accessory/genital/penis/get_special_x_dimension(mob/living/carbon/human/target_mob)
	var/taur_mode = target_mob?.get_taur_mode()

	if(!taur_mode || !target_mob.dna.features["penis_taur_mode"] || taur_mode & STYLE_TAUR_SNAKE)
		return dimension_x

	return TAUR_DIMENSION_X

/datum/sprite_accessory/genital/testicles/get_special_icon(mob/living/carbon/human/target_mob)
	var/taur_mode = target_mob?.get_taur_mode()

	if(!taur_mode || !target_mob.dna.features["penis_taur_mode"] || taur_mode & STYLE_TAUR_SNAKE)
		return icon

	return 'modular_skyrat/master_files/icons/mob/sprite_accessory/genitals/taur_penis_onmob.dmi'

/datum/sprite_accessory/genital/testicles/get_special_x_dimension(mob/living/carbon/human/target_mob)
	var/taur_mode = target_mob?.get_taur_mode()

	if(!taur_mode || !target_mob.dna.features["penis_taur_mode"] || taur_mode & STYLE_TAUR_SNAKE)
		return dimension_x

	return TAUR_DIMENSION_X

#undef TAUR_DIMENSION_X
