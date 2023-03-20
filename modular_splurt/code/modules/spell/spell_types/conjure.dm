/datum/action/cooldown/spell/conjure_item/soap
	name = "Summon Soap"
	desc = "For El Trollage. And maybe a bit of crew's anger too."
	cooldown_time = 100 SECONDS

	button_icon = 'icons/obj/weapons/items_and_weapons.dmi'
	button_icon_state = "soapdeluxe"
	sound = 'sound/magic/summonitems_generic.ogg'

	item_type = /obj/item/soap/deluxe
	delete_old = FALSE

/datum/action/cooldown/spell/conjure_item/summon_pie
	name = "Summon Creampie"
	desc = "A clown's weapon of choice.  Use this to summon a fresh pie, just waiting to acquaintain itself with someone's face."
	invocation_type = "none"

	item_type = /obj/item/food/pie/cream

	cooldown_time = 15 SECONDS
	button_icon = 'icons/obj/food/piecake.dmi'
	button_icon_state = "pie"
	delete_old = FALSE
