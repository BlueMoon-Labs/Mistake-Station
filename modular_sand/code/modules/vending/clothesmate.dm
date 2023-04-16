/obj/machinery/vending/clothing/Initialize(mapload)
	products += list(/obj/item/clothing/head/wig = 5,
					/obj/item/clothing/suit/jacket/duster = 5,
					/obj/item/clothing/head/slouch_hat = 5,
					/obj/item/clothing/head/lawdog = 5,
					/obj/item/clothing/head/gunfighter = 5
	)
	for(var/P in typesof(/datum/loadout_item/underwear))
		var/datum/loadout_item/G = P
		products[initial(G.item_path)] = 5
	for(var/P in typesof(/datum/loadout_item/shirt))
		var/datum/loadout_item/G = P
		products[initial(G.item_path)] = 5
	for(var/P in typesof(/datum/loadout_item/socks))
		var/datum/loadout_item/G = P
		products[initial(G.item_path)] = 5
	. = ..()
