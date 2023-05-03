/obj/item/organ/external/genital/testicles
	name = "testicles"
	desc = "A male reproductive organ."
	icon_state = "testicles"
	icon = 'icons/obj/genitals/testicles.dmi'
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_TESTICLES
	size = BALLS_SIZE_MIN
	mutantpart_key = ORGAN_SLOT_TESTICLES
	mutantpart_info = list(MUTANT_INDEX_NAME = "Pair", MUTANT_INDEX_COLOR_LIST = list("#FFEEBB"))
	arousal_verb = "Твои яйца немного болят от переполненности"
	unarousal_verb = "Твои яйца наконец-то перестают болеть от переполненности"
	linked_organ_slot = ORGAN_SLOT_PENIS
	genital_flags = CAN_MASTURBATE_WITH|MASTURBATE_LINKED_ORGAN|GENITAL_FLUID_PRODUCTION|UPDATE_OWNER_APPEARANCE|GENITAL_UNDIES_HIDDEN|CAN_CUM_INTO|HAS_EQUIPMENT
	var/size_name = "average"
	shape = DEF_BALLS_SHAPE
	fluid_id = /datum/reagent/consumable/semen
	masturbation_verb = "massage"
	layer_index = TESTICLES_LAYER_INDEX
	bodypart_overlay = /datum/bodypart_overlay/mutant/genital/testicles

/datum/bodypart_overlay/mutant/genital/testicles
	feature_key = ORGAN_SLOT_TESTICLES
	layers = EXTERNAL_ADJACENT | EXTERNAL_BEHIND

/datum/bodypart_overlay/mutant/genital/testicles/get_global_feature_list()
	return GLOB.sprite_accessories[ORGAN_SLOT_TESTICLES]

/obj/item/organ/external/genital/testicles/build_from_accessory(datum/sprite_accessory/genital/accessory, datum/dna/DNA)
	if(DNA.features["testicles_uses_skintones"])
		uses_skintones = accessory.has_skintone_shading

/obj/item/organ/external/genital/testicles/generate_fluid()
	if(!linked_organ && !update_link())
		return FALSE
	return ..()
	// in memoriam "Your balls finally feel full, again." ??-2020

/obj/item/organ/external/genital/testicles/upon_link()
	size = linked_organ.size
	update_size()
	update_appearance()

/obj/item/organ/external/genital/testicles/proc/balls_description_to_size(cup)
	for(var/key in GLOB.balls_size_translation)
		if(GLOB.balls_size_translation[key] == cup)
			return text2num(key)
	return 0

/obj/item/organ/external/genital/testicles/update_size(modified = FALSE)
	switch(size)
		if(BALLS_SIZE_MIN)
			size_name = "среднего"
		if(BALLS_SIZE_DEF)
			size_name = "большого"
		if(BALLS_SIZE_2)
			size_name = "сжимательного"
		if(BALLS_SIZE_3)
			size_name = "массивного"
		if(BALLS_SIZE_MAX)
			size_name = pick(list("гигантского", "экстремального", "невероятного", "абсолютно огромного"))
		else
			size_name = "плоского"

/obj/item/organ/external/genital/testicles/update_appearance()
	. = ..()
	desc = "Вы наблюдаете два семенника [size_name] размера."
	var/datum/sprite_accessory/S = GLOB.balls_shapes_list[shape]
	var/icon_shape = S ? S.icon_state : "single"
	icon_state = "testicles_[icon_shape]_[size]"
	if(owner)
		if(owner.dna.species.use_skintones && owner.dna.features["genitals_use_skintone"])
			if(ishuman(owner)) // Check before recasting type, although someone fucked up if you're not human AND have use_skintones somehow...
				var/mob/living/carbon/human/H = owner // only human mobs have skin_tone, which we need.
				color = SKINTONE2HEX(H.skin_tone)
				if(!H.dna.skin_tone_override)
					icon_state += "_s"
		else
			color = "#[owner.dna.features["balls_color"]]"

/obj/item/organ/external/genital/testicles/get_features(mob/living/carbon/human/H)
	var/datum/dna/D = H.dna
	if(D.species.use_skintones && D.features["genitals_use_skintone"])
		color = SKINTONE2HEX(H.skin_tone)
	else
		color = "#[D.features["balls_color"]]"
	shape = D.features["balls_shape"]
	fluid_rate = D.features["balls_cum_rate"]
	fluid_mult = D.features["balls_cum_mult"]
	fluid_efficiency = D.features["balls_efficiency"]
	toggle_visibility(D.features["balls_visibility"], FALSE)
	if(D.features["balls_stuffing"])
		toggle_visibility(GEN_ALLOW_EGG_STUFFING, FALSE)
	if(D.features["inert_eggs"])
		AddComponent(/datum/component/ovipositor)

/obj/item/organ/external/genital/testicles
	default_fluid_id = /datum/reagent/consumable/semen

/obj/item/organ/external/genital/testicles/get_features(mob/living/carbon/human/H)
	var/datum/dna/D = H.dna
	if(D.features["balls_fluid"])
		var/datum/reagent/fluid = find_reagent_object_from_type(D.features["balls_fluid"])
		if(istype(fluid, /datum/reagent/blood))
			fluid_id = H.get_blood_id()
		if(fluid && ((fluid in GLOB.genital_fluids_list) || istype(fluid, H.get_blood_id())))
			fluid_id = D.features["balls_fluid"]
	else
		fluid_id = initial(fluid_id)
	original_fluid_id = fluid_id
	. = ..()

/datum/sprite_accessory/genital/testicles
	icon = 'icons/obj/genitals/testicles_onmob.dmi'
	icon_state = "testicle"
	color_src = "balls_color"
	key = ORGAN_SLOT_TESTICLES
	always_color_customizable = TRUE
	organ_type = /obj/item/organ/external/genital/testicles

/datum/sprite_accessory/genital/testicles/none
	icon_state = "none"
	name = "None"
	factual = FALSE
	color_src = null

/datum/sprite_accessory/genital/testicles/single
	icon_state = "single"
	name = "single"
	has_skintone_shading = TRUE

/datum/sprite_accessory/genital/testicles/hidden
	icon_state = "hidden"
	name = "hidden"

/datum/sprite_accessory/genital/testicles/sheath
	icon_state = "sheath"
	name = "sheath"
