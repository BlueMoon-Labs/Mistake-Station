//Main code edits
/obj/item/reagent_containers/pill/breast_enlargement
	icon = 'modular_splurt/icons/obj/chemical.dmi'
	icon_state = "pill_lewd"

/obj/item/reagent_containers/pill/butt_enlargement
	icon = 'modular_splurt/icons/obj/chemical.dmi'
	icon_state = "pill_lewd"

//Own stuff
/obj/item/reagent_containers/pill/lsdpsych
	name = "antipsychotic pill"
	desc = "Talk to your healthcare provider immediately if hallucinations worsen or new hallucinations emerge."
	icon_state = "pill14"
	list_reagents = list(/datum/reagent/toxin/mindbreaker = 5)

/obj/item/reagent_containers/pill/happinesspsych
	name = "mood stabilizer pill"
	desc = "Used to temporarily alleviate anxiety and depression, take only as prescribed."
	icon_state = "pill_happy"
	list_reagents = list(/datum/reagent/drug/happiness = 5)

/obj/item/reagent_containers/pill/paxpsych
	name = "pacification pill"
	desc = "Used to temporarily suppress violent, homicidal, or suicidal behavior in patients."
	list_reagents = list(/datum/reagent/pax = 5)
	icon_state = "pill12"

/obj/item/reagent_containers/pill/penis_enlargement
	name = "penis enlargement pill"
	list_reagents = list(/datum/reagent/drug/aphrodisiac/incubus_draft = 10)
	icon = 'modular_splurt/icons/obj/chemical.dmi'
	icon_state = "pill_lewd"

/obj/item/reagent_containers/pill/breast_enlargement
	name = "breast enlargement pill"
	list_reagents = list(/datum/reagent/drug/aphrodisiac/succubus_milk = 10)

/obj/item/reagent_containers/pill/butt_enlargement
	name = "butt enlargement pill"
	list_reagents = list(/datum/reagent/growthchem = 15)

/obj/item/reagent_containers/pill/belly_inflation
	name = "belly inflation pill"
	list_reagents = list(/datum/reagent/shrinkchem = 15)

/obj/item/reagent_containers/cup/bottle/vial/small/bellyreduction
	name = "blue hypovial (for too bloated and bubbly tummy aches)"
	icon_state = "hypovial-d"
	list_reagents = list(/datum/reagent/shrinkchem = 15)

/obj/item/storage/pill_bottle/penis_enlargement
	name = "penis enlargement pills"
	desc = "You want penis enlargement pills?"

/obj/item/storage/pill_bottle/penis_enlargement/PopulateContents()
	for(var/i in 1 to 10)
		new /obj/item/reagent_containers/pill/penis_enlargement(src)

/obj/item/storage/pill_bottle/breast_enlargement
	name = "breast enlargement pills"
	desc = "Made by Fermichem - The bottle shows a woman with breasts larger than she is on them. The warning states to not take more than 10 units at a time."

/obj/item/storage/pill_bottle/breast_enlargement/PopulateContents()
	for(var/i in 1 to 10)
		new /obj/item/reagent_containers/pill/breast_enlargement(src)

/obj/item/storage/pill_bottle/butt_enlargement
	name = "butt enlargement pills"
	desc = "May alert security when sneaking around if enough pills are consumed due to assclapping. Be dummy thick responsibly."

/obj/item/storage/pill_bottle/butt_enlargement/PopulateContents()
	for(var/i in 1 to 10)
		new /obj/item/reagent_containers/pill/butt_enlargement(src)

/obj/item/storage/pill_bottle/neurine
	name = "bottle of neurine pills"
	desc = "Contains pills to treat non-severe mental traumas."

/obj/item/storage/pill_bottle/neurine/PopulateContents()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/pill/neurine(src)
