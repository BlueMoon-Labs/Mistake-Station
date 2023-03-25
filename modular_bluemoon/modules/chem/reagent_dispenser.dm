/obj/structure/reagent_dispensers/fueltank/limitka
	name = "Огромный Топливный Бак"
	desc = "<font size=+2><b>Пиздец, блядь, нахуй!!!</b></font>"
	icon = 'icons/obj/medical/chemical_tanks.dmi'
	icon_state = "fuel_pizdec"
	tank_volume = 100000

/obj/structure/reagent_dispensers/fueltank/limitka/boom(guaranteed_violent = TRUE)
	explosion(src, heavy_impact_range = 7, light_impact_range = 14, flame_range = 21, flash_range = 34)
	qdel(src)
