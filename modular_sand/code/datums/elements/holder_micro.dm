/datum/element/mob_holder/micro

/datum/element/mob_holder/micro/Attach(datum/target, worn_state, alt_worn, right_hand, left_hand, inv_slots = NONE, proctype, escape_on_find)
	. = ..()

	RegisterSignal(target, COMSIG_CLICK_ALT, .proc/mob_try_pickup_micro, TRUE)
	RegisterSignal(target, COMSIG_MICRO_PICKUP_FEET, .proc/mob_pickup_micro_feet)
	RegisterSignal(target, COMSIG_MOB_RESIZED, .proc/on_resize)

/datum/element/mob_holder/micro/Detach(datum/source, force)
	. = ..()
	UnregisterSignal(source, COMSIG_MICRO_PICKUP_FEET)

/datum/element/mob_holder/micro/proc/on_resize(mob/living/micro, new_size, old_size)
	var/obj/item/clothing/head/mob_holder/holder = micro.loc
	if(istype(holder))
		var/mob/living/living = get_atom_on_turf(micro.loc, /mob/living)
		if(living && (abs(get_size(micro)/get_size(living)) > CONFIG_GET(number/max_pick_ratio)))
			living.visible_message(span_warning("\The [living] drops [micro] as [micro.ru_who()] grow\s too big to carry."),
								span_warning("You drop \The [living] as [living.ru_who()] grow\s too big to carry."))
			holder.release()
		else if(!istype(living)) // Somehow a inside a mob_holder and the mob_holder isn't inside any livings? release.
			holder.release()

/datum/element/mob_holder/micro/on_examine(mob/living/source, mob/user, list/examine_list)
	if(ishuman(user) && !istype(source.loc, /obj/item/clothing/head/mob_holder) && (abs(get_size(source)/get_size(user)) <= CONFIG_GET(number/max_pick_ratio)))
		examine_list += "<span class='notice'>Looks like [source.ru_who(FALSE)] can be picked up using <b>Alt+Click and grab intent</b>!</span>"

/datum/element/mob_holder/micro/proc/mob_pickup_micro(mob/living/source, mob/user)
	var/obj/item/clothing/head/mob_holder/micro/holder = new(get_turf(source), source, worn_state, alt_worn, right_hand, left_hand, inv_slots)
	if(!holder)
		return

	user.put_in_hands(holder)
	return

//shoehorned (get it?) and lazy way to do instant foot pickups cause haha funny.
/datum/element/mob_holder/micro/proc/mob_pickup_micro_feet(mob/living/source, mob/user)
	var/obj/item/clothing/head/mob_holder/micro/holder = new(get_turf(source), source, worn_state, alt_worn, right_hand, left_hand, inv_slots)
	if(!holder)
		return
	user.equip_to_slot(holder, ITEM_SLOT_FEET)
	return

/datum/element/mob_holder/micro/proc/mob_try_pickup_micro(mob/living/carbon/source, mob/living/carbon/user)
	if(!(user.combat_mode == TRUE))
		return FALSE
	if(!ishuman(user) || !user.Adjacent(source) || user.incapacitated())
		return FALSE
	if(source == user)
		to_chat(user, "<span class='warning'>You can't pick yourself up.</span>")
		source.balloon_alert(user, "cannot pick yourself!")
		return FALSE
	if(abs(get_size(source)/get_size(user)) > CONFIG_GET(number/max_pick_ratio))
		to_chat(user, "<span class='warning'>They're too big to pick up!</span>")
		source.balloon_alert(user, "too big to pick up!")
		return FALSE
	if(user.get_active_held_item())
		to_chat(user, "<span class='warning'>Your hands are full!</span>")
		source.balloon_alert(user, "hands are full!")
		return FALSE
	if(source.buckled)
		to_chat(user, "<span class='warning'>[source] is buckled to something!</span>")
		source.balloon_alert(user, "buckled to something!")
		return FALSE
	source.visible_message("<span class='warning'>[user] starts picking up [source].</span>", \
					"<span class='userdanger'>[user] starts picking you up!</span>")
	source.balloon_alert(user, "picking up")
	var/p = abs(get_size(source)/get_size(user) * 40) //Scale how fast the pickup will be depending on size difference
	if(!do_after(user, p, target = source))
		return FALSE

	if(user.get_active_held_item())
		to_chat(user, "<span class='warning'>Your hands are full!</span>")
		source.balloon_alert(user, "hands full!")
		return FALSE
	if(source.buckled)
		to_chat(user, "<span class='warning'>[source] is buckled to something!</span>")
		source.balloon_alert(user, "buckled!")
		return FALSE

	source.visible_message("<span class='warning'>[user] picks up [source]!</span>",
					"<span class='userdanger'>[user] picks you up!</span>")
	source.drop_all_held_items()
	mob_pickup_micro(source, user)
	return TRUE

