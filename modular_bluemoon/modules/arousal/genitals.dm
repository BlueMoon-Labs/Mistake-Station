/obj/item/organ/external/genital
	color = "#fcccb3"
	organ_flags = ORGAN_EDIBLE | ORGAN_NO_DISMEMBERMENT
	///Size value of the genital, needs to be translated to proper lengths/girths/cups
	var/genital_size = 1
	///Sprite name of the genital, it's what shows up on character creation
	var/genital_name = "Human"
	///Type of the genital. For penises tapered/horse/human etc. for breasts quadruple/sixtuple etc...
	var/genital_type = SPECIES_HUMAN
	///Used for determining what sprite is being used, derrives from size and type
	var/sprite_suffix
	///Used for input from the user whether to show a genital through clothing or not, always or never etc.
	var/visibility_preference = GENITAL_HIDDEN_BY_CLOTHES
	///Whether the organ is aroused, matters for sprites, use AROUSAL_CANT, AROUSAL_NONE, AROUSAL_PARTIAL or AROUSAL_FULL
	var/aroused = AROUSAL_NONE
	///Whether the organ is supposed to use a skintoned variant of the sprite
	var/uses_skintones = FALSE
	///Whether the organ is supposed to use the color of the holder's skin tone.
	var/uses_skin_color = FALSE
	/// Where the genital is actually located, for clothing checks.
	var/genital_location = GROIN
	var/obj/item/organ/external/genital/linked_organ
	//used for linking an apparatus' organ to its other half on update_link().
	var/linked_organ_slot
	// wow if this were ever used that'd be cool but it's not but i'm keeping it for my unshit code
	var/sensitivity = 1
	// For Fluids.
	var/genital_flags
	// How much would a partner get in them if they climax using this?
	var/fluid_transfer_factor = 0
	// Жидкости, сука, нахуй, блядь.
	var/datum/reagent/fluid_id = null
	var/fluid_max_volume = 50
	var/fluid_efficiency = 1
	var/fluid_rate = CUM_RATE
	var/fluid_mult = 1
	var/last_orgasmed = 0
	var/arousal_verb = "Вы ощущаете сильное возбуждение"
	var/unarousal_verb = "Возбуждение пропадает, будто бы его и не было"
	var/masturbation_verb = "стимулировать"
	var/layer_index = GENITAL_LAYER_INDEX //Order should be very important. FIRST vagina, THEN testicles, THEN penis, as this affects the order they are rendered in.

/obj/item/organ/external/genital
	/// Controls whenever a genital is always accessible
	var/always_accessible = FALSE

/// Toggles whether such genital can always be accessed
/obj/item/organ/external/genital/proc/toggle_accessibility()
	always_accessible = !always_accessible

/obj/item/organ/external/genital
	/// The fluid count of the genital.
	var/internal_fluid_count = 0

	/// The maximum amount of fluid that can be stored in the genital.
	var/internal_fluid_maximum = 0

	/// The datum to be used for the tracked fluid, should it need to be added to a fluid container.
	var/internal_fluid_datum

	/// The currently inserted sex toy.
	var/obj/item/inserted_item

/mob/living/carbon/proc/anus_toggle_visibility(visibility)
	switch(visibility)
		if(GEN_VISIBLE_ALWAYS)
			anus_exposed = TRUE
			log_message("Exposed their anus", LOG_EMOTE)
		if(GEN_VISIBLE_NO_UNDIES)
			anus_exposed = FALSE
			log_message("Hid their anus under underwear", LOG_EMOTE)
		else
			anus_exposed = -1
			log_message("Hid their anus completely", LOG_EMOTE)

/obj/item/organ/external/genital/proc/set_aroused_state(new_state,cause = "manual toggle")
	if(!(genital_flags & GENITAL_CAN_AROUSE))
		return FALSE
	if(!((HAS_TRAIT(owner,TRAIT_PERMABONER) && !new_state) || HAS_TRAIT(owner,TRAIT_NEVERBONER) && new_state))
		aroused = new_state
	owner.log_message("[src]'s arousal was [new_state ? "enabled" : "disabled"] due to [cause]", LOG_EMOTE)
	return aroused

