/obj/item/organ/external/genital/breasts
	name = "breasts"
	desc = "Female milk producing organs."
	icon_state = "breasts"
	icon = 'modular_skyrat/master_files/icons/obj/genitals/breasts.dmi'
	genital_type = "pair"
	mutantpart_key = ORGAN_SLOT_BREASTS
	mutantpart_info = list(MUTANT_INDEX_NAME = "Pair", MUTANT_INDEX_COLOR_LIST = list("#FFEEBB"))
	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_BREASTS
	genital_location = CHEST
	drop_when_organ_spilling = FALSE
	var/lactates = FALSE
	arousal_verb = "Ваши соски становятся намного более чувствительными и твёрдыми"
	unarousal_verb = "Ваши соски больше не такие твёрдые и чувствительные"
	fluid_id = /datum/reagent/consumable/milk
	fluid_rate = MILK_RATE
	var/static/list/breast_values = list("a" =  1, "b" = 2, "c" = 3, "d" = 4, "e" = 5, "f" = 6, "g" = 7, "h" = 8, "i" = 9, "j" = 10, "k" = 11, "l" = 12, "m" = 13, "n" = 14, "o" = 15, "huge" = 16, "flat" = 0)
	bodypart_overlay = /datum/bodypart_overlay/mutant/genital/breasts

/datum/bodypart_overlay/mutant/genital/breasts
	feature_key = ORGAN_SLOT_BREASTS
	layers = EXTERNAL_FRONT | EXTERNAL_BEHIND

/obj/item/organ/external/genital/breasts/get_description_string(datum/sprite_accessory/genital/gas)
	var/returned_string = "Вы наблюдаете грудь. Кажется, там [lowertext(genital_name)] пары."
	var/size_description
	var/translation = breasts_size_to_cup(genital_size)
	switch(translation)
		if(BREAST_SIZE_FLATCHESTED)
			size_description = " Они очень маленькие и плоскогрудые, как жаль."
		if(BREAST_SIZE_BEYOND_MEASUREMENT)
			size_description = " Вы наблюдаете [pick("несколько серьезных сисяндр", "настоящий набор бадончиков", "огромную грудь", "пару гигантских бонхонагахугов", "пару хумонгус хунголомгхнонолоугус")]. Их объем уже превышает размер стандартной чашки, составляя примерно [genital_size * 5] сантиметров в диаметре."
		else
			size_description = " Они [translation] размера."
	returned_string += size_description
	if(aroused == AROUSAL_FULL)
		if(lactates)
			returned_string += " Соски выглядят твёрдыми и подтекают молочком."
		else
			returned_string += " Соски выглядят твёрдыми."
	return returned_string

/obj/item/organ/external/genital/breasts/update_genital_icon_state()
	var/max_size = 5
	var/current_size = FLOOR(genital_size, 1)
	if(current_size < 0)
		current_size = 0
	else if (current_size > max_size)
		current_size = max_size
	var/passed_string = "breasts_pair_[current_size]"
	if(uses_skintones)
		passed_string += "_s"
	icon_state = passed_string

/obj/item/organ/external/genital/breasts/get_sprite_size_string()
	var/max_size = 5
	if(genital_type == "pair")
		max_size = 16
	var/current_size = FLOOR(genital_size, 1)
	if(current_size < 0)
		current_size = 0
	else if (current_size > max_size)
		current_size = max_size
	var/passed_string = "[genital_type]_[current_size]"
	if(uses_skintones)
		passed_string += "_s"
	return passed_string

/obj/item/organ/external/genital/breasts/build_from_dna(datum/dna/DNA, associated_key)
	lactates = DNA.features["breasts_lactation"]
	uses_skin_color = DNA.features["breasts_uses_skincolor"]
	set_size(DNA.features["breasts_size"])

	return ..()

/obj/item/organ/external/genital/breasts/build_from_accessory(datum/sprite_accessory/genital/accessory, datum/dna/DNA)
	if(DNA.features["breasts_uses_skintones"])
		uses_skintones = accessory.has_skintone_shading

/datum/bodypart_overlay/mutant/genital/breasts/get_global_feature_list()
	return GLOB.sprite_accessories[ORGAN_SLOT_BREASTS]

/obj/item/organ/external/genital/breasts/proc/breasts_size_to_cup(number)
	if(number < 0)
		number = 0
	var/returned = GLOB.breast_size_translation["[number]"]
	if(!returned)
		returned = BREAST_SIZE_BEYOND_MEASUREMENT
	return returned

/obj/item/organ/external/genital/breasts/proc/breasts_cup_to_size(cup)
	for(var/key in GLOB.breast_size_translation)
		if(GLOB.breast_size_translation[key] == cup)
			return text2num(key)
	return 0

/obj/item/organ/external/genital/breasts
	internal_fluid_datum = /datum/reagent/consumable/breast_milk

/obj/item/organ/external/genital/breasts/build_from_dna(datum/dna/DNA, associated_key)
	. = ..()
	var/breasts_capacity = 0
	var/size = 0.5
	if(DNA.features["breasts_size"] > 0)
		size = DNA.features["breasts_size"]

	switch(genital_type)
		if("pair")
			breasts_capacity = 2
		if("quad")
			breasts_capacity = 3
		if("sextuple")
			breasts_capacity = 5
	internal_fluid_maximum = size * breasts_capacity * 60 // This seems like it could balloon drastically out of proportion with larger breast sizes.

/obj/item/organ/external/genital/breasts/Insert(mob/living/carbon/M, special, drop_if_replaced)
	. = ..()
	var/obj/item/organ/external/genital/womb/W = M.get_organ_slot(ORGAN_SLOT_WOMB)
	if(!W)
		return
	if(!W.impregnated)
		return

	fluid_rate *= 2

/obj/item/organ/external/genital/breasts/Remove(mob/living/carbon/M, special, moving)
	var/obj/item/organ/external/genital/womb/W = M.get_organ_slot(ORGAN_SLOT_WOMB)
	if(!W)
		return ..()
	if(!W.impregnated)
		return ..()

	fluid_rate *= 0.5
	. = ..()

/datum/sprite_accessory/genital/breasts
	icon = 'modular_skyrat/master_files/icons/mob/sprite_accessory/genitals/breasts_onmob.dmi'
	organ_type = /obj/item/organ/external/genital/breasts
	associated_organ_slot = ORGAN_SLOT_BREASTS
	key = ORGAN_SLOT_BREASTS
	always_color_customizable = TRUE
	default_color = DEFAULT_SKIN_OR_PRIMARY
	relevent_layers = list(BODY_BEHIND_LAYER, BODY_FRONT_LAYER)
	has_skintone_shading = TRUE
	genital_location = CHEST
	genetic = TRUE

/datum/sprite_accessory/genital/breasts/none
	icon_state = "none"
	name = "None"
	factual = FALSE
	color_src = null

/datum/sprite_accessory/genital/breasts/pair
	icon_state = "pair"
	name = "Pair"

/datum/sprite_accessory/genital/breasts/quad
	icon_state = "quad"
	name = "Quad"

/datum/sprite_accessory/genital/breasts/sextuple
	icon_state = "sextuple"
	name = "Sextuple"
