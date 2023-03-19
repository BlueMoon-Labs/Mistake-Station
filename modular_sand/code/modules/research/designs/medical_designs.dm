/obj/item/reagent_containers/cup/beaker/ultimate
	name = "Ultimate Beaker"
	desc = "An ultimate beaker, made by extrapolating on bluespace technology \
		with dark matter combined. Can hold up to \
		900 units! And can withstand reagents of an extreme pH, \
		\nLiterally a chemist's dream."
	icon = 'modular_sand/icons/obj/chemical.dmi'
	icon_state = "beakerultimate"
	custom_materials = list(/datum/material/glass = 5000, /datum/material/plasma = 3000, /datum/material/diamond = 1000, /datum/material/bluespace = 1000)
	volume = 900
	possible_transfer_amounts = list(5,10,15,20,25,30,50,100,300,450,600,900)

/datum/design/ultimatebeaker
	name = "Ultimate Beaker"
	desc = "An ultimate beaker, made by extrapolating on bluespace technology with dark matter combined. Can hold up to 900 units."
	id = "ultimatebeaker"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 3000,
					/datum/material/glass = 3000,
					/datum/material/plasma = 3000,
					/datum/material/diamond = 500,
					/datum/material/bluespace = 500)
	build_path = /obj/item/reagent_containers/cup/beaker/ultimate
	reagents_list = list(/datum/reagent/liquid_dark_matter = 10)
	category = list("Medical Designs")
	lathe_time_factor = 0.8
	departmental_flags = DEPARTMENT_BITFLAG_MEDICAL | DEPARTMENT_BITFLAG_SCIENCE | DEPARTMENT_BITFLAG_SERVICE