/// Helper proc for checking if internal fluids are full or not.
/obj/item/organ/external/genital/proc/internal_fluid_full()
	return internal_fluid_count >= internal_fluid_maximum

/// Adds the given amount to the internal fluid count, clamping it between 0 and internal_fluid_maximum.
/obj/item/organ/external/genital/proc/adjust_internal_fluid(amount)
	internal_fluid_count = clamp(internal_fluid_count + amount, 0, internal_fluid_maximum)

/// Tries to add the specified amount to the target reagent container. Keeps in mind internal_fluid_count.
/obj/item/organ/external/genital/proc/transfer_internal_fluid(datum/reagents/reagent_container, attempt_amount)
	if(!internal_fluid_datum || !internal_fluid_count || !internal_fluid_maximum || !reagent_container)
		return FALSE

	attempt_amount = clamp(attempt_amount, 0, internal_fluid_count)
	reagent_container.add_reagent(internal_fluid_datum, attempt_amount)
	internal_fluid_count -= attempt_amount

//This translates the float size into a sprite string
/obj/item/organ/external/genital/proc/get_sprite_size_string()
	return 0

//This translates the float size into a sprite string
/obj/item/organ/external/genital/proc/update_sprite_suffix()
	sprite_suffix = "[get_sprite_size_string()]"

	var/datum/bodypart_overlay/mutant/genital/our_overlay = bodypart_overlay

	our_overlay.sprite_suffix = sprite_suffix


/obj/item/organ/external/genital/proc/get_description_string(datum/sprite_accessory/genital/gas)
	return "Вы наблюдаете Гениталии..."

/obj/item/organ/external/genital/proc/update_genital_icon_state()
	return

/obj/item/organ/external/genital/proc/set_size(size)
	genital_size = size
	update_sprite_suffix()

/obj/item/organ/external/genital/Initialize(mapload)
	. = ..()
	update_sprite_suffix()
	if(CONFIG_GET(flag/disable_lewd_items))
		return INITIALIZE_HINT_QDEL

/obj/item/organ/external/genital/proc/update_appearance_genitals()
	if(!owner || owner.stat == DEAD)
		aroused = FALSE

//Removes ERP organs depending on config
/obj/item/organ/external/genital/Insert(mob/living/carbon/M, special, drop_if_replaced = TRUE)
	if(CONFIG_GET(flag/disable_erp_preferences))
		return
	. = ..()
	if(.)
		update()
		RegisterSignal(owner, COMSIG_GLOB_MOB_DEATH, .proc/update_appearance_genitals)
		if(genital_flags & GENITAL_THROUGH_CLOTHES)
			owner.exposed_genitals += src

/obj/item/organ/external/genital/Remove(mob/living/carbon/C, special = FALSE, moving)
	. = ..()
	update()
	if(!QDELETED(C))
		if(genital_flags & UPDATE_OWNER_APPEARANCE && ishuman(C))
			var/mob/living/carbon/human/H = C
			H.update_genitals()
		C.exposed_genitals -= src
		UnregisterSignal(C, COMSIG_GLOB_MOB_DEATH)
	update_genital_icon_state()

/obj/item/organ/external/genital/build_from_dna(datum/dna/DNA, associated_key)
	. = ..()
	var/datum/sprite_accessory/genital/accessory = GLOB.sprite_accessories[associated_key][DNA.mutant_bodyparts[associated_key][MUTANT_INDEX_NAME]]
	genital_name = accessory.name
	genital_type = accessory.icon_state
	build_from_accessory(accessory, DNA)
	update_sprite_suffix()

	var/datum/bodypart_overlay/mutant/genital/our_overlay = bodypart_overlay

	our_overlay.color_source = uses_skin_color ? ORGAN_COLOR_INHERIT : ORGAN_COLOR_OVERRIDE

/// for specific build_from_dna behavior that also checks the genital accessory.
/obj/item/organ/external/genital/proc/build_from_accessory(datum/sprite_accessory/genital/accessory, datum/dna/DNA)
	return

