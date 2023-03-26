/datum/preference/choiced/runechat_color
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "character_runechat_color"

/datum/preference/choiced/runechat_color/init_possible_values()
	return assoc_to_keys(GLOB.laugh_types)

/datum/preference/choiced/runechat_color/apply_to_human(mob/living/carbon/human/target, value)
	var/laugh_id = GLOB.laugh_types[value]
	if(laugh_id)
		var/datum/laugh_type/laugh_type = new laugh_id
		target.selected_laugh = laugh_type

/datum/preference/choiced/speech_verb
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "character_speech_verb"

/datum/preference/choiced/speech_verb/init_possible_values()
	return assoc_to_keys(GLOB.laugh_types)

/datum/preference/choiced/speech_verb/apply_to_human(mob/living/carbon/human/target, value)
	var/laugh_id = GLOB.laugh_types[value]
	if(laugh_id)
		var/datum/laugh_type/laugh_type = new laugh_id
		target.selected_laugh = laugh_type

/datum/preference/choiced/character_tongue
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "character_tongue"

/datum/preference/choiced/character_tongue/init_possible_values()
	return assoc_to_keys(GLOB.laugh_types)

/datum/preference/choiced/character_tongue/apply_to_human(mob/living/carbon/human/target, value)
	var/laugh_id = GLOB.laugh_types[value]
	if(laugh_id)
		var/datum/laugh_type/laugh_type = new laugh_id
		target.selected_laugh = laugh_type
