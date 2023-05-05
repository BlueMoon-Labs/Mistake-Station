#define BREASTS_ICON_MIN_SIZE 1
#define BREASTS_ICON_MAX_SIZE 6

/obj/item/organ/external/genital/breasts
	name = "breasts"
	desc = "Female milk producing organs."
	icon_state = "breasts"
	icon = 'icons/obj/genitals/breasts.dmi'
	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_BREASTS
	mutantpart_key = ORGAN_SLOT_BREASTS
	mutantpart_info = list(MUTANT_INDEX_NAME = "Pair", MUTANT_INDEX_COLOR_LIST = list("#FFEEBB"))
	size = BREASTS_SIZE_DEF // "c". Refer to the breast_values static list below for the cups associated number values
	fluid_id = /datum/reagent/consumable/milk
	fluid_rate = MILK_RATE
	shape = DEF_BREASTS_SHAPE
	genital_flags = CAN_MASTURBATE_WITH|CAN_CLIMAX_WITH|GENITAL_FLUID_PRODUCTION|GENITAL_CAN_AROUSE|UPDATE_OWNER_APPEARANCE|GENITAL_UNDIES_HIDDEN|CAN_CUM_INTO|HAS_EQUIPMENT
	masturbation_verb = "massage"
	arousal_verb = "Ваши соски становятся намного более чувствительными и твёрдыми"
	unarousal_verb = "Ваши соски больше не такие твёрдые и чувствительные"
	orgasm_verb = "leaking"
	fluid_transfer_factor = 0.5
	layer_index = BREASTS_LAYER_INDEX
	var/lactates = FALSE
	var/static/list/breast_values = list("a" =  1, "b" = 2, "c" = 3, "d" = 4, "e" = 5, "f" = 6, "g" = 7, "h" = 8, "i" = 9, "j" = 10, "k" = 11, "l" = 12, "m" = 13, "n" = 14, "o" = 15, "huge" = 16, "massive" = 17, "giga" = 25, "impossible" = 30, "flat" = 0)
	var/cached_size //these two vars pertain size modifications and so should be expressed in NUMBERS.
	var/prev_size //former cached_size value, to allow update_size() to early return should be there no significant changes.
	bodypart_overlay = /datum/bodypart_overlay/mutant/genital/breasts

/datum/bodypart_overlay/mutant/genital/breasts
	feature_key = ORGAN_SLOT_BREASTS
	layers = EXTERNAL_FRONT | EXTERNAL_BEHIND

/obj/item/organ/external/genital/breasts/build_from_accessory(datum/sprite_accessory/genital/accessory, datum/dna/DNA)
	if(DNA.features["genitals_use_skintone"])
		uses_skintones = accessory.has_skintone_shading

/obj/item/organ/external/genital/breasts/Initialize(mapload, do_update = TRUE)
	if(do_update)
		cached_size = breast_values[size]
		prev_size = cached_size
	return ..()