/obj/item/organ/external/genital/proc/is_exposed()
	if(!owner || visibility_preference & (GENITAL_INTERNAL|GENITAL_HIDDEN))
		return FALSE
	if(visibility_preference & GENITAL_THROUGH_CLOTHES)
		return TRUE

	switch(zone) //update as more genitals are added
		if(BODY_ZONE_CHEST)
			return owner.is_chest_exposed()
		if(BODY_ZONE_PRECISE_GROIN)
			return owner.is_groin_exposed()

/datum/bodypart_overlay/mutant/genital
	layers = EXTERNAL_FRONT
	color_source = ORGAN_COLOR_OVERRIDE
	/// The suffix appended to the feature_key for the overlays.
	var/sprite_suffix

/datum/bodypart_overlay/mutant/genital/override_color(rgb_value)
	return draw_color

/datum/bodypart_overlay/mutant/genital/get_base_icon_state()
	return sprite_suffix


/datum/bodypart_overlay/mutant/genital/get_color_layer_names(icon_state_to_lookup)
	if(length(sprite_datum.color_layer_names))
		return sprite_datum.color_layer_names

	sprite_datum.color_layer_names = list()
	if (!GLOB.cached_mutant_icon_files[sprite_datum.icon])
		GLOB.cached_mutant_icon_files[sprite_datum.icon] = icon_states(new /icon(sprite_datum.icon))

	var/list/cached_mutant_icon_states = GLOB.cached_mutant_icon_files[sprite_datum.icon]

	for (var/layer in all_layers)
		if(!(layer & layers))
			continue

		var/layertext = mutant_bodyparts_layertext(bitflag_to_layer(layer))
		if ("m_[feature_key]_[get_base_icon_state()]_[layertext]_primary" in cached_mutant_icon_states)
			sprite_datum.color_layer_names["1"] = "primary"
		if ("m_[feature_key]_[get_base_icon_state()]_[layertext]_secondary" in cached_mutant_icon_states)
			sprite_datum.color_layer_names["2"] = "secondary"
		if ("m_[feature_key]_[get_base_icon_state()]_[layertext]_tertiary" in cached_mutant_icon_states)
			sprite_datum.color_layer_names["3"] = "tertiary"

	return sprite_datum.color_layer_names

/mob/living/carbon/human/verb/toggle_genitals()
	set category = "IC"
	set name = "Expose/Hide genitals"
	set desc = "Allows you to toggle which genitals should show through clothes or not."

	if(stat != CONSCIOUS)
		to_chat(usr, span_warning("You can't toggle genitals visibility right now..."))
		return

	var/list/genital_list = list()
	for(var/obj/item/organ/external/genital/genital in organs)
		if(!genital.visibility_preference == GENITAL_SKIP_VISIBILITY)
			genital_list += genital
	if(!genital_list.len) //There is nothing to expose
		return
	//Full list of exposable genitals created
	var/obj/item/organ/external/genital/picked_organ
	picked_organ = input(src, "Choose which genitalia to expose/hide", "Expose/Hide genitals") as null|anything in genital_list
	if(picked_organ && (picked_organ in organs))
		var/list/gen_vis_trans = list("Never show" = GENITAL_NEVER_SHOW,
									"Hidden by clothes" = GENITAL_HIDDEN_BY_CLOTHES,
									"Always show" = GENITAL_ALWAYS_SHOW
									)
		var/picked_visibility = input(src, "Choose visibility setting", "Expose/Hide genitals") as null|anything in gen_vis_trans
		if(picked_visibility && picked_organ && (picked_organ in organs))
			picked_organ.visibility_preference = gen_vis_trans[picked_visibility]
			update_body()
	return

//Removing ERP IC verb depending on config
/mob/living/carbon/human/Initialize(mapload)
	. = ..()
	if(CONFIG_GET(flag/disable_erp_preferences))
		verbs -= /mob/living/carbon/human/verb/toggle_genitals
		verbs -= /mob/living/carbon/human/verb/toggle_arousal

