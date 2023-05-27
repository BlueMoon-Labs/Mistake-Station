
/proc/tg_ui_icon_to_cit_ui(ui_style)
	switch(ui_style)
		if("Plasmafire")
			return 'modular_citadel/icons/ui/screen_plasmafire.dmi'
		if("Slimecore")
			return 'modular_citadel/icons/ui/screen_slimecore.dmi'
		if("Operative")
			return 'modular_citadel/icons/ui/screen_operative.dmi'
		if("Clockwork")
			return 'modular_citadel/icons/ui/screen_clockwork.dmi'
		if("Liteweb")
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

	//using = new /atom/movable/screen/voretoggle() //We fancy Vore now
	//using.icon = tg_ui_icon_to_cit_ui(ui_style)
	//using.screen_loc = ui_voremode
	//if(!widescreenlayout)
	//	using.screen_loc = ui_boxvore
	using.hud = src
	static_inventory += using
