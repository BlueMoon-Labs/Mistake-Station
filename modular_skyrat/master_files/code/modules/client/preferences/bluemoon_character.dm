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

/datum/preference/choiced/character_speech_verb
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "character_speech_verb" //Вот этой хуйнёй мы связываем Бекенд с Фронтендом.

//LANGUAGE CHARACTER CUSTOMIZATION
GLOBAL_LIST_INIT(speech_verbs, list("default", "says", "gibbers", "states", "chitters", "chimpers", "declares", "bellows", "buzzes" ,"beeps", "chirps", "clicks", "hisses" ,"poofs" , "puffs", "rattles", "mewls" ,"barks", "blorbles", "squeaks", "squawks", "flutters", "warbles", "caws", "gekkers", "clucks", "mumbles", "crackles", "rawrs", "merps", "roars"))

/mob/living/carbon/human/say_mod(input, list/message_mods = list(), atom/target)
	var/mob/M
	if(GLOB.speech_verbs[M.name])
		M.verb_say = GLOB.speech_verbs[M.name]
	else if(ismob(M) && M.name == M.real_name)
		var/per_verb = M.client.prefs.custom_speech_verb
		GLOB.speech_verbs[M.name] = per_verb
		M.verb_say = per_verb

	return ..()

/datum/preference/choiced/character_speech_verb/init_possible_values()
	return assoc_to_keys(GLOB.speech_verbs) //Вот в этой хуйне мы получаем Валью.

/datum/preference/choiced/character_speech_verb/apply_to_human(character, value)
	if(value) //Вот в этой хуйне мы используем Валью.
		var/mob/living/carbon/human/D = character
		GLOB.speech_verbs[D.name] = sanitize_inlist(custom_speech_verb, GLOB.speech_verbs, "default")
