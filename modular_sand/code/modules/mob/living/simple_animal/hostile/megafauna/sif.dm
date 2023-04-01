/*
Original PR made by sushifish on Russ Station. Bob joga just did a lazy ass port.
SIF (Sprites and ideas by MetalGearMan)

Sif spawns randomly in lavaland when it can, in the form of a sword which the user needs to interact with in order to summon Sif.

Speical attacks:
	- When Sif's able to he will charge his current target with 200% increased speed for 1 second, getting right next to his target.
	- Sif can also do an AOE spin attack.

	Links for videos on all of Sif's modes and attacks:

	Summon:			  https://bungdeep.com/Sif/Sif_Summon.mp4
	Angered Stage:	  https://bungdeep.com/Sif/Sif_Angered.mp4
	Enraged Stage:	  https://bungdeep.com/Sif/Sif_Enraged.mp4

	Projectile Dodge: https://bungdeep.com/Sif/Sif_Dodge.mp4

	AOE Spin:		  https://bungdeep.com/Sif/Sif_Spin.mp4
	Charge: 		  https://bungdeep.com/Sif/Sif_Charge.mp4
	Spin and Charge:  https://bungdeep.com/Sif/Sif_Spin_and_charge.mp4

	Death:			  https://bungdeep.com/Sif/Sif_Death.mp4

Sif has three stages:
 1. Normal state when it has health above 50%.
 2. When Sif reaches below 50% health it enters a angered state, which makes Sif's movement speed faster and attack speed slower,
 	with increased usage of specials.
 3. At 20% health Sif is significantly slowed but constantly doing special attacks.

WHEN SIF IS ANGERED (Stage 2):
	- Sif's specials take 50% less time to recharge from (Normal = 100) to (Angered = 50)
	- Sif's attack speed decreased by 30% and movement speed increased by 50%

WHEN SIF IS ENRAGED (Stage 3):
	- Sif's specials take 60% less time to recharge from (Angered = 50) to (Enraged = 30)
	- Sif is way slower but does more damage, as well as chances to dodge projectiles and melee attacks more often.

When Sif dies, it leaves behind a:
	!! Sword Of The Forsaken !! -> Giant ass sword that does damage. Small chance of blocking hits and almost no chance to block projectiles.
	!! Necklace Of The Forsaken !! -> Works by instantly reviving or fully healing the user at their discretion (one time use and can be used when dead, knocked out or alive)
	!! Dark Energy !! (If killed with a kinetic crusher) -> A Kinetic Crusher attachment which performs a bash attack for 100 damage (only works on big boy mobs like megafaunas)
Difficulty: Medium
*/

//Sif stuff
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Sword Of The Forsaken=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=//

/*Videos on what the sword can do:
**
**Attacking: ----------	https://bungdeep.com/Sif/Sword_of_the_Forsaken_Attack.mp4
**Butchering: --------- https://bungdeep.com/Sif/Sword_of_the_Forsaken_Butcher.mp4
**Dodging: ------------ https://bungdeep.com/Sif/Sword_of_the_Forsaken_Block_Melee.png
**Projectile Dodging: - https://bungdeep.com/Sif/Sword_of_the_Forsaken_Block.png
**
*/
/obj/item/melee/sword_of_the_forsaken
	name = "Sword of the Forsaken"
	desc = "A glowing giant heavy blade that grows and slightly shrinks in size depending on the wielder's strength."
	icon = 'modular_sand/icons/obj/lavaland/sif.dmi'
	icon_state = "sword_of_the_forsaken"
	inhand_icon_state = "sword_of_the_forsaken"
	lefthand_file = 'modular_sand/icons/mob/inhands/item_lefthand.dmi'
	righthand_file = 'modular_sand/icons/mob/inhands/item_righthand.dmi'
	w_class = WEIGHT_CLASS_HUGE
	force = 20 //slight buff because 15 just doesn't cut it for megafauna loot... hehe "cut it"
	throwforce = 10
	block_chance = 20 //again, slight buff
	armour_penetration = 200 //the armor penetration is really what makes this unique and actually worth it so boomp it
	hitsound = 'modular_sand/sound/sif/sif_slash.ogg'
	attack_verb_simple = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut", "gutted", "gored")
	sharpness = SHARP_EDGED
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

