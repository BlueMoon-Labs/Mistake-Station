//For custom items.

// Unless there's a digitigrade version make sure you add supports_variations_flags = NONE to all clothing/under and shoes - Pooj
// Digitigrade stuff is uniform_digi.dmi and digishoes.dmi in icons/mob

/obj/item/clothing/neck/cloak/inferno
	name = "Kiara's Cloak"
	desc = "The design on this seems a little too familiar."
	icon = 'icons/obj/custom.dmi'
	icon_state = "infcloak"
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "infcloak"
	w_class = WEIGHT_CLASS_SMALL
	body_parts_covered = CHEST|GROIN|LEGS|ARMS

/obj/item/clothing/neck/petcollar/inferno
	name = "Kiara's Collar"
	desc = "A soft black collar that seems to stretch to fit whoever wears it."
	icon = 'icons/obj/custom.dmi'
	icon_state = "infcollar"
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "infcollar"
	tagname = null

/obj/item/clothing/accessory/medal/steele
	name = "Insignia Of Steele"
	desc = "An intricate pendant given to those who help a key member of the Steele Corporation."
	icon = 'icons/obj/custom.dmi'
	icon_state = "steele"
	medaltype = "medal-silver"

/obj/item/toy/darksabre
	name = "Kiara's Sabre"
	desc = "This blade looks as dangerous as its owner."
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "darksabre"
	icon_state = "darksabre"
	lefthand_file = 'modular_citadel/icons/mob/inhands/stunsword_left.dmi'
	righthand_file = 'modular_citadel/icons/mob/inhands/stunsword_right.dmi'

/obj/item/toy/darksabre/get_belt_overlay()
	return mutable_appearance('icons/obj/custom.dmi', "darksheath-darksabre")

/obj/item/toy/darksabre/get_worn_belt_overlay(icon_file)
	return mutable_appearance(icon_file, "darksheath-darksabre")

/obj/item/storage/belt/sabre/darksabre
	name = "Ornate Sheathe"
	desc = "An ornate and rather sinister looking sabre sheathe."
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "darksheath"
	icon_state = "darksheath"

/obj/item/lighter/gold
	name = "\improper Engraved Zippo"
	desc = "A shiny and relatively expensive zippo lighter. There's a small etched in verse on the bottom that reads, 'No Gods, No Masters, Only Man.'"
	icon = 'icons/obj/custom.dmi'
	icon_state = "gold_zippo"
	icon_state = "gold_zippo"
	w_class = WEIGHT_CLASS_TINY
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BELT
	heat = 1500
	resistance_flags = FIRE_PROOF
	light_color = LIGHT_COLOR_FIRE

/obj/item/clothing/neck/scarf/zomb
	name = "A special scarf"
	icon = 'icons/obj/custom.dmi'
	icon_state = "zombscarf"
	desc = "A fashionable collar"
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	dog_fashion = /datum/dog_fashion/head

/obj/item/clothing/suit/toggle/labcoat/mad/red
	name = "\improper The Mad's labcoat"
	desc = "An oddly special looking coat."
	icon = 'icons/obj/custom.dmi'
	icon_state = "labred"
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "labred"
	supports_variations_flags = NONE

/obj/item/clothing/suit/toggle/labcoat/labredblack
	name = "Black and Red Coat"
	desc = "An oddly special looking coat."
	icon = 'icons/obj/custom.dmi'
	icon_state = "labredblack"
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "labredblack"
	supports_variations_flags = NONE

/obj/item/toy/plush/carrot
	name = "carrot plushie"
	desc = "While a normal carrot would be good for your eyes, this one seems a bit more for hugging then eating."
	icon = 'icons/obj/hydroponics/harvest.dmi'
	icon_state = "carrot"
	icon_state = "carrot"
	w_class = WEIGHT_CLASS_SMALL
	resistance_flags = FLAMMABLE
	squeak_override = list('sound/items/bikehorn.ogg'= 1)

/obj/item/clothing/neck/cloak/carrot
	name = "carrot cloak"
	desc = "A cloak in the shape and color of a carrot!"
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "carrotcloak"
	icon_state = "carrotcloak"
	w_class = WEIGHT_CLASS_SMALL
	body_parts_covered = CHEST|GROIN|LEGS|ARMS

