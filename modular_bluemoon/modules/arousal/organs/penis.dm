/obj/item/organ/external/genital/penis
	name = "penis"
	desc = "A male reproductive organ."
	icon_state = "penis"
	icon = 'modular_skyrat/master_files/icons/obj/genitals/penis.dmi'
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_PENIS
	mutantpart_key = ORGAN_SLOT_PENIS
	arousal_verb = "У тебя сильный стояк"
	unarousal_verb = "Твой стояк опускается"
	mutantpart_info = list(MUTANT_INDEX_NAME = "Human", MUTANT_INDEX_COLOR_LIST = list("#FFEEBB"))
	drop_when_organ_spilling = FALSE
	var/girth = 9
	var/sheath = SHEATH_NONE
	bodypart_overlay = /datum/bodypart_overlay/mutant/genital/penis

/datum/bodypart_overlay/mutant/genital/penis
	feature_key = ORGAN_SLOT_PENIS
	layers = EXTERNAL_FRONT | EXTERNAL_BEHIND

/obj/item/organ/external/genital/penis/get_description_string(datum/sprite_accessory/genital/gas)
	var/returned_string = ""
	var/pname = lowertext(genital_name) == "nondescript" ? "" : lowertext(genital_name) + " "
	if(sheath != SHEATH_NONE && aroused != AROUSAL_FULL) //Hidden in sheath
		switch(sheath)
			if(SHEATH_NORMAL)
				returned_string = "На ваши глаза попадается мешочек."
			if(SHEATH_SLIT)
				returned_string = "Вы наблюдаете щель." ///Typo fix.
		if(aroused == AROUSAL_PARTIAL)
			returned_string += " Кажется... оттуда выглядывает головка полового члена!"
	else
		returned_string = "Вы наблюдаете [pname] формы член. По вашим оценкам, он примерно [genital_size] сантиметров в длину и [girth] сантиметров в ширину."
		switch(aroused)
			if(AROUSAL_NONE)
				returned_string += " Он просто висит."
			if(AROUSAL_PARTIAL)
				returned_string += " Он дёргается, наливаясь силой."
			if(AROUSAL_FULL)
				returned_string += " Он полностью встал!"
	return returned_string

/obj/item/organ/external/genital/penis/update_genital_icon_state()
	var/size_affix
	var/measured_size = FLOOR(genital_size,1)
	if(measured_size < 1)
		measured_size = 1
	switch(measured_size)
		if(0 to 12)
			size_affix = 1
		if(13 to 24)
			size_affix = 2
		if(23 to 50)
			size_affix = 3
		if(51 to 90)
			size_affix = 4
		if(91 to INFINITY)
			size_affix = 4 // Временная мера.

	var/passed_string = "penis_[genital_type]_[size_affix]"
	if(uses_skintones)
		passed_string += "_s"
	icon_state = passed_string

/obj/item/organ/external/genital/penis/get_sprite_size_string()
	if(aroused != AROUSAL_FULL && sheath != SHEATH_NONE) //Sheath time!
		var/poking_out = 0
		if(aroused == AROUSAL_PARTIAL)
			poking_out = 1
		return "[lowertext(sheath)]_[poking_out]"

	var/size_affix
	var/measured_size = FLOOR(genital_size,1)
	var/is_erect = 0
	if(aroused == AROUSAL_FULL)
		is_erect = 1
	if(measured_size < 1)
		measured_size = 1
	switch(measured_size)
		if(0 to 12)
			size_affix = 1
		if(13 to 24)
			size_affix = 2
		if(23 to 50)
			size_affix = 3
		if(51 to 90)
			size_affix = 4
		if(91 to INFINITY)
			size_affix = 4 // Временная мера.
	var/passed_string = "[genital_type]_[size_affix]_[is_erect]"
	if(uses_skintones)
		passed_string += "_s"
	return passed_string

/obj/item/organ/external/genital/penis/build_from_dna(datum/dna/DNA, associated_key)
	girth = DNA.features["penis_girth"]
	uses_skin_color = DNA.features["penis_uses_skincolor"]
	set_size(DNA.features["penis_size"])

	return ..()

/obj/item/organ/external/genital/penis/build_from_accessory(datum/sprite_accessory/genital/accessory, datum/dna/DNA)
	var/datum/sprite_accessory/genital/penis/snake = accessory
	if(snake.can_have_sheath)
		sheath = DNA.features["penis_sheath"]
	if(DNA.features["penis_uses_skintones"])
		uses_skintones = accessory.has_skintone_shading

/datum/bodypart_overlay/mutant/genital/penis/get_global_feature_list()
	return GLOB.sprite_accessories[ORGAN_SLOT_PENIS]

/datum/sprite_accessory/genital/penis
	icon = 'modular_skyrat/master_files/icons/mob/sprite_accessory/genitals/penis_onmob.dmi'
	organ_type = /obj/item/organ/external/genital/penis
	associated_organ_slot = ORGAN_SLOT_PENIS
	key = ORGAN_SLOT_PENIS
	color_src = USE_MATRIXED_COLORS
	always_color_customizable = TRUE
	center = TRUE
	special_icon_case = TRUE
	special_x_dimension = TRUE
	//default_color = DEFAULT_SKIN_OR_PRIMARY //This is the price we're paying for sheaths
	relevent_layers = list(BODY_BEHIND_LAYER, BODY_FRONT_LAYER)
	genetic = TRUE
	var/can_have_sheath = TRUE

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

/datum/sprite_accessory/genital/penis/none
	icon_state = "none"
	name = "None"
	factual = FALSE
	color_src = null

/datum/sprite_accessory/genital/penis/human
	icon_state = "human"
	name = "Human"
	color_src = USE_ONE_COLOR
	default_color = DEFAULT_SKIN_OR_PRIMARY
	has_skintone_shading = TRUE
	can_have_sheath = FALSE

/datum/sprite_accessory/genital/penis/nondescript
	icon_state = "nondescript"
	name = "Nondescript"

/datum/sprite_accessory/genital/penis/knotted
	icon_state = "knotted"
	name = "Knotted"

/datum/sprite_accessory/genital/penis/flared
	icon_state = "flared"
	name = "Flared"

/datum/sprite_accessory/genital/penis/barbknot
	icon_state = "barbknot"
	name = "Barbed, Knotted"

/datum/sprite_accessory/genital/penis/tapered
	icon_state = "tapered"
	name = "Tapered"

/datum/sprite_accessory/genital/penis/tentacle
	icon_state = "tentacle"
	name = "Tentacled"

/datum/sprite_accessory/genital/penis/hemi
	icon_state = "hemi"
	name = "Hemi"

/datum/sprite_accessory/genital/penis/hemiknot
	icon_state = "hemiknot"
	name = "Knotted Hemi"