//Enables the sword to butcher bodies
/obj/item/melee/sword_of_the_forsaken/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/butchering, 50, 100, 10)

//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=End of Sworf Of The Forsaken=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=//


//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=Necklace Of The Forsaken=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=//

/*Videos on what the necklace can do:
**
**Binding the necklace to yourself: ------- https://bungdeep.com/Sif/Necklace_of_the_Forsaken_Binding.mp4
**Reviving when died: --------------------- https://bungdeep.com/Sif/Necklace_of_the_Forsaken_Death_Revive.mp4
**Becomes a cosmetic item after it is used: https://bungdeep.com/Sif/Necklace_of_the_Forsaken_Revive_Used.png
**
*/
/obj/item/clothing/neck/necklace/necklace_of_the_forsaken
	name = "Necklace of the Forsaken"
	desc = "A rose gold necklace with a small static ember that burns inside of the black gem stone, making it warm to the touch."
	icon = 'modular_sand/icons/obj/lavaland/sif.dmi'
	icon_state = "necklace_forsaken_active"
	actions_types = list(/datum/action/item_action/hands_free/necklace_of_the_forsaken)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	var/mob/living/carbon/active_owner
	var/numUses = 1

/obj/item/clothing/neck/necklace/necklace_of_the_forsaken/item_action_slot_check(slot)
	return (..() && (slot == ITEM_SLOT_NECK))

/obj/item/clothing/neck/necklace/necklace_of_the_forsaken/dropped(mob/user)
	..()
	if(active_owner)
		remove_necklace()

//Apply a temp buff until the necklace is used
/obj/item/clothing/neck/necklace/necklace_of_the_forsaken/proc/temp_buff(mob/living/carbon/human/user)
	to_chat(user, "<span class='warning'>You feel as if you have a second chance at something, but you're not sure what.</span>")
	if(do_after(user, 40, target = user))
		to_chat(user, "<span class='notice'>The ember warms you...</span>")
		ADD_TRAIT(user, TRAIT_NOHARDCRIT, "necklace_of_the_forsaken")//less chance of being gibbed
		active_owner = user

//Revive the user and remove buffs
/obj/item/clothing/neck/necklace/necklace_of_the_forsaken/proc/second_chance()
	icon_state = "necklace_forsaken_active"
	if(!active_owner)
		return
	var/mob/living/carbon/C = active_owner
	active_owner = null
	to_chat(C, "<span class='userdanger'>You feel a scorching burn fill your body and limbs!</span>")
	C.revive(TRUE, FALSE)
	remove_necklace() //remove buffs

//Remove buffs
/obj/item/clothing/neck/necklace/necklace_of_the_forsaken/proc/remove_necklace()
	icon_state = "necklace_forsaken_active"
	if(!active_owner)
		return
	REMOVE_TRAIT(active_owner, TRAIT_NOHARDCRIT, "necklace_of_the_forsaken")
	active_owner = null //just in case

//Add action
/datum/action/item_action/hands_free/necklace_of_the_forsaken
	check_flags = NONE
	name = "Necklace of the Forsaken"
	desc = "Bind the necklaces ember to yourself, so that next time you activate it, it will revive or fully heal you whether dead or knocked out. (Beware of being gibbed)"

//What happens when the user clicks on datum
/datum/action/item_action/hands_free/necklace_of_the_forsaken/Trigger(trigger_flags)
	var/obj/item/clothing/neck/necklace/necklace_of_the_forsaken/MM = target
	if(MM.numUses <= 0)//skip if it has already been used up
		return
	if(!MM.active_owner)//apply bind if there is no active owner
		if(iscarbon(owner))
			MM.temp_buff(owner)
		src.desc = "Revive or fully heal yourself, but you can only do this once! Can be used when knocked out or dead."
		to_chat(MM.active_owner, "<span class='userdanger'>You have binded the ember to yourself! The next time you use the necklace it will heal you!</span>")
	else if(MM.numUses >= 1 && MM.active_owner)//revive / heal then remove usage
		MM.second_chance()
		MM.numUses = 0
		MM.icon_state = "necklace_forsaken"
		MM.desc = "A rose gold necklace that used to have a bright burning ember inside of it."
		src.desc = "The necklaces ember has already been used..."

