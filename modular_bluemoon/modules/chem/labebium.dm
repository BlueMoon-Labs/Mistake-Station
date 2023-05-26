/datum/market_item/consumable/labebium
	name = "Бутылочка правды"
	desc = "Заставит поглотившего это познать правду."
	item = /obj/item/storage/pill_bottle/labebium

	stock_min = 1
	stock_max = 5
	price_min = BLACKMARKET_CRATE_VALUE * 250
	price_max = BLACKMARKET_CRATE_VALUE * 550
	availability_prob = 30

/datum/reagent/drug/labebium
	name = "Labebium"
	description = "Пахнет интересно."
	color = "#999922"
	reagent_state = LIQUID
	taste_description = "моча"
	var/obj/effect/client_image_holder/simple/ovoshi/fruit
	var/obj/effect/client_image_holder/simple/water/flood
	var/obj/effect/client_image_holder/simple/ovoshi/statues/statuya
	var/list/trip_types = list("ovoshi", "statues")
	var/current_trip
	var/tripsoundstarted = FALSE
	var/list/shenanigans = list()
	var/list/sounds = list()

/datum/reagent/drug/labebium/on_mob_end_metabolize(mob/living/L)
	stop_shit(L)
	..()

/datum/reagent/drug/labebium/proc/stop_shit(mob/living/carbon/C)
	if(C && C.hud_used)
		if(!HAS_TRAIT(C, TRAIT_DUMB))
			C.adjust_derpspeech(0)
		C.adjust_slurring(0)
		C.hud_used.show_hud(HUD_STYLE_STANDARD)
		C.Paralyze(95)
		DIRECT_OUTPUT(C.client, sound(null))
		var/list/screens = list(C.hud_used.get_plane_master(FLOOR_PLANE), C.hud_used.get_plane_master(GAME_PLANE), C.hud_used.get_plane_master(LIGHTING_PLANE))
		for(var/atom/movable/screen/plane_master/whole_screen in screens)
			animate(whole_screen, transform = matrix(), pixel_x = 0, pixel_y = 0, color = "#ffffff", time = 200, easing = ELASTIC_EASING)
			addtimer(VARSET_CALLBACK(whole_screen, filters, list()), 200) //reset filters
		to_chat(C, "<b><big>Неужели отпустило...</big></b>")

		if(C.client && current_cycle > 100)
		//	if(C.client.get_metabalance() < 0)
			to_chat(C, "<b><big>Эта терапия излечила мой аутизм...</big></b>")
		//		C.client.set_metacoin_count(0)
		//		return

		if(prob(50) && current_cycle > 50)
			spawn(30)
				to_chat(C, "<b><big>Или нет?!</big></b>")
				if(prob(50))
					spawn(50)
						to_chat(C, "<b><big>А-А-А-А-А-А-А-А-А-А-А-А-А-А!</big></b>")
						C.reagents.add_reagent_list(list(/datum/reagent/drug/labebium = 25))

/datum/reagent/drug/labebium/proc/create_flood(mob/living/carbon/C)
	for(var/turf/T in orange(14,C))
		if(prob(66))
			if(!(locate(flood) in T.contents))
				flood = new(T, C)

/datum/reagent/drug/labebium/proc/create_ovosh(mob/living/carbon/C)
	for(var/turf/T in orange(14,C))
		if(prob(23))
			if(!(locate(fruit) in T.contents))
				fruit = new(T, C, phrases = shenanigans)

/datum/reagent/drug/labebium/proc/create_statue(mob/living/carbon/C)
	for(var/turf/T in orange(14,C))
		if(prob(1))
			if(!(locate(statuya) in T.contents))
				statuya = new(T, C, phrases = shenanigans)

/datum/reagent/drug/labebium/on_mob_add(mob/living/L)
	. = ..()
	if (!current_trip)
		current_trip = pick(trip_types)
	var/json_file = file("data/npc_saves/Poly.json")
	if(!fexists(json_file))
		return
	var/list/json = r_json_decode(file2text(json_file))
	shenanigans = json["phrases"]
	return

