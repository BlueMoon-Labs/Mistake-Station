/// Fattens the target
/datum/smite/creampie
	name = "Бросить Особый Пирог"

/datum/smite/creampie/effect(client/user, mob/living/target)
	. = ..()
	var/obj/item/food/pie/cream/nostun/creamy = new(get_turf(target))
	creamy.splat(target)
	if(creamy.reagents)
		var/chosen_id
		switch(tgui_alert(usr, "Choose a method.", "Add Reagents", list("Search", "Choose from a list", "I'm feeling lucky")))
			if("Search")
				var/valid_id
				while(!valid_id)
					chosen_id = input(usr, "Enter the ID of the reagent you want to add.", "Search reagents") as null|text
					if(isnull(chosen_id)) //Get me out of here!
						break
					if (!ispath(text2path(chosen_id)))
						chosen_id = pick_closest_path(chosen_id, make_types_fancy(subtypesof(/datum/reagent)))
						if (ispath(chosen_id))
							valid_id = TRUE
					else
						valid_id = TRUE
					if(!valid_id)
						to_chat(usr, span_warning("A reagent with that ID doesn't exist!"))
			if("Choose from a list")
				chosen_id = input(usr, "Choose a reagent to add.", "Choose a reagent.") as null|anything in sort_list(subtypesof(/datum/reagent), GLOBAL_PROC_REF(cmp_typepaths_asc))
			if("I'm feeling lucky")
				chosen_id = pick(subtypesof(/datum/reagent))
		if(chosen_id)
			var/amount = input(usr, "Choose the amount to add.", "Choose the amount.", creamy.reagents.maximum_volume) as num|null
			if(amount)
				creamy.reagents.add_reagent(chosen_id, amount)
				log_admin("[key_name(usr)] has added [amount] units of [chosen_id] to [src]")
				message_admins(span_notice("[key_name(usr)] has added [amount] units of [chosen_id] to [src]"))