/obj/item/clothing/head/mob_holder/micro
	name = "micro"
	desc = "Another person, small enough to fit in your hand."
	icon = null
	icon_state = ""
	slot_flags = ITEM_SLOT_FEET | ITEM_SLOT_HEAD | ITEM_SLOT_ID | ITEM_SLOT_BACK | ITEM_SLOT_NECK
	w_class = null //handled by their size

//TODO: add a timer to escape someone's grip dependant on size diff
/obj/item/clothing/head/mob_holder/micro/container_resist(mob/living/user)
	if(user.incapacitated())
		to_chat(user, "<span class='warning'>You can't escape while you're restrained like this!</span>")
		return
	var/mob/living/L = loc
	visible_message("<span class='warning'>[src] begins to squirm in [L]'s grasp!</span>")
	if(!do_after(user, 4 SECONDS, target = src))
		if(!user || user.stat != CONSCIOUS || user.loc != src)
			return
		to_chat(loc, "<span class='warning'>[src] stops resisting.</span>")
		return
	visible_message("<span class='warning'>[src] escapes [L]!")
	release()

/obj/item/clothing/head/mob_holder/micro/MouseDrop(mob/M as mob)
	..()
	if(M != usr)
		return
	if(usr == src)
		return
	if(!Adjacent(usr))
		return
	if(istype(M,/mob/living/silicon/ai))
		return
	var/mob/living/carbon/human/O = held_mob
	if(istype(O))
		O.MouseDrop(usr)

/obj/item/clothing/head/mob_holder/micro/attack_self(mob/living/user)
	if(!user.CheckActionCooldown())
		return
	user.changeNext_move(CLICK_CD_MELEE)
	var/mob/living/carbon/human/M = held_mob
	if(istype(M))
		if(user.combat_mode == TRUE) //TO:DO, rework all of these interactions to be a lot more in depth
			visible_message("<span class='danger'>[user] slams their fist down on [M]!</span>")
			playsound(loc, 'sound/weapons/punch1.ogg', 50, 1)
			M.adjustBruteLoss(5)
			return
		M.help_shake_act(user)

/obj/item/clothing/head/mob_holder/micro/attacked_by(obj/item/I, mob/living/user)
	return held_mob?.attacked_by(I, user) || ..()

/mob/living/Adjacent(atom/neighbor)
	. = ..()
	var/obj/item/clothing/head/mob_holder/micro/micro_holder = loc
	if(istype(micro_holder))
		return micro_holder.Adjacent(neighbor)

/obj/item/clothing/head/mob_holder/micro/attack(mob/living/pred, mob/living/user)
	user.vore_attack(user, held_mob, pred)
	return STOP_ATTACK_PROC_CHAIN

/obj/item/clothing/head/mob_holder/micro/verb/interact_with()
	set name = "Interact With"
	set desc = "Perform an interaction with someone."
	set category = "IC"
	set src in view(usr.client)

	var/datum/component/interaction_menu_granter/menu = usr.GetComponent(/datum/component/interaction_menu_granter)
	if(!menu)
		to_chat(usr, span_warning("You must have done something really bad to not have an interaction component."))
		return

	if(!src)
		to_chat(usr, span_warning("Your interaction target is gone!"))
		return
	menu.open_menu(usr, src)
