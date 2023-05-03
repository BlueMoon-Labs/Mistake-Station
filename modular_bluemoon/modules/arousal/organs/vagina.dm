/obj/item/organ/external/genital/vagina
	name = "vagina"
	desc = "A female reproductive organ."
	icon = 'icons/obj/genitals/vagina.dmi'
	icon_state = ORGAN_SLOT_VAGINA
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_VAGINA
	mutantpart_key = ORGAN_SLOT_VAGINA
	mutantpart_info = list(MUTANT_INDEX_NAME = "Human", MUTANT_INDEX_COLOR_LIST = list("#FFEEBB"))
	size = 1 //There is only 1 size right now
	shape = DEF_VAGINA_SHAPE
	genital_flags = CAN_MASTURBATE_WITH|CAN_CLIMAX_WITH|GENITAL_CAN_AROUSE|GENITAL_UNDIES_HIDDEN|CAN_CUM_INTO|HAS_EQUIPMENT
	masturbation_verb = "finger"
	arousal_verb = "Вы чувствуете сильную влагу в вашей промежности"
	unarousal_verb = "Возбуждение пропадает, влаги становится меньше"
	fluid_transfer_factor = 0.1 //Yes, some amount is exposed to you, go get your AIDS
	layer_index = VAGINA_LAYER_INDEX
	var/cap_length = 8//D   E   P   T   H (cap = capacity)
	var/cap_girth = 12
	var/cap_girth_ratio = 1.5
	var/clits = 1
	var/clit_diam = 0.25
	var/clit_len = 0.25
	var/list/vag_types = list("тентяклевидная", "зубастая", "волосатая", "лопатковидная", "мохнатая")
	bodypart_overlay = /datum/bodypart_overlay/mutant/genital/vagina

/datum/bodypart_overlay/mutant/genital/vagina
	feature_key = ORGAN_SLOT_VAGINA
	layers = EXTERNAL_FRONT

/datum/bodypart_overlay/mutant/genital/vagina/get_global_feature_list()
	return GLOB.sprite_accessories[ORGAN_SLOT_VAGINA]

/obj/item/organ/external/genital/vagina/build_from_accessory(datum/sprite_accessory/genital/accessory, datum/dna/DNA)
	if(DNA.features["vagina_uses_skintones"])
		uses_skintones = accessory.has_skintone_shading

/obj/item/organ/external/genital/vagina/update_appearance()
	. = ..()
	icon_state = "vagina"
	var/lowershape = lowertext(shape)
	var/details

	switch(lowershape)
		if("tentacles")
			details = "Отверстие закрыто половыми губами, оно покрыто несколькими щупальцами и они "
		if("dentata")
			details = "Внутри и снаружи есть зубы, и они "
		if("hairy")
			details = "На ней довольно много волос и они "
		if("human")
			details = "Она подтянута, не имеет на своей поверхности сильно много волос, обладает особо гладкой и нежной кожей, и её губы "
		if("gaping")
			details = "Она слегка приоткрыта, не имеет большой растительности и её половые губы "
		if("spade")
			details = "По форме она похожа на собачью лопатку и её половые губы "
		if("furred")
			details = "Она имеет аккуратно ухоженный мех вокруг половых губок, которые "
		if("cloaca")
			details = "Это узкое, небольшое горизонтальное отверстие и внешние губы "
		else
			details = "Она имеет экзотическую форму и её губы "
	if(aroused_state)
		details += "пропитаны женскими секретами."
	else
		details += "кажутся сухими."

	desc = "Вы наблюдаете вагину. [details]"

	if(owner)
		if(owner.dna.species.use_skintones && owner.dna.features["genitals_use_skintone"])
			if(ishuman(owner)) // Check before recasting type, although someone fucked up if you're not human AND have use_skintones somehow...
				var/mob/living/carbon/human/H = owner // only human mobs have skin_tone, which we need.
				color = SKINTONE2HEX(H.skin_tone)
				if(!H.dna.skin_tone_override)
					icon_state += "_s"
		else
			color = "#[owner.dna.features["vag_color"]]"
		if(ishuman(owner))
			var/mob/living/carbon/human/H = owner
			H.update_genitals()

/obj/item/organ/external/genital/vagina/get_features(mob/living/carbon/human/H)
	var/datum/dna/D = H.dna
	if(D.species.use_skintones && D.features["genitals_use_skintone"])
		color = SKINTONE2HEX(H.skin_tone)
	else
		color = "[D.features["vag_color"]]"
	shape = "[D.features["vag_shape"]]"
	toggle_visibility(D.features["vag_visibility"], FALSE)
	if(D.features["vag_stuffing"])
		toggle_visibility(GEN_ALLOW_EGG_STUFFING, FALSE)

/datum/sprite_accessory/genital/vagina
	icon = 'icons/obj/genitals/vagina_onmob.dmi'
	organ_type = /obj/item/organ/external/genital/vagina
	color_src = "vag_color"
	alt_aroused = TRUE
	key = ORGAN_SLOT_VAGINA
	always_color_customizable = TRUE

/datum/sprite_accessory/genital/vagina/none
	icon_state = "none"
	name = "None"
	factual = FALSE
	color_src = null

/datum/sprite_accessory/genital/vagina/human
	icon_state = "human"
	name = "human"

/datum/sprite_accessory/genital/vagina/tentacles
	icon_state = "tentacle"
	name = "tentacles"

/datum/sprite_accessory/genital/vagina/dentata
	icon_state = "dentata"
	name = "dentata"

/datum/sprite_accessory/genital/vagina/hairy
	icon_state = "hairy"
	name = "hairy"
	alt_aroused = FALSE

/datum/sprite_accessory/genital/vagina/spade
	icon_state = "spade"
	name = "spade"
	alt_aroused = FALSE

/datum/sprite_accessory/genital/vagina/furred
	icon_state = "furred"
	name = "furred"
	alt_aroused = FALSE

/datum/sprite_accessory/genital/vagina/gaping
	icon_state = "gaping"
	name = "gaping"

/datum/sprite_accessory/genital/vagina/cloaca
	icon_state = "cloaca"
	name = "cloaca"
