/// Fattens the target
/datum/smite/labebium
	name = "Открыть Глаза"

/datum/smite/labebium/effect(client/user, mob/living/target)
	. = ..()
	var/obj/item/food/pie/cream/nostun/A = new()
		if(!A.reagents)
			var/amount = input(usr, "Specify the reagent size of [A]", "Set Reagent Size", 50) as num|null
			if(amount)
				A.create_reagents(amount)
		if(A.reagents)
			var/chosen_id = choose_reagent_id(usr)
			if(chosen_id)
				var/amount = input(usr, "Choose the amount to add.", "Choose the amount.", A.reagents.maximum_volume) as num|null
				if(amount)
					A.reagents.add_reagent(chosen_id, amount)
					A.splat(target)
