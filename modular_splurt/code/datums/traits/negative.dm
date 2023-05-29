// masked_mook moved to neutral

//well-trained moved to neutral

/datum/quirk/dumb4cum
	name = "Спермоприёмник"
	desc = "По той или иной причине, вы помешаны на сперме. Её тепло, запах... вкус... делают счастливее."
	value = 0
	mob_trait = TRAIT_DUMB_CUM
	gain_text = span_notice("Неожиданно вам захотелось ощутить семя внутри себя!")
	lose_text = span_notice("Всё равно сперма была не такой уж и вкусной...")
	medical_record_text = "У пациента навязчивая одержимость семенными жидкостями."
	icon = FA_ICON_QUESTION_CIRCLE

	var/timer
	var/timer_trigger = 15 MINUTES

/datum/quirk/dumb4cum/add()
	// Set timer
	timer = addtimer(CALLBACK(src, .proc/crave), timer_trigger, TIMER_STOPPABLE)

/datum/quirk/dumb4cum/remove()
	// Remove status trait
	REMOVE_TRAIT(quirk_holder, TRAIT_DUMB_CUM_CRAVE, DUMB_CUM_TRAIT)

	// Remove penalty traits
	REMOVE_TRAIT(quirk_holder, TRAIT_ILLITERATE, DUMB_CUM_TRAIT)
	REMOVE_TRAIT(quirk_holder, TRAIT_DUMB, DUMB_CUM_TRAIT)
	REMOVE_TRAIT(quirk_holder, TRAIT_PACIFISM, DUMB_CUM_TRAIT)

	// Remove mood event
	SEND_SIGNAL(quirk_holder, COMSIG_CLEAR_MOOD_EVENT, QMOOD_DUMB_CUM)

	// Remove timer
	deltimer(timer)

/datum/quirk/dumb4cum/proc/crave()
	// Check if conscious
	if(quirk_holder.stat == CONSCIOUS)
		// Display emote
		quirk_holder.emote("sigh")

		// Define list of phrases
		var/list/trigger_phrases = list(
										"У тебя урчит в животе, а на ум приходит сперма.",\
										"Уф-ф, сейчас бы не помешало раздобыть спермы...",\
										"Было бы неплохо сейчас потребить спермы!",\
										"Ты начинаешь тосковать по сперме..."
									  )
		// Alert user in chat
		to_chat(quirk_holder, span_love("[pick(trigger_phrases)]"))

	// Add active status trait
	ADD_TRAIT(quirk_holder, TRAIT_DUMB_CUM_CRAVE, DUMB_CUM_TRAIT)

	// Add illiterate, dumb, and pacifist
	ADD_TRAIT(quirk_holder, TRAIT_ILLITERATE, DUMB_CUM_TRAIT)
	ADD_TRAIT(quirk_holder, TRAIT_DUMB, DUMB_CUM_TRAIT)
	ADD_TRAIT(quirk_holder, TRAIT_PACIFISM, DUMB_CUM_TRAIT)

	// Add negative mood effect
	SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, QMOOD_DUMB_CUM, /datum/mood_event/cum_craving)

/datum/quirk/dumb4cum/proc/uncrave()
	// Remove active status trait
	REMOVE_TRAIT(quirk_holder, TRAIT_DUMB_CUM_CRAVE, DUMB_CUM_TRAIT)

	// Remove penalty traits
	REMOVE_TRAIT(quirk_holder, TRAIT_ILLITERATE, DUMB_CUM_TRAIT)
	REMOVE_TRAIT(quirk_holder, TRAIT_DUMB, DUMB_CUM_TRAIT)
	REMOVE_TRAIT(quirk_holder, TRAIT_PACIFISM, DUMB_CUM_TRAIT)

	// Add positive mood event
	SEND_SIGNAL(quirk_holder, COMSIG_ADD_MOOD_EVENT, QMOOD_DUMB_CUM, /datum/mood_event/cum_stuffed)

	// Remove timer
	deltimer(timer)
	timer = null

	// Add new timer
	timer = addtimer(CALLBACK(src, .proc/crave), timer_trigger, TIMER_STOPPABLE)

// Small issue with this. If the quirk holder has NO_HUNGER or NO_THIRST, this trait can still be taken and they will still get the benefits of it.
// It's unlikely that someone will be both, especially at round start, but vampirism makes me wary of having these separate.
/datum/quirk/hungry
	name = "Бездонный Желудок"
	desc = "В вас быстрее просыпаются голод и жажда. Необходимо есть и пить в два раза больше."
	value = -1
	gain_text = "<span class='danger'>Вы хотите есть и пить чаще.</span>"
	lose_text = "<span class='notice'>Жир идёт на спад.</span>"
	medical_record_text = "Пациенту требуется вдвое большее количество еды по сравнению с типичным представителем его вида."
	icon = FA_ICON_QUESTION_CIRCLE

/datum/quirk/hungry/add()
	var/mob/living/carbon/human/H = quirk_holder
	var/datum/physiology/P = H.physiology
	P.hunger_mod *= 2
	P.thirst_mod *= 2

/datum/quirk/hungry/remove()
	var/mob/living/carbon/human/H = quirk_holder
	if(H)
		var/datum/physiology/P = H.physiology
		P.hunger_mod /= 2
		P.thirst_mod /= 2
