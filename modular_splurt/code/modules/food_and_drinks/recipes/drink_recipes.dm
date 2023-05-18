//SPLURT drinks
/datum/chemical_reaction/panty_dropper //https://ifunny.co/video/uyksuxGK8?s=cl
	results = list(/datum/reagent/consumable/ethanol/panty_dropper = 8, /datum/reagent/drug/aphrodisiac/crocin/hexacrocin = 2)
	required_reagents = list(/datum/reagent/consumable/ethanol/screwdrivercocktail = 1, /datum/reagent/consumable/ethanol/gin = 1, /datum/reagent/consumable/ethanol/creme_de_coconut = 1, /datum/reagent/consumable/ethanol/rum = 1, /datum/reagent/consumable/ethanol/triple_sec = 1, /datum/reagent/consumable/pineapplejuice = 1, /datum/reagent/consumable/berryjuice = 1) //Can't have the legendary 1:1 ratio or original recipe cuz of recipe clashes :(
	mix_message = "A very tvvisted combination begins to bubble..."

/datum/chemical_reaction/lean
	results = list(/datum/reagent/consumable/ethanol/lean = 3)
	required_reagents = list(/datum/reagent/medicine/salbutamol = 1, /datum/reagent/consumable/pwr_game = 1, /datum/reagent/consumable/sugar = 1) // Salbutamol for the cough syrup. Pwr Game for the Sprite, sugar for the candies.
	mix_message = "The mixture turns a deep purple colour."

/datum/chemical_reaction/wockyslush
	results = list(/datum/reagent/consumable/wockyslush = 5)
	required_reagents = list(/datum/reagent/toxin/fentanyl = 1, /datum/reagent/consumable/ice = 1, /datum/reagent/consumable/lemon_lime = 1)
	mix_message = "That thang bleedin' P!"

/datum/chemical_reaction/ethanol/semen
	results = list(/datum/reagent/consumable/ethanol/semen = 3)
	required_reagents = list(/datum/reagent/consumable/semen = 1)

/datum/chemical_reaction/cum_in_a_hot_tub
	results = list(/datum/reagent/consumable/ethanol/cum_in_a_hot_tub = 3)
	required_reagents = list(/datum/reagent/consumable/ethanol/vodka = 2, /datum/reagent/consumable/ethanol/white_russian = 1, /datum/reagent/consumable/ethanol/irish_cream = 1)

/datum/chemical_reaction/cum_in_a_hot_tub/semen
	results = list(/datum/reagent/consumable/ethanol/cum_in_a_hot_tub/semen = 3)
	required_reagents = list(/datum/reagent/consumable/ethanol/vodka = 2, /datum/reagent/consumable/semen = 1, /datum/reagent/consumable/ethanol/irish_cream = 1)

/datum/chemical_reaction/orange_creamsicle
    results = list(/datum/reagent/consumable/orange_creamsicle = 4)
    required_reagents = list(/datum/reagent/consumable/vanilla = 1, /datum/reagent/consumable/milk = 1, /datum/reagent/consumable/ice = 1, /datum/reagent/consumable/orangejuice = 1)

/datum/chemical_reaction/mech_rider
	results = list(/datum/reagent/consumable/ethanol/mech_rider = 4)
	required_reagents = list(/datum/reagent/consumable/ethanol/absinthe = 1, /datum/reagent/consumable/ethanol/hcider = 1, /datum/reagent/consumable/ethanol/syndicatebomb = 1, /datum/reagent/consumable/coffee = 1)

/datum/chemical_reaction/isloation_cell
	results = list(/datum/reagent/consumable/ethanol/isloation_cell = 5)
	required_reagents = list(
		/datum/reagent/drug/aphrodisiac = 1,
		/datum/reagent/medicine/synaptizine = 2,
		/datum/reagent/consumable/ethanol/hippies_delight = 2
	)

/datum/chemical_reaction/isloation_cell/morphine
	results = list(/datum/reagent/consumable/ethanol/isloation_cell/morphine = 5)
	required_reagents = list(
		/datum/reagent/drug/aphrodisiac = 1,
		/datum/reagent/medicine/morphine = 2,
		/datum/reagent/consumable/ethanol/hippies_delight = 2
	)

/datum/chemical_reaction/chemical_ex
	results = list(/datum/reagent/consumable/ethanol/chemical_ex = 5)
	required_reagents = list(
		/datum/reagent/drug/aphrodisiac/crocin/hexacrocin = 1,
		/datum/reagent/medicine/morphine = 2
	)

