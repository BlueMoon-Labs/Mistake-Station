/obj/item/organ/external/genital/belly
	name = "belly"
	desc = "You see a belly on their midsection."
	icon_state = "breasts_sextuple_e_s"
	icon = 'icons/obj/genitals/breasts.dmi'
	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_BELLY
	mutantpart_key = ORGAN_SLOT_BELLY
	mutantpart_info	= list(MUTANT_INDEX_NAME = "None", MUTANT_INDEX_COLOR_LIST = list("FFEEBB"))
	drop_when_organ_spilling = FALSE
	genital_size = 0
	genital_type = "pair"
	bodypart_overlay = /datum/bodypart_overlay/mutant/genital/belly
	visibility_preference = UPDATE_OWNER_APPEARANCE | GENITAL_UNDIES_HIDDEN | CAN_CUM_INTO | HAS_EQUIPMENT
	var/size_cached			= 0
	var/prev_size 			//former size value, to allow update_size() to early return should be there no significant changes.
	var/sent_full_message	= TRUE //defaults to 1 since they're full to start
	var/size_name 			= "flat"
	var/statuscheck			= FALSE
	layer_index 			= BELLY_LAYER_INDEX

/datum/bodypart_overlay/mutant/genital/belly
	feature_key = ORGAN_SLOT_BELLY
	layers = EXTERNAL_FRONT | EXTERNAL_BEHIND

/datum/bodypart_overlay/mutant/genital/belly/get_global_feature_list()
	return GLOB.sprite_accessories[ORGAN_SLOT_BELLY]

/obj/item/organ/external/genital/belly/get_sprite_size_string()
	var/measured_size = FLOOR(genital_size,1)
	measured_size = clamp(measured_size, 0, 10)
	var/passed_string = "[genital_type]_[measured_size]"
	if(uses_skintones)
		passed_string += "_s"
	return passed_string

/obj/item/organ/external/genital/belly/update_genital_icon_state()
	var/measured_size = clamp(genital_size, 1, 10)
	var/passed_string = "belly_pair_[measured_size]"
	if(uses_skintones)
		passed_string += "_s"
	icon_state = passed_string

/obj/item/organ/external/genital/belly/get_description_string(datum/sprite_accessory/genital/gas)
	var/returned_string = "Вы наблюдаете живот. Кажется, он [lowertext(genital_size)] размера."

	switch(round(genital_size))
		if(1)
			size_name = "среднего"
		if(2)
			size_name = "большого"
		if(3)
			size_name = "сжимательного"
		if(4)
			size_name = "крупного"
		if(5)
			size_name = pick("массивного", "особо крупного")
		if(6)
			size_name = pick("гигантского", "крупнопузырчатого", "огромного")
		if(7 to BELLY_SIZE_MAX)
			size_name = pick("абсолютно огромного", "невероятно гигантского", "THAT'S ULTRA THICC")
		else
			size_name = "плоского"

	returned_string = "Вы наблюдаете животик [size_name] размера. [round(genital_size) >= 4 ? "Он подпрыгивает и булькает от того, что [owner] идёт." : "Животик плотно 'сидит' на своём месте."]."

	return returned_string

/obj/item/organ/external/genital/belly/on_life()
	if(QDELETED(src))
		return
	if(!owner)
		return

/obj/item/organ/external/genital/belly/modify_size(modifier, min = -INFINITY, max = BELLY_SIZE_MAX)
	var/new_value = clamp(size_cached + modifier, min, max)
	if(new_value == size_cached)
		return
	prev_size = size_cached
	size_cached = new_value
	genital_size = round(size_cached)
	update()
	..()

/obj/item/organ/external/genital/belly/build_from_dna(mob/living/carbon/human/H)
	. = ..()
	var/datum/dna/D = H.dna
	if(D.species.use_skintones && D.features["belly_uses_skintones"])
		color = SKINTONE2HEX(H.skin_tone)
	else
		color = "#[D.features["belly_color"]]"
	genital_size = D.features["belly_size"]
	prev_size = genital_size
	size_cached = genital_size
	original_fluid_id = fluid_id
	fluid_max_volume += ((genital_size - initial(genital_size))*2.5)*(owner ? get_size(owner) : 1)
	fluid_rate += ((genital_size - initial(genital_size))/10)*(owner ? get_size(owner) : 1)
	toggle_visibility(D.features["belly_visibility"], FALSE)
	if(D.features["belly_stuffing"])
		toggle_visibility(GEN_ALLOW_EGG_STUFFING, FALSE)

/obj/item/organ/external/genital/belly/climax_modify_size(mob/living/partner, obj/item/organ/external/genital/source_gen, cum_hole)
	if(!(owner.client?.prefs?.read_preference(/datum/preference/toggle/erp/belly_enlargement)))
		if(owner.has_anus(REQUIRE_EXPOSED) && (cum_hole == CUM_TARGET_ANUS) && (owner.client?.prefs?.read_preference(/datum/preference/toggle/erp/butt_enlargement)))
			var/obj/item/organ/external/genital/butt/ass = owner.get_organ_slot(ORGAN_SLOT_BUTT)
			if(!ass)
				ass = new
				ass.Insert(owner)
			ass.climax_modify_size(partner, source_gen)
		return

	var/datum/reagents/fluid_source = source_gen.climaxable()
	if(!fluid_source)
		return

	if(!climax_fluids)
		climax_fluids = new
		climax_fluids.maximum_volume = INFINITY

	source_gen.generate_fluid(fluid_source)
	fluid_source.trans_to(climax_fluids, fluid_source.total_volume)

	if(climax_fluids.total_volume >= fluid_max_volume * GENITAL_INFLATION_THRESHOLD)
		var/previous = genital_size
		var/growth_amount = climax_fluids.total_volume / (fluid_max_volume * GENITAL_INFLATION_THRESHOLD)
		modify_size(growth_amount)
		if(genital_size > round(previous))
			owner.visible_message("<span class='lewd'>\The Животик <b>[owner]</b> становится совсем выпуклым и раздувается от наполнения [pick("сладкой", "желанной")] '[lowertext(source_gen.get_fluid_name())]'!</span>", ignored_mobs = owner.get_unconsenting())
			fluid_id = source_gen.get_fluid_id()
		if((growth_amount >= 3 || genital_size >= 3) && (owner.client?.prefs?.read_preference(/datum/preference/toggle/erp/butt_enlargement)))
			var/obj/item/organ/external/genital/butt/ass = owner.get_organ_slot(ORGAN_SLOT_BUTT)
			if(!ass)
				ass = new
				ass.Insert(owner)
			ass.climax_modify_size(partner, source_gen, TRUE)
		climax_fluids.clear_reagents()

/datum/sprite_accessory/genital/belly
	icon = 'modular_splurt/icons/obj/genitals/belly_onmob.dmi'
	organ_type = /obj/item/organ/external/genital/belly
	icon_state = "belly"
	name = "belly"
	color_src = USE_ONE_COLOR
	default_color = DEFAULT_SKIN_OR_PRIMARY
	relevent_layers = list(BODY_BEHIND_LAYER, BODY_FRONT_LAYER)
	associated_organ_slot = ORGAN_SLOT_BELLY
	key = ORGAN_SLOT_BELLY
	genetic = TRUE

/datum/sprite_accessory/genital/belly/none

	icon_state = "none"
	name = "None"
	factual = FALSE
	color_src = null

/datum/sprite_accessory/genital/belly/pair
	icon_state = "pair"
	name = "pair"