/obj/item/storage/backpack/satchel/carrot
	name = "carrot satchel"
	desc = "An satchel that is designed to look like an carrot"
	icon = 'icons/obj/custom.dmi'
	icon_state = "satchel_carrot"
	icon_state = "satchel_carrot"
	worn_icon = 'icons/mob/clothing/custom_w.dmi'

/obj/item/storage/backpack/satchel/carrot/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/squeak, list('sound/items/toysqueak1.ogg'=1), 50)

/obj/item/toy/plush/tree
	name = "christmass tree plushie"
	desc = "A festive plush that squeeks when you squeeze it!"
	icon = 'icons/obj/custom.dmi'
	icon_state = "pine_c"
	icon_state = "pine_c"
	w_class = WEIGHT_CLASS_SMALL
	resistance_flags = FLAMMABLE
	squeak_override = list('sound/misc/server-ready.ogg'= 1)

/obj/item/clothing/neck/cloak/festive
	name = "Celebratory Cloak of Morozko"
	desc = " It probably will protect from snow, charcoal or elves."
	icon = 'icons/obj/custom.dmi'
	icon_state = "festive"
	icon_state = "festive"
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	w_class = WEIGHT_CLASS_SMALL
	body_parts_covered = CHEST|GROIN|LEGS|ARMS

/obj/item/clothing/mask/luchador/zigfie
	name = "Alboroto Rosa mask"
	icon = 'icons/obj/custom.dmi'
	icon_state = "lucharzigfie"
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "lucharzigfie"

/obj/item/clothing/head/santa/fluff
	name = "santa's hat"
	desc = "On the first day of christmas my employer gave to me! - From Vlad with Salad"
	icon_state = "santahatnorm"
	icon_state = "that"
	dog_fashion = /datum/dog_fashion/head/santa

//Removed all of the space flags from this suit so it utilizes nothing special.
/obj/item/clothing/suit/space/santa/fluff
	name = "Santa's suit"
	desc = "Festive!"
	icon_state = "santa"
	icon_state = "santa"
	slowdown = 0

/obj/item/clothing/mask/hheart
	name = "The Hollow heart"
	desc = "Sometimes things are too much to hide."
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "hheart"
	icon_state = "hheart"
	flags_inv = HIDEFACE|HIDEFACIALHAIR

/obj/item/clothing/suit/trenchcoat/green
	name = "Reece's Great Coat"
	desc = "You would swear this was in your nightmares after eating too many veggies."
	icon = 'icons/obj/custom.dmi'
	icon_state = "hos-g"
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "hos-g"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS
	supports_variations_flags = NONE

/obj/item/reagent_containers/food/drinks/flask/russian
	name = "russian flask"
	desc = "Every good russian spaceman knows it's a good idea to bring along a couple of pints of whiskey wherever they go."
	icon = 'icons/obj/custom.dmi'
	icon_state = "russianflask"
	volume = 60

/obj/item/clothing/mask/gas/stalker
	name = "S.T.A.L.K.E.R. mask"
	desc = "Smells like reactor four."
	icon = 'icons/obj/custom.dmi'
	icon_state = "stalker"
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "stalker"

/obj/item/clothing/mask/gas/military
	name = "Military Gas Mask"
	desc = "A rare PMC gas mask, one of the very expensive kinds. The inside looks comfortable to wear for a while. The blood red eyes however seem to stare back at you. Creepy."
	icon = 'icons/obj/custom.dmi'
	icon_state = "mgas"
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "mgas"

/obj/item/reagent_containers/food/drinks/flask/steel
	name = "The End"
	desc = "A plain steel flask, sealed by lock and key. The front is inscribed with The End."
	icon = 'icons/obj/custom.dmi'
	icon_state = "steelflask"
	volume = 60

/obj/item/clothing/neck/petcollar/stripe //don't really wear this though please c'mon seriously guys
	name = "collar"
	desc = "It's a collar..."
	icon = 'icons/obj/custom.dmi'
	icon_state = "petcollar-stripe"
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "petcollar-stripe"
	tagname = null

/obj/item/clothing/under/costume/singer/yellow/custom
	name = "bluish performer's outfit"
	desc = "Just looking at this makes you want to sing."
	icon = 'icons/obj/custom.dmi'
	icon_state = "singer"
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "singer"
	alternate_worn_layer = ABOVE_SHOES_LAYER
	can_adjust = 0
	supports_variations_flags = NONE

