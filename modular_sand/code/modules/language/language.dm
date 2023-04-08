// And so, people started making weird sounds that only similar ones could understand and do them too.

/datum/language/modular_sand
	icon = 'modular_sand/icons/misc/language.dmi'
	icon_state = null
/datum/language/modular_sand/sergal
	name = LANGUAGE_SERGAL
	desc = "The dominant language of the Sergal homeworld, Tal. It consists of aggressive low-pitched hissing and throaty growling."
	key = "z"
	space_chance = 40
	syllables = list("grr", "gah", "woof", "arf", "arra", "rah", "wor", "sarg")
	icon_state = "cheese"
	flags = TONGUELESS_SPEECH

/datum/language/modular_sand/buggy
	name = "Buggy"
	desc = "A barely comprehensible language, spoken by insectoid-like races."
	key = "f"
	flags = TONGUELESS_SPEECH
	space_chance = 10
	syllables = list(
		"brr", "bzz", "zzz", "zzp", "ziip", "buzz", "rrr", "skrk", "skr", "sk",
		"tsk","pzz", "tzzz", "pzt", "krrr"
	)
	icon_state = "buggy"
	default_priority = 94

/datum/language/modular_sand/dunmeri
	name = "Dunmeri"
	desc = "The native language of the dark elves of lavaland."
	key = "v"
	space_chance = 30
	flags = TONGUELESS_SPEECH
	syllables = list(
		"sid", "n'", "wah", "shad", "i'ag", "ald", "alt",
		"bal", "mora", "chap'", "druhn", "aka", "vehk", "ur",
		"cor", "prus", "dun", "meri", "mer", "dra", "dae",
		"gah", "hla", "isra", "ju", "kena", "khan", "kogo",
		"mola", "mira", "muth", "sera", "nammu", "nchow",
		"oad", "rah", "quada", "sad", "rith", "ser","jo",
		"ra","na","sun", "s'", "wit", "tel","t'","tong"
	)
	icon_state = "dunmeri"
	default_priority = 92

/datum/language/arachnid
	name = "Rachnidian"
	desc = "A language that exploits the multiple limbs of arachnids to do subtle dance like movements to communicate.\
	A proper speaker's movements are quick and sharp enough to make audible whiffs and thumps however, which are intelligible over the radio."
	key = "c"
	flags = NO_STUTTER | LANGUAGE_HIDE_ICON_IF_NOT_UNDERSTOOD
	icon_state = "arachnid"

/datum/language/arachnid/scramble(input)
	. = prob(65) ? "<i>wiff</i>" : "<i>thump</i>"
	. += (copytext(input, length(input)) == "?") ? "?" : "!"
