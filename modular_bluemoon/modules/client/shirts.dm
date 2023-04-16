GLOBAL_LIST_INIT(loadout_shirts, generate_loadout_items(/datum/loadout_item/shirt))

/datum/loadout_item/shirt
	category = LOADOUT_SUBCATEGORY_SHIRT

/datum/loadout_item/shirt/pre_equip_item(datum/outfit/outfit, datum/outfit/outfit_important_for_life, mob/living/carbon/human/equipper, visuals_only = FALSE)
	if(initial(outfit_important_for_life.shirt))
		.. ()
		return TRUE

/datum/loadout_item/shirt/insert_path_into_outfit(datum/outfit/outfit, mob/living/carbon/human/equipper, visuals_only = FALSE, override_items = LOADOUT_OVERRIDE_BACKPACK)
	if(override_items == LOADOUT_OVERRIDE_BACKPACK && !visuals_only)
		if(outfit.shirt)
			LAZYADD(outfit.backpack_contents, outfit.shirt)
		outfit.shirt = item_path
	else
		outfit.shirt = item_path

/datum/loadout_item/shirt/plain
	name = "Shirt"
	category = LOADOUT_CATEGORY_GENERAL_UNDER
	item_path = /obj/item/clothing/underwear/shirt

/datum/loadout_item/shirt/alien
	name = "Postal Dude Shirt"
	item_path = /obj/item/clothing/underwear/shirt/alien

/datum/loadout_item/shirt/band
	name = "Band Shirt"
	item_path = /obj/item/clothing/underwear/shirt/band

/datum/loadout_item/shirt/bee
	name = "Bee Shirt"
	item_path = /obj/item/clothing/underwear/shirt/bee

/datum/loadout_item/shirt/bluejersey
	name = "Blue Jersey Shirt"
	item_path = /obj/item/clothing/underwear/shirt/bluejersey

/datum/loadout_item/shirt/bowlingcyan
	name = "Cyan Bowling Shirt"
	item_path = /obj/item/clothing/underwear/shirt/bowling/cyan

/datum/loadout_item/shirt/bowlinggrey
	name = "Grey Bowling Shirt"
	item_path = /obj/item/clothing/underwear/shirt/bowling/grey

/datum/loadout_item/shirt/bowlingpink
	name = "Pink Bowling Shirt"
	item_path = /obj/item/clothing/underwear/shirt/bowling/pink

/datum/loadout_item/shirt/bowlingred
	name = "Red Bowling Shirt"
	item_path = /obj/item/clothing/underwear/shirt/bowling

/datum/loadout_item/shirt/bra
	name = "Bra"
	item_path = /obj/item/clothing/underwear/shirt/bra

/datum/loadout_item/shirt/bra/alt
	name = "Bra (alt)"
	item_path = /obj/item/clothing/underwear/shirt/bra/alt

/datum/loadout_item/shirt/bra/babydoll
	name = "Babydoll Bra"
	item_path = /obj/item/clothing/underwear/shirt/bra/babydoll

/datum/loadout_item/shirt/bra/beekini
	name = "Beekini Bra"
	item_path = /obj/item/clothing/underwear/shirt/bra/beekini

/datum/loadout_item/shirt/bra/bikini
	name = "Bikini Bra"
	item_path = /obj/item/clothing/underwear/shirt/bra/bikini

/datum/loadout_item/shirt/bra/bikini/black
	name = "Bikini Bra (Black)"
	item_path = /obj/item/clothing/underwear/shirt/bra/bikini/black

/datum/loadout_item/shirt/bra/bikini/blue
	name = "Bikini Bra (Blue)"
	item_path = /obj/item/clothing/underwear/shirt/bra/bikini/blue

/datum/loadout_item/shirt/bra/commie
	name = "Commie Bra"
	item_path = /obj/item/clothing/underwear/shirt/bra/commie

/datum/loadout_item/shirt/bra/fishnet
	name = "Fishnet Bra"
	item_path = /obj/item/clothing/underwear/shirt/bra/fishnet

/datum/loadout_item/shirt/bra/fishnet/sleeves
	name = "Sleeved Fishnet Bra"
	item_path = /obj/item/clothing/underwear/shirt/bra/fishnet/sleeves

/datum/loadout_item/shirt/bra/fishnet/sleeves/gloves
	name = "Sleeved & Gloved Fishnet Bra"
	item_path = /obj/item/clothing/underwear/shirt/bra/fishnet/sleeves/gloves

/datum/loadout_item/shirt/bra/halterneck
	name = "Halterneck Bra"
	item_path = /obj/item/clothing/underwear/shirt/bra/halterneck