/obj/item/clothing/shoes/sneakers/pink
	icon = 'icons/obj/custom.dmi'
	icon_state = "pink"
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "pink"
	supports_variations_flags = NONE

/obj/item/clothing/neck/tie/bloodred
	name = "Blood Red Tie"
	desc = "A neosilk clip-on tie. This one has a black S on the tipping and looks rather unique."
	icon = 'icons/obj/custom.dmi'
	icon_state = "bloodredtie"
	worn_icon = 'icons/mob/clothing/custom_w.dmi'

/obj/item/clothing/suit/puffydress
	name = "Puffy Dress"
	desc = "A formal puffy black and red Victorian dress."
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "puffydress"
	icon_state = "puffydress"
	body_parts_covered = CHEST|GROIN|LEGS
	supports_variations_flags = NONE

/obj/item/clothing/suit/vermillion
	name = "vermillion clothing"
	desc = "Some clothing."
	icon_state = "vermillion"
	icon_state = "vermillion"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|HANDS
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	supports_variations_flags = NONE

/obj/item/clothing/under/sweater/black/naomi
	name = "worn black sweater"
	supports_variations_flags = NONE
	desc = "A well-loved sweater, showing signs of several cleanings and re-stitchings. And a few stains. Is that cat fur?"

/obj/item/clothing/neck/petcollar/naomi
	name = "worn pet collar"
	desc = "A pet collar that looks well used."

/obj/item/clothing/neck/cloak/green
	name = "Generic Green Cloak"
	desc = "This cloak doesn't seem too special."
	icon = 'icons/obj/custom.dmi'
	icon_state = "wintergreencloak"
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "wintergreencloak"
	w_class = WEIGHT_CLASS_SMALL
	body_parts_covered = CHEST|GROIN|LEGS|ARMS

/obj/item/clothing/head/paperhat
	name = "paperhat"
	desc = "A piece of paper folded into neat little hat."
	icon_state = "paperhat"
	icon_state = "paperhat"

/obj/item/clothing/suit/toggle/labcoat/mad/techcoat
	name = "Techomancers Labcoat"
	desc = "An oddly special looking coat."
	icon = 'icons/obj/custom.dmi'
	icon_state = "rdcoat"
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "rdcoat"
	supports_variations_flags = NONE

/obj/item/custom/leechjar
	name = "Jar of Leeches"
	desc = "A dubious cure-all. The cork seems to be sealed fairly well, and the glass impossible to break."
	icon = 'icons/obj/custom.dmi'
	icon_state = "leechjar"
	icon_state = "leechjar"

/obj/item/clothing/neck/devilwings
	name = "Strange Wings"
	desc = "These strange wings look like they once attached to something... or someone...? Whatever the case, their presence makes you feel uneasy.."
	icon = 'icons/obj/custom.dmi'
	icon_state = "devilwings"
	worn_icon = 'modular_citadel/icons/mob/clothing/devilwings64x64.dmi'
	icon_state = "devilwings"
	worn_x_dimension = 64
	worn_y_dimension = 34

/obj/item/clothing/neck/flagcape
	name = "Flag Cape"
	desc = "A truly patriotic form of heroic attire."
	icon = 'icons/obj/custom.dmi'
	resistance_flags = FLAMMABLE
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "flagcape"
	icon_state = "flagcape"

/obj/item/clothing/shoes/lucky
	name = "Lucky Jackboots"
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	desc = "Comfy Lucky Jackboots with the word Luck on them."
	icon_state = "luckyjack"
	icon_state = "luckyjack"
	supports_variations_flags = NONE

/obj/item/clothing/under/custom/lunasune
	name = "Divine Robes"
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	desc = "Heavenly robes of the kitsune Luna Pumpkin,you can feel radiance coming from them."
	icon_state = "Divine_robes"
	icon_state = "Divine_robes"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/custom/leoskimpy
	name = "Leon's Skimpy Outfit"
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	desc =  "A rather skimpy outfit."
	icon_state = "shark_cloth"
	icon_state = "shark_cloth"
	supports_variations_flags = NONE

/obj/item/clothing/under/custom/mimeoveralls
	name = "Mime's Overalls"
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	desc = "A less-than-traditional mime's attire, completed by a set of dorky-looking overalls."
	icon_state = "moveralls"
	icon_state = "moveralls"
	supports_variations_flags = NONE