//Sifs loot chest
/obj/structure/closet/crate/necropolis/sif
	name = "Great Brown Wolf Sif's chest"

/obj/structure/closet/crate/necropolis/sif/PopulateContents()
	new /obj/item/melee/sword_of_the_forsaken(src)
	new /obj/item/clothing/neck/necklace/necklace_of_the_forsaken(src)
	new /obj/item/reagent_containers/cup/bottle/potion/flight(src)

/obj/structure/closet/crate/necropolis/sif/crusher
	name = "Great Brown Wolf Sif's infinity chest"

/obj/structure/closet/crate/necropolis/sif/crusher/PopulateContents()
	new /obj/item/melee/sword_of_the_forsaken(src)
	new /obj/item/clothing/neck/necklace/necklace_of_the_forsaken(src)
	new /obj/item/crusher_trophy/dark_energy(src)

/mob/living/simple_animal/hostile/megafauna/sif
	name = "Great Brown Wolf Sif"
	desc = "Guardian of the abyss. Looks pretty pissed that you're here."
	health = 4000
	maxHealth = 4000
	movement_type = GROUND
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	attack_sound = 'modular_sand/sound/sif/sif_slash.ogg'
	icon_state = "Great_Brown_Wolf"
	icon_living = "Great_Brown_Wolf"
	icon_dead = ""
	friendly_verb_continuous = "stares down"
	friendly_verb_simple = "stare down"
	icon = 'modular_sand/icons/mob/lavaland/sif.dmi'
	speak_emote = list("growls")
	gps_name = "Infinity Signal"
	armour_penetration = 50
	melee_damage_lower = 35
	melee_damage_upper = 35
	speed = 1.5
	pixel_x = -32 //Hit box perfectly centered
	pixel_y = -16
	move_to_delay = 3
	rapid_melee = 2
	melee_queue_distance = 10
	ranged = FALSE
	del_on_death = 1
	loot = list(/obj/structure/closet/crate/necropolis/sif)
	crusher_loot = list(/obj/structure/closet/crate/necropolis/sif/crusher)

	death_message = "falls into the abyss."
	death_sound = 'modular_sand/sound/sif/death_howl.ogg'
	var/can_special = 1 //Enables sif to do what he does best, spin and charge
	var/spinIntervals = 0 //Counts how many spins Sif does before setting spinning status to false
	var/spinning = FALSE //AOE spin special attack status
	var/charging = FALSE //dashing special attack status
	var/angered = FALSE //active at < 50% health
	var/enraged = FALSE //active at < 20% health
	var/stageTwo = FALSE
	var/stageThree = FALSE
	var/currentPower = 0 //Every few seconds this variable gets higher, when it gets high
						 //enough it will use a special attack then reset the variable to 0w
	glorymessageshand = list("climbs atop the wolf's head as it dangles weakly near the ground, ripping its left eye off and jumping down before punching through it's cranium!", "goes around the wolf and rips off their tail, using it as whip on the fiend")
	glorymessagescrusher = list("chops off the wolf's head by it's neck!")
	glorymessagespka = list("shoots at the wolf's eyes with their PKA, exploding them into giblets!")
	glorymessagespkabayonet = list("slides down below Sif, using their bayonet to rip it's stomach open!")
	var/list/hit_things = list()

//Sword structure, used to summon sif.
/obj/structure/sword/sif
	name = "Massive Glowing Sword"
	desc = "Sweet! A free sword!"
	max_integrity = 10000
	anchored = TRUE
	icon = 'modular_sand/icons/mob/lavaland/sif_sword.dmi'
	icon_state = "Idle_Sword"
	layer = HIGH_OBJ_LAYER //Looks better when its over everything... cause its huge

//When the sword is touched it will spawn sif.
/obj/structure/sword/sif/attack_hand(mob/user)
	icon_state = "Interact_Sword"
	playsound(get_turf(src.loc), 'sound/effects/curse1.ogg', 100, 1)
	spawn(30)
		if(!QDELETED(src))
			new /mob/living/simple_animal/hostile/megafauna/sif(get_turf(src.loc))
			visible_message("<span class='notice'>The ground shakes.</span>")
			playsound(get_turf(src.loc), 'sound/effects/curse3.ogg', 100, 1)
			playsound(get_turf(src.loc), 'sound/effects/meteorimpact.ogg', 100, 1)
			qdel(src)

