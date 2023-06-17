/obj/item/clothing/mask/leatherwhip/ridingcrop
	name = "riding crop"
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	desc = "For teaching a lesson in a more compact fashion."
	icon_state = "ridingcrop"
	force = 30

/obj/item/clothing/mask/leatherwhip/suicide_act(mob/user)
		user.visible_message("<span class='suicide'>[user] is getting just a little too kinky!</span>")
		return (OXYLOSS)

/obj/item/khopesh
	name = "khopesh"
	desc = "An sickle-shaped sword that evolved from battle axes"
	icon_state = "khopesh"
	icon_state = "khopesh"
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	lefthand_file = 'modular_splurt/icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/weapons/swords_righthand.dmi'
	hitsound = 'sound/weapons/bladeslice.ogg'
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BELT
	force = 30
	throwforce = 10
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb_simple = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	sharpness = SHARP_EDGED
	max_integrity = 200
	resistance_flags = FIRE_PROOF

/obj/item/khopesh/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is falling on [src]! It looks like [user.ru_who()] trying to commit suicide!</span>")
	return(BRUTELOSS)

#define STATUS_EFFECT_ELECTROSTAFF /datum/status_effect/electrostaff		//slows down victim

/datum/status_effect/electrostaff
	id = "electrostaff"
	alert_type = null
	status_type = STATUS_EFFECT_REPLACE

/datum/status_effect/electrostaff/on_creation(mob/living/new_owner, set_duration)
	if(isnum(set_duration))
		duration = set_duration
	. = ..()
	owner.add_movespeed_modifier(/datum/movespeed_modifier/status_effect/electrostaff)

/datum/status_effect/electrostaff/on_remove()
	. = ..()
	owner.remove_movespeed_modifier(/datum/movespeed_modifier/status_effect/electrostaff)

/obj/item/electrostaff
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	icon_state = "electrostaff"
	inhand_icon_state = "electrostaff"
	lefthand_file = 'icons/mob/inhands/weapons/staves_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/staves_righthand.dmi'
	name = "riot suppression electrostaff"
	desc = "A large quarterstaff, with massive silver electrodes mounted at the end."
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = ITEM_SLOT_BACK | ITEM_SLOT_OCLOTHING
	throwforce = 15			//if you are a madman and finish someone off with this, power to you.
	throw_speed = 1
	item_flags = NO_MAT_REDEMPTION
	attack_verb_simple = list("struck", "beaten", "thwacked", "pulped")
	attack_speed = CLICK_CD_MELEE
	block_chance = 30
	var/obj/item/stock_parts/cell/cell = /obj/item/stock_parts/cell/high
	var/on = FALSE
	var/can_block_projectiles = FALSE		//can't block guns
	var/lethal_cost = 400			//10000/400*20 = 500. decent enough?
	var/lethal_damage = 20
	var/stun_cost = 333				//10000/333*25 = 750. stunbatons are at time of writing 10000/1000*49 = 490.
	var/stun_status_effect = STATUS_EFFECT_ELECTROSTAFF			//a small slowdown effect
	var/stun_stamdmg = 40
	var/stun_status_duration = 25
	var/stam_cost = 3.5
	var/wielded = FALSE // track wielded status on item

/obj/item/electrostaff/Initialize(mapload)
	. = ..()
	if(ispath(cell))
		cell = new cell
	RegisterSignal(src, COMSIG_TWOHANDED_WIELD, PROC_REF(turn_on))
	RegisterSignal(src, COMSIG_TWOHANDED_UNWIELD, PROC_REF(turn_off))

/obj/item/electrostaff/Initialize()
	. = ..()
	AddComponent(/datum/component/two_handed, force_multiplier=2, wieldsound="sparks", unwieldsound="sparks")

/obj/item/electrostaff/Destroy()
	STOP_PROCESSING(SSobj, src)
	QDEL_NULL(cell)
	return ..()

/obj/item/electrostaff/get_cell()
	. = cell
	if(iscyborg(loc))
		var/mob/living/silicon/robot/R = loc
		. = R.get_cell()

/obj/item/electrostaff/proc/min_hitcost()
	return min(stun_cost, lethal_cost)

/obj/item/electrostaff/proc/turn_on(obj/item/source, mob/user)
	wielded = TRUE
	if(!cell)
		if(user)
			to_chat(user, "<span class='warning'>[src] has no cell.</span>")
		return
	if(cell.charge < min_hitcost())
		if(user)
			to_chat(user, "<span class='warning'>[src] is out of charge.</span>")
		return
	on = TRUE
	START_PROCESSING(SSobj, src)
	if(user)
		to_chat(user, "<span class='warning'>You turn [src] on.</span>")

/obj/item/electrostaff/proc/turn_off(obj/item/source, mob/user)
	wielded = FALSE
	if(user)
		to_chat(user, "<span class='warning'>You turn [src] off.</span>")
	on = FALSE
	STOP_PROCESSING(SSobj, src)

/obj/item/electrostaff/update_icon_state()
	if(!wielded)
		icon_state = inhand_icon_state = "electrostaff"
	else
		icon_state = inhand_icon_state = (on? "electrostaff_1" : "electrostaff_0")
	set_light(7, on? 1 : 0, LIGHT_COLOR_CYAN)
	return ..()

/obj/item/electrostaff/examine(mob/living/user)
	. = ..()
	if(cell)
		. += "<span class='notice'>The cell charge is [round(cell.percent())]%.</span>"
	else
		. += "<span class='warning'>There is no cell installed!</span>"

