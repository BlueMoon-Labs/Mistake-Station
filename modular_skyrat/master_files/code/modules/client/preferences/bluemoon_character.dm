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
