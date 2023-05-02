/datum/emote/living/cloaker1
	key = "cloaker"
	key_third_person = "cloakers"
	message = "aggressively approaching."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/cloaker1/run_emote(mob/user, params, type_override, intentional)
	if(ishuman(user))
		if(user.nextsoundemote >= world.time)
			to_chat(user, span_warning("Рано! Очень рано!!"))
			SEND_SOUND(user, 'sound/machines/buzz-sigh.ogg')
			return
		user.nextsoundemote = world.time + 30 SECONDS
	playsound(user, 'sound/voice/cloaker1.ogg', 25, 1, -1)
	. = ..()

/datum/emote/living/cloaker2
	key = "cloaker2"
	key_third_person = "cloakers2"
	message = "clearly demands to stop beating yourself."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/cloaker2/run_emote(mob/user, params, type_override, intentional)
	if(ishuman(user))
		if(user.nextsoundemote >= world.time)
			to_chat(user, span_warning("Рано! Очень рано!!"))
			SEND_SOUND(user, 'sound/machines/buzz-sigh.ogg')
			return
		user.nextsoundemote = world.time + 10 SECONDS
	playsound(user, 'sound/voice/cloaker2.ogg', 50, 1, -1)
	. = ..()

/datum/emote/living/cloaker3
	key = "cloaker3"
	key_third_person = "cloakers3"
	message = "explains the reason for the detention."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/cloaker3/run_emote(mob/user, params, type_override, intentional)
	if(ishuman(user))
		if(user.nextsoundemote >= world.time)
			to_chat(user, span_warning("Рано! Очень рано!!"))
			SEND_SOUND(user, 'sound/machines/buzz-sigh.ogg')
			return
		user.nextsoundemote = world.time + 10 SECONDS
	playsound(user, 'sound/voice/cloaker3.ogg', 50, 1, -1)
	. = ..()

/datum/emote/living/cloaker4
	key = "cloaker4"
	key_third_person = "cloakers4"
	message = "approves the Safe Word."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/cloaker4/run_emote(mob/user, params, type_override, intentional)
	if(ishuman(user))
		if(user.nextsoundemote >= world.time)
			to_chat(user, span_warning("Рано! Очень рано!!"))
			SEND_SOUND(user, 'sound/machines/buzz-sigh.ogg')
			return
		user.nextsoundemote = world.time + 10 SECONDS
	playsound(user, 'sound/voice/cloaker4.ogg', 50, 1, -1)
	. = ..()

/datum/emote/living/cluwne
	key = "cluwne"
	key_third_person = "cluwnes"
	message = "clown around; laughs terribly..."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/cluwne/run_emote(mob/user, params, type_override, intentional)
	if(ishuman(user))
		if(user.nextsoundemote >= world.time)
			to_chat(user, span_warning("Рано! Очень рано!!"))
			SEND_SOUND(user, 'sound/machines/buzz-sigh.ogg')
			return
		user.nextsoundemote = world.time + 10 SECONDS
	playsound(user, pick('sound/voice/cluwnelaugh1.ogg', 'sound/voice/cluwnelaugh2.ogg', 'sound/voice/cluwnelaugh3.ogg'), 50, 1, -1)
	. = ..()

/datum/emote/living/suka1
	key = "suka"
	key_third_person = "sukas"
	message = "seems to be very angry."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/suka1/run_emote(mob/user, params, type_override, intentional)
	if(ishuman(user))
		if(user.nextsoundemote >= world.time)
			to_chat(user, span_warning("Рано! Очень рано!!"))
			SEND_SOUND(user, 'sound/machines/buzz-sigh.ogg')
			return
		user.nextsoundemote = world.time + 10 SECONDS
	playsound(user, 'modular_bluemoon/sound/russian/bear_fight.ogg', 50, 1, -1)
	. = ..()


/datum/emote/living/suka2
	key = "suka2"
	key_third_person = "sukas2"
	message = "seems to be very angry."
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/suka2/run_emote(mob/user, params, type_override, intentional)
	if(ishuman(user))
		if(user.nextsoundemote >= world.time)
			to_chat(user, span_warning("Рано! Очень рано!!"))
			SEND_SOUND(user, 'sound/machines/buzz-sigh.ogg')
			return
		user.nextsoundemote = world.time + 10 SECONDS
	playsound(user, 'sound/voice/bear_fight2.ogg', 50, 1, -1)
	. = ..()


/datum/emote/living/jacket1
	key = "jacket"
	key_third_person = "jackets"
	message = "asks: <b>'Do You Know What Time It Is?'</b>"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/jacket1/run_emote(mob/user, params, type_override, intentional)
	if(ishuman(user))
		if(user.nextsoundemote >= world.time)
			to_chat(user, span_warning("Рано! Очень рано!!"))
			SEND_SOUND(user, 'sound/machines/buzz-sigh.ogg')
			return
		user.nextsoundemote = world.time + 10 SECONDS
	playsound(user, 'sound/voice/jacket1.ogg', 75, 1, -1)
	. = ..()

/datum/emote/living/jacket2
	key = "jacket2"
	key_third_person = "jacket2"
	message = "speaking: <b>'Help Is On The Way!'</b>"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/jacket2/run_emote(mob/user, params, type_override, intentional)
	if(ishuman(user))
		if(user.nextsoundemote >= world.time)
			to_chat(user, span_warning("Рано! Очень рано!!"))
			SEND_SOUND(user, 'sound/machines/buzz-sigh.ogg')
			return
		user.nextsoundemote = world.time + 10 SECONDS
	playsound(user, 'sound/voice/jacket2.ogg', 75, 1, -1)
	. = ..()

