/obj/item/organ/external/genital/testicles
	name = "testicles"
	desc = "A male reproductive organ."
	icon_state = "testicles"
	icon = 'modular_skyrat/master_files/icons/obj/genitals/testicles.dmi'
	mutantpart_key = ORGAN_SLOT_TESTICLES
	mutantpart_info = list(MUTANT_INDEX_NAME = "Pair", MUTANT_INDEX_COLOR_LIST = list("#FFEEBB"))
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_TESTICLES
	aroused = AROUSAL_CANT
	genital_location = GROIN
	drop_when_organ_spilling = FALSE
	arousal_verb = "Твои яйца немного болят от переполненности"
	unarousal_verb = "Твои яйца наконец-то перестают болеть от переполненности"
	bodypart_overlay = /datum/bodypart_overlay/mutant/genital/testicles

/datum/bodypart_overlay/mutant/genital/testicles
	feature_key = ORGAN_SLOT_TESTICLES
	layers = EXTERNAL_ADJACENT | EXTERNAL_BEHIND

/datum/bodypart_overlay/mutant/genital/testicles/get_global_feature_list()
	return GLOB.sprite_accessories[ORGAN_SLOT_TESTICLES]

/obj/item/organ/external/genital/testicles/get_sprite_size_string()
	var/measured_size = FLOOR(genital_size,1)
	measured_size = clamp(measured_size, 0, 3)
	var/passed_string = "[genital_type]_[measured_size]"
	if(uses_skintones)
		passed_string += "_s"
	return passed_string

/obj/item/organ/external/genital/testicles/update_genital_icon_state()
	var/measured_size = clamp(genital_size, 1, 3)
	var/passed_string = "testicles_[genital_type]_[measured_size]"
	if(uses_skintones)
		passed_string += "_s"
	icon_state = passed_string

/obj/item/organ/external/genital/testicles/get_description_string(datum/sprite_accessory/genital/gas)
	if(genital_name == "Internal") //Checks if Testicles are of Internal Variety
		visibility_preference = GENITAL_SKIP_VISIBILITY //Removes visibility if yes.
	else
		return "Вы наблюдаете семенники [lowertext(balls_size_to_description(genital_size))] размера."

/obj/item/organ/external/genital/testicles/build_from_dna(datum/dna/DNA, associated_key)
	uses_skin_color = DNA.features["testicles_uses_skincolor"]
	set_size(DNA.features["balls_size"])

	return ..()

/obj/item/organ/external/genital/testicles/build_from_accessory(datum/sprite_accessory/genital/accessory, datum/dna/DNA)
	if(DNA.features["testicles_uses_skintones"])
		uses_skintones = accessory.has_skintone_shading

/obj/item/organ/external/genital/testicles/proc/balls_size_to_description(number)
	if(number < 0)
		number = 0
	var/returned = GLOB.balls_size_translation["[number]"]
	if(!returned)
		returned = BREAST_SIZE_BEYOND_MEASUREMENT
	return returned

/obj/item/organ/external/genital/testicles/proc/balls_description_to_size(cup)
	for(var/key in GLOB.balls_size_translation)
		if(GLOB.balls_size_translation[key] == cup)
			return text2num(key)
	return 0

/obj/item/organ/external/genital/testicles
	internal_fluid_datum = /datum/reagent/consumable/cum

/obj/item/organ/external/genital/testicles/build_from_dna(datum/dna/DNA, associated_key)
	. = ..()
	var/size = 0.5
	if(DNA.features["balls_size"] > 0)
		size = DNA.features["balls_size"]

	internal_fluid_maximum = size * 20

/datum/sprite_accessory/genital/testicles
	icon = 'modular_skyrat/master_files/icons/mob/sprite_accessory/genitals/testicles_onmob.dmi'
	organ_type = /obj/item/organ/external/genital/testicles
	associated_organ_slot = ORGAN_SLOT_TESTICLES
	key = ORGAN_SLOT_TESTICLES
	always_color_customizable = TRUE
	special_icon_case = TRUE
	special_x_dimension = TRUE
	default_color = DEFAULT_SKIN_OR_PRIMARY
	relevent_layers = list(BODY_ADJ_LAYER, BODY_BEHIND_LAYER)
	genetic = TRUE
	var/has_size = TRUE

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

/datum/sprite_accessory/genital/testicles/none
	icon_state = "none"
	name = "None"
	factual = FALSE
	color_src = null

/datum/sprite_accessory/genital/testicles/pair
	name = "Pair"
	icon_state = "pair"
	has_skintone_shading = TRUE

/datum/sprite_accessory/genital/testicles/internal
	name = "Internal"
	icon_state = "none"
	color_src = null
	has_size = FALSE