/mob/living/carbon/human/verb/toggle_arousal()
	set category = "IC"
	set name = "Toggle Arousal"
	set desc = "Allows you to toggle how aroused your private parts are."

	if(stat != CONSCIOUS)
		to_chat(usr, span_warning("You can't toggle arousal right now..."))
		return

	var/list/genital_list = list()
	for(var/obj/item/organ/external/genital/genital in organs)
		if(!genital.aroused == AROUSAL_CANT)
			genital_list += genital
	if(!genital_list.len) //There is nothing to expose
		return
	//Full list of exposable genitals created
	var/obj/item/organ/external/genital/picked_organ
	picked_organ = input(src, "Choose which genitalia to change arousal", "Expose/Hide genitals") as null|anything in genital_list
	if(picked_organ && (picked_organ in organs))
		var/list/gen_arous_trans = list(
			"Not aroused" = AROUSAL_NONE,
			"Partly aroused" = AROUSAL_PARTIAL,
			"Very aroused" = AROUSAL_FULL,
		)
		var/picked_arousal = input(src, "Choose arousal", "Toggle Arousal") as null|anything in gen_arous_trans
		if(picked_arousal && picked_organ && (picked_organ in organs))
			picked_organ.aroused = gen_arous_trans[picked_arousal]
			picked_organ.update_sprite_suffix()
			update_body()
	return

/obj/item/organ/external/genital/proc/generate_fluid(datum/reagents/R)
	var/amount = get_fluid()
	R.clear_reagents()
	R.maximum_volume = fluid_max_volume
	if(fluid_id)
		R.add_reagent(fluid_id,amount, owner.get_blood_data())
	else if(linked_organ?.fluid_id)
		R.add_reagent(linked_organ.fluid_id,amount, owner.get_blood_data())
	return TRUE

/obj/item/organ/external/genital/proc/update()
	if(QDELETED(src))
		return
	update_appearance()
	if(genital_flags & UPDATE_OWNER_APPEARANCE && owner && ishuman(owner))
		var/mob/living/carbon/human/H = owner
		H.update_genitals()
	if(linked_organ_slot || (linked_organ && !owner))
		update_link()

/obj/item/organ/external/genital/proc/update_link()
	if(owner)
		if(linked_organ)
			return FALSE
		linked_organ = owner.getorganslot(linked_organ_slot)
		if(linked_organ)
			linked_organ.linked_organ = src
			linked_organ.upon_link()
			upon_link()
			return TRUE
	if(linked_organ)
		linked_organ.linked_organ = null
		linked_organ = null
	return FALSE

//post organ duo making arrangements.
/obj/item/organ/external/genital/proc/upon_link()
	return

//Checks to see if organs are new on the mob, and changes their colours so that they don't get crazy colours.
/mob/living/carbon/human/proc/emergent_genital_call()
	if(!client.prefs.arousable)
		return FALSE

	var/organCheck = locate(/obj/item/organ/external/genital) in organs
	var/breastCheck = getorganslot(ORGAN_SLOT_BREASTS)
	var/willyCheck = getorganslot(ORGAN_SLOT_PENIS)
	var/buttCheck = getorganslot(ORGAN_SLOT_BUTT)
	var/ballCheck = getorganslot(ORGAN_SLOT_TESTICLES)
	var/bellyCheck = getorganslot(ORGAN_SLOT_BELLY)
	var/anusCheck = getorganslot(ORGAN_SLOT_ANUS)

	if(organCheck == FALSE)
		if(dna.species.fixed_mut_color)
			dna.features["cock_color"] = "[dna.species.fixed_mut_color]"
			dna.features["breasts_color"] = "[dna.species.fixed_mut_color]"
			dna.features["butt_color"] = "[dna.species.fixed_mut_color]"
			dna.features["testicles_color"] = "[dna.species.fixed_mut_color]"
			dna.features["belly_color"] = "[dna.species.fixed_mut_color]"
			dna.features["anus_color"] = "[dna.species.fixed_mut_color]"
			return
		//So people who haven't set stuff up don't get rainbow surprises.
		dna.features["cock_color"] = "[dna.features["mcolor"]]"
		dna.features["breasts_color"] = "[dna.features["mcolor"]]"
		dna.features["butt_color"] = "[dna.features["mcolor"]]"
		dna.features["testicles_color"] = "[dna.features["mcolor"]]"
		dna.features["belly_color"] = "[dna.features["mcolor"]]"
		dna.features["anus_color"] = "[dna.features["mcolor"]]"
	else //If there's a new organ, make it the same colour.
		if(breastCheck == FALSE)
			dna.features["breasts_color"] = dna.features["cock_color"]
		else if (willyCheck == FALSE)
			dna.features["cock_color"] = dna.features["breasts_color"]
		else if (buttCheck == FALSE)
			dna.features["butt_color"] = dna.features["butt_color"]
		else if (ballCheck == FALSE)
			dna.features["testicles_color"] = dna.features["testicles_color"]
		else if (bellyCheck == FALSE)
			dna.features["belly_color"] = dna.features["belly_color"]
		else if (anusCheck)
			dna.features["anus_color"] = dna.features["butt_color"]
	return TRUE