/datum/emote/living/bulldozer1
	key = "bulldozer"
	key_third_person = "bulldozers"
	message = "yelling: <b>'You're up against the wall and I am the fucking wall!'</b>"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/bulldozer1/run_emote(mob/user, params, type_override, intentional)
	if(ishuman(user))
		if(user.nextsoundemote >= world.time)
			to_chat(user, span_warning("Рано! Очень рано!!"))
			SEND_SOUND(user, 'sound/machines/buzz-sigh.ogg')
			return
		user.nextsoundemote = world.time + 10 SECONDS
	playsound(user, 'sound/voice/bulldozer1.ogg', 75, 1, -1)
	. = ..()

/datum/emote/living/bulldozer2
	key = "bulldozer2"
	key_third_person = "bulldozers2"
	message = "yelling: <b>'Please, stay alive a little bit longer, so I can kill you myself!!'</b>"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/bulldozer2/run_emote(mob/user, params, type_override, intentional)
	if(ishuman(user))
		if(user.nextsoundemote >= world.time)
			to_chat(user, span_warning("Рано! Очень рано!!"))
			SEND_SOUND(user, 'sound/machines/buzz-sigh.ogg')
			return
		user.nextsoundemote = world.time + 10 SECONDS
	playsound(user, 'sound/voice/bulldozer2.ogg', 75, 1, -1)
	. = ..()

/datum/emote/living/cheekybreeky
	key = "cheekybreeky"
	key_third_person = "cheekybreekys"
	message = "yells: <b>'Cheeky Breeky and v Damke!'</b>"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/cheekybreeky/run_emote(mob/user, params, type_override, intentional)
	if(ishuman(user))
		if(user.nextsoundemote >= world.time)
			to_chat(user, span_warning("Рано! Очень рано!!"))
			SEND_SOUND(user, 'sound/machines/buzz-sigh.ogg')
			return
		user.nextsoundemote = world.time + 10 SECONDS
	playsound(user, 'modular_bluemoon/sound/russian/cheekibreeki.ogg', 75, 1, -1)
	. = ..()

/datum/emote/living/anyo
	key = "anyo"
	key_third_person = "anyos"
	message = "lets out a <b>anyo!</b>"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/anyo/run_emote(mob/user, params, type_override, intentional)
	if(ishuman(user))
		if(user.nextsoundemote >= world.time)
			to_chat(user, span_warning("Рано! Очень рано!!"))
			SEND_SOUND(user, 'sound/machines/buzz-sigh.ogg')
			return
		user.nextsoundemote = world.time + 10 SECONDS
	playsound(user, 'sound/voice/anyo.ogg', 75, 1, -1)
	. = ..()

/datum/emote/living/ura1
	key = "ura"
	key_third_person = "ura"
	message = "lets out a <b>ura!</b>"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/ura1/run_emote(mob/user, params, type_override, intentional)
	if(ishuman(user))
		if(user.nextsoundemote >= world.time)
			to_chat(user, span_warning("Рано! Очень рано!!"))
			SEND_SOUND(user, 'sound/machines/buzz-sigh.ogg')
			return
		user.nextsoundemote = world.time + 10 SECONDS
	playsound(user, 'sound/voice/ura1.ogg', 75, 1, -1)
	. = ..()

/datum/emote/living/ura2
	key = "ura2"
	key_third_person = "ura2"
	message = "lets out a <b>mega-ura!</b>"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/ura2/run_emote(mob/user, params, type_override, intentional)
	if(ishuman(user))
		if(user.nextsoundemote >= world.time)
			to_chat(user, span_warning("Рано! Очень рано!!"))
			SEND_SOUND(user, 'sound/machines/buzz-sigh.ogg')
			return
		user.nextsoundemote = world.time + 30 SECONDS
	playsound(user, 'sound/voice/ura2.ogg', 75, 1, -1)
	. = ..()

/datum/emote/living/ura3
	key = "ura3"
	key_third_person = "ura3"
	message = "lets out a <b>mega-ultra-URAAAAAAAAAA!</b>"
	emote_type = EMOTE_AUDIBLE

/datum/emote/living/ura3/run_emote(mob/user, params, type_override, intentional)
	if(ishuman(user))
		if(user.nextsoundemote >= world.time)
			to_chat(user, span_warning("Рано! Очень рано!!"))
			SEND_SOUND(user, 'sound/machines/buzz-sigh.ogg')
			return
		user.nextsoundemote = world.time + 60 SECONDS
	playsound(user, 'sound/voice/ura3.ogg', 75, 1, -1)
	. = ..()

/obj/item/soap/tongue/organic
	name = "tongue"
	desc = "Mlem."
	icon = 'icons/obj/medical/organs/organs.dmi'
	icon_state = "tongue"
	force = 0
	throwforce = 0
	item_flags = DROPDEL | ABSTRACT | HAND_ITEM
	attack_verb_simple = list("licked", "lapped", "mlemmed")
	hitsound = 'sound/effects/footstep/gib_step.ogg'

/datum/emote/living/carbon/lick
	key = "lick"
	key_third_person = "licks"

/datum/emote/living/carbon/lick/run_emote(mob/user)
	. = ..()
	if(user.get_active_held_item())
		to_chat(user, span_warning("Your active hand is full, and therefore you can't lick anything! Don't ask why!"))
		return
	var/obj/item/soap/tongue/organic/licky = new(user)
	if(user.put_in_active_hand(licky))
		to_chat(user, span_notice("You extend your tongue and get ready to lick something."))
	else
		qdel(licky)
