//Made by quotefox
//Really needs some work, mainly because condoms should be a container for semen, but I dont know how that works yet. Feel free to improve upon.

/obj/item/genital_equipment/condom //TODO: fucking fix whatever the shit this it
	name 				= "condom"
	desc 				= "Dont be silly, cover your willy!"
	icon 				= 'modular_splurt/icons/obj/condom.dmi'
	throwforce			= 0
	icon_state 			= "b_condom_wrapped"
	var/unwrapped		= 0
	w_class 			= WEIGHT_CLASS_TINY
	custom_price		= PAYCHECK_LOWER * 3 // 75 credits

/obj/item/genital_equipment/condom/Initialize()
	create_reagents(300, DRAWABLE|NO_REACT)
	..()

/obj/item/genital_equipment/condom/update_icon()
	switch(reagents.total_volume)
		if(0 to 49)
			icon_state = "b_condom_inflated"
		if(50 to 100)
			icon_state = "b_condom_inflated_med"
		if(101 to 249)
			icon_state = "b_condom_inflated_large"
		if(250 to 300)
			icon_state = "b_condom_inflated_huge"
	..()

/obj/item/genital_equipment/condom/proc/on_reagent_change()
	update_icon()

/obj/item/genital_equipment/condom/attack_self(mob/user) //Unwrap The Condom in hands
	if(!istype(user))
		return
	if(isliving(user))
		if(unwrapped == 0)
			icon_state 	= "b_condom"
			unwrapped = 1
			to_chat(user, "<span class='notice'>You unwrap the condom.</span>")
			playsound(user, 'sound/items/poster_ripped.ogg', 50, 1, -1)
			return

/obj/item/genital_equipment/condom/throw_impact(atom/hit_atom)
	. = ..()
	if(!.) //if we're not being caught
		splat(hit_atom)

/obj/item/genital_equipment/condom/proc/splat(atom/movable/hit_atom)
	if(isliving(loc))
		return
	var/turf/T = get_turf(hit_atom)
	new/obj/effect/decal/cleanable/semen(T)
	playsound(T, 'sound/misc/splort.ogg', 50, TRUE)
	qdel(src)
//		if(unwrapped == 1)
//			new /obj/item/clothing/head/condom(usr.loc)
//			qdel(src)
//			to_chat(user, "<span class='notice'>You roll the condom out.</span>")
//			playsound(user, 'sound/lewd/latex.ogg', 50, 1, -1)
//			return
/*
/obj/item/genital_equipment/condom/attack(mob/living/carbon/C, mob/living/user) //apply the johnny on another person or yourself

	if(unwrapped == 0 )
		to_chat(user, "<span class='notice'>You must remove the condom from the package first!</span>")
		return
	var/obj/item/organ/external/genital/penis/P = C.get_organ_slot(ORGAN_SLOT_PENIS)
	if((C.has_penis(REQUIRE_EXPOSED) && (P?.visibility_preference & HAS_EQUIPMENT)) || (C.has_strapon(REQUIRE_EXPOSED)))
		if(P.equipment[GENITAL_EQUIPEMENT_CONDOM])
			to_chat(user, "<span class='notice'>\The [C] already has condom on!</span>")
			return
		if(isliving(C) && isliving(user) && unwrapped == 1)
			C.visible_message("<span class='warning'>\The <b>[user]</b> is trying to put a condom on \the <b>[C]</b>!</span>",\
						"<span class='warning'>\The <b>[user]</b> is trying to put a condom on you!</span>")
		if(!do_after(user, C, 4 SECONDS))	//if Failed to put the condom on
			return
		if(!user.transferItemToLoc(src, P)) //check if you can put it in
			return
		//var/mob/living/carbon/human/L = C
		playsound(C, 'modular_sand/sound/lewd/latex.ogg', 50, 1, -1)
		P.equipment[GENITAL_EQUIPEMENT_CONDOM] = src //apply condom
		/*
		P.colourtint = "87ceeb" //We'll do this later
		if(L)
			L.update_genitals() // apply the colour!
		*/
		if(C.has_penis())
			to_chat(C, "<span class='userlove'>Your penis feels more safe!</span>")
		else
			to_chat(C, "<span class='userlove'>Your strapon feels more safe... Not sure why would that matter though.</span>")

		return
	to_chat(user, "<span class='notice'>You can't find anywhere to put the condom on.</span>") //Trying to put it on something without/or with a hidden
*/

/obj/item/clothing/head/condom //p
	name = "condom"
	icon = 'modular_splurt/icons/obj/condom.dmi'
	desc = "Looks like someone had abit of some fun!"
	worn_icon = 'modular_splurt/icons/obj/clothing/head.dmi'
	icon_state = "b_condom_out"


/* Handled on lewd interactions
/mob/living/carbon/human/proc/removecondom()

	var/obj/item/organ/external/genital/penis/P = get_organ_slot("penis")
	if(P.condom)
		new /obj/item/clothing/head/condom(usr.loc)
		P.condom = FALSE
		/*P.colourtint = ""
		update_genitals()*/
*/
/*
/obj/item/genital_equipment/condom/filled
	name 				= "filled condom"
	icon_state 			= "b_condom_inflated"
	unwrapped			= 2
	w_class = WEIGHT_CLASS_TINY

/obj/item/genital_equipment/condom/filled/throw_impact(atom/hit_atom)
	. = ..()
	if(!.) //if we're not being caught
		splat(hit_atom)

/obj/item/genital_equipment/condom/filled/proc/splat(atom/movable/hit_atom)
	if(isliving(loc))
		return
	var/turf/T = get_turf(hit_atom)
	new/obj/effect/decal/cleanable/semen(T)
	playsound(T, 'sound/misc/splort.ogg', 50, TRUE)
	qdel(src)
*/
/*
/obj/item/genital_equipment/condom/genital_remove_proccess(obj/item/organ/external/genital/G)
	if(!G.equipment[GENITAL_EQUIPEMENT_CONDOM])
		return
	new /obj/item/clothing/head/condom(owner.loc)
	G.equipment.Remove(GENITAL_EQUIPEMENT_CONDOM)
	. = ..()
	qdel(src)

*/

/mob/living/carbon/human/proc/condomclimax()
	var/obj/item/organ/external/genital/penis/P = get_organ_slot(ORGAN_SLOT_PENIS)
	var/obj/item/genital_equipment/condom/condo = locate(/obj/item/genital_equipment/condom) in P.contents
	return condo

	/*
	var/obj/item/genital_equipment/condom/filled/C = new
	P.linked_organ.reagents.trans_to(C, P.linked_organ.reagents.total_volume)
	C.loc = loc
	P.condom = FALSE
	//P.colourtint = ""
	update_genitals()
	C.update_icon()
	to_chat(src, "<span class='love'>The condom bubbles outwards and fills with your cum.</span>")
	SEND_SIGNAL(src, COMSIG_ADD_MOOD_EVENT, "orgasm", /datum/mood_event/orgasm)
	setArousalLoss(0)
	*/
