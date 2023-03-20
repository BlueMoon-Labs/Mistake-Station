/*
DOG BORG EQUIPMENT HERE
SLEEPER CODE IS IN game/objects/items/devices/dogborg_sleeper.dm !
*/

/obj/item/dogborg/jaws
	name = "Dogborg jaws"
	desc = "The jaws of the debug errors oh god."
	icon = 'modular_sand/icons/mob/dogborg.dmi'
	flags_1 = CONDUCT_1
	force = 1
	throwforce = 0
	w_class = 3
	hitsound = 'sound/weapons/bite.ogg'
	sharpness = SHARP_EDGED

/obj/item/dogborg/jaws/big
	name = "combat jaws"
	desc = "The jaws of the law. Very sharp."
	icon_state = "jaws_2"
	force = 10 //Lowered to match secborg. No reason it should be more than a secborg's baton.
	attack_verb_simple = list("chomped", "bit", "ripped", "mauled", "enforced")

/obj/item/dogborg/jaws/small
	name = "puppy jaws"
	desc = "Rubberized teeth designed to protect accidental harm. Sharp enough for specialized tasks however."
	icon_state = "jaws_2"
	force = 6
	attack_verb_simple = list("nibbled", "bit", "gnawed", "chomped", "nommed")
	var/status = 0

/obj/item/dogborg/jaws/attack(atom/A, mob/living/silicon/robot/user)
	..()
	user.do_attack_animation(A, ATTACK_EFFECT_BITE)

