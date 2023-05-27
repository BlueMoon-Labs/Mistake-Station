/datum/round_event_control/anomaly/anomaly_bioscrambler
	name = "Anomaly: Bioscrambler"
	typepath = /datum/round_event/anomaly/anomaly_bioscrambler

	min_players = 10
	max_occurrences = 5
	weight = 20
	description = "This anomaly replaces the limbs of nearby people."
	min_wizard_trigger_potency = 0
	max_wizard_trigger_potency = 2

/datum/round_event/anomaly/anomaly_bioscrambler
	start_when = ANOMALY_START_MEDIUM_TIME
	announce_when = ANOMALY_ANNOUNCE_MEDIUM_TIME
	anomaly_path = /obj/effect/anomaly/bioscrambler

/datum/round_event/anomaly/anomaly_bioscrambler/announce(fake)
	priority_announce("Биологически-Опасная Аномалия, производящая Подмен Конечностей, обнаружена [ANOMALY_ANNOUNCE_MEDIUM_TEXT] [impact_area.name]. Носите биокостюмы или другие средства защиты, чтобы противостоять воздействию. Расчетный период полураспада %9£$T$%F3 года.", "Аномальная Тревога", ANNOUNCER_ANOMALIES) //SKYRAT EDIT CHANGE
