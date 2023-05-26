/mob
	//Main Code edits
	var/combat_cursor_icon = 'modular_splurt/icons/effects/mouse_pointers/combat.dmi'
	var/is_tilted
	// Admin player panel for this mob
	var/datum/player_panel/mob_panel

/mob/Initialize()
	. = ..()
	create_player_panel()

// facing verbs
/mob/proc/canface()
	if(world.time < usr.next_move)
		return FALSE
	if(stat == DEAD || stat == UNCONSCIOUS)
		return FALSE
	if(anchored)
		return FALSE
	if(HAS_TRAIT(src, TRAIT_RESTRAINED))
		return FALSE
	return TRUE

/mob/Destroy()
	QDEL_NULL(mob_panel)
	. = ..()

/mob/verb/tilt_left()
	set hidden = TRUE
	if(!canface() || is_tilted < -45)
		return FALSE
	transform = transform.Turn(-1)
	is_tilted--

/mob/verb/tilt_right()
	set hidden = TRUE
	if(!canface() || is_tilted > 45)
		return FALSE
	transform = transform.Turn(1)
	is_tilted++

/mob/proc/has_spell(spelltype)
	if (!mind)
		return FALSE

	for(var/datum/action/cooldown/spell/to_add as anything in subtypesof(/datum/action/cooldown/spell))
		if(to_add.type == spelltype)
			return TRUE
	return FALSE

/mob/proc/create_player_panel()
	QDEL_NULL(mob_panel)
	mob_panel = new(src)

/mob/verb/check_out(atom/A as mob in view())
	set name = "Check Out"
	set category = "IC"

	. = examinate(A)
	if (.)
		return
	to_chat(A, span_notice("[src] seems to be checking you out."))

/mob/proc/allow_vampiric_ability(check_anti_magic = TRUE, check_holy = TRUE, check_garlic_neck = TRUE, check_garlic_blood = TRUE, check_stake = TRUE, silent = TRUE)
	// Check if carbon
	if(!iscarbon(src))
		// Warn user and return false
		if(!silent)
			to_chat(src, span_warning("Your body cannot form connections to the other-world!"))
		return FALSE

	// Check for anti-magic variables
	if(check_anti_magic || check_holy)
		// Check for anti-magic
		if(!HAS_TRAIT(src, TRAIT_ANTIMAGIC_NO_SELFBLOCK))
			// Warn user and return false
			if(!silent)
				to_chat(src, span_warning("A powerful anti-magic force is blocking your connection to the other-world!"))
			return FALSE

	// All checks passed
	return TRUE


/datum/keybinding/mob/tilt_right
	hotkey_keys = list("CtrlAltEast", "CtrlAltD")
	name = "pixel_tilt_east"
	full_name = "Pixel Tilt Right"
	description = ""
	category = CATEGORY_MOVEMENT

/datum/keybinding/mob/tilt_right/down(client/user)
	var/mob/M = user.mob
	M.tilt_right()
	return ..()

/datum/keybinding/mob/tilt_left
	hotkey_keys = list("CtrlAltWest", "CtrlAltA")
	name = "pixel_tilt_west"
	full_name = "Pixel Tilt Left"
	description = ""
	category = CATEGORY_MOVEMENT

/datum/keybinding/mob/tilt_left/down(client/user)
	var/mob/M = user.mob
	M.tilt_left()
	return ..()

/datum/keybinding/mob/shift_north
	hotkey_keys = list("CtrlShiftW", "CtrlShiftNorth")
	name = "pixel_shift_north"
	full_name = "Pixel Shift North"
	description = ""
	category = CATEGORY_MOVEMENT

/datum/keybinding/mob/shift_north/down(client/user)
	var/mob/M = user.mob
	M.pixel_shift(NORTH)
	return ..()

/datum/keybinding/mob/shift_east
	hotkey_keys = list("CtrlShiftD", "CtrlShiftEast")
	name = "pixel_shift_east"
	full_name = "Pixel Shift East"
	description = ""
	category = CATEGORY_MOVEMENT

/datum/keybinding/mob/shift_east/down(client/user)
	var/mob/M = user.mob
	M.pixel_shift(EAST)
	return ..()

/datum/keybinding/mob/shift_south
	hotkey_keys = list("CtrlShiftS", "CtrlShiftSouth")
	name = "pixel_shift_south"
	full_name = "Pixel Shift South"
	description = ""
	category = CATEGORY_MOVEMENT

/datum/keybinding/mob/shift_south/down(client/user)
	var/mob/M = user.mob
	M.pixel_shift(SOUTH)
	return ..()

/datum/keybinding/mob/shift_west
	hotkey_keys = list("CtrlShiftA", "CtrlShiftWest")
	name = "pixel_shift_west"
	full_name = "Pixel Shift West"
	description = ""
	category = CATEGORY_MOVEMENT

/datum/keybinding/mob/shift_west/down(client/user)
	var/mob/M = user.mob
	M.pixel_shift(WEST)
	return ..()
