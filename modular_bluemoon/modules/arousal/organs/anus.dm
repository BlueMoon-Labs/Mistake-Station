/obj/item/organ/external/genital/anus
	name = "anus"
	desc = "What do you want me to tell you?"
	icon = 'modular_skyrat/master_files/icons/obj/genitals/anus.dmi'
	icon_state = "anus"
	mutantpart_key = ORGAN_SLOT_ANUS
	mutantpart_info = list(MUTANT_INDEX_NAME = "Normal", MUTANT_INDEX_COLOR_LIST = list("FEB"))
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_ANUS
	genital_location = GROIN
	drop_when_organ_spilling = FALSE
	bodypart_overlay = /datum/bodypart_overlay/mutant/genital/anus

/datum/bodypart_overlay/mutant/genital/anus
	feature_key = ORGAN_SLOT_ANUS
	layers = NONE

/obj/item/organ/external/genital/anus/get_description_string(datum/sprite_accessory/genital/gas)
	var/returned_string = "You see an [lowertext(genital_name)]."
	if(aroused == AROUSAL_PARTIAL)
		returned_string += " It looks tight."
	if(aroused == AROUSAL_FULL)
		returned_string += " It looks very tight."
	return returned_string

/datum/bodypart_overlay/mutant/genital/anus/get_global_feature_list()
	return GLOB.sprite_accessories[ORGAN_SLOT_ANUS]

/datum/sprite_accessory/genital/anus
	organ_type = /obj/item/organ/external/genital/anus
	associated_organ_slot = ORGAN_SLOT_ANUS
	key = ORGAN_SLOT_ANUS
	genetic = TRUE

/datum/sprite_accessory/genital/anus/none
	icon_state = "none"
	name = "None"
	factual = FALSE
	color_src = null

/datum/sprite_accessory/genital/anus/normal
	icon_state = "anus"
	name = "Anus"
	color_src = null