/obj/item/organ/external/genital/breasts/update_appearance()
	. = ..()
	var/lowershape = lowertext(shape)
	switch(lowershape)
		if("pair")
			desc = "Вы видите грудь с двумя сосками."
		if("quad")
			desc = "Вы видите две груди с двумя парами сосков, одна прямо под другой.."
		if("sextuple")
			desc = "Вы видите три группы груди с тремя парами сосков, идущих от груди к животу."
		else
			desc = "Перед своими глазами вы наблюдаете довольно экзотичную грудь."
	if(size == "huge")
		desc = "Вы наблюдаете [pick("несколько серьезных сисяндр", "настоящий набор бадончиков", "огромную грудь", "пару гигантских бонхонагахугов", "пару хумонгус хунголомгхнонолоугус")]. Их объем уже намного превышает размер стандартной чашки, составляя примерно [round(cached_size*(owner ? get_size(owner) : 1))]сантиметров в диаметре."
	else
		if (size == "flat")
			desc += " Они очень маленькие и плоскогрудые, как жаль."
		else
			desc += " По вашим оценкам, грудь примерно [uppertext(size)] размера."

	if((genital_flags & GENITAL_FLUID_PRODUCTION) && aroused_state)
		var/datum/reagent/R = GLOB.chemical_reagents_list[fluid_id]
		if(R)
			desc += " Соски подтекают '[lowertext(R.name)]'."
	var/datum/sprite_accessory/S = GLOB.breasts_shapes_list[shape]
	var/icon_shape = S ? S.icon_state : "pair"
	var/icon_size = clamp(breast_values[size], BREASTS_ICON_MIN_SIZE, BREASTS_ICON_MAX_SIZE)
	icon_state = "breasts_[icon_shape]_[icon_size]"
	if(owner)
		if(owner.dna.species.use_skintones && owner.dna.features["genitals_use_skintone"])
			if(ishuman(owner)) // Check before recasting type, although someone fucked up if you're not human AND have use_skintones somehow...
				var/mob/living/carbon/human/H = owner // only human mobs have skin_tone, which we need.
				color = SKINTONE2HEX(H.skin_tone)
				if(!H.dna.skin_tone_override)
					icon_state += "_s"
		else
			color = "#[owner.dna.features["breasts_color"]]"

/obj/item/organ/external/genital/breasts/modify_size(modifier, min = -INFINITY, max = INFINITY)
	var/new_value = clamp(cached_size + modifier, min, max)
	if(new_value == cached_size)
		return
	prev_size = cached_size
	cached_size = new_value
	update()
	..()

/obj/item/organ/external/genital/breasts/update_size()//wah
	var/rounded_cached = round(cached_size)
	if(cached_size < 0)//I don't actually know what round() does to negative numbers, so to be safe!!fixed
		if(owner)
			to_chat(owner, "<span class='warning'>Вы чувствуете, что ваша грудь уменьшается по сравнению с телом, так как грудь становится плоской.</span>")
		QDEL_IN(src, 1)
		return
	switch(rounded_cached)
		if(0) //flatchested
			size = "плоского"
		if(1 to 8) //modest
			size = breast_values[rounded_cached]
		if(9 to 15) //massive
			size = breast_values[rounded_cached]
		if(16 to 17) //ridiculous
			size = breast_values[rounded_cached]
		if(18 to 24) //AWOOOOGAAAAAAA
			size = "массивного"
		if(25 to 29) //AWOOOOOOGAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
			size = "гигантского"
		if(30 to INFINITY) //AWWWWWWWWWWWWWOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOGGGGGAAAAAAAAAAAAAAAAAAAAAA
			size = "неимоверно огромного"


	if((rounded_cached < 18 || rounded_cached ==  25 || rounded_cached == 30) && owner )//Because byond doesn't count from 0, I have to do this.
		var/mob/living/carbon/human/H = owner
		var/r_prev_size = round(prev_size)
		if (rounded_cached > r_prev_size)
			to_chat(H, "<span class='warning'>Ваша грудь [pick("начинает разбухать", "начинает расцветать", "начинает расширяться", "начинает прорываться", "начинает расти с нетерпением", "начинает увеличиваться в размерах")] вплоть до [uppertext(size)].</span>")
		else if (rounded_cached < r_prev_size)
			to_chat(H, "<span class='warning'>Ваша грудь начинает [pick("уменьшаться до", "уменьшаться до", "сдуваться до", "сморщиваться с сожалением до", "сокращаться до")] [uppertext(size)] размера.</span>")

/obj/item/organ/external/genital/breasts/build_from_dna(datum/dna/DNA, associated_key)
	lactates = DNA.features["breasts_lactation"]

	return ..()