/obj/item/organ/external/genital
	var/max_size = 6
	var/min_size = 1
	var/datum/reagents/climax_fluids
	var/datum/reagent/original_fluid_id
	var/datum/reagent/default_fluid_id
	var/list/writtentext = ""

/obj/item/organ/external/genital/proc/modify_size(modifier, min = -INFINITY, max = INFINITY)
	fluid_max_volume += modifier*2.5
	fluid_rate += modifier/10
	return

/obj/item/organ/external/genital/modify_size(modifier, min, max)
	. = ..()
	if(owner) //Add extra space depending on the owner's size
		fluid_max_volume += (modifier*2.5)*(get_size(owner)-1)
		fluid_rate += (modifier/10)*(get_size(owner)-1)

/obj/item/organ/external/genital/proc/size_to_state()
	return genital_size

/obj/item/organ/external/genital/proc/get_fluid()
	return clamp(fluid_rate * ((world.time - last_orgasmed) / (10 SECONDS)) * fluid_mult, 0, fluid_max_volume)

/obj/item/organ/external/genital/proc/get_fluid_fraction()
	return get_fluid() / fluid_max_volume

/obj/item/organ/external/genital/proc/climax_modify_size(mob/living/partner, obj/item/organ/external/genital/source_gen)
    return

/obj/item/organ/external/genital/proc/get_fluid_id()
	if(fluid_id)
		return fluid_id
	else if(linked_organ?.fluid_id)
		return linked_organ.fluid_id
	return

/obj/item/organ/external/genital/proc/get_fluid_name()
	var/milkies = get_fluid_id()
	var/message
	if(!milkies) //No milkies??
		return
	var/datum/reagent/R = find_reagent_object_from_type(milkies)
	message = R.name
	return message

/obj/item/organ/external/genital/proc/get_default_fluid()
	if(default_fluid_id)
		return default_fluid_id
	else if(linked_organ?.default_fluid_id)
		return linked_organ.default_fluid_id
	return

/obj/item/organ/external/genital/proc/set_fluid_id(new_fluidtype)
	if(genital_flags & GENITAL_FLUID_PRODUCTION)
		fluid_id = new_fluidtype
	else if(linked_organ?.genital_flags & GENITAL_FLUID_PRODUCTION)
		linked_organ?.fluid_id = new_fluidtype

//proc to give a player their genitals and stuff when they log in
/mob/living/carbon/human/proc/give_genitals(clean = FALSE)//clean will remove all pre-existing genitals. proc will then give them any genitals that are enabled in their DNA
	if(clean)
		for(var/obj/item/organ/external/genital/G in organs)
			qdel(G)
	if (NOGENITALS in dna.species.species_traits)
		return
	if(dna.features["has_vag"])
		give_genital(/obj/item/organ/external/genital/vagina)
	if(dna.features["has_womb"])
		give_genital(/obj/item/organ/external/genital/womb)
	if(dna.features["has_balls"])
		give_genital(/obj/item/organ/external/genital/testicles)
	if(dna.features["has_breasts"])
		give_genital(/obj/item/organ/external/genital/breasts)
	if(dna.features["has_cock"])
		give_genital(/obj/item/organ/external/genital/penis)
	if(dna.features["has_butt"])
		give_genital(/obj/item/organ/external/genital/butt)
	if(dna.features["has_belly"])
		give_genital(/obj/item/organ/external/genital/belly)
	if(dna.features["has_anus"])
		give_genital(/obj/item/organ/external/genital/anus)

