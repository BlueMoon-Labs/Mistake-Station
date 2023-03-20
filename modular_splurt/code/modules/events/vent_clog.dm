/datum/round_event_control/scrubber_overflow/cope_and_seethe
	name = "Copium Flood"
	typepath = /datum/round_event/scrubber_overflow/cope_and_seethe
	max_occurrences = 0

/datum/round_event/scrubber_overflow/cope_and_seethe/announce()
	priority_announce("Мы обнаружили высокий уровень Агрессии на станции. Для борьбы с этим мы будем использовать массовое количество копиума. Пожалуйста, держитесь подальше от вентиляционных отверстий, пока давление не выровняется.", "Центральное Командование")

/datum/round_event/scrubber_overflow/cope_and_seethe
	safer_chems = list(
		/datum/reagent/drug/copium
	)

/datum/round_event/scrubber_overflow/cope_and_seethe/start()
	for (var/obj/machinery/atmospherics/components/unary/vent as anything in scrubbers)
		if (vent && vent.loc && !vent.welded)
			var/datum/reagents/R = new/datum/reagents(1000)
			R.my_atom = vent
			R.add_reagent(/datum/reagent/drug/copium, 5)

			R.create_foam(/datum/effect_system/fluid_spread/smoke, reagents_amount)

		CHECK_TICK

/datum/round_event_control/scrubber_overflow/female
	name = "Clogged Vents: Girlcum"
	typepath = /datum/round_event/scrubber_overflow/female
	max_occurrences = 1

/datum/round_event/scrubber_overflow/female
	safer_chems = list(
		/datum/reagent/consumable/semen/femcum
	)
	reagents_amount = 100

/datum/round_event/scrubber_overflow/female/announce()
	priority_announce("Сеть скрубберов испытывает противодавление из-за откуда-то взявшегося в них СКВИРТА. Может произойти некоторое разбрызгивание содержимого.", "Атмосферная Тревога")

/datum/round_event/scrubber_overflow/female/start()
	for(var/obj/machinery/atmospherics/components/unary/vent as anything in scrubbers)
		if(vent && vent.loc && !vent.welded)
			var/datum/reagents/R = new/datum/reagents(1000)
			R.my_atom = vent
			R.add_reagent(/datum/reagent/consumable/semen/femcum, reagents_amount)

			R.create_foam(/datum/effect_system/fluid_spread/foam/short, reagents_amount)

		CHECK_TICK

/datum/round_event_control/scrubber_overflow/male
	name = "Clogged Vents: Semen"
	typepath = /datum/round_event/scrubber_overflow/male
	max_occurrences = 1

/datum/round_event/scrubber_overflow/male
	safer_chems = list(
		/datum/reagent/consumable/semen
	)
	reagents_amount = 100

/datum/round_event/scrubber_overflow/male/announce()
	priority_announce("Сеть скрубберов испытывает противодавление из-за откуда-то взявшегося в них СЕМЕНИ. Может произойти некоторое разбрызгивание содержимого.", "Атмосферная Тревога")

/datum/round_event/scrubber_overflow/male/start()
	for(var/obj/machinery/atmospherics/components/unary/vent as anything in scrubbers)
		if(vent && vent.loc && !vent.welded)
			var/datum/reagents/R = new/datum/reagents(1000)
			R.my_atom = vent
			R.add_reagent(/datum/reagent/consumable/semen, reagents_amount)

			R.create_foam(/datum/effect_system/fluid_spread/foam/short, reagents_amount)

		CHECK_TICK

/datum/round_event_control/scrubber_overflow/crocin
	name = "Aphrodisiac Flood"
	typepath = /datum/round_event/scrubber_overflow/crocin
	weight = 10
	max_occurrences = 1

/datum/round_event/scrubber_overflow/crocin
	safer_chems = list(
		/datum/reagent/drug/aphrodisiac
	)
	reagents_amount = 100
	var/reagent = /datum/reagent/drug/aphrodisiac

/datum/round_event/scrubber_overflow/crocin/announce()
	priority_announce("Мы обнаружили снижение уровня похоти на станции. Чтобы исправить это, мы будем использовать большое количество легкого афродизиака. Пожалуйста, держитесь подальше от вентиляционных отверстий, пока розовый газ не рассеется.", "Центральное Командование")

/datum/round_event/scrubber_overflow/crocin/start()
	for(var/obj/machinery/atmospherics/components/unary/vent as anything in scrubbers)
		if(vent && vent.loc && !vent.welded)
			var/datum/reagents/R = new(1000)
			R.my_atom = vent
			R.add_reagent(reagent, reagents_amount)

			R.create_foam(/datum/effect_system/fluid_spread/smoke, reagents_amount)

		CHECK_TICK

/datum/round_event_control/scrubber_overflow/crocin/hexacrocin
	name = "Strong Aphrodisiac Flood"
	typepath = /datum/round_event/scrubber_overflow/crocin/hexacrocin
	max_occurrences = 0 //Only adminspawn because this one causes brain damage

/datum/round_event/scrubber_overflow/crocin/hexacrocin
	safer_chems = list(
		/datum/reagent/drug/aphrodisiacplus
	)
	reagent = /datum/reagent/drug/aphrodisiacplus

/datum/round_event/scrubber_overflow/crocin/hexacrocin/announce()
	priority_announce("Мы обнаружили опасно низкий уровень похоти на станции. Чтобы исправить это, мы будем использовать большое количество сильных афродизиаков. Пожалуйста, не подходите к вентиляционным отверстиям, пока розовый газ не рассеется, если вы хотите избежать повреждения мозга.", "Центральное Командование")