/datum/loadout_item/shirt/bra/kinky
	name = "Kinky Bra"
	item_path = /obj/item/clothing/underwear/shirt/bra/kinky

/datum/loadout_item/shirt/bra/neko
	name = "Neko Bra"
	item_path = /obj/item/clothing/underwear/shirt/bra/neko

/datum/loadout_item/shirt/bra/sports
	name = "Sports Bra"
	item_path = /obj/item/clothing/underwear/shirt/bra/sports

/datum/loadout_item/shirt/bra/sports/alt
	name = "Sports Bra (alt)"
	item_path = /obj/item/clothing/underwear/shirt/bra/sports/alt

/datum/loadout_item/shirt/bra/strapless
	name = "Strapless Bra"
	item_path = /obj/item/clothing/underwear/shirt/bra/strapless

/datum/loadout_item/shirt/bra/strapless/alt
	name = "Strapless Bra (alt)"
	item_path = /obj/item/clothing/underwear/shirt/bra/strapless/alt

/datum/loadout_item/shirt/bra/striped
	name = "Striped Bra"
	item_path = /obj/item/clothing/underwear/shirt/bra/striped

/datum/loadout_item/shirt/bra/swimming
	name = "Swimming Bra"
	item_path = /obj/item/clothing/underwear/shirt/bra/swimming

/datum/loadout_item/shirt/bra/swimming/alt
	name = "Swimming Bra (alt)"
	item_path = /obj/item/clothing/underwear/shirt/bra/swimming/alt

/datum/loadout_item/shirt/bra/thin
	name = "Thin Bra"
	item_path = /obj/item/clothing/underwear/shirt/bra/thin

/datum/loadout_item/shirt/bra/tubetop
	name = "Tubetop Bra"
	item_path = /obj/item/clothing/underwear/shirt/bra/tubetop

/datum/loadout_item/shirt/bra/uk
	name = "UK Bra"
	item_path = /obj/item/clothing/underwear/shirt/bra/uk

/datum/loadout_item/shirt/bra/usa
	name = "USA Bra"
	item_path = /obj/item/clothing/underwear/shirt/bra/usa

/datum/loadout_item/shirt/clown
	name = "Clown Shirt"
	item_path = /obj/item/clothing/underwear/shirt/clown

/datum/loadout_item/shirt/commie
	name = "Commie Shirt"
	item_path = /obj/item/clothing/underwear/shirt/commie

/datum/loadout_item/shirt/corset
	name = "Corset"
	item_path = /obj/item/clothing/underwear/shirt/corset

/datum/loadout_item/shirt/cowboy
	name = "Black Cowboy Shirt"
	item_path = /obj/item/clothing/underwear/shirt/cowboy

/datum/loadout_item/shirt/cowboy/navy
	name = "Navy Cowboy Shirt"
	item_path = /obj/item/clothing/underwear/shirt/cowboy/navy

/datum/loadout_item/shirt/cowboy/red
	name = "Red Cowboy Shirt"
	item_path = /obj/item/clothing/underwear/shirt/cowboy/red

/datum/loadout_item/shirt/cowboy/short
	name = "Black Shortsleeved Cowboy Shirt"
	item_path = /obj/item/clothing/underwear/shirt/cowboy/short

/datum/loadout_item/shirt/cowboy/short/navy
	name = "Navy Shortsleeved Cowboy Shirt"
	item_path = /obj/item/clothing/underwear/shirt/cowboy/short/navy

/datum/loadout_item/shirt/cowboy/short/red
	name = "Red Shortsleeved Cowboy Shirt"
	item_path = /obj/item/clothing/underwear/shirt/cowboy/short/red

/datum/loadout_item/shirt/cowboy/short/white
	name = "White Shortsleeved Cowboy Shirt"
	item_path = /obj/item/clothing/underwear/shirt/cowboy/short/white

/datum/loadout_item/shirt/cowboy/white
	name = "White Cowboy Shirt"
	item_path = /obj/item/clothing/underwear/shirt/cowboy/white

/datum/loadout_item/shirt/ian
	name = "Ian Shirt"
	item_path = /obj/item/clothing/underwear/shirt/ian

/datum/loadout_item/shirt/ilovent
	name = "I Love NT Shirt"
	item_path = /obj/item/clothing/underwear/shirt/ilovent

/datum/loadout_item/shirt/long
	name = "Longsleeved Shirt"
	item_path = /obj/item/clothing/underwear/shirt/long

/datum/loadout_item/shirt/long/striped
	name = "Striped Longsleeved Shirt"
	item_path = /obj/item/clothing/underwear/shirt/long/striped

