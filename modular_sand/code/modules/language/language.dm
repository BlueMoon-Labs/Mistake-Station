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

/datum/language/modular_sand/calcic
	name = "Calcic"
	desc = "The disjointed and staccato language of plasmamen. Also understood by skeletons."
	key = "q"
	flags = TONGUELESS_SPEECH
	space_chance = 10
	syllables = list(
		"k", "ck", "ack", "ick", "cl", "tk", "sk", "isk", "tak",
		"kl", "hs", "ss", "ks", "lk", "dk", "gk", "ka", "ska", "la", "pk",
    	"wk", "ak", "ik", "ip", "ski", "bk", "kb", "ta", "is", "it", "li", "di",
    	"ds", "ya", "sck", "crk", "hs", "ws", "mk", "aaa", "skraa", "skee", "hss",
		"raa", "klk", "tk", "stk", "clk"
	)
	icon_state = "calcic"
	default_priority = 89

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

/datum/language/modular_sand/moffic
	name = "Moffic"
	desc = "The language of the Mothpeople borders on complete unintelligibility."
	key = "m"
	flags = TONGUELESS_SPEECH
	space_chance = 10
	syllables = list(
		"år", "i", "går", "sek", "mo", "ff", "ok", "gj", "ø", "gå", "la", "le",
		"lit", "ygg", "van", "dår", "næ", "møt", "idd", "hvo", "ja", "på", "han",
		"så", "ån", "det", "att", "nå", "gö", "bra", "int", "tyc", "om", "när",
		"två", "må", "dag", "sjä", "vii", "vuo", "eil", "tun", "käyt", "teh", "vä",
		"hei", "huo", "suo", "ää", "ten", "ja", "heu", "stu", "uhr", "kön", "we", "hön"
	)
	icon_state = "moffic"
	default_priority = 93

/datum/language/modular_sand/shadowtongue
	name = "Shadowtongue"
	desc = "What a grand and intoxicating innocence."
	key = "x"
	flags = TONGUELESS_SPEECH
	space_chance = 50
	syllables = list(
		"er", "sint", "en", "et", "nor", "bahr", "sint", "un", "ku'elm", "lakor", "eri",
    	"noj", "dashilu", "as", "ot", "lih", "morh", "ghinu", "kin", "sha", "marik", "jibu",
    	"sudas", "fut", "kol", "bivi", "pohim", "devohr", "ru", "huirf", "neiris", "sut",
    	"devehr", "iru", "gher", "gan", "ujil", "lacor", "bahris", "ghar", "alnef", "wah",
    	"khurdhar", "bar", "et", "ilu", "dash", "diru", "noj", "de", "damjulan", "luvahr",
    	"telshahr", "tifur", "enhi", "am", "bahr", "nei", "neibahri", "n'chow", "n'wah",
    	"s'wit", "b'vehk", "f'lah", "muth", "sera", "sedura", "bal", "dun"
	)
	icon_state = "shadowtongue"
	default_priority = 95

/datum/language/modular_sand/solcommon
	name = "Sol Common"
	desc = "The old Earthen language of Latin, re-adopted into the modern day to offer more identity to Humanity."
	key = "p"
	space_chance = 30
	default_priority = 96
	flags = TONGUELESS_SPEECH
	syllables = list(
		"sed", "ut", "unde", "omnis", "iste", "natus", "sit", "vol", "totam", "rem", "eaque", "ipsa", "quae", "ab", "illo",
		"et", "quasi", "dicta", "sunt", "enim", "ipsam", "aut", "odit", "qui", "porro", "amet", "que",
		"eius", "modi", "inci","ad", "vel", "eum", "iure", "hic", "pa", "mit", "dis", "du", "di", "tol", "mi"
	)
	icon_state = "solcommon"
