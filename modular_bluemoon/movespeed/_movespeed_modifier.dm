/*! Movespeed modification datums.

	How move speed for mobs works

Move speed is now calculated by using modifier datums which are added to mobs. Some of them (nonvariable ones) are globally cached, the variable ones are instanced and changed based on need.

This gives us the ability to have multiple sources of movespeed, reliabily keep them applied and remove them when they should be

THey can have unique sources and a bunch of extra fancy flags that control behaviour

Previously trying to update move speed was a shot in the dark that usually meant mobs got stuck going faster or slower

Movespeed modification list is a simple key = datum system. Key will be the datum's ID if it is overridden to not be null, or type if it is not.

DO NOT override datum IDs unless you are going to have multiple types that must overwrite each other. It's more efficient to use types, ID functionality is only kept for cases where dynamic creation of modifiers need to be done.

When update movespeed is called, the list of items is iterated, according to flags priority and a bunch of conditions
this spits out a final calculated value which is used as a modifer to last_move + modifier for calculating when a mob
can next move

Key procs
* [add_movespeed_modifier](mob.html#proc/add_movespeed_modifier)
* [remove_movespeed_modifier](mob.html#proc/remove_movespeed_modifier)
* [has_movespeed_modifier](mob.html#proc/has_movespeed_modifier)
* [update_movespeed](mob.html#proc/update_movespeed)
*/

/datum/movespeed_modifier
	/// Next two variables depend on this: Should we do advanced calculations?
	var/complex_calculation = FALSE
	/// Absolute max tiles we can boost to
	var/absolute_max_tiles_per_second = INFINITY
	/// Max tiles per second we can boost
	var/max_tiles_per_second_boost = INFINITY

/datum/movespeed_modifier/New()
	. = ..()
	if(!id)
		id = "[type]" //We turn the path into a string.

/**
  * Returns new multiplicative movespeed after modification.
  */
/datum/movespeed_modifier/proc/apply_multiplicative(existing, mob/target)
	if(!complex_calculation || (multiplicative_slowdown > 0))		// we aren't limiting how much things can slowdown.. yet.
		return existing + multiplicative_slowdown
	var/current_tiles = 10 / max(existing, world.tick_lag)
	// multiplicative_slowdown is negative due to our first check
	var/max_buff_to = max(existing + multiplicative_slowdown, 10 / absolute_max_tiles_per_second, 10 / (current_tiles + max_tiles_per_second_boost))
	// never slow the user
	return min(existing, max_buff_to)

/// Handles the special case of editing the movement var
/mob/vv_edit_var(var_name, var_value)
	if(var_name == NAMEOF(src, control_object))
		var/obj/O = var_value
		if(!istype(O) && (var_value != null))
			return FALSE
		if(O.obj_flags & DANGEROUS_POSSESSION)
			return FALSE
	var/slowdown_edit = (var_name == NAMEOF(src, cached_multiplicative_slowdown))
	var/diff
	if(slowdown_edit && isnum(cached_multiplicative_slowdown) && isnum(var_value))
		remove_movespeed_modifier(/datum/movespeed_modifier/admin_varedit)
		diff = var_value - cached_multiplicative_slowdown
	. = ..()
	if(. && slowdown_edit && isnum(diff))
		add_or_update_variable_movespeed_modifier(/datum/movespeed_modifier/admin_varedit, multiplicative_slowdown = diff)

/// Calculate the total slowdown of all movespeed modifiers
/mob/proc/total_multiplicative_slowdown()
	. = 0
	for(var/id in get_movespeed_modifiers())
		var/datum/movespeed_modifier/M = movespeed_modification[id]
		. += M.multiplicative_slowdown

/**
  * Gets the movespeed modifier datum of a modifier on a mob. Returns null if not found.
  * DANGER: IT IS UP TO THE PERSON USING THIS TO MAKE SURE THE MODIFIER IS NOT MODIFIED IF IT HAPPENS TO BE GLOBAL/CACHED.
  */
/mob/proc/get_movespeed_modifier_datum(id)
	return movespeed_modification[id]
