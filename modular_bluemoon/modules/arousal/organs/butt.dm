#define BUTT_LAYER_OFFSET 5

/obj/item/organ/external/genital/butt
	name 						= "butt"
	desc 						= "You see a pair of asscheeks."
	icon 						= 'icons/obj/genitals/butt.dmi'
	icon_state 					= "butt_pair_1"
	zone 						= BODY_ZONE_PRECISE_GROIN
	slot 						= ORGAN_SLOT_BUTT
	mutantpart_key 				= ORGAN_SLOT_BUTT
	mutantpart_info				= list(MUTANT_INDEX_NAME = "Pair", MUTANT_INDEX_COLOR_LIST = list("#FFEEBB"))
	w_class 					= 3
	genital_size 				= 0
	var/size_name				= "nonexistent"
	genital_type				= "Pair" //turn this into a default constant if for some inexplicable reason we get more than one butt type but I doubt it.
	genital_flags 				= UPDATE_OWNER_APPEARANCE|GENITAL_UNDIES_HIDDEN|CAN_CUM_INTO|HAS_EQUIPMENT
	masturbation_verb 			= "massage"
	var/size_cached				= 0
	var/prev_size 				//former size value, to allow update_size() to early return should be there no significant changes.
	layer_index 				= BREASTS_LAYER_INDEX
	linked_organ_slot			= ORGAN_SLOT_ANUS
	bodypart_overlay			= /datum/bodypart_overlay/mutant/genital/butt

/datum/bodypart_overlay/mutant/genital/butt
	feature_key = ORGAN_SLOT_BUTT
	layers = EXTERNAL_FRONT|EXTERNAL_BEHIND

/datum/bodypart_overlay/mutant/genital/butt/get_global_feature_list()
	return GLOB.sprite_accessories[ORGAN_SLOT_BUTT]

/datum/bodypart_overlay/mutant/genital/butt/get_images(image_layer, obj/item/bodypart/limb)
	var/list/mutable_appearance/returned_overlays = ..()

	for(var/mutable_appearance/overlay in returned_overlays)
		overlay.layer -= BUTT_LAYER_OFFSET

	return returned_overlays

/obj/item/organ/external/genital/butt/update_genital_icon_state()
	var/measured_size = clamp(genital_size, 1, 10)
	var/passed_string = "butt_pair_[measured_size]"
	if(uses_skintones)
		passed_string += "_s"
	icon_state = passed_string

/obj/item/organ/external/genital/butt/get_sprite_size_string()
	var/measured_size = FLOOR(genital_size,1)
	measured_size = clamp(measured_size, 0, 8)
	var/passed_string = "[genital_type]_[measured_size]"
	if(uses_skintones)
		passed_string += "_s"
	return passed_string

/obj/item/organ/external/genital/butt/get_description_string(datum/sprite_accessory/genital/gas)
	var/returned_string = "Вы наблюдаете сочную попку. Кажется, она [lowertext(genital_size)] размера."

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
		if(7)
			size_name = pick("непостижимо большого", "экстремального")
		if(8)
			size_name = pick("абсолютно огромного", "невероятно гигантского", "THAT'S ULTRA THICC")
		else
			size_name = "плоского"

	returned_string = "Вы наблюдаете сочную попку. Кажется, она [size_name] размера."

	return returned_string

/obj/item/organ/external/genital/butt/build_from_dna(datum/dna/DNA, associated_key)
	uses_skin_color = DNA.features["butt_uses_skincolor"]
	set_size(DNA.features["butt_size"])
	toggle_visibility(DNA.features["butt_visibility"], FALSE)
	if(DNA.features["butt_stuffing"])
		toggle_visibility(GEN_ALLOW_EGG_STUFFING, FALSE)

	return ..()

/obj/item/organ/external/genital/butt/build_from_accessory(datum/sprite_accessory/genital/accessory, datum/dna/DNA, mob/living/carbon/human/H)
	if(DNA.features["butt_uses_skintones"])
		uses_skintones = accessory.has_skintone_shading
	. = ..()
	original_fluid_id = fluid_id
	fluid_max_volume += ((genital_size - initial(genital_size))*2.5)*(owner ? get_size(owner) : 1)
	fluid_rate += ((genital_size - initial(genital_size))/10)*(owner ? get_size(owner) : 1)

/obj/item/organ/external/genital/butt/modify_size(modifier, min = -INFINITY, max = BUTT_SIZE_MAX)
	var/new_value = clamp(size_cached + modifier, min, max)
	if(new_value == size_cached)
		return
	prev_size = size_cached
	size_cached = new_value
	genital_size = round(size_cached)
	update()
	..()

/obj/item/organ/external/genital/butt/build_from_dna()
	if(!linked_organ)
		return ..()

	linked_organ.genital_size = genital_size
	linked_organ.update()
	if(genital_size < 0)
		QDEL_IN(linked_organ, 1)
	. = ..()

/obj/item/organ/external/genital/butt/toggle_visibility(visibility, update)
	. = ..()
	var/obj/item/organ/external/genital/anus/butthole = linked_organ
	if(!butthole?.is_exposed() || is_exposed())
		return .
	linked_organ.toggle_visibility(visibility)

/obj/item/organ/external/genital/butt/climax_modify_size(mob/living/partner, obj/item/organ/external/genital/source_gen, from_belly = FALSE)
	if(!(owner.client?.prefs?.read_preference(/datum/preference/toggle/erp/butt_enlargement)))
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
		var/growth_amount = (from_belly ? min(climax_fluids.total_volume, 1) : climax_fluids.total_volume)
		var/list/asscheeks = list("попка", "ягодицы", "булочки", "подушечки", "шары Дамптрака", "[pick(list("покачивающиеся", "непоседливые", "шатающиеся"))] ягодицы")
		modify_size(growth_amount)
		if(genital_size != previous)
			owner.visible_message("<span class='lewd'>\The [pick(GLOB.butt_nouns + asscheeks)] <b>[owner]</b> непристойно отскакивают наружу, как [owner.ru_who()] накачивают [lowertext(source_gen.get_fluid_name())] сзади!</span>", ignored_mobs = owner.get_unconsenting())
			fluid_id = source_gen.get_fluid_id()
		climax_fluids.clear_reagents()

/datum/sprite_accessory/genital/butt
	icon = 'modular_splurt/icons/obj/genitals/butt_onmob.dmi'
	organ_type = /obj/item/organ/external/genital/butt
	associated_organ_slot = ORGAN_SLOT_BUTT
	key = ORGAN_SLOT_BUTT
	always_color_customizable = TRUE
	default_color = DEFAULT_SKIN_OR_PRIMARY
	relevent_layers = list(BODY_FRONT_LAYER, BODY_FRONT_LAYER)
	has_skintone_shading = TRUE
	genital_location = GROIN
	genetic = TRUE

/datum/sprite_accessory/genital/butt/none
	icon_state = "none"
	name = "None"
	factual = FALSE
	color_src = null

/datum/sprite_accessory/genital/butt/pair
	icon_state = "pair"
	name = "Pair"