/datum/reagent/drug/labebium/on_mob_life(mob/living/carbon/H)
	if(!H || !H.hud_used)
		return
	var/high_message
	var/list/screens = list(H.hud_used.get_plane_master(FLOOR_PLANE), H.hud_used.get_plane_master(GAME_PLANE), H.hud_used.get_plane_master(LIGHTING_PLANE))
	switch(current_trip)
		if("ovoshi")
			switch(current_cycle)
				if(1 to 20)
					high_message = "НЕТ, Я НЕ ХОЧУ УМИРАТЬ!!!"
					if(prob(30))
						H.adjust_derpspeech(90)
						H.adjust_slurring(90)
					if(!tripsoundstarted)
						var/sound/sound = sound('modular_bluemoon/sound/lifeweb/cometodaddy.ogg', TRUE)
						sound.environment = 23
						sound.volume = 100
						SEND_SOUND(H.client, sound)
						create_ovosh(H)
						H.hud_used.show_hud(HUD_STYLE_NOHUD)
						H.emote("agony")
						tripsoundstarted = TRUE
				if(31 to INFINITY)
					if(prob(80) && (H.mobility_flags & MOBILITY_MOVE) && !ismovable(H.loc))
						step(H, pick(GLOB.cardinals))
					if(H.client)
						sounds = H.client.SoundQuery()
						for(var/sound/S in sounds)
							if(S.len <= 3)
								PlaySpook(H, S.file, 23)
								sounds = list()
					if(prob(85))
						H.adjust_jitter(35)
						var/rotation = max(min(round(current_cycle/4), 20),360)
						for(var/atom/movable/screen/plane_master/whole_screen in screens)
							if(prob(3))
								var/sound/sound = sound('modular_bluemoon/sound/trip_blast.wav')
								sound.environment = 23
								sound.volume = 100
								SEND_SOUND(H.client, sound)
								H.emote("agony")
								H.overlay_fullscreen("labebium", /atom/movable/screen/fullscreen/labeb, rand(1, 23))
								H.clear_fullscreen("labebium", rand(15, 60))
								new /datum/hallucination/delusion(H, TRUE, duration = 150, skip_nearby = FALSE)
								if(prob(50))
									spawn(30)
										H.overlay_fullscreen("labebium", /atom/movable/screen/fullscreen/labeb, rand(1, 23))
										H.clear_fullscreen("labebium", rand(15, 60))
										H.emote("agony")
										if(prob(50))
											spawn(30)
												H.overlay_fullscreen("labebium", /atom/movable/screen/fullscreen/labeb, rand(1, 23))
												H.clear_fullscreen("labebium", rand(15, 60))
												H.emote("agony")
							if(prob(40))
								H.adjust_stutter(90)
								animate(whole_screen, color = color_matrix_rotate_hue(rand(0, 360)), transform = turn(matrix(), rand(1,rotation)), time = 150, easing = CIRCULAR_EASING)
								animate(transform = turn(matrix(), -rotation), time = 100, easing = BACK_EASING)
							if(prob(13))
								H.adjust_jitter(100)
								whole_screen.filters += filter(type="wave", x=20*rand() - 20, y=20*rand() - 20, size=rand()*0.1, offset=rand()*0.5, flags = WAVE_BOUNDED)
								animate(whole_screen, transform = matrix()*2, time = 40, easing = BOUNCE_EASING)
								addtimer(VARSET_CALLBACK(whole_screen, filters, list()), 1200)
							addtimer(VARSET_CALLBACK(whole_screen, filters, list()), 600)
					high_message = "ГОСПОДИ, НЕТ!!!"
					create_flood(H)
					create_ovosh(H)
		if("statues")
			high_message = "Расслабон..."
			if(!tripsoundstarted)
				var/sound/sound = sound('modular_bluemoon/sound/lifeweb/caves8.ogg', TRUE)
				sound.environment = 23
				sound.volume = 80
				SEND_SOUND(H.client, sound)
				H.hud_used.show_hud(HUD_STYLE_NOHUD)
				tripsoundstarted = TRUE
			if(prob(15))
				for(var/atom/movable/screen/plane_master/whole_screen in screens)
					animate(whole_screen, color = color_matrix_rotate_hue(rand(0, 360)), time = rand(5, 20))
			if(prob(15))
				if(H.client)
					sounds = H.client.SoundQuery()
					for(var/sound/S in sounds)
						if(S.len <= 3)
							PlaySpook(H, S.file, 23)
							sounds = list()
				create_statue(H)
				if(prob(3))
					var/sound/sound = sound('modular_bluemoon/sound/trip_blast.wav')
					sound.environment = 23
					sound.volume = 100
					SEND_SOUND(H.client, sound)
					H.overlay_fullscreen("labebium", /atom/movable/screen/fullscreen/labeb, rand(1, 23))
					H.clear_fullscreen("labebium", rand(15, 60))
	if(prob(10))
		to_chat(H, "\n")
	if(prob(5))
		to_chat(H, "<b><big> ... [readable_corrupted_text(high_message)] ... </big></b>")
	..()

