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

/datum/preference/choiced/character_bark/apply_to_human(character, value, mob/user)
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

	var/bark_name = GLOB.bark_list[value]
	if(bark_name)
		var/datum/bark/bark_type = new bark_name
		var/mob/living/carbon/human/D = character
		D.selected_laugh = bark_type
		D.set_bark(bark_name)
		D.vocal_speed = bark_speed
		D.vocal_pitch = bark_pitch
		D.vocal_pitch_range = bark_variance
