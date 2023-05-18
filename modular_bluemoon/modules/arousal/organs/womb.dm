/obj/item/organ/external/genital/womb
	name = "womb"
	desc = "A female reproductive organ."
	icon = 'modular_skyrat/master_files/icons/obj/genitals/vagina.dmi'
	icon_state = "womb"
	mutantpart_key = ORGAN_SLOT_WOMB
	mutantpart_info = list(MUTANT_INDEX_NAME = "Normal", MUTANT_INDEX_COLOR_LIST = list("FFEEBB"))
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_WOMB
	visibility_preference = GENITAL_SKIP_VISIBILITY
	aroused = AROUSAL_CANT
	genital_location = GROIN
	drop_when_organ_spilling = FALSE
	bodypart_overlay = /datum/bodypart_overlay/mutant/genital/womb

/datum/bodypart_overlay/mutant/genital/womb
	feature_key = ORGAN_SLOT_WOMB
	layers = NONE

/datum/bodypart_overlay/mutant/genital/womb/get_global_feature_list()
	return GLOB.sprite_accessories[ORGAN_SLOT_WOMB]

/datum/sprite_accessory/genital/womb
	organ_type = /obj/item/organ/external/genital/womb
	associated_organ_slot = ORGAN_SLOT_WOMB
	key = ORGAN_SLOT_WOMB
	genetic = TRUE

/datum/sprite_accessory/genital/womb/none
	icon_state = "none"
	name = "None"
	factual = FALSE
	color_src = null

/datum/sprite_accessory/genital/womb/normal
	icon_state = "none"
	name = "Normal"
	color_src = null
