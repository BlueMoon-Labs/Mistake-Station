
/proc/tg_ui_icon_to_cit_ui(ui_style)
	switch(ui_style)
		if('icons/hud/screen_plasmafire.dmi')
			return 'modular_citadel/icons/ui/screen_plasmafire.dmi'
		if('icons/hud/screen_slimecore.dmi')
			return 'modular_citadel/icons/ui/screen_slimecore.dmi'
		if('icons/hud/screen_operative.dmi')
			return 'modular_citadel/icons/ui/screen_operative.dmi'
		if('icons/hud/screen_clockwork.dmi')
			return 'modular_citadel/icons/ui/screen_clockwork.dmi'
		if('modular_sand/icons/mob/screen_liteweb.dmi')
			return 'modular_sand/icons/mob/screen_liteweb.dmi'
		else
			return 'modular_citadel/icons/ui/screen_midnight.dmi'

/datum/hud/human/New(mob/living/carbon/human/owner)
	. = ..()
	var/atom/movable/screen/using

	if(owner.client?.prefs.arousable)
		using = new /atom/movable/screen/arousal(null, owner)
		using.icon_state = "arousal0"
		using.hud = src
		infodisplay += using

	using = new /atom/movable/screen/voretoggle() //We fancy Vore now
	using.icon = tg_ui_icon_to_cit_ui(ui_style)
	using.screen_loc = ui_voremode
	//if(!widescreenlayout)
	//	using.screen_loc = ui_boxvore
	using.hud = src
	static_inventory += using