/obj/item/clothing/suit/hooded/cloak/zuliecloak
	name = "Project: Zul-E"
	desc = "A standard version of a prototype cloak given out by Nanotrasen higher ups. It's surprisingly thick and heavy for a cloak despite having most of it's tech stripped. It also comes with a bluespace trinket which calls it's accompanying hat onto the user. A worn inscription on the inside of the cloak reads 'Fleuret' ...the rest is faded away."
	icon_state = "zuliecloak"
	icon_state = "zuliecloak"
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	hoodtype = /obj/item/clothing/head/hooded/cloakhood/zuliecloak
	body_parts_covered = CHEST|ARMS
	slot_flags = ITEM_SLOT_OCLOTHING | ITEM_SLOT_NECK //it's a cloak. it's cosmetic. so why the hell not? what could possibly go wrong?
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/head/hooded/cloakhood/zuliecloak
	name = "NT Special Issue"
	desc = "This hat is unquestionably the best one, bluespaced to and from CentComm. It smells of Fish and Tea with a hint of antagonism"
	icon_state = "zuliecap"
	icon_state = "zuliecap"
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	flags_inv = HIDEEARS|HIDEHAIR
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/suit/blackredgold
	name = "Multicolor Coat"
	desc = "An oddly special looking coat with black, red, and gold"
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "redgoldjacket"
	icon_state = "redgoldjacket"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	supports_variations_flags = NONE

/obj/item/clothing/suit/kimono
	name = "Blue Kimono"
	desc = "A traditional kimono, this one is blue with purple flowers."
	icon_state = "kimono"
	icon_state = "kimono"
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	supports_variations_flags = NONE

/obj/item/clothing/suit/commjacket
	name = "Dusty Commisar's Cloak"
	desc = "An Imperial Commisar's Coat, straight from the frontline of battle, filled with dirt, bulletholes, and dozens of little pockets. Alongside a curious golden eagle sitting on it's left breast, the marking '200th Venoland' is clearly visible on the inner workings of the coat. It certainly holds an imposing flair, however."
	icon_state = "commjacket"
	icon_state = "commjacket"
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	supports_variations_flags = NONE

/obj/item/clothing/under/custom/mw2_russian_para
	name = "Russian Paratrooper Jumper"
	desc = "A Russian made old paratrooper jumpsuit, has many pockets for easy storage of gear from a by gone era. As bulky as it looks, its shockingly light!"
	icon_state = "mw2_russian_para"
	icon_state = "mw2_russian_para"
	alternate_screams = RUSSIAN_SCREAMS
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	supports_variations_flags = NONE

/obj/item/clothing/gloves/longblackgloves
	name = "Luna's Gauntlets"
	desc = "These gloves seem to have a coating of slime fluid on them, you should possibly return them to their rightful owner."
	icon_state = "longblackgloves"
	icon_state = "longblackgloves"
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'

/obj/item/clothing/under/custom/trendy_fit
	name = "Trendy Fitting Clothing"
	desc = "An outfit straight from the boredom of space, its the type of thing only someone trying to entertain themselves on the way to their next destination would wear."
	icon_state = "trendy_fit"
	icon_state = "trendy_fit"
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	supports_variations_flags = NONE

/obj/item/clothing/head/blueberet
	name = "Atmos Beret"
	desc = "A fitted beret designed to be worn by Atmos Techs."
	icon_state = "blueberet"
	icon_state = "blueberet"
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'

/obj/item/clothing/head/flight
	name = "flight goggles"
	desc = "Old style flight goggles with a leather cap attached."
	icon_state = "flight-g"
	icon_state = "flight-g"
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'

/obj/item/clothing/neck/necklace/onion
	name = "Onion Necklace"
	desc = "A string of onions sequenced together to form a necklace."
	icon = 'icons/obj/custom.dmi'
	icon_state = "onion"
	icon_state = "onion"
	worn_icon = 'icons/mob/clothing/custom_w.dmi'

/obj/item/clothing/under/custom/mikubikini
	name = "starlight singer bikini"
	desc = ""
	icon_state = "mikubikini"
	icon_state = "mikubikini"
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/suit/mikujacket
	name = "starlight singer jacket"
	desc = " "
	icon_state = "mikujacket"
	icon_state = "mikujacket"
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	supports_variations_flags = NONE

