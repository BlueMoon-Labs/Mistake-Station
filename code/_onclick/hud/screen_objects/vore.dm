/atom/movable/screen/voretoggle
	name = "toggle vore mode"
	icon = 'modular_citadel/icons/ui/screen_midnight.dmi'
	icon_state = "nom_off"

/atom/movable/screen/voretoggle/Click()
	if(usr != hud.mymob)
		return
	var/mob/living/carbon/C = usr
	C.toggle_vore_mode()

/atom/movable/screen/voretoggle/update_icon_state()
	var/mob/living/carbon/user = hud?.mymob
	if(!istype(user))
		return
	if(user.voremode)
		icon_state = "nom"
	else
		icon_state = "nom_off"
	return ..()
