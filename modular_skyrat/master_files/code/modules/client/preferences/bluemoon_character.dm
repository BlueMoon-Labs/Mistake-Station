/datum/preference/color/character_runechat_color
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "character_runechat_color" //Вот этой хуйнёй мы связываем Бекенд с Фронтендом.

/datum/preference/color/character_runechat_color/apply_to_human(character, value)
	if(value) //Вот в этой хуйне мы используем Валью.
		var/mob/living/carbon/human/D = character
		GLOB.runechat_color_names[D.name] = sanitize_hexcolor(value, 6, TRUE)

/datum/preference/color/character_runechat_color/create_default_value()
	return assoc_to_keys(GLOB.runechat_color_names) //Вот в этой хуйне мы получаем Валью.

/// Shoe Slot Items (Deletes overrided items)
GLOBAL_LIST_INIT(loadout_shirts, generate_loadout_items(/datum/loadout_item/shirt))

/// Shoe Slot Items (Deletes overrided items)
GLOBAL_LIST_INIT(loadout_underwear, generate_loadout_items(/datum/loadout_item/underwear))

/// Shoe Slot Items (Deletes overrided items)
GLOBAL_LIST_INIT(loadout_socks, generate_loadout_items(/datum/loadout_item/socks))

/// Undershirt preference
/datum/preference/choiced/undershirt
	savefile_key = "undershirt"
	savefile_identifier = PREFERENCE_CHARACTER
	main_feature_name = "Undershirt"
	category = PREFERENCE_CATEGORY_CLOTHING
	should_generate_icons = TRUE

/datum/preference/choiced/undershirt/init_possible_values()
	return generate_values_for_underwear(GLOB.loadout_shirts) //Вот в этой хуйне мы получаем Валью.

/datum/preference/choiced/undershirt/apply_to_human(mob/living/carbon/human/target, value)
	target.undershirt = value

/datum/preference/choiced/undershirt/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "undershirt_color"

	return data

/datum/preference/choiced/undershirt/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	var/species_type = preferences.read_preference(/datum/preference/choiced/species)
	var/datum/species/species = new species_type
	return !(NO_UNDERWEAR in species.species_traits)

/// Underwear preference
/datum/preference/choiced/underwear
	savefile_key = "underwear"
	savefile_identifier = PREFERENCE_CHARACTER
	main_feature_name = "Underwear"
	category = PREFERENCE_CATEGORY_CLOTHING
	should_generate_icons = TRUE

/datum/preference/choiced/underwear/init_possible_values()
	return generate_values_for_underwear(GLOB.loadout_underwear) //Вот в этой хуйне мы получаем Валью.

/datum/preference/choiced/underwear/apply_to_human(mob/living/carbon/human/target, value)
	target.underwear = value

/datum/preference/choiced/underwear/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	var/species_type = preferences.read_preference(/datum/preference/choiced/species)
	var/datum/species/species = new species_type
	return !(NO_UNDERWEAR in species.species_traits)

/datum/preference/choiced/underwear/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "underwear_color"

	return data

/// Socks preference
/datum/preference/choiced/socks
	savefile_key = "socks"
	savefile_identifier = PREFERENCE_CHARACTER
	main_feature_name = "Socks"
	category = PREFERENCE_CATEGORY_CLOTHING
	should_generate_icons = TRUE

/datum/preference/choiced/socks/init_possible_values()
	return generate_values_for_underwear(GLOB.socks_list) //Вот в этой хуйне мы получаем Валью.

/datum/preference/choiced/socks/apply_to_human(mob/living/carbon/human/target, value)
	target.socks = value

/datum/preference/choiced/socks/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "socks_color"

	return data

/datum/preference/choiced/socks/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	var/species_type = preferences.read_preference(/datum/preference/choiced/species)
	var/datum/species/species = new species_type
	return !(NO_UNDERWEAR in species.species_traits)