/obj/item/clothing/head/mikuhair
	name = "starlight singer hair"
	desc = " "
	icon_state = "mikuhair"
	icon_state = "mikuhair"
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	supports_variations_flags = NONE
	flags_inv = HIDEHAIR

/obj/item/clothing/gloves/mikugloves
	name = "starlight singer gloves"
	desc = " "
	icon_state = "mikugloves"
	icon_state = "mikugloves"
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	supports_variations_flags = NONE

/obj/item/clothing/shoes/sneakers/mikuleggings
	name = "starlight singer leggings"
	desc = " "
	icon_state = "mikuleggings"
	icon_state = "mikuleggings"
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	supports_variations_flags = NONE

/obj/item/clothing/neck/cloak/polychromic/polyce
	name = "polychromic embroidered cloak"
	desc = "A fancy cloak embroidered with polychromatic thread in a pattern that reminds one of the wielders of unlimited power."
	icon_state = "polyce"

/obj/item/clothing/under/custom/customskirt
	name = "unzipped atmos skirt"
	desc = "atmos jumpsuit skirt with the top half zipped down and wrapped around the waist."
	icon_state = "atmos_skirt"
	icon_state = "atmos_skirt"
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'

/obj/item/clothing/head/halo
	name = "transdimensional halo"
	desc = "An oddly shaped halo that magically hovers above the head."
	icon_state = "halo"
	icon_state = "halo"
	icon = 'icons/mob/clothing/custom_w.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'

/obj/item/clothing/under/custom/vest
	name = "vest"
	desc = "A vest with a shirt underlining it."
	icon_state = "vest"
	icon_state = "vest"
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION

/obj/item/clothing/suit/custom/exo
	name = "Full ExoFrame"
	desc = "A suit specially designed for those who live and breath hardware with custom tooled robotic manipulators for working with precision even on the most hazardous of jobs."
	icon_state = "frame"
	icon_state = "frame"
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	supports_variations_flags = NONE

/obj/item/clothing/neck/petcollar/donorchoker
	name = "NT Choker"
	desc = "NT property since January 21st,  2562."
	icon = 'icons/obj/custom.dmi'
	icon_state = "choker"
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "choker"

/obj/item/clothing/mask/breath/mmask
	name = "Strange Metal Mask"
	desc = "An odd metal mask."
	icon = 'icons/obj/custom.dmi'
	icon_state = "mmask"
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	icon_state = "mmask"

/obj/item/clothing/under/smaiden
	name = "shrine maiden outfit"
	desc = "Seems questionably tight for religious purposes."
	icon_state = "smaiden"
	icon_state = "smaiden"
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/suit/spacehoodie
	name = "space hoodie"
	desc = "You are not sure why this hoodie exists... but it does and it is comfortable."
	icon_state = "starhoodie"
	icon_state = "starhoodie"
	icon = 'icons/obj/custom.dmi'
	worn_icon = 'icons/mob/clothing/custom_w.dmi'
	supports_variations_flags = NONE

/obj/item/coin/red
	name = "red pokerchip"
	desc = "A red pokerchip."
	icon_state = "c_red"
	icon_state = "c_red"
	icon = 'icons/obj/custom.dmi'

/obj/item/coin/blue
	name = "blue pokerchip"
	desc = "A blue pokerchip."
	icon_state = "c_nlue"
	icon_state = "c_blue"
	icon = 'icons/obj/custom.dmi'

/obj/item/coin/green
	name = "green pokerchip"
	desc = "A green pokerchip."
	icon_state = "c_green"
	icon_state = "c_green"
	icon = 'icons/obj/custom.dmi'

/obj/item/coin/black
	name = "black pokerchip"
	desc = "A black pokerchip."
	icon_state = "c_black"
	icon_state = "c_black"
	icon = 'icons/obj/custom.dmi'

/obj/item/storage/box/pockerchips
	name = "tray of pocker chips"
	desc = "A tray of green, red, blue, and black pocker chips."
	icon_state = "c_holder"
	icon = 'icons/obj/custom.dmi'
	illustration=null

/obj/item/storage/box/pokerchips/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/coin/red(src)
	for(var/i in 1 to 10)
		new /obj/item/coin/blue(src)
	for(var/i in 1 to 15)
		new /obj/item/coin/black(src)
	for(var/i in 1 to 20)
		new /obj/item/coin/green(src)

