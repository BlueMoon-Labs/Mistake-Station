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

//LANGUAGE CHARACTER CUSTOMIZATION
GLOBAL_LIST_INIT(speech_verbs, list("default", "says", "gibbers", "states", "chitters", "chimpers", "declares", "bellows", "buzzes" ,"beeps", "chirps", "clicks", "hisses" ,"poofs" , "puffs", "rattles", "mewls" ,"barks", "blorbles", "squeaks", "squawks", "flutters", "warbles", "caws", "gekkers", "clucks", "mumbles", "crackles", "rawrs", "merps", "roars"))

/datum/preference/choiced/speech_verb/init_possible_values()
	return assoc_to_keys(GLOB.speech_verbs)

/datum/preference/choiced/speech_verb/apply_to_human(mob/living/carbon/human/character)
	var/custom_speech_verb = "default"
	if(custom_speech_verb != "default")
		character.dna.species.say_mod = custom_speech_verb

	custom_speech_verb = sanitize_inlist(custom_speech_verb, GLOB.speech_verbs, "default")

	for(var/selected_custom_speech_verb as anything in GLOB.speech_verbs)
		if(selected_custom_speech_verb)
			custom_speech_verb = selected_custom_speech_verb