/datum/reagent/drug/labebium/proc/PlaySpook(mob/living/carbon/C, soundfile, environment = 0, vary = TRUE)
	var/sound/sound = sound(soundfile)
	sound.environment = environment //druggy
	sound.volume = rand(25,100)
	if(vary)
		sound.frequency = rand(10000,70000)
	SEND_SOUND(C.client, sound)

/obj/effect/client_image_holder/simple/water
	name = "А-ха!"
	desc = "<big>АААААААААААААААААААААААА!!!</big>"
	image_icon = 'modular_bluemoon/icons/lifeweb/water.dmi'
	image_state = "water0"
	var/triggered_shit = FALSE

/obj/effect/client_image_holder/simple/water/New(turf/location_who_cares_fuck, mob/living/carbon/C, forced = TRUE)
	image_state = "water[rand(0, 7)]"
	. = ..()
	color = pick("#ff00ff", "#ff0000", "#0000ff", "#00ff00", "#00ffff")
	animate(src, color = color_matrix_rotate_hue(rand(0, 360)), time = 200, easing = CIRCULAR_EASING)
	QDEL_IN(src, rand(40, 200))
	var/static/list/loc_connections = list(
		COMSIG_ATOM_ENTERED = PROC_REF(on_entered),
	)
	AddElement(/datum/element/connect_loc, loc_connections)


/obj/effect/client_image_holder/simple/water/proc/on_entered(datum/source, atom/movable/AM)
	SIGNAL_HANDLER
	if(!triggered_shit)
		if(ishuman(AM))
			animate(src, pixel_y = 600, pixel_x = rand(-4, 4), time = 30, easing = BOUNCE_EASING)
			if(prob(10) && AM == who_sees_us)
				var/mob/living/carbon/human/M = AM
				M.adjustOrganLoss(ORGAN_SLOT_BRAIN, 5, 170)
				to_chat(M, "<b>[readable_corrupted_text("ПШШШШШШШШШШШШШШШШШШШ!!!")]</b>")
				var/sound/sound = sound('modular_bluemoon/sound/pshsh.ogg')
				sound.environment = 23
				sound.volume = 20
				SEND_SOUND(M, sound)
				M.Paralyze(25)
			triggered_shit = TRUE


/obj/effect/client_image_holder/simple/ovoshi
	name = "Овощ"
	desc = "М-М-М-М-М-М..!"
	image_icon = 'modular_bluemoon/icons/lifeweb/harvest.dmi'
	image_state = "berrypile"
	var/list/states = list("berrypile", "chilipepper", "eggplant", "soybeans", \
		"plumphelmet", "carrot", "corn", "corn2", "corn_cob", "tomato", "ambrosiavulgaris", \
		"watermelon", "apple", "applestub", "appleold", "lime", "lemon", "poisonberrypile", \
		"grapes", "cabbage", "greengrapes", "orange", "potato", "potato-peeled", "wheat", \
		"ashroom", "cshroom", "eshroom", "fshroom", "amanita", "gshroom", "bshroom", "dshroom", \
		"bezglaznik", "krovnik", "pumpkin", "rice", "goldenapple", "gryab", "curer", "otorvyannik", \
		"glig", "beet", "turnip")

