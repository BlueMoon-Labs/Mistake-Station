/obj/item/clothing/suit/armor/blastwave
	name = "blastwave trenchcoat"
	desc = "A generic trenchcoat of the boring wars."
	icon = 'modular_bluemoon/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_bluemoon/icons/mob/clothing/suit.dmi'
	icon_state = "blastwave_suit"
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	cold_protection = CHEST|GROIN|LEGS|ARMS
	heat_protection = CHEST|GROIN|LEGS|ARMS
	strip_delay = 80
	unique_reskin = list(
		"Default (Purple)" = list(
			RESKIN_ICON_STATE = "blastwave_suit",
			RESKIN_WORN_ICON_STATE = "blastwave_suit"
		),
		"Red" = list(
			RESKIN_ICON_STATE = "blastwave_suit_r",
			RESKIN_WORN_ICON_STATE = "blastwave_suit_r"
		),
		"Green" = list(
			RESKIN_ICON_STATE = "blastwave_suit_g",
			RESKIN_WORN_ICON_STATE = "blastwave_suit_g"
		),
		"Blue" = list(
			RESKIN_ICON_STATE = "blastwave_suit_b",
			RESKIN_WORN_ICON_STATE = "blastwave_suit_b"
		),
		"Yellow" = list(
			RESKIN_ICON_STATE = "blastwave_suit_y",
			RESKIN_WORN_ICON_STATE = "blastwave_suit_y"
		)
	)
