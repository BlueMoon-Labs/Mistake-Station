/datum/component/storage/concrete/pockets/small/collar/mind_collar/Initialize()
	. = ..()
	set_holdable = typecacheof(list(
	/obj/item/food/cookie,
	/obj/item/food/sugarcookie,
	/obj/item/mind_controller))