/datum/chemical_reaction/heart_of_gold
	results = list(/datum/reagent/consumable/ethanol/heart_of_gold = 10)
	required_reagents = list(
		/datum/reagent/consumable/ethanol/jack_rose = 4,
		/datum/reagent/consumable/peachjuice = 3,
		/datum/reagent/consumable/pineapplejuice = 3
	)

/datum/chemical_reaction/moth_in_chief
	results = list(/datum/reagent/consumable/ethanol/moth_in_chief = 4)
	required_reagents = list(
		/datum/reagent/consumable/ethanol/commander_and_chief = 1,
		/datum/reagent/mutationtoxin/moth = 1,
		/datum/reagent/drug/space_drugs = 1,
		/datum/reagent/medicine/stimulants = 1
	)


// ~( Ported from TG )~

/datum/chemical_reaction/skullfucker_deluxe
	results = list(/datum/reagent/consumable/ethanol/skullfucker_deluxe = 5)
	required_reagents = list(
		/datum/reagent/consumable/ethanol/sugar_rush = 2,
		/datum/reagent/consumable/ethanol/moonshine = 2,
		/datum/reagent/consumable/ethanol/brave_bull = 1
	)

//Milkshakes
/datum/chemical_reaction/milkshake_base
	results = list(/datum/reagent/consumable/milkshake_base = 3)
	required_reagents = list(
		/datum/reagent/consumable/milk = 1,
		/datum/reagent/consumable/ice = 1,
		/datum/reagent/consumable/cream =1
	)

/datum/chemical_reaction/milkshake_vanilla
	results = list(/datum/reagent/consumable/milkshake_vanilla = 2)
	required_reagents = list(
		/datum/reagent/consumable/milkshake_base =1,
		/datum/reagent/consumable/vanilla =1
	)

/datum/chemical_reaction/milkshake_choc
	results = list(/datum/reagent/consumable/milkshake_choc = 2)
	required_reagents = list(
		/datum/reagent/consumable/milkshake_base = 1,
		/datum/reagent/consumable/coco = 1
	)

/datum/chemical_reaction/milkshake_strawberry
	results = list(/datum/reagent/consumable/milkshake_strawberry = 2)
	required_reagents = list(
		/datum/reagent/consumable/milkshake_base = 1,
		/datum/reagent/consumable/berryjuice = 1
	)

/datum/chemical_reaction/milkshake_banana
	results = list(/datum/reagent/consumable/milkshake_banana = 2)
	required_reagents = list(
		/datum/reagent/consumable/milkshake_base = 1,
		/datum/reagent/consumable/banana = 1
	)

/datum/chemical_reaction/milkshake_berry
	results = list(/datum/reagent/consumable/milkshake_berry = 2)
	required_reagents = list(
		/datum/reagent/consumable/milkshake_base = 1,
		/datum/reagent/consumable/berryjuice = 1
	)

/datum/chemical_reaction/milkshake_cola
	results = list(/datum/reagent/consumable/milkshake_cola = 2)
	required_reagents = list(
		/datum/reagent/consumable/milkshake_base = 1,
		/datum/reagent/consumable/space_cola = 1
	)

/datum/chemical_reaction/milkshake_gibb
	results = list(/datum/reagent/consumable/milkshake_gibb = 2)
	required_reagents = list(
		/datum/reagent/consumable/milkshake_base = 1,
		/datum/reagent/consumable/dr_gibb = 1
	)

/datum/chemical_reaction/milkshake_peach
	results = list(/datum/reagent/consumable/milkshake_peach = 2)
	required_reagents = list(
		/datum/reagent/consumable/milkshake_base = 1,
		/datum/reagent/consumable/peachjuice = 1
	)

/datum/chemical_reaction/milkshake_pineapple
	results = list(/datum/reagent/consumable/milkshake_pineapple = 2)
	required_reagents = list(
		/datum/reagent/consumable/milkshake_base = 1,
		/datum/reagent/consumable/pineapplejuice = 1
	)

/datum/chemical_reaction/milkshake_melon
	results = list(/datum/reagent/consumable/milkshake_melon = 2)
	required_reagents = list(
		/datum/reagent/consumable/milkshake_base = 1,
		/datum/reagent/consumable/watermelonjuice = 1
	)

/datum/chemical_reaction/ionstorm
	results = list(/datum/reagent/consumable/ethanol/ionstorm = 10)
	required_reagents = list(
		/datum/reagent/consumable/ethanol/quadruple_sec = 5,
		/datum/reagent/consumable/ethanol/bastion_bourbon = 2
	)
	mix_message = "The lights flicker for a moment..."
	mix_sound = 'sound/weapons/taser.ogg'