/obj/item/electrostaff/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/stock_parts/cell))
		var/obj/item/stock_parts/cell/C = W
		if(cell)
			to_chat(user, "<span class='warning'>[src] already has a cell!</span>")
		else
			if(C.maxcharge < min_hit_cost())
				to_chat(user, "<span class='notice'>[src] requires a higher capacity cell.</span>")
				return
			if(!user.transferItemToLoc(W, src))
				return
			cell = C
			to_chat(user, "<span class='notice'>You install a cell in [src].</span>")

	else if(W.tool_behaviour == TOOL_SCREWDRIVER)
		if(cell)
			cell.update_icon()
			cell.forceMove(get_turf(src))
			cell = null
			to_chat(user, "<span class='notice'>You remove the cell from [src].</span>")
			turn_off(user, TRUE)
	else
		return ..()

/obj/item/electrostaff/process()
	deductcharge(50)			//Wasteful!

/obj/item/electrostaff/proc/min_hit_cost()
	return min(lethal_cost, stun_cost)

/obj/item/electrostaff/proc/deductcharge(amount)
	var/obj/item/stock_parts/cell/C = get_cell()
	if(!C)
		turn_off()
		return FALSE
	C.use(min(amount, C.charge))
	if(QDELETED(src))
		return FALSE
	if(C.charge < min_hit_cost())
		turn_off()

/obj/item/electrostaff/attack(mob/living/target, mob/living/user)
	if(on && HAS_TRAIT(user, TRAIT_CLUMSY) && prob(50))
		clowning_around(user)			//ouch!
		return
	if(iscyborg(target))
		return ..()
	var/list/return_list = list()
	if(user.combat_mode != TRUE)
		if(stun_act(target, user, null, return_list))
			user.do_attack_animation(target)
		return
	else if(!harm_act(target, user, null, return_list))
		return ..()		//if you can't fry them just beat them with it
	else		//we did harm act them
		user.do_attack_animation(target)

/obj/item/electrostaff/proc/stun_act(mob/living/target, mob/living/user, no_charge_and_force = FALSE, list/block_return = list())
	var/stunforce = BATON_ATTACKING
	if(!no_charge_and_force)
		if(!on)
			target.visible_message("<span class='warning'>[user] has bapped [target] with [src]. Luckily it was off.</span>", \
							"<span class='warning'>[user] has bapped you with [src]. Luckily it was off</span>")
			turn_off()			//if it wasn't already off
			return FALSE
		var/obj/item/stock_parts/cell/C = get_cell()
		var/chargeleft = C.charge
		deductcharge(stun_cost)
		if(QDELETED(src) || QDELETED(C))		//boom
			return FALSE
		if(chargeleft < stun_cost)
			stunforce *= round(chargeleft/stun_cost, 0.1)
	target.adjustStaminaLoss(stunforce)
	target.Paralyze(5)
	SEND_SIGNAL(target, COMSIG_LIVING_MINOR_SHOCK)
	if(user)
		target.lastattacker = user.real_name
		target.lastattackerckey = user.ckey
		target.LAssailant = WEAKREF(user)
		target.visible_message("<span class='danger'>[user] has shocked [target] with [src]!</span>", \
								"<span class='userdanger'>[user] has shocked you with [src]!</span>")
		log_combat(user, target, "stunned with an electrostaff")
	playsound(src, 'sound/weapons/staff.ogg', 50, 1, -1)
	target.apply_status_effect(stun_status_effect, stun_status_duration)
	return TRUE

/obj/item/electrostaff/proc/harm_act(mob/living/target, mob/living/user, no_charge_and_force = FALSE, list/block_return = list())
	var/lethal_force = BATON_ATTACKING
	if(!no_charge_and_force)
		if(!on)
			return FALSE		//standard item attack
		var/obj/item/stock_parts/cell/C = get_cell()
		var/chargeleft = C.charge
		deductcharge(lethal_cost)
		if(QDELETED(src) || QDELETED(C))		//boom
			return FALSE
		if(chargeleft < stun_cost)
			lethal_force *= round(chargeleft/lethal_cost, 0.1)
	target.adjustFireLoss(lethal_force)		//good against ointment spam
	SEND_SIGNAL(target, COMSIG_LIVING_MINOR_SHOCK)
	if(user)
		target.lastattacker = user.real_name
		target.lastattackerckey = user.ckey
		target.LAssailant = WEAKREF(user)
		target.visible_message("<span class='danger'>[user] has seared [target] with [src]!</span>", \
								"<span class='userdanger'>[user] has seared you with [src]!</span>")
		log_combat(user, target, "burned with an electrostaff")
	playsound(src, 'sound/weapons/sear.ogg', 50, 1, -1)
	return TRUE

/obj/item/electrostaff/proc/clowning_around(mob/living/user)
	user.visible_message("<span class='danger'>[user] accidentally hits себя with [src]!</span>", \
						"<span class='userdanger'>You accidentally hit yourself with [src]!</span>")
	SEND_SIGNAL(user, COMSIG_LIVING_MINOR_SHOCK)
	harm_act(user, user, TRUE)
	stun_act(user, user, TRUE)
	deductcharge(lethal_cost)

/obj/item/electrostaff/emp_act(severity)
	. = ..()
	if (!(. & EMP_PROTECT_SELF))
		turn_off()
		if(!iscyborg(loc))
			deductcharge(severity*10, TRUE, FALSE)
