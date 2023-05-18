/obj/item/organ/external/genital/vagina
	name = "vagina"
	icon = 'modular_skyrat/master_files/icons/obj/genitals/vagina.dmi'
	icon_state = "vagina"
	mutantpart_key = ORGAN_SLOT_VAGINA
	mutantpart_info = list(MUTANT_INDEX_NAME = "Human", MUTANT_INDEX_COLOR_LIST = list("#FFEEBB"))
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_VAGINA
	genital_location = GROIN
	drop_when_organ_spilling = FALSE
	arousal_verb = "Вы чувствуете сильную влагу в вашей промежности"
	unarousal_verb = "Возбуждение пропадает, влаги становится меньше"
	bodypart_overlay = /datum/bodypart_overlay/mutant/genital/vagina

/datum/bodypart_overlay/mutant/genital/vagina
	feature_key = ORGAN_SLOT_VAGINA
	layers = EXTERNAL_FRONT

/obj/item/organ/external/genital/vagina/get_description_string(datum/sprite_accessory/genital/gas)
	var/returned_string = "Вы наблюдаете вагину. "
	switch(lowertext(genital_name))
		if("tentacles")
			returned_string += "Отверстие закрыто половыми губами, оно покрыто несколькими щупальцами и они "
		if("dentata")
			returned_string += "Внутри и снаружи есть зубы, и они "
		if("hairy")
			returned_string += "На ней довольно много волос и они "
		if("human")
			returned_string += "Она подтянута, не имеет на своей поверхности сильно много волос, обладает особо гладкой и нежной кожей, и её губы "
		if("gaping")
			returned_string += "Она слегка приоткрыта, не имеет большой растительности и её половые губы "
		if("spade")
			returned_string += "По форме она похожа на собачью лопатку и её половые губы "
		if("furred")
			returned_string += "Она имеет аккуратно ухоженный мех вокруг половых губок, которые "
		if("cloaca")
			returned_string += "Это узкое, небольшое горизонтальное отверстие и внешние губы "
		else
			returned_string += "Она имеет экзотическую форму и её губы "
	switch(aroused)
		if(AROUSAL_NONE)
			returned_string += "суховаты."
		if(AROUSAL_PARTIAL)
			returned_string += "подтекают женскими секретами."
		if(AROUSAL_FULL)
			returned_string += "пропитаны женскими секретами."
	return returned_string

/obj/item/organ/external/genital/vagina/get_sprite_size_string()
	var/is_dripping = 0
	if(aroused == AROUSAL_FULL)
		is_dripping = 1
	return "[genital_type]_[is_dripping]"

/obj/item/organ/external/genital/vagina/build_from_dna(datum/dna/DNA, associated_key)
	uses_skin_color = DNA.features["vagina_uses_skincolor"]

	return ..() // will update the sprite suffix

/obj/item/organ/external/genital/vagina/build_from_accessory(datum/sprite_accessory/genital/accessory, datum/dna/DNA)
	if(DNA.features["vagina_uses_skintones"])
		uses_skintones = accessory.has_skintone_shading

/datum/bodypart_overlay/mutant/genital/vagina/get_global_feature_list()
	return GLOB.sprite_accessories[ORGAN_SLOT_VAGINA]

/obj/item/organ/external/genital/vagina
	internal_fluid_datum = /datum/reagent/consumable/femcum

/obj/item/organ/external/genital/vagina/build_from_dna(datum/dna/DNA, associated_key)
	. = ..()
	internal_fluid_maximum = 10

/datum/sprite_accessory/genital/vagina
	icon = 'modular_skyrat/master_files/icons/mob/sprite_accessory/genitals/vagina_onmob.dmi'
	organ_type = /obj/item/organ/external/genital/vagina
	associated_organ_slot = ORGAN_SLOT_VAGINA
	key = ORGAN_SLOT_VAGINA
	always_color_customizable = TRUE
	default_color = "#FFCCCC"
	relevent_layers = list(BODY_FRONT_LAYER)
	genetic = TRUE

/datum/sprite_accessory/genital/vagina/none
	icon_state = "none"
	name = "None"
	factual = FALSE
	color_src = null

/datum/sprite_accessory/genital/vagina/human
	icon_state = "human"
	name = "Human"

/datum/sprite_accessory/genital/vagina/tentacles
	icon_state = "tentacle"
	name = "Tentacle"

/datum/sprite_accessory/genital/vagina/dentata
	icon_state = "dentata"
	name = "Dentata"

/datum/sprite_accessory/genital/vagina/hairy
	icon_state = "hairy"
	name = "Hairy"
	alt_aroused = FALSE

/datum/sprite_accessory/genital/vagina/spade
	icon_state = "spade"
	name = "Spade"
	alt_aroused = FALSE

/datum/sprite_accessory/genital/vagina/furred
	icon_state = "furred"
	name = "Furred"
	alt_aroused = FALSE

/datum/sprite_accessory/genital/vagina/gaping
	icon_state = "gaping"
	name = "Gaping"

/datum/sprite_accessory/genital/vagina/cloaca
	icon_state = "cloaca"
	name = "Cloaca"
