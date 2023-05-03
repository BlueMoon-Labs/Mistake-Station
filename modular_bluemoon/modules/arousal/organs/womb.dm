/obj/item/organ/external/genital/womb
	name = "womb"
	desc = "A female reproductive organ."
	icon = 'icons/obj/genitals/vagina.dmi'
	icon_state = "womb"
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_WOMB
	mutantpart_key = ORGAN_SLOT_WOMB
	mutantpart_info = list(MUTANT_INDEX_NAME = "Normal", MUTANT_INDEX_COLOR_LIST = list("FFEEBB"))
	genital_flags = GENITAL_INTERNAL|GENITAL_FLUID_PRODUCTION|HAS_EQUIPMENT
	fluid_id = /datum/reagent/consumable/semen/femcum
	linked_organ_slot = ORGAN_SLOT_VAGINA
	bodypart_overlay = /datum/bodypart_overlay/mutant/genital/womb

/datum/bodypart_overlay/mutant/genital/womb
	feature_key = ORGAN_SLOT_WOMB
	layers = NONE

/datum/bodypart_overlay/mutant/genital/womb/get_global_feature_list()
	return GLOB.sprite_accessories[ORGAN_SLOT_WOMB]

/obj/item/organ/external/genital/womb/get_features(mob/living/carbon/human/H)
	var/datum/dna/D = H.dna
	if(D.features["inert_eggs"])
		AddComponent(/datum/component/ovipositor)

/obj/item/organ/external/genital/womb
	default_fluid_id = /datum/reagent/consumable/semen/femcum

/obj/item/organ/external/genital/womb/get_features(mob/living/carbon/human/H)
	var/datum/dna/D = H.dna
	if(D.features["womb_fluid"])
		var/datum/reagent/fluid = find_reagent_object_from_type(D.features["womb_fluid"])
		if(istype(fluid, /datum/reagent/blood))
			fluid_id = H.get_blood_id()
		if(fluid && ((fluid in GLOB.genital_fluids_list) || istype(fluid, H.get_blood_id())))
			fluid_id = D.features["womb_fluid"]
	else
		fluid_id = initial(fluid_id)
	original_fluid_id = fluid_id
	. = ..()

/datum/sprite_accessory/genital/womb
	organ_type = /obj/item/organ/external/genital/womb
	key = ORGAN_SLOT_WOMB
	genetic = TRUE
	always_color_customizable = TRUE

/datum/sprite_accessory/genital/womb/none
	icon_state = "none"
	name = "None"
	factual = FALSE
	color_src = null

/datum/sprite_accessory/genital/womb/normal
	icon_state = "none"
	name = "normal"
	color_src = null
