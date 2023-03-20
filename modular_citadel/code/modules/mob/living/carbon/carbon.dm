/mob/living/carbon
	//oh no vore time
	var/voremode = FALSE

/mob/living/carbon/set_combat_mode(new_mode, silent = TRUE)

	var/mob/living/carbon/C = usr
	if(C.voremode)
		C.disable_vore_mode()

	return ..()

/mob/living/carbon/proc/toggle_vore_mode(mob/living/carbon/human/user)
	if(!user.combat_mode)
		help_shake_act(user)
		return FALSE
	voremode = !voremode
	var/atom/movable/screen/voretoggle/T = locate() in hud_used?.static_inventory
	T?.update_icon_state()
	return TRUE

/mob/living/carbon/proc/disable_vore_mode()
	voremode = FALSE
	var/atom/movable/screen/voretoggle/T = locate() in hud_used?.static_inventory
	T?.update_icon_state()