/mob/living/carbon/human/proc/give_genital(obj/item/organ/external/genital/G)
	if(!dna || (NOGENITALS in dna.species.species_traits) || getorganslot(initial(G.slot)))
		return FALSE
	G = new G(null, FALSE)
	G.build_from_dna(src)
	G.Insert(src)
	return G

/obj/item/organ/external/genital
	var/list/obj/item/equipment = list()

/mob/living/carbon/human/proc/update_genitals()
	if(QDELETED(src))
		return
	var/static/list/relevant_layers = list("[GENITALS_BEHIND_LAYER]" = "BEHIND", "[GENITALS_FRONT_LAYER]" = "FRONT")
	var/static/list/layers_num
	if(!layers_num)
		for(var/L in relevant_layers)
			LAZYSET(layers_num, L, text2num(L))
	for(var/L in relevant_layers) //Less hardcode
		remove_overlay(layers_num[L])
	remove_overlay(GENITALS_EXPOSED_LAYER)
	if(!LAZYLEN(organs) || ((NOGENITALS in dna.species.species_traits) && !genital_override) || HAS_TRAIT(src, TRAIT_HUSK))
		return

	//start scanning for genitals

	var/list/gen_index[GENITAL_LAYER_INDEX_LENGTH]
	var/list/genitals_to_add
	var/list/fully_exposed
	for(var/obj/item/organ/external/genital/G in organs)
		if(G.is_exposed()) //Checks appropriate clothing slot and if it's through_clothes
			LAZYADD(gen_index[G.layer_index], G)
	if(has_strapon(REQUIRE_EXPOSED))
		LAZYADD(gen_index[PENIS_LAYER_INDEX], get_strapon())
	for(var/L in gen_index)
		if(L) //skip nulls
			LAZYADD(genitals_to_add, L)
	if(!genitals_to_add)
		return
	//Now we added all genitals that aren't internal and should be rendered
	//start applying overlays
	for(var/layer in relevant_layers)
		var/list/standing = list()
		var/layertext = relevant_layers[layer]
		for(var/A in genitals_to_add)
			if(istype(A, /obj/item/clothing/underwear/briefs/strapon))
				var/obj/item/clothing/underwear/briefs/strapon/strapon = A
				var/datum/sprite_accessory/S = GLOB.cock_shapes_list[GLOB.dildo_shape_to_cock_shape[strapon.dildo_shape]]
				var/mutable_appearance/genital_overlay = mutable_appearance(S.icon, layer = -layer)
				genital_overlay.color = strapon.dildo_color
				genital_overlay.icon_state = "[ORGAN_SLOT_PENIS]_[S.icon_state]_[strapon.dildo_size]_[1]_[layertext]"
				genital_overlay.alpha = strapon.dildo_alpha
				// dirty fix to render the dildo above the strap
				if(strapon.is_exposed())
					genital_overlay.layer = -GENITALS_EXPOSED_LAYER
					LAZYADD(fully_exposed, genital_overlay)
				else
					genital_overlay.layer = -layers_num[layer]
					standing += genital_overlay
				continue

			var/obj/item/organ/external/genital/G = A
			var/datum/sprite_accessory/S
			var/size = G.size_to_state()
			switch(G.type)
				if(/obj/item/organ/external/genital/penis)
					S = GLOB.cock_shapes_list[G.genital_type]
				if(/obj/item/organ/external/genital/testicles)
					S = GLOB.balls_shapes_list[G.genital_type]
				if(/obj/item/organ/external/genital/vagina)
					S = GLOB.vagina_shapes_list[G.genital_type]
				if(/obj/item/organ/external/genital/breasts)
					S = GLOB.breasts_shapes_list[G.genital_type]
				if(/obj/item/organ/external/genital/butt)
					S = GLOB.butt_shapes_list[G.genital_type]
				if(/obj/item/organ/external/genital/belly)
					S = GLOB.belly_shapes_list[G.genital_type]
				if(/obj/item/organ/external/genital/anus)
					S = GLOB.anus_shapes_list[G.genital_type]

			if(!S || S.icon_state == "none")
				continue
			var/aroused_state = G.aroused && S.alt_aroused
			var/accessory_icon = S.icon
			var/do_center = S.center
			var/dim_x = S.dimension_x
			var/dim_y = S.dimension_y
			if(G.genital_flags & GENITAL_CAN_TAUR && S.taur_icon && (!S.feat_taur || dna.features[S.feat_taur]) && dna.species.mutant_bodyparts["taur"])
				var/datum/sprite_accessory/taur/T = GLOB.taur_list[dna.features["taur"]]
				if(T?.taur_mode & S.accepted_taurs)
					accessory_icon = S.taur_icon
					do_center = TRUE
					dim_x = S.taur_dimension_x
					dim_y = S.taur_dimension_y

			var/mutable_appearance/genital_overlay = mutable_appearance(accessory_icon, layer = -layer)
			if(do_center)
				genital_overlay = center_image(genital_overlay, dim_x, dim_y)

			if(dna.species.use_skintones && dna.features["genitals_use_skintone"])
				genital_overlay.color = SKINTONE2HEX(skin_tone)
			else
				switch(S.color_src)
					if("cock_color")
						genital_overlay.color = "#[dna.features["cock_color"]]"
					if("balls_color")
						genital_overlay.color = "#[dna.features["balls_color"]]"
					if("breasts_color")
						genital_overlay.color = "#[dna.features["breasts_color"]]"
					if("vag_color")
						genital_overlay.color = "#[dna.features["vag_color"]]"
					if("butt_color")
						genital_overlay.color = "#[dna.features["butt_color"]]"
					if("belly_color")
						genital_overlay.color = "#[dna.features["belly_color"]]"
					if("anus_color")
						genital_overlay.color = "#[dna.features["anus_color"]]"

			genital_overlay.icon_state = "[G.slot]_[S.icon_state]_[size][(dna.species.use_skintones && !dna.skin_tone_override) ? "_s" : ""]_[aroused_state]_[layertext]"

			if(layers_num[layer] == GENITALS_FRONT_LAYER && G.genital_flags & GENITAL_THROUGH_CLOTHES)
				genital_overlay.layer = -GENITALS_EXPOSED_LAYER
				LAZYADD(fully_exposed, genital_overlay)
			else
				genital_overlay.layer = -layers_num[layer]
				standing += genital_overlay

		if(LAZYLEN(standing))
			overlays_standing[layers_num[layer]] = standing

	if(LAZYLEN(fully_exposed))
		overlays_standing[GENITALS_EXPOSED_LAYER] = fully_exposed
		apply_overlay(GENITALS_EXPOSED_LAYER)

	for(var/L in relevant_layers)
		apply_overlay(layers_num[L])