/obj/item/dogborg/jaws/small/attack_self(mob/user)
	var/mob/living/silicon/robot/R = user
	if(R.cell && R.cell.charge > 100)
		if(R.emagged && status == 0)
			name = "combat jaws"
			icon_state = "jaws"
			desc = "The jaws of the law."
			force = 12
			attack_verb_simple = list("chomped", "bit", "ripped", "mauled", "enforced")
			status = 1
			to_chat(user, "<span class='notice'>Your jaws are now [status ? "Combat" : "Pup'd"].</span>")
		else
			name = "puppy jaws"
			icon_state = "smalljaws"
			desc = "The jaws of a small dog."
			force = 5
			attack_verb_simple = list("nibbled", "bit", "gnawed", "chomped", "nommed")
			status = 0
			if(R.emagged)
				to_chat(user, "<span class='notice'>Your jaws are now [status ? "Combat" : "Pup'd"].</span>")
	update_icon()

//Boop

/obj/item/analyzer/nose
	name = "boop module"
	icon = 'modular_sand/icons/mob/dogborg.dmi'
	icon_state = "nose"
	desc = "The BOOP module"
	flags_1 = CONDUCT_1
	force = 0
	throwforce = 0
	attack_verb_simple = list("nuzzles", "pushes", "boops")
	w_class = 1

/obj/item/analyzer/nose/attack_self(mob/user)
	user.visible_message("[user] sniffs around the air.", "<span class='warning'>You sniff the air for gas traces.</span>")
	if(user.stat != CONSCIOUS || !user.can_read(src)) //SKYRAT EDIT: Blind People Can Analyze Again
		return
	atmos_scan(user=user, target=get_turf(src), silent=FALSE)
	on_analyze(source=src, target=get_turf(src))

/obj/item/analyzer/nose/afterattack(atom/target, mob/user, proximity)
	. = ..()
	if(!proximity)
		return
	do_attack_animation(target, null, src)
	user.visible_message("<span class='notice'>[user] [pick(attack_verb_simple)] \the [target.name] with their nose!</span>")

//Delivery
/obj/item/storage/bag/borgdelivery
	name = "fetching storage"
	desc = "Fetch the thing!"
	icon = 'modular_sand/icons/mob/dogborg.dmi'
	icon_state = "dbag"
	w_class = WEIGHT_CLASS_BULKY

/obj/item/storage/bag/borgdelivery/Initialize()
	. = ..()

	atom_storage.max_specific_storage = WEIGHT_CLASS_BULKY
	atom_storage.max_total_storage = 1
	atom_storage.cant_hold = typecacheof(list(/obj/item/disk/nuclear, /obj/item/radio/intercom))

//Tongue stuff
/obj/item/soap/tongue
	name = "synthetic tongue"
	desc = "Useful for slurping mess off the floor before affectionally licking the crew members in the face."
	icon = 'modular_sand/icons/mob/dogborg.dmi'
	icon_state = "synthtongue"
	hitsound = 'sound/effects/attackblob.ogg'
	cleanspeed = 80
	var/status = 0

/obj/item/soap/tongue/scrubpup
	cleanspeed = 25 //slightly faster than a mop.

/obj/item/soap/tongue/New()
	..()
	item_flags |= NOBLUDGEON //No more attack messages

/obj/item/soap/tongue/attack_self(mob/user)
	var/mob/living/silicon/robot/R = user
	if(R.cell && R.cell.charge > 100)
		if(R.emagged && status == 0)
			status = !status
			name = "energized tongue"
			desc = "Your tongue is energized for dangerously maximum efficency."
			icon_state = "syndietongue"
			to_chat(user, "<span class='notice'>Your tongue is now [status ? "Energized" : "Normal"].</span>")
			cleanspeed = 10 //(nerf'd)tator soap stat
		else
			status = 0
			name = "synthetic tongue"
			desc = "Useful for slurping mess off the floor before affectionally licking the crew members in the face."
			icon_state = "synthtongue"
			cleanspeed = initial(cleanspeed)
			if(R.emagged)
				to_chat(user, "<span class='notice'>Your tongue is now [status ? "Energized" : "Normal"].</span>")
	update_icon()

/atom/proc/wash_cream()
	return TRUE

/obj/item/soap/tongue/afterattack(atom/target, mob/user, proximity)
	var/mob/living/silicon/robot/R = user
	if(!proximity || !check_allowed_items(target))
		return
	if(R.client && (target in R.client.screen))
		to_chat(R, "<span class='warning'>You need to take that [target.name] off before cleaning it!</span>")
	else if(ismopable(target))
		R.visible_message("[R] begins to lick off \the [target.name].", "<span class='warning'>You begin to lick off \the [target.name]...</span>")
		if(do_after(R, src.cleanspeed, target = target))
			if(!in_range(src, target)) //Proximity is probably old news by now, do a new check.
				return //If they moved away, you can't eat them.
			to_chat(R, "<span class='notice'>You finish licking off \the [target.name].</span>")
			qdel(target)
			R.cell.give(50)
	else if(isobj(target)) //hoo boy. danger zone man
		if(istype(target,/obj/item/trash))
			R.visible_message("[R] nibbles away at \the [target.name].", "<span class='warning'>You begin to nibble away at \the [target.name]...</span>")
			if(!do_after(R, src.cleanspeed, target = target))
				return //If they moved away, you can't eat them.
			to_chat(R, "<span class='notice'>You finish off \the [target.name].</span>")
			qdel(target)
			R.cell.give(250)
			return
		if(istype(target,/obj/item/stock_parts/cell))
			R.visible_message("[R] begins cramming \the [target.name] down its throat.", "<span class='warning'>You begin cramming \the [target.name] down your throat...</span>")
			if(!do_after(R, 50, target = target))
				return //If they moved away, you can't eat them.
			to_chat(R, "<span class='notice'>You finish off \the [target.name].</span>")
			var/obj/item/stock_parts/cell/C = target
			R.cell.charge = R.cell.charge + (C.charge / 3) //Instant full cell upgrades op idgaf
			qdel(target)
			return
		var/obj/item/I = target //HAHA FUCK IT, NOT LIKE WE ALREADY HAVE A SHITTON OF WAYS TO REMOVE SHIT
		if(!I.anchored && R.emagged)
			R.visible_message("[R] begins chewing up \the [target.name]. Looks like it's trying to loophole around its diet restriction!", "<span class='warning'>You begin chewing up \the [target.name]...</span>")
			if(!do_after(R, 100, target = I)) //Nerf dat time yo
				return //If they moved away, you can't eat them.
			visible_message("<span class='warning'>[R] chews up \the [target.name] and cleans off the debris!</span>")
			to_chat(R, "<span class='notice'>You finish off \the [target.name].</span>")
			qdel(I)
			R.cell.give(500)
			return
		R.visible_message("[R] begins to lick \the [target.name] clean...", "<span class='notice'>You begin to lick \the [target.name] clean...</span>")
	else if(ishuman(target))
		var/mob/living/L = target
		if(status == 0 && check_zone(R.zone_selected) == "head")
			R.visible_message("<span class='warning'>\the [R] affectionally licks \the [L]'s face!</span>", "<span class='notice'>You affectionally lick \the [L]'s face!</span>")
			playsound(src.loc, 'sound/effects/attackblob.ogg', 50, 1)
			if(istype(L) && L.fire_stacks > 0)
				L.adjust_fire_stacks(-10)
			return
		else if(status == 0)
			R.visible_message("<span class='warning'>\the [R] affectionally licks \the [L]!</span>", "<span class='notice'>You affectionally lick \the [L]!</span>")
			playsound(src.loc, 'sound/effects/attackblob.ogg', 50, 1)
			if(istype(L) && L.fire_stacks > 0)
				L.adjust_fire_stacks(-10)
			return
		else
			if(R.cell.charge <= 800)
				to_chat(R, "Insufficent Power!")
				return
			L.Stun(4) // normal stunbaton is force 7 gimme a break good sir!
			L.Knockdown(80)
			L.Paralyze(5)
			L.visible_message("<span class='danger'>[R] has shocked [L] with its tongue!</span>", \
								"<span class='userdanger'>[R] has shocked you with its tongue!</span>")
			playsound(loc, 'sound/weapons/Egloves.ogg', 50, 1, -1)
			R.cell.use(666)
			log_combat(R, L, "tongue stunned")

	else if(istype(target, /obj/structure/window))
		R.visible_message("[R] begins to lick \the [target.name] clean...", "<span class='notice'>You begin to lick \the [target.name] clean...</span>")
		if(do_after(user, src.cleanspeed, target = target))
			to_chat(user, "<span class='notice'>You clean \the [target.name].</span>")
			target.remove_atom_colour(WASHABLE_COLOUR_PRIORITY)
			target.set_opacity(initial(target.opacity))
	else
		R.visible_message("[R] begins to lick \the [target.name] clean...", "<span class='notice'>You begin to lick \the [target.name] clean...</span>")
		if(do_after(user, src.cleanspeed, target = target))
			to_chat(user, "<span class='notice'>You clean \the [target.name].</span>")
			var/obj/effect/decal/cleanable/C = locate() in target
			qdel(C)
			target.remove_atom_colour(WASHABLE_COLOUR_PRIORITY)
			SEND_SIGNAL(target, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_WASH)
			target.wash_cream()
			target.wash_cum()
	return

//Dogfood

/obj/item/trash/rkibble
	name = "robo kibble"
	desc = "A novelty bowl of assorted mech fabricator byproducts. Mockingly feed this to the sec-dog to help it recharge."
	icon = 'modular_sand/icons/mob/dogborg.dmi'
	icon_state= "kibble"

//Defibs

/obj/item/shockpaddles/cyborg/hound
	name = "Paws of Life"
	desc = "MediHound specific shock paws."
	icon = 'modular_sand/icons/mob/dogborg.dmi'
	icon_state = "defibpaddles0"
	icon_state = "defibpaddles0"

/obj/item/shockpaddles/cyborg/hound/Initialize()
	. = ..()
	AddComponent(/datum/component/two_handed)

//pleasuremaw stuff
/obj/item/milking_machine/pleasuremaw
	name = "pleasuremaw"
	desc = "A module that makes hound maws become slippery, warm, sticky, and soft, perfect place to slip your dick inside and relax, feed and help charge the borgs."
	icon = 'modular_sand/icons/mob/dogborg.dmi'
	icon_state = "pleasuremaw"
	on = TRUE
	var/toggle_process_regents = FALSE
	var/consumption_rate = 2
	var/mob/living/silicon/robot/borg_self = null

/obj/item/milking_machine/pleasuremaw/Initialize()
	. = ..()
	inserted_item = new /obj/item/reagent_containers/cup/beaker/meta(src)
	inserted_item.name = "cyborg stomach"
	inserted_item.desc = "A cyborg stomach. It seems integrated into [src]'s machinery."

/obj/item/milking_machine/pleasuremaw/Destroy()
	STOP_PROCESSING(SSobj, src) //please no
	QDEL_NULL(inserted_item)
	borg_self = null
	. = ..()

/obj/item/milking_machine/pleasuremaw/interact(mob/user)
	//start processing the regents in the container - and slowly use em up to create power
	toggle_process_regents = !toggle_process_regents
	if (toggle_process_regents)
		to_chat(user, "<span class='notice'>You start churning the sexual fluids from your [inserted_item.name] into energy.</span>")
		borg_self = user
		START_PROCESSING(SSobj, src)
	else
		STOP_PROCESSING(SSobj, src)
		to_chat(user, "<span class='notice'>You stop processing the fluids from the [inserted_item.name].</span>")
	return

/obj/item/milking_machine/pleasuremaw/process()
	//TODO: Check if any of the regents are not erotic fluids - if they are - stop the process and spit out a message to the user.
	if (inserted_item.reagents.total_volume < consumption_rate)
		src.interact(borg_self)
		return
	inserted_item.reagents.remove_all(consumption_rate)
	borg_self.cell.charge = min(borg_self.cell.charge + borg_self.cell.maxcharge/50, borg_self.cell.maxcharge)

/obj/item/milking_machine/pleasuremaw/AltClick(mob/living/user)
	//function for when alt-clicked -  do nothing for now - do not call parent
	return

/obj/item/milking_machine/pleasuremaw/afterattack(atom/target, mob/living/silicon/robot/user, proximity)
	//use pleasuremaw on designated body part in different ways depending on the intent
	if(!proximity || !check_allowed_items(target) || !istype(user))
		return

	if(istype(target, /obj/item/reagent_containers))
		if(inserted_item?.reagents?.total_volume <= 1) //oh noes my 0.62 units of extra luxurious semen
			to_chat(user, span_info("Pleasure maw tank empty."))
			return
		user.visible_message(span_notice("You open your mouth and dispense the contents of your [src.name]'s storage into \the [target]."),
			span_notice("[user] opens [ru_ego()] [src.name] and dispenses something sticky into \the [target]!")
		)
		inserted_item.reagents.trans_to(target, inserted_item.reagents.total_volume)
		return
	//TODO: check if internal beaker is too full - and if yes - spill rest onto floor

	if(!ishuman(target))
		return
	var/mob/living/carbon/human/victim = target
	target_organ = null

	//TODO: arms and legs?
	switch(user.zone_selected) //i can't make it pretty jeremy
		if(BODY_ZONE_PRECISE_MOUTH)
			//mouth
			//TODO: on harm intent feed contents of cyborg stomach to person instead
			//		make a check for if the mouth is covered
			user.visible_message(span_warning("[user] kisses [victim]!"),
				span_notice("You kiss [victim]!")
			)
			playsound(src.loc, 'sound/effects/attackblob.ogg', 30, 1)
			victim.add_lust(10)

		if(BODY_ZONE_HEAD, BODY_ZONE_PRECISE_EYES) //It's still funny how he thought hypercode was from sand lol
			user.visible_message(span_warning("[user] licks [victim]'s ears!"),
				span_notice("You lick [victim]'s ears!")
			)
			playsound(src.loc, 'sound/effects/attackblob.ogg', 30, 1)
			victim.add_lust(5)
		if(BODY_ZONE_CHEST)
			var/obj/item/organ/genital/breasts/breasts = victim.getorganslot(ORGAN_SLOT_BREASTS)
			if(breasts?.is_exposed())
				user.visible_message(span_warning("[user] sucks on [victim]'s [breasts.name]]!"),
					span_notice("You suck on [victim]'s [breasts.name]]!")
				)
				playsound(src.loc, 'sound/effects/attackblob.ogg', 30, 1)
				victim.add_lust(10)
				return ..() //this is giving me chain aneurisms but i don't have the patience to fix this
			else
				to_chat(user, span_info("Lickable breasts not found!"))
		if(BODY_ZONE_PRECISE_GROIN)
			//penis,testies,vag,ass
			//TODO: add only the parts that the target actually has to the radial menu
			//		add color to images and make them correspond with the type that the target user has
			//		make it so that if a covered up part is chosen - it licks the outside (the clothes). (apply this to the mouth interaction)
			var/static/list/possible_choices = sortList(list(
				"Penis" = image(icon = 'icons/obj/genitals/penis.dmi', icon_state = "penis"),
				"Testicles" = image(icon= 'icons/obj/genitals/testicles.dmi', icon_state = "testicles"),
				"Vagina" = image(icon= 'icons/obj/genitals/vagina.dmi', icon_state = "vagina"),
				"Butt" = image(icon= 'icons/obj/genitals/breasts.dmi', icon_state = "butt"),
				"Belly" = image(icon= 'modular_splurt/icons/obj/genitals/belly_onmob.dmi', icon_state = "belly_pair_4_0_FRONT")
			))
			var/choice = show_radial_menu(user, src, possible_choices)
			if(!choice)
				return
			switch(choice)
				if("Penis")
					var/obj/item/organ/genital/penis/penis = victim.getorganslot(ORGAN_SLOT_PENIS)
					if(penis?.is_exposed())
						target_organ = ORGAN_SLOT_PENIS
						user.visible_message(span_warning("[user] blows [victim]'s [penis.name]!"),
							span_notice("You blow [victim]'s [penis.name]!")
						)
						playsound(src.loc, 'sound/effects/attackblob.ogg', 30, 1)
						victim.add_lust(10)
						return ..()
					else
						to_chat(user, span_info("Lickable penis not found!"))
				if("Testicles")
					var/obj/item/organ/genital/testicles/testicles = victim.getorganslot(ORGAN_SLOT_TESTICLES)
					if(testicles?.is_exposed())
						user.visible_message(span_warning("[user] laps [victim]'s [testicles.name]!"),
							span_notice("You lap [victim]'s [testicles.name]!")
						)
						playsound(src.loc, 'sound/effects/attackblob.ogg', 30, 1)
						victim.add_lust(10)
						return ..()
					else
						to_chat(user, span_info("Lickable testicles not found!"))
				if("Vagina")
					var/obj/item/organ/genital/vagina/vagina = victim.getorganslot(ORGAN_SLOT_VAGINA)
					if(vagina?.is_exposed())
						target_organ = ORGAN_SLOT_VAGINA
						user.visible_message(span_warning("[user] tongue fucks [victim]'s [vagina.name]!"),
							span_notice("You tongue fuck [victim]'s [vagina.name]!")
						)
						playsound(src.loc, 'sound/effects/attackblob.ogg', 30, 1)
						victim.add_lust(10)
						return ..()
					else
						to_chat(user, span_info("Lickable pussy not found!"))
				if("Butt")
					var/obj/item/organ/genital/butt/butt = victim.getorganslot(ORGAN_SLOT_BUTT)
					if(butt?.is_exposed())
						user.visible_message(span_warning("[user]'s giving [victim] a rimjob!"),
							span_notice("You rim [victim]'s [butt.name]!")
						)
						playsound(src.loc, 'sound/effects/attackblob.ogg', 30, 1)
						victim.add_lust(15)
					else
						to_chat(user, span_info("Lickable ass not found!"))
				if("Belly")
					var/obj/item/organ/genital/belly/belly = victim.getorganslot(ORGAN_SLOT_BELLY)
					if(belly?.is_exposed())
						user.visible_message(span_notice("[user]'s lapping [victim]'s [belly.name]!"),
							span_notice("You lick [victim]'s [belly.name]!")
						)
						playsound(src, 'sound/effects/attackblob.ogg', 30, 1)
						victim.add_lust(5)
					else
						to_chat(user, span_info("Lickable belly not found!"))
		//TODO:	make check for if is in harm intent - if yes (spit regents from cyborg stomach) at target
		//		if is nearby
		// 			if target has a mouth and target_bodypart is mouth
		// 				feed all of the regents to target
		//			else
		// 				splash target with regents
		//		else spit regents in direction of where it was clicked and get what was hit (target)
		// 			if target has a mouth and target_bodypart is mouth
		// 				feed 10u of the regents to target
		// 			splash target with remaining regents
