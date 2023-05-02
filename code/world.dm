//This file is just for the necessary /world definition
//Try looking in /code/game/world.dm, where initialization order is defined

/*

	† † † † † † † † † † † † † † † † † † † † † † † † † † † † † †

	Отче наш, сущий на небесах!

	Да святится имя Твое;

	Да приидет Царствие Твое;

	да будет воля Твоя и на земле, как на небе;

	Хлеб наш насущный дай нам на сей день;

	И прости нам долги наши, как и мы прощаем должникам нашим;

	И не введи нас в искушение, но избавь нас от лукавого.

	Ибо Твое есть Царство и сила и слава вовеки. Аминь.

													Мф. 6:9-13.

	† † † † † † † † † † † † † † † † † † † † † † † † † † † † † †

*/

/**
 * # World
 *
 * Two possibilities exist: either we are alone in the Universe or we are not. Both are equally terrifying. ~ Arthur C. Clarke
 *
 * The byond world object stores some basic byond level config, and has a few hub specific procs for managing hub visiblity
 */
/world
	mob = /mob/dead/new_player
	turf = /turf/open/space/basic
	area = /area/space
	view = "15x15"
	hub = "Exadv1.spacestation13"
	hub_password = "kMZy3U5jJHSiBQjr"
	name = "/tg/ Station 13"
	fps = 20
	//map_format = SIDE_MAP // SKYRAT EDIT - TODO: WALLENING - REMOVE THIS (hopefully the visual z-fighting issues will have been ironed out by then)
#ifdef FIND_REF_NO_CHECK_TICK
	loop_checks = FALSE
#endif
