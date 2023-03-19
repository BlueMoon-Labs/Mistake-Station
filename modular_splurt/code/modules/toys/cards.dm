/// A deck of unum cards. Classic.
/obj/item/toy/cards/deck/unum
	name = "\improper UNUM deck"
	desc = "A deck of unum cards. House rules to argue over not included."
	icon = 'modular_bluemoon/icons/obj/toy.dmi'
	icon_state = "deck_unum_full"
	deckstyle = "unum"
	decksize = 108

//Populate the deck.
/obj/item/toy/cards/deck/unum/Initialize()
	for(var/colour in list("Red","Yellow","Green","Blue"))
		initial_cards += "[colour] 0" //Uno, i mean, cough cough, Unum decks have only one colour of each 0, weird huh?
		for(var/k in 0 to 1) //two of each colour of number
			initial_cards += "[colour] skip"
			initial_cards += "[colour] reverse"
			initial_cards += "[colour] draw 2"
			for(var/i in 1 to 9)
				initial_cards += "[colour] [i]"
	for(var/k in 0 to 3) //4 wilds and draw 4s
		initial_cards += "Wildcard"
		initial_cards += "Draw 4"
	return ..()
