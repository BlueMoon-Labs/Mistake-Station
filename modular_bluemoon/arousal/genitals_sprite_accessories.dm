/datum/sprite_accessory
	var/alt_aroused = FALSE //CIT CODE if this is TRUE, then the genitals will use an alternate icon_state when aroused.
	var/taur_icon //leave null if the genital doesn't have a taur counterpart.
	var/accepted_taurs = STYLE_TAUR_HOOF|STYLE_TAUR_PAW //Types that match with the accessory.
	var/feat_taur //the text string of the dna feature to check for those who want to opt out.
	var/taur_dimension_y = 32
	var/taur_dimension_x = 32


//DICKS,COCKS,PENISES,WHATEVER YOU WANT TO CALL THEM
/datum/sprite_accessory/penis
	icon = 'icons/obj/genitals/penis_onmob.dmi'
	name = "penis"			//the preview name of the accessory
	color_src = "cock_color"
	alt_aroused = TRUE
	feat_taur = "cock_taur"

/datum/sprite_accessory/penis/human
	icon_state = "human"
	name = "человеческий"

/datum/sprite_accessory/penis/knotted
	icon_state = "knotted"
	name = "узловатый"
	taur_icon = 'icons/obj/genitals/taur_penis_onmob.dmi'
	taur_dimension_x = 64

/datum/sprite_accessory/penis/flared
	icon_state = "flared"
	name = "утолщённый"
	taur_icon = 'icons/obj/genitals/taur_penis_onmob.dmi'
	taur_dimension_x = 64

/datum/sprite_accessory/penis/barbknot
	icon_state = "barbknot"
	name = "колючий узловатый"

/datum/sprite_accessory/penis/tapered
	icon_state = "tapered"
	name = "конусоподобный"
	taur_icon = 'icons/obj/genitals/taur_penis_onmob.dmi'
	taur_dimension_x = 64

/datum/sprite_accessory/penis/tentacle
	icon_state = "tentacle"
	name = "тентяклевидный"

/datum/sprite_accessory/penis/hemi
	icon_state = "hemi"
	name = "двойной"

/datum/sprite_accessory/penis/hemiknot
	icon_state = "hemiknot"
	name = "двойной узловатый"

//Testicles
/datum/sprite_accessory/testicles
	icon = 'icons/obj/genitals/testicles_onmob.dmi'
	icon_state = "testicle"
	name = "яйца"		//the preview name of the accessory
	color_src = "balls_color"

/datum/sprite_accessory/testicles/single
	icon_state = "single"
	name = "одинарные" //Single as "single pair", for clarity.

/datum/sprite_accessory/testicles/hidden
	icon_state = "hidden"
	name = "скрытые" //not sure why these were missing, but I'm pretty certain people might want these.

//Vaginas
/datum/sprite_accessory/vagina
	icon = 'icons/obj/genitals/vagina_onmob.dmi'
	name = "вагина"
	color_src = "vag_color"
	alt_aroused = TRUE

/datum/sprite_accessory/vagina/human
	icon_state = "human"
	name = "человеческая"

/datum/sprite_accessory/vagina/tentacles
	icon_state = "tentacle"
	name = "тентяклевидная"

/datum/sprite_accessory/vagina/dentata
	icon_state = "dentata"
	name = "зубастая"

/datum/sprite_accessory/vagina/hairy
	icon_state = "hairy"
	name = "волосатая"
	alt_aroused = FALSE

/datum/sprite_accessory/vagina/spade
	icon_state = "spade"
	name = "лопатковидная"
	alt_aroused = FALSE

/datum/sprite_accessory/vagina/furred
	icon_state = "furred"
	name = "мохнатая"
	alt_aroused = FALSE

/datum/sprite_accessory/vagina/gaping
	icon_state = "gaping"
	name = "приоткрытая"

//BREASTS BE HERE
/datum/sprite_accessory/breasts
	icon = 'icons/obj/genitals/breasts_onmob.dmi'
	name = "breasts"
	color_src = "breasts_color"

/datum/sprite_accessory/breasts/pair
	icon_state = "pair"
	name = "Pair"

/datum/sprite_accessory/breasts/quad
	icon_state = "quad"
	name = "Quad"

/datum/sprite_accessory/breasts/sextuple
	icon_state = "sextuple"
	name = "Sextuple"

//BUTT BE HERE
/datum/sprite_accessory/butt
	icon = 'icons/obj/genitals/butt_onmob.dmi'
	icon_state = "butt"
	name = "butt"
	color_src = "butt_color"

//there literally shouldn't be any other ass types besides one because that'd be weird, this is just here to keep things consistent for the genital system.
/datum/sprite_accessory/butt/pair
	icon_state = "pair"
	name = "Pair"
