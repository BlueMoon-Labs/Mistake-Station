/datum/language/german
	name = "Katzenjammer"
	desc = "Modernised version of the German language, combined with Austrian, Swiss, Neo Berlin and many other various dialects. Usually used by the inhabitants of the Earth."
	icon = 'modular_bluemoon/modules/kovac_modules/languages/icons/german.dmi'
	icon_state = null
	key = "g"
	space_chance = 70
	default_priority = 98
	flags = TONGUELESS_SPEECH
	syllables = list("das leben", "warten", "die frau", "das jahr", "weit", "alles", "platz", "du", "aus", "uber", "aber", "yat", "übrigens", "hier", \
					 "durch", "neu", "luftkuss", "freudentränen", "frühlingsgefühle", "verzehren", "geborgenheit", "sonne", "mutter", "engel", "tier", "mein", "herz", "brennt", \
					 "zeit", "gut", "eins", "rosenrot", "ausländer", "angst", "haifisch", "bück", "dich", "adieu", "onhe", "reise", "herzeleid", \
					 "seemann", "weisses", "fleisch", "riechst", "bist", "zerstören", "frühling", "führe", "halt", "donaukinder", "haifisch")
	icon_state = "german"

/obj/item/encryptionkey/german
	name = "\improper Katzenjammer translation key"
	desc = "An encryption key that automatically encodes Katzenjammer heard through the radio into common."
	translated_language = /datum/language/german