/obj/item/organ/external/genital/breasts/get_features(mob/living/carbon/human/H)
	var/datum/dna/D = H.dna
	if(D.species.use_skintones && D.features["genitals_use_skintone"])
		color = SKINTONE2HEX(H.skin_tone)
	else
		color = "#[D.features["breasts_color"]]"
	size = D.features["breasts_size"]
	shape = D.features["breasts_shape"]
	if(!D.features["breasts_lactation"])
		genital_flags &= ~ (GENITAL_FLUID_PRODUCTION|CAN_CLIMAX_WITH|CAN_MASTURBATE_WITH)
	if(!isnum(size))
		cached_size = breast_values[size]
	else
		cached_size = size
		size = breast_values[size]
	prev_size = cached_size
	toggle_visibility(D.features["breasts_visibility"], FALSE)
	if(D.features["breasts_stuffing"])
		toggle_visibility(GEN_ALLOW_EGG_STUFFING, FALSE)

#undef BREASTS_ICON_MIN_SIZE
#undef BREASTS_ICON_MAX_SIZE

/obj/item/organ/external/genital/breasts
	default_fluid_id = /datum/reagent/consumable/milk

/obj/item/organ/external/genital/breasts/get_features(mob/living/carbon/human/H)
	var/datum/dna/D = H.dna
	if(D.features["breasts_fluid"])
		var/datum/reagent/fluid = find_reagent_object_from_type(D.features["breasts_fluid"])
		if(istype(fluid, /datum/reagent/blood))
			fluid_id = H.get_blood_id()
		else if(fluid && (fluid in GLOB.genital_fluids_list))
			fluid_id = D.features["breasts_fluid"]
	else
		fluid_id = initial(fluid_id)
	original_fluid_id = fluid_id
	. = ..()
	fluid_max_volume += ((cached_size - breast_values[initial(size)])*2.5)*(owner ? get_size(owner) : 1)
	fluid_rate += ((cached_size - breast_values[initial(size)])/10)*(owner ? get_size(owner) : 1)

/obj/item/organ/external/genital/breasts/climax_modify_size(mob/living/partner, obj/item/organ/external/genital/source_gen)
	if(!(owner.client?.prefs.read_preference(/datum/preference/toggle/erp/breast_enlargement)))
		return

	var/datum/reagents/fluid_source = source_gen.climaxable(partner)
	if(!fluid_source)
		return

	if(!climax_fluids)
		climax_fluids = new
		climax_fluids.maximum_volume = INFINITY //Just in case

	source_gen.generate_fluid(fluid_source)
	fluid_source.trans_to(climax_fluids, fluid_source.total_volume)

	if(climax_fluids.total_volume >= fluid_max_volume * GENITAL_INFLATION_THRESHOLD)
		var/previous = size
		modify_size(climax_fluids.total_volume / (fluid_max_volume * GENITAL_INFLATION_THRESHOLD))
		if(size != previous)
			owner.visible_message("<span class='lewd'>\The <b>[owner]</b>'s [pick(GLOB.breast_nouns)] разбухают от прилива [lowertext(source_gen.get_fluid_name())] из \the <b>[partner]</b>'s [source_gen.name]", ignored_mobs = owner.get_unconsenting())
			fluid_id = source_gen.get_fluid_id()
		climax_fluids.clear_reagents()

/datum/sprite_accessory/genital/breasts
	icon = 'icons/obj/genitals/breasts_onmob.dmi'
	organ_type = /obj/item/organ/external/genital/breasts
	color_src = "breasts_color"
	has_skintone_shading = TRUE
	key = ORGAN_SLOT_BREASTS
	always_color_customizable = TRUE
/datum/sprite_accessory/genital/breasts/none
	icon_state = "none"
	name = "None"
	factual = FALSE
	color_src = null
/datum/sprite_accessory/genital/breasts/pair
	icon_state = "pair"
	name = "pair"
/datum/sprite_accessory/genital/breasts/quad
	icon_state = "quad"
	name = "quad"
/datum/sprite_accessory/genital/breasts/sextuple
	icon_state = "sextuple"
	name = "sextuple"