/obj/effect/client_image_holder/simple/ovoshi/New(turf/location_who_cares_fuck, mob/living/carbon/C, forced = TRUE, list/phrases = list())
	image_state = pick(states)
	. = ..()
	SpinAnimation(rand(5, 40), TRUE, prob(50))
	pixel_x = (rand(-16, 16))
	pixel_y = (rand(-16, 16))
	if(prob(1) && C.client)
		if(!phrases.len)
			phrases = list("Мяу", "Кря")
		to_chat(C.client, "<b>[name]</b> <i>говорит</i>, <big>\"[readable_corrupted_text(pick(phrases))]\"</big>")
	animate(src, color = color_matrix_rotate_hue(rand(0, 360)), transform = matrix()*rand(1,3), time = 200, pixel_x = rand(-64,64), pixel_y = rand(-64,64), easing = CIRCULAR_EASING)
	QDEL_IN(src, rand(40, 200))

/obj/effect/client_image_holder/simple/ovoshi/attack_hand(mob/living/carbon/C)
	if(prob(10))
		to_chat(C, "<b>ЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫЫ!!!</b>")
	var/sound/sound = sound(pick('modular_bluemoon/sound/lifeweb/wallhit.ogg', \
		'modular_bluemoon/sound/lifeweb/wallhit2.ogg', 'modular_bluemoon/sound/lifeweb/wallhit3.ogg'))
	sound.environment = 23
	sound.volume = rand(50, 100)
	SEND_SOUND(C.client, sound)
	C.Paralyze(5)
	to_chat(C, "<span class='rose bold'>[prob(50) ? "Получено" : "Потеряно"] [rand(1, 20)] метакэша!</span>")
	. = ..()
	qdel(src)

/obj/effect/client_image_holder/simple/ovoshi/statues
	name = "Мяу"
	desc = "Ого!"
	image_icon = 'modular_bluemoon/icons/lifeweb/crafts.dmi'
	image_state = "statue1"
	states = list("statue1", "statue2", "statue3", "statue4", \
		"statue6", "statue7", "seangel", "seangel2")

/atom/movable/screen/fullscreen/labeb
	icon = 'modular_bluemoon/icons/ruzone_went_up.dmi'
	plane = SPLASHSCREEN_PLANE
	screen_loc = "CENTER-7,BOTTOM"
	icon_state = ""

/obj/item/reagent_containers/pill/labebium
	name = "Таблетка Правды"
	desc = "Выпей меня."
	icon_state = "pill5"
	list_reagents = list(/datum/reagent/drug/labebium = 15)

/obj/item/storage/pill_bottle/labebium
	name = "Бутылочка Правды"
	desc = "Поглощение одной такой таблетки превратит тебя в овоща. Я не шучу."

/obj/item/storage/pill_bottle/labebium/PopulateContents()
	for(var/i in 1 to 7)
		new /obj/item/reagent_containers/pill/labebium(src)

/obj/machinery/chem_dispenser
	name = "Генератор Хим. Реагентов"
	desc = "Создаёт и выдаёт всяческие химические вещеста..."

	emagged_reagents = list(
		/datum/reagent/drug/labebium
	)

/obj/machinery/chem_heater
	name = "Реакционная Камера"
	desc = "Миниатюрная термомашина способная быстро изменять и удерживать температуру состава, а также мануально контролировать баланс ПШ."

/obj/machinery/chem_master
	name = "ХимМастер-3000"
	desc = "Используется для разделения химикатов и их распределения в различных состояниях."

/obj/machinery/reagentgrinder
	name = "Миксер"
	desc = "Лучшая модель крутейшего Миксера от BlenderTech. Замиксуется? Давайте узнаем!"
