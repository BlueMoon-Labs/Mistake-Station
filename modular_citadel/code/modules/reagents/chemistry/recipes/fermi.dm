/datum/chemical_reaction/fermi
	mix_sound = 'sound/effects/bubbles.ogg'

/datum/chemical_reaction/fermi/breast_enlarger
	results = list(/datum/reagent/fermi/breast_enlarger = 8)
	required_reagents = list(/datum/reagent/medicine/salglu_solution = 1, /datum/reagent/consumable/milk = 1, /datum/reagent/medicine/c2/synthflesh = 2, /datum/reagent/silicon = 3, /datum/reagent/drug/aphrodisiac = 3)
	mix_message = "the reaction gives off a mist of milk."
	required_temp = 600

/datum/chemical_reaction/fermi/breast_enlarger/reaction_finish(datum/reagents/holder, atom/my_atom)
	var/datum/reagent/fermi/breast_enlarger/BE = locate(/datum/reagent/fermi/breast_enlarger) in my_atom.reagents.reagent_list
	if(!BE)
		return
	var/cached_volume = BE.volume
	if(BE.purity < 0.35)
		holder.remove_reagent(type, cached_volume)
		holder.add_reagent(/datum/reagent/fermi/BEsmaller, cached_volume)


/datum/chemical_reaction/fermi/breast_enlarger/default_explode(datum/reagents, var/atom/my_atom, volume, temp, pH)
	var/obj/item/organ/external/genital/breasts/B = new /obj/item/organ/external/genital/breasts(get_turf(my_atom))
	my_atom.visible_message("<span class='warning'>The reaction suddenly condenses, creating a pair of breasts!</b></span>")
	var/datum/reagent/fermi/breast_enlarger/BE = locate(/datum/reagent/fermi/breast_enlarger) in my_atom.reagents.reagent_list
	B.size = ((BE.volume * BE.purity) / 10) //half as effective.
	my_atom.reagents.clear_reagents()

/datum/chemical_reaction/fermi/penis_enlarger
	results = list(/datum/reagent/fermi/penis_enlarger = 8)
	required_reagents = list(/datum/reagent/blood = 5, /datum/reagent/medicine/c2/synthflesh = 2, /datum/reagent/carbon = 2, /datum/reagent/drug/aphrodisiac = 2, /datum/reagent/medicine/salglu_solution = 1)
	mix_message = "the reaction gives off a spicy mist."
	required_temp = 600

/datum/chemical_reaction/fermi/penis_enlarger/default_explode(datum/reagents, var/atom/my_atom, volume, temp, pH)
	var/obj/item/organ/external/genital/penis/P = new /obj/item/organ/external/genital/penis(get_turf(my_atom))
	my_atom.visible_message("<span class='warning'>The reaction suddenly condenses, creating a penis!</b></span>")
	var/datum/reagent/fermi/penis_enlarger/PE = locate(/datum/reagent/fermi/penis_enlarger) in my_atom.reagents.reagent_list
	P.length = ((PE.volume * PE.purity) / 10)//half as effective.
	my_atom.reagents.clear_reagents()

/datum/chemical_reaction/fermi/penis_enlarger/reaction_finish(datum/reagents/holder, atom/my_atom)
	var/datum/reagent/fermi/penis_enlarger/PE = locate(/datum/reagent/fermi/penis_enlarger) in my_atom.reagents.reagent_list
	if(!PE)
		return
	var/cached_volume = PE.volume
	if(PE.purity < 0.35)
		holder.remove_reagent(type, cached_volume)
		holder.add_reagent(/datum/reagent/fermi/PEsmaller, cached_volume)