//Sif's charge attack
/mob/living/simple_animal/hostile/megafauna/sif/proc/rush()

	//Target
	if(!target)
		return //Exit porc

	var/chargeturf = get_turf(target)

	//Targets turf
	if(!chargeturf)
		return //Exit proc

	var/dir = get_dir(src, chargeturf)
	var/turf/T = get_ranged_target_turf(chargeturf, dir, 2)

	//Turfs area
	if(!T)
		return //Exit proc

	//Start charging
	charging = TRUE
	DestroySurroundings()
	walk(src, 0)
	setDir(dir)
	var/movespeed = 1
	walk_to(src, T, movespeed)
	var/atom/prevLoc = target.loc
	sleep((get_dist(src, T) * movespeed) + 1)
	src.loc = prevLoc
	walk(src, 0)
	charging = FALSE
	//Stop charging

/mob/living/simple_animal/hostile/megafauna/sif/Move()
	//Move
	..()

	//Can they perform these tasks?
	if(can_special == 1)

		//Charging currentPower every step
		if(!charging || !spinning)
			src.currentPower += 2

		//Sets sif's anger status.
		if(src.health <= 1000 && src.stageTwo == FALSE)
			angered()

		//Sets sifs enrage status.
		if(src.health <= 400 && src.stageThree == FALSE)
			enraged()

		//Whenever Sif moves he destroys walls in his way.
		if(src.angered == TRUE || src.enraged == TRUE)
			DestroySurroundings()

		//Normally Sif will do a special when he has 100 currentPower.
		if(src.angered == FALSE && src.currentPower >= 100)
			special()

		//Now requires 50 power when angery
		if(src.angered == TRUE && src.currentPower >= 50 && src.enraged == FALSE)
			special()

		//Now requires 30 power when enraged
		if(src.enraged == TRUE && src.currentPower >= 30)
			special()

		//visual effect
		if(src.charging == TRUE)
			new /obj/effect/temp_visual/decoy/fading(loc,src)
			DestroySurroundings()

//Sif's AOE spin attack
/mob/living/simple_animal/hostile/megafauna/sif/proc/spinAttack()
	src.spinning = TRUE
	spin(5,2)// Spin me boi

//Chance to dodge projectiles when angered or enraged
/mob/living/simple_animal/hostile/megafauna/sif/bullet_act(obj/projectile/P)
	var/passed = 0

	if(angered)
		switch(rand(0,100))
			if(0 to 1)
				passed = 1
			else

	if(enraged)
		switch(rand(0,100))
			if(0 to 5)
				passed = 1
			else

	if(passed == 1)
		visible_message("<span class='danger'>[src] dodged the projectile!</span>", "<span class='userdanger'>You dodge the projectile!</span>")
		playsound(src, pick('sound/weapons/bulletflyby.ogg', 'sound/weapons/bulletflyby2.ogg', 'sound/weapons/bulletflyby3.ogg'), 300, 1)
		return 0

	return ..()

//Sets Sif's angered stats
/mob/living/simple_animal/hostile/megafauna/sif/proc/angered()
	src.angered = TRUE
	src.stageTwo = TRUE
	src.visible_message("<span class='userdanger'>[src] lets out a ear ripping howl!</span>", "<span class='userdanger'>[src] lets out an ear ripping roar!</span>")
	playsound(src, 'modular_sand/sound/sif/howl.ogg', 100, 1)
	var/mob/living/L = target
	shake_camera(L, 4, 3)
	src.speed = 6
	src.move_to_delay = 2
	src.melee_damage_lower = 25
	src.melee_damage_upper = 25
	src.rapid_melee = 3

//Sets Sif's enraged stats
/mob/living/simple_animal/hostile/megafauna/sif/proc/enraged()
	src.stageThree = TRUE
	src.enraged = TRUE
	src.visible_message("<span class='userdanger'>[src] lets out a ear ripping yelp!</span>", "<span class='userdanger'>[src] lets out an ear ripping yelp!</span>")
	playsound(src, 'modular_sand/sound/sif/howl.ogg', 100, 1)
	var/mob/living/L = target
	shake_camera(L, 8, 6)
	src.speed = 3
	src.move_to_delay = 4
	src.melee_damage_lower = 30
	src.melee_damage_upper = 30
	src.rapid_melee = 4
	src.dodge_prob = 50

