//Idk who jessie is
/datum/design/bbqsauce
	name = "5u Barbecue sauce"
	id = "bbq_sauce"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 1000)
	make_reagent = list(/datum/reagent/consumable/bbqsauce = 5)
	category = list("initial","Food")

/datum/design/fishketchup
	name = "5u Soy Sauce"
	id = "soy_sauce"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 1000)
	make_reagent = list(/datum/reagent/consumable/soysauce = 5)
	category = list("initial","Food")

/datum/design/egg_synth
	name = "Synthesized Egg"
	id = "egg_snack"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 2500)
	build_path = /obj/item/food/egg
	category = list("initial","Food")

/datum/design/sfish
	name = "Biomass Fish Slab"
	id = "sfish"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 10000)
	build_path = /obj/item/food/fishmeat/carp/imitation
	category = list("initial", "Food")

/datum/design/ricebag
	name = "Biomass Rice Box"
	id = "Ricebox"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 10000)
	build_path = /obj/item/reagent_containers/condiment/rice
	category = list("initial", "Food")

/datum/design/flour_sack
	name = "Flour Sack"
	id = "flour_sack"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 10000)
	build_path = /obj/item/reagent_containers/condiment/flour
	category = list("initial","Food")

/datum/design/sugarbag
	name = "Biomass Sugar Box"
	id = "Sugarbox"
	build_type = BIOGENERATOR
	materials = list(/datum/material/biomass = 10000)
	build_path = /obj/item/reagent_containers/condiment/sugar
	category = list("initial", "Food")