/mob/living/carbon/human/update_genitals()
	. = ..()

	// Send signal
	SEND_SIGNAL(src, COMSIG_MOB_UPDATE_GENITALS)

/obj/item/organ/external/genital/proc/toggle_visibility(visibility, update = TRUE)
	if(visibility != GEN_ALLOW_EGG_STUFFING)
		genital_flags &= ~(GENITAL_THROUGH_CLOTHES|GENITAL_HIDDEN|GENITAL_UNDIES_HIDDEN)
	if(owner)
		owner.exposed_genitals -= src
	switch(visibility)
		if(GEN_VISIBLE_ALWAYS)
			genital_flags |= GENITAL_THROUGH_CLOTHES
			if(owner)
				owner.log_message("Exposed their [src]",LOG_EMOTE)
				owner.exposed_genitals += src
		if(GEN_VISIBLE_NO_CLOTHES)
			if(owner)
				owner.log_message("Hid their [src] under clothes only",LOG_EMOTE)
		if(GEN_VISIBLE_NO_UNDIES)
			genital_flags |= GENITAL_UNDIES_HIDDEN
			if(owner)
				owner.log_message("Hid their [src] under underwear",LOG_EMOTE)
		if(GEN_VISIBLE_NEVER)
			genital_flags |= GENITAL_HIDDEN
			if(owner)
				owner.log_message("Hid their [src] completely",LOG_EMOTE)
		if(GEN_ALLOW_EGG_STUFFING)
			TOGGLE_BITFIELD(genital_flags, GENITAL_CAN_STUFF)
			if(owner)
				owner.log_message("Allowed egg stuffing in their [src]",LOG_EMOTE)

	if(update && owner && ishuman(owner)) //recast to use update genitals proc
		var/mob/living/carbon/human/H = owner
		H.update_genitals()

