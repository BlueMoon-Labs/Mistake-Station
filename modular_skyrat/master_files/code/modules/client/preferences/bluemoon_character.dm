/datum/preference/choiced/character_runechat_color
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "character_runechat_color"

/datum/preference/choiced/character_runechat_color/init_possible_values(value)
	return "#ebe2e2"

/datum/preference/choiced/character_runechat_color/apply_to_human(atom/character, value)
	if(value)
		if(is_color_dark(value) > 200)
			character.chat_color = sanitize_hexcolor(value, 6, TRUE)
		else
			to_chat(character, "<span class='danger'>Invalid color. Your color is not bright enough.</span>")

/datum/preference/choiced/character_speech_verb
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "character_speech_verb"

//LANGUAGE CHARACTER CUSTOMIZATION
GLOBAL_LIST_INIT(speech_verbs, list("default", "says", "gibbers", "states", "chitters", "chimpers", "declares", "bellows", "buzzes" ,"beeps", "chirps", "clicks", "hisses" ,"poofs" , "puffs", "rattles", "mewls" ,"barks", "blorbles", "squeaks", "squawks", "flutters", "warbles", "caws", "gekkers", "clucks", "mumbles", "crackles", "rawrs", "merps", "roars"))

/datum/preference/choiced/character_speech_verb/init_possible_values()
	return assoc_to_keys(GLOB.speech_verbs)

/datum/preference/choiced/character_speech_verb/apply_to_human(mob/living/carbon/human/character, value)
	character.dna.species.say_mod = value
