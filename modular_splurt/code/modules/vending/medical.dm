/obj/machinery/vending/medical/Initialize()
	var/list/extra_contraband = list(
		/obj/item/reagent_containers/pill/labebium = 6,
	)
	LAZYADD(contraband, extra_contraband)
	. = ..()