/// The alternative `dimension_x` to use if it's a taur.
#define TAUR_DIMENSION_X 64

/datum/sprite_accessory/genital
	special_render_case = TRUE
	special_colorize = TRUE
	var/associated_organ_slot
	/// If true, then there should be a variant in the icon file that's slightly pinkier to match human base colors.
	var/has_skintone_shading = FALSE
	///Where the genital is on the body. If clothing doesn't cover it, it shows up!
	var/genital_location = GROIN

/datum/sprite_accessory/genital/is_hidden(mob/living/carbon/human/target_mob)
	var/obj/item/organ/external/genital/badonkers = target_mob.get_organ_slot(associated_organ_slot)
	if(!badonkers)
		return TRUE
	switch(badonkers.visibility_preference)
		if(GENITAL_ALWAYS_SHOW) //Never hidden
			return FALSE
		if(GENITAL_HIDDEN_BY_CLOTHES) //Hidden if the relevant body parts are covered by clothes or underwear
			//Do they have a Uniform or Suit that covers them?
			if((target_mob.w_uniform && target_mob.w_uniform.body_parts_covered & genital_location) || (target_mob.wear_suit && target_mob.wear_suit.body_parts_covered & genital_location))
				return TRUE
			//Do they have a Hospital Gown covering them? (The gown has no body_parts_covered so needs its own check)
			if(istype(target_mob.wear_suit, /obj/item/clothing/suit/toggle/labcoat/skyrat/hospitalgown))
				return TRUE

			//Are they wearing an Undershirt?
			if(target_mob.undershirt != "Nude" && !(target_mob.underwear_visibility & UNDERWEAR_HIDE_SHIRT))
				var/datum/sprite_accessory/undershirt/worn_undershirt = GLOB.undershirt_list[target_mob.undershirt]
				//Does this Undershirt cover a relevant slot?
				if(genital_location == CHEST) //(Undershirt always covers chest)
					return TRUE

				else if(genital_location == GROIN && worn_undershirt.hides_groin)
					return TRUE

			//Undershirt didn't cover them, are they wearing Underwear?
			if(target_mob.underwear != "Nude" && !(target_mob.underwear_visibility & UNDERWEAR_HIDE_UNDIES))
				var/datum/sprite_accessory/underwear/worn_underwear = GLOB.underwear_list[target_mob.underwear]
				//Does this Underwear cover a relevant slot?
				if(genital_location == GROIN) //(Underwear always covers groin)
					return TRUE

				else if(genital_location == CHEST && worn_underwear.hides_breasts)
					return TRUE

			//Nothing they're wearing will cover them
			else
				return FALSE

		//If not always shown or hidden by clothes, then it defaults to always hidden
		else
			return TRUE

/datum/sprite_accessory/genital/get_special_render_state(mob/living/carbon/human/human)
	var/obj/item/organ/external/genital/genital = human.get_organ_slot(associated_organ_slot)
	return "[genital?.sprite_suffix]"

/datum/sprite_accessory/genital/get_special_render_colour(mob/living/carbon/human/human, render_state)
	var/obj/item/organ/external/genital/genital = human.get_organ_slot(associated_organ_slot)
	if(genital?.uses_skin_color && human.dna.species.use_skintones)
		return skintone2hex(human.skin_tone)

/datum/sprite_accessory
	var/alt_aroused = FALSE //CIT CODE if this is TRUE, then the genitals will use an alternate icon_state when aroused.
	var/taur_icon //leave null if the genital doesn't have a taur counterpart.
	var/feat_taur //the text string of the dna feature to check for those who want to opt out.
	var/accepted_taurs = STYLE_TAUR_HOOF|STYLE_TAUR_PAW //Types that match with the accessory.
	var/taur_dimension_y = 32
	var/taur_dimension_x = 32
