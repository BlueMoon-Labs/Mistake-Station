/obj/item/extinguisher/Initialize()
	. = ..()
	if(tank_holder_icon_state)
		AddComponent(/datum/component/container_item/tank_holder, tank_holder_icon_state)

/obj/item/extinguisher/advanced
	tank_holder_icon_state = "holder_foam_extinguisher"
