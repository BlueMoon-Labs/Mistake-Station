/obj/item/organ/external/genital/butt
	name 					= "butt"
	desc 					= "You see a pair of asscheeks."
	icon 					= 'icons/obj/genitals/butt.dmi'
	icon_state 				= "butt"
	zone 					= BODY_ZONE_PRECISE_GROIN
	slot 					= ORGAN_SLOT_BUTT
	mutantpart_key 			= ORGAN_SLOT_BUTT
	mutantpart_info			= list(MUTANT_INDEX_NAME = "Normal", MUTANT_INDEX_COLOR_LIST = list("FEB"))
	w_class 				= 3
	size 					= 0
	var/size_name			= "nonexistent"
	shape					= "Pair" //turn this into a default constant if for some inexplicable reason we get more than one butt type but I doubt it.
	genital_flags 			= UPDATE_OWNER_APPEARANCE|GENITAL_UNDIES_HIDDEN|CAN_CUM_INTO|HAS_EQUIPMENT
	masturbation_verb 		= "massage"
	var/size_cached			= 0
	var/prev_size 			//former size value, to allow update_size() to early return should be there no significant changes.
	layer_index 			= BUTT_LAYER_INDEX
	bodypart_overlay		= /datum/bodypart_overlay/mutant/genital/anus

/datum/bodypart_overlay/mutant/genital/butt
	feature_key = ORGAN_SLOT_BUTT
	layers = EXTERNAL_FRONT | EXTERNAL_BEHIND

/datum/bodypart_overlay/mutant/genital/butt/get_global_feature_list()
	return GLOB.sprite_accessories[ORGAN_SLOT_BUTT]

/obj/item/organ/external/genital/butt/modify_size(modifier, min = -INFINITY, max = BUTT_SIZE_MAX)
	var/new_value = clamp(size_cached + modifier, min, max)
	if(new_value == size_cached)
		return
	prev_size = size_cached
	size_cached = new_value
	size = round(size_cached)
	update()
	..()

/obj/item/organ/external/genital/butt/update_size()//wah
	var/rounded_size = round(size)
	if(size < 0)//I don't actually know what round() does to negative numbers, so to be safe!!fixed
		if(owner)
			to_chat(owner, "<span class='warning'>Вы чувствуете, как ваши ягодицы уменьшаются до обычного размера.</span>")
		QDEL_IN(src, 1)
		return

	if(owner) //Because byond doesn't count from 0, I have to do this.
		var/mob/living/carbon/human/H = owner
		var/r_prev_size = round(prev_size)
		if (rounded_size > r_prev_size)
			to_chat(H, "<span class='warning'>Ваши ягодицы начинают [pick("разбухать до", "расцветать до", "расширяться до", "пухнуть до", "расти с нетерпением до", "увеличиваться до")] большего размера.</span>")
		else if (rounded_size < r_prev_size)
			to_chat(H, "<span class='warning'>Ваши ягодицы начинают [pick("уменьшаться до", "сдуваться до", "колебаться до", "сокращаться до", "сморщиваться с сожалением до", "сдуваться до")] меньшего размера.</span>")


/obj/item/organ/external/genital/butt/update_appearance()
	var/lowershape = lowertext(shape)

	//Reflect the size of dat ass on examine.
	switch(round(size))
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

	desc = "Вы наблюдаете попу [size_name] размера."

	var/icon_size = size
	icon_state = "butt_[lowershape]_[icon_size]"
	if(owner)
		if(owner.dna.species.use_skintones && owner.dna.features["genitals_use_skintone"])
			if(ishuman(owner)) // Check before recasting type, although someone fucked up if you're not human AND have use_skintones somehow...
				var/mob/living/carbon/human/H = owner // only human mobs have skin_tone, which we need.
				color = SKINTONE2HEX(H.skin_tone)
				if(!H.dna.skin_tone_override)
					icon_state += "_s"
		else
			color = "#[owner.dna.features["butt_color"]]"
	return ..()

/obj/item/organ/external/genital/butt/get_features(mob/living/carbon/human/H)
	var/datum/dna/D = H.dna
	if(D.species.use_skintones && D.features["genitals_use_skintone"])
		color = SKINTONE2HEX(H.skin_tone)
	else
		color = "#[D.features["butt_color"]]"
	size = D.features["butt_size"]
	prev_size = size
	size_cached = size
	toggle_visibility(D.features["butt_visibility"], FALSE)
	if(D.features["butt_stuffing"])
		toggle_visibility(GEN_ALLOW_EGG_STUFFING, FALSE)

/obj/item/organ/external/genital/butt
	linked_organ_slot = ORGAN_SLOT_ANUS

/obj/item/organ/external/genital/butt/update_size()
	if(!linked_organ)
		return ..()

	linked_organ.size = size
	linked_organ.update()
	if(size < 0)
		QDEL_IN(linked_organ, 1)
	. = ..()

/obj/item/organ/external/genital/butt/toggle_visibility(visibility, update)
	. = ..()
	var/obj/item/organ/external/genital/anus/butthole = linked_organ
	if(!butthole?.is_exposed() || is_exposed())
		return .
	linked_organ.toggle_visibility(visibility)

/obj/item/organ/external/genital/butt/get_features(mob/living/carbon/human/H)
	. = ..()
	original_fluid_id = fluid_id
	fluid_max_volume += ((size - initial(size))*2.5)*(owner ? get_size(owner) : 1)
	fluid_rate += ((size - initial(size))/10)*(owner ? get_size(owner) : 1)

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
		var/previous = size
		var/growth_amount = (from_belly ? min(climax_fluids.total_volume, 1) : climax_fluids.total_volume)
		var/list/asscheeks = list("попка", "ягодицы", "булочки", "подушечки", "шары Дамптрака", "[pick(list("покачивающиеся", "непоседливые", "шатающиеся"))] ягодицы")
		modify_size(growth_amount)
		if(size != previous)
			owner.visible_message("<span class='lewd'>\The [pick(GLOB.butt_nouns + asscheeks)] <b>[owner]</b> непристойно отскакивают наружу, как [owner.ru_who()] накачивают [lowertext(source_gen.get_fluid_name())] сзади!</span>", ignored_mobs = owner.get_unconsenting())
			fluid_id = source_gen.get_fluid_id()
		climax_fluids.clear_reagents()

/datum/sprite_accessory/genital/butt
	icon = 'modular_splurt/icons/obj/genitals/butt_onmob.dmi'
	organ_type = /obj/item/organ/external/genital/butt
	icon_state = "butt"
	color_src = "butt_color"
	key = ORGAN_SLOT_BUTT
	relevent_layers = list(BODY_BEHIND_LAYER, BODY_FRONT_LAYER)
	always_color_customizable = TRUE

/datum/sprite_accessory/genital/butt/none
	icon_state = "none"
	name = "None"
	factual = FALSE
	color_src = null

/datum/sprite_accessory/genital/butt/pair
	icon_state = "pair"
	name = "pair"
