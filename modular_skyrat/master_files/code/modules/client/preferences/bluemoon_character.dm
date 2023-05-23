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

/datum/preference/choiced/character_bark
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "character_bark" //Вот этой хуйнёй мы связываем Бекенд с Фронтендом.

/datum/preference/choiced/character_bark/init_possible_values()
	return assoc_to_keys(GLOB.bark_list) //Вот в этой хуйне мы получаем Валью.

/datum/preference/choiced/character_bark/apply_to_human(mob/living/carbon/human/character, value, mob/user)
	var/bark_name = GLOB.bark_list[value]
	if(bark_name)
		var/datum/bark/bark_type = new bark_name
		character.selected_laugh = bark_type
		character.set_bark(bark_name)
		character.vocal_speed = bark_speed
		character.vocal_pitch = bark_pitch
		character.vocal_pitch_range = bark_variance
/datum/preference/numeric/bark_speed
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "bark_speed"
	minimum = BARK_DEFAULT_MINSPEED
	maximum = BARK_DEFAULT_MAXSPEED
	step = 0.1

/datum/preference/numeric/bark_speed/apply_to_human(mob/living/carbon/human/character, value)
	character.vocal_speed = bark_speed
	bark_speed = value

/datum/preference/numeric/bark_speed/create_default_value()
	return round((BARK_DEFAULT_MINSPEED + BARK_DEFAULT_MAXSPEED) / 2)

/datum/preference/numeric/bark_pitch
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "bark_pitch"
	minimum = BARK_DEFAULT_MINPITCH
	maximum = BARK_DEFAULT_MAXPITCH
	step = 0.1

/datum/preference/numeric/bark_pitch/apply_to_human(mob/living/carbon/human/character, value)
	character.vocal_pitch = bark_pitch
	bark_pitch = value

/datum/preference/numeric/bark_pitch/create_default_value()
	return round((BARK_DEFAULT_MINPITCH + BARK_DEFAULT_MAXPITCH) / 2)

/datum/preference/numeric/vocal_pitch_range
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "vocal_pitch_range"
	minimum = BARK_DEFAULT_MINVARY
	maximum = BARK_DEFAULT_MAXVARY
	step = 0.1

/datum/preference/numeric/vocal_pitch_range/apply_to_human(mob/living/carbon/human/character, value)
	character.vocal_pitch_range = bark_variance
	bark_variance = value

/datum/preference/numeric/vocal_pitch_range/create_default_value()
	return 0.2

///datum/preference/bark_sounding
//	// Название звукового Файла.
//	var/name = "Default"
//
//	// Идентификационное Имя звукового Файла.
//	var/id = "Default"
//
//	// Путь звукового файла.
//	var/soundpath
//
//	abstract_type = /datum/preference/sounding
//
///datum/preference/bark_sounding/deserialize(input, datum/preferences/preferences)
//	if(istext(input)) // Sometimes TGUI will return a string instead of a number, so we take that into account.
//		input = text2num(input) // Worst case, it's null, it'll just use create_default_value()
//	return sanitize_float(input, minimum, maximum, step, create_default_value())
//
///datum/preference/bark_sounding/serialize(input)
//	return sanitize_float(input, minimum, maximum, step, create_default_value())
//
///datum/preference/bark_sounding/create_default_value()
//	return rand(minimum, maximum)
//
///datum/preference/bark_sounding/is_valid(value)
//	return isnum(value) && value >= round(minimum, step) && value <= round(maximum, step)
//
///datum/preference/bark_sounding/compile_constant_data()
//	return list(
//		"minimum" = minimum,
//		"maximum" = maximum,
//		"step" = step,
//	)

/datum/preference/toggle/bark_preview
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "bark_preview"

/datum/preference/toggle/bark_preview/apply_to_human(mob/living/carbon/human/character, value, mob/user)
	var/client/parent
	if(SSticker.current_state == GAME_STATE_STARTUP) //Timers don't tick at all during game startup, so let's just give an error message
		to_chat(user, "<span class='warning'>Bark previews can't play during initialization!</span>")
		return
	if(!COOLDOWN_FINISHED(src, bark_previewing))
		return
	if(!parent || !parent.mob)
		return
	COOLDOWN_START(src, bark_previewing, (5 SECONDS))
	var/atom/movable/barkbox = new(get_turf(parent.mob))
	barkbox.set_bark(bark_id)
	var/total_delay
	for(var/i in 1 to (round((32 / bark_speed)) + 1))
		addtimer(CALLBACK(barkbox, /atom/movable/proc/bark, list(parent.mob), 7, 70, BARK_DO_VARY(bark_pitch, bark_variance)), total_delay)
		total_delay += rand(DS2TICKS(bark_speed/4), DS2TICKS(bark_speed/4) + DS2TICKS(bark_speed/4)) TICKS
	QDEL_IN(barkbox, total_delay)

/datum/preference/toggle/bark_preview/create_default_value(mob/living/carbon/human/character, value, mob/user)
	var/client/parent
	if(SSticker.current_state == GAME_STATE_STARTUP) //Timers don't tick at all during game startup, so let's just give an error message
		to_chat(user, "<span class='warning'>Bark previews can't play during initialization!</span>")
		return
	if(!COOLDOWN_FINISHED(src, bark_previewing))
		return
	if(!parent || !parent.mob)
		return
	COOLDOWN_START(src, bark_previewing, (5 SECONDS))
	var/atom/movable/barkbox = new(get_turf(parent.mob))
	barkbox.set_bark(bark_id)
	var/total_delay
	for(var/i in 1 to (round((32 / bark_speed)) + 1))
		addtimer(CALLBACK(barkbox, /atom/movable/proc/bark, list(parent.mob), 7, 70, BARK_DO_VARY(bark_pitch, bark_variance)), total_delay)
		total_delay += rand(DS2TICKS(bark_speed/4), DS2TICKS(bark_speed/4) + DS2TICKS(bark_speed/4)) TICKS
	QDEL_IN(barkbox, total_delay)
	return barkbox.vocal_bark
