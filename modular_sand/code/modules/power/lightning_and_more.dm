/obj/structure/light_construct/floor
	name = "floor light fixture frame"
	icon = 'modular_sand/icons/obj/lighting.dmi'
	icon_state = "floor-construct-stage1"
	fixture_type = "floor"
	sheets_refunded = 1

/obj/machinery/light/floor/built
	icon_state = "floor-empty"
	start_with_cell = FALSE

/obj/machinery/light/floor/built/Initialize(mapload)
	. = ..()
	status = LIGHT_EMPTY
	update(0)

/obj/item/flashlight/seclite
	icon = 'modular_sand/icons/obj/lighting.dmi'

/obj/item/flashlight/flare
	icon = 'modular_sand/icons/obj/lighting.dmi'

/obj/machinery/light/floor
	icon = 'modular_sand/icons/obj/lighting.dmi'
	overlay_icon = 'modular_sand/icons/obj/lighting_overlay.dmi'

/obj/structure/light_construct/small
	icon = 'modular_sand/icons/obj/lighting.dmi'

/obj/machinery/light
	bulb_colour = "#defcff"

/obj/machinery/light/small
	bulb_colour = "#defcff"
	icon = 'modular_sand/icons/obj/lighting.dmi'
	overlay_icon = 'modular_sand/icons/obj/lighting_overlay.dmi'

/obj/machinery/power/floodlight
	icon = 'modular_sand/icons/obj/lighting.dmi'
	light_power = 2

/obj/item/radio
	icon = 'icons/obj/intercom.dmi'

/obj/item/radio/intercom
	icon = 'icons/obj/intercom.dmi'

/obj/item/wallframe/intercom
	icon = 'icons/obj/intercom.dmi'
