/obj/item/pda/send_message(mob/living/user, list/obj/item/pda/targets, everyone)
	// Check for D4C craving
	if(HAS_TRAIT(user, TRAIT_DUMB_CUM_CRAVE))
		// Warn user, then return
		to_chat(user, span_love("You can't focus on anything but cum right now!"))
		return

	// Return normally
	. = ..()
