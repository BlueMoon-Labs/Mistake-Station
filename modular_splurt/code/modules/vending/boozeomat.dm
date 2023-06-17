/obj/machinery/vending/boozeomat/Initialize()
	var/list/extra_products = list(
		/obj/item/reagent_containers/cup/glass/bottle/bitters = 6,
		/obj/item/reagent_containers/cup/glass/bottle/curacao = 3,
		/obj/item/reagent_containers/cup/glass/bottle/navy_rum = 3
	)
	LAZYADD(products, extra_products)
	. = ..()