/datum/loadout_item/shirt/long/striped/blue
	name = "Blue Striped Longsleeved Shirt"
	item_path = /obj/item/clothing/underwear/shirt/long/striped/blue

/datum/loadout_item/shirt/lover
	name = "Lover Shirt"
	item_path = /obj/item/clothing/underwear/shirt/lover

/datum/loadout_item/shirt/matroska
	name = "Matroska Shirt"
	item_path = /obj/item/clothing/underwear/shirt/matroska

/datum/loadout_item/shirt/meat
	name = "Meat Shirt"
	item_path = /obj/item/clothing/underwear/shirt/meat

/datum/loadout_item/shirt/peace
	name = "Peace Shirt"
	item_path = /obj/item/clothing/underwear/shirt/peace

/datum/loadout_item/shirt/pogoman
	name = "Pogoman Shirt"
	item_path = /obj/item/clothing/underwear/shirt/pogoman

/datum/loadout_item/shirt/polo
	name = "Polo Shirt"
	item_path = /obj/item/clothing/underwear/shirt/polo

/datum/loadout_item/shirt/question
	name = "Question Mark Shirt"
	item_path = /obj/item/clothing/underwear/shirt/question

/datum/loadout_item/shirt/redjersey
	name = "Red Jersey Shirt"
	item_path = /obj/item/clothing/underwear/shirt/redjersey

/datum/loadout_item/shirt/shortsleeve
	name = "Shortsleeved Shirt"
	item_path = /obj/item/clothing/underwear/shirt/shortsleeve

/datum/loadout_item/shirt/skull
	name = "Skull Shirt"
	item_path = /obj/item/clothing/underwear/shirt/skull

/datum/loadout_item/shirt/sportblue
	name = "Blue Sport Shirt"
	item_path = /obj/item/clothing/underwear/shirt/sportblue

/datum/loadout_item/shirt/sportgreen
	name = "Green Sport Shirt"
	item_path = /obj/item/clothing/underwear/shirt/sportgreen

/datum/loadout_item/shirt/sportred
	name = "Red Sport Shirt"
	item_path = /obj/item/clothing/underwear/shirt/sportred

/datum/loadout_item/shirt/ss13
	name = "SS13 Shirt"
	item_path = /obj/item/clothing/underwear/shirt/ss13

/datum/loadout_item/shirt/striped
	name = "Striped Shirt"
	item_path = /obj/item/clothing/underwear/shirt/striped

/datum/loadout_item/shirt/tanktop
	name = "Tanktop Shirt"
	item_path = /obj/item/clothing/underwear/shirt/tanktop

/datum/loadout_item/shirt/tanktop/alt
	name = "Tanktop Shirt (alt)"
	item_path = /obj/item/clothing/underwear/shirt/tanktop/alt

/datum/loadout_item/shirt/tanktop/midriff
	name = "Midriff Tanktop Shirt"
	item_path = /obj/item/clothing/underwear/shirt/tanktop/midriff

/datum/loadout_item/shirt/tanktop/midriff/alt
	name = "Midriff Tanktop Shirt (alt)"
	item_path = /obj/item/clothing/underwear/shirt/tanktop/midriff/alt

/datum/loadout_item/shirt/tanktop/rainbow
	name = "Rainbow Tanktop Shirt"
	item_path = /obj/item/clothing/underwear/shirt/tanktop/rainbow

/datum/loadout_item/shirt/tanktop/striped
	name = "Striped Tanktop Shirt"
	item_path = /obj/item/clothing/underwear/shirt/tanktop/striped

/datum/loadout_item/shirt/tanktop/sun
	name = "Sun Tanktop Shirt"
	item_path = /obj/item/clothing/underwear/shirt/tanktop/sun

/datum/loadout_item/shirt/tiedye
	name = "Tie Dye Shirt"
	item_path = /obj/item/clothing/underwear/shirt/tiedye

/datum/loadout_item/shirt/top/shibari
	name = "Shibari Ropes"
	item_path = /obj/item/clothing/underwear/shirt/top/shibari

/datum/loadout_item/shirt/top/shibari_sleeved
	name = "Shibari Ropes - sleeves"
	item_path = /obj/item/clothing/underwear/shirt/top/shibari_sleeved

/datum/loadout_item/shirt/uk
	name = "UK Shirt"
	item_path = /obj/item/clothing/underwear/shirt/uk

/datum/loadout_item/shirt/usa
	name = "USA Shirt"
	item_path = /obj/item/clothing/underwear/shirt/usa