//Chooses a random special
/mob/living/simple_animal/hostile/megafauna/sif/proc/special()
	src.currentPower = 0
	switch(rand(1,2))
		if(1)
			rush()
		if(2)
			spinAttack()

/mob/living/simple_animal/hostile/megafauna/sif/proc/default_attackspeed()
	if(stageTwo)
		src.move_to_delay = 2
		return 10
	if(stageThree)
		src.move_to_delay = 4
		return 4

	src.move_to_delay = 3
	return 2

/mob/living/simple_animal/hostile/megafauna/sif/do_attack_animation(atom/A, visual_effect_icon,used_item, no_effect)
	if(charging == FALSE)
		..()

//Attack speed delay
//bob's note: everything here is well coded except this like why would you not just use changeNext_move()
/mob/living/simple_animal/hostile/megafauna/sif/AttackingTarget()
	if(charging == FALSE)
		. = ..()
		if(.)
			recovery_time = world.time + 10

/mob/living/simple_animal/hostile/megafauna/sif/Goto(target, delay, minimum_distance)
	if(charging == FALSE)
		..()

/mob/living/simple_animal/hostile/megafauna/sif/MoveToTarget(list/possible_targets)
	if(charging == FALSE)
		..()

//Immune to explosions when spinning or charging
/mob/living/simple_animal/hostile/megafauna/sif/ex_act(severity, target)
	return 0

//stop spinning if you lose the target
/mob/living/simple_animal/hostile/megafauna/sif/LoseTarget()
	. = ..()
	if(spinning)
		icon_state = "Great_Brown_Wolf"
		src.spinIntervals = 0
		spinning = FALSE
		src.speed = default_attackspeed()
		hit_things = list()

/mob/living/simple_animal/hostile/megafauna/sif/Move()

	if(can_special == 1)

		if(charging == TRUE)
			DestroySurroundings()

		//Stop spinning
		if(src.spinIntervals == 5)
			icon_state = "Great_Brown_Wolf"
			src.spinIntervals = 0
			spinning = FALSE
			src.speed = default_attackspeed()
			hit_things = list()

		//Start spinning
		if(spinning == TRUE)
			icon_state = "Great_Brown_Wolf_Spin"
			src.spinIntervals += 1
			if(isturf(src.loc) || isobj(src.loc) && src.loc.density)
				for(var/turf/T in view(1, src))
					new /obj/effect/temp_visual/small_smoke/halfsecond(T)
				for(var/mob/living/LM in view(1, src))
					if(!(LM in hit_things))
						LM.Stun(30, TRUE)
						hit_things += LM
				playsound(src, pick('modular_sand/sound/sif/whoosh1.ogg', 'modular_sand/sound/sif/whoosh2.ogg', 'modular_sand/sound/sif/whoosh3.ogg'), 300, 1)
				playsound(src, 'modular_sand/sound/sif/blade_spin.ogg', 400, 1)
				if(angered)
					src.speed = 6
					src.move_to_delay = 2

	playsound(src, 'sound/effects/meteorimpact.ogg', 200, 1, 2, 1)
	..()

//Activated when sif collides with target when charging.
/mob/living/simple_animal/hostile/megafauna/sif/Bump(atom/A)
	if(charging == TRUE)
		if(isturf(A) || isobj(A) && A.density)
			A.ex_act(EXPLODE_HEAVY)
		DestroySurroundings()
		if(isliving(A))
			var/mob/living/L = A
			L.visible_message("<span class='danger'>[src] stomps on [L]!</span>", "<span class='userdanger'>[src] stomps on you!</span>")
			src.forceMove(get_turf(L))
			L.apply_damage(20, BRUTE)
			playsound(get_turf(L), 'modular_sand/sound/sif/sif_stomp.ogg', 400, 1)
			shake_camera(L, 4, 3)
			shake_camera(src, 2, 3)
	..()
