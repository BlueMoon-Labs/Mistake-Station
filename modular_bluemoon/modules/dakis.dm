//////////////////////////////////
//dakimakuras
//////////////////////////////////

/obj/item/storage/daki
	name = "dakimakura"
	desc = "Большая подушка с изображением девушки в компрометирующей позе. Она примерно такого же размера, как и вы."
	icon = 'icons/obj/daki.dmi'
	icon_state = "daki_base"
	slot_flags = ITEM_SLOT_BACK
	var/cooldowntime = 20
	var/static/list/dakimakura_options = list("Callie","Casca","Chaika","Elisabeth","Foxy Grandpa","Haruko","Holo","Ian","Jolyne","Kurisu","Marie","Mugi","Nar'Sie","Patchouli","Plutia","Rei","Reisen","Naga","Squid","Squigly","Tomoko","Toriel","Umaru","Yaranaika","Yoko") //Kurisu is the ideal girl." - Me, Logos.

/obj/item/storage/daki/Initialize()
	. = ..()
	atom_storage.max_specific_storage = WEIGHT_CLASS_SMALL
	atom_storage.max_total_storage = 6

/obj/item/storage/daki/attack_self(mob/living/user)
	var/body_choice
	var/custom_name

	if(icon_state == "daki_base")
		body_choice = input("Pick a body.") in dakimakura_options
		icon_state = "daki_[body_choice]"
		custom_name = stripped_input(user, "What's her name?")
		if(length(custom_name) > MAX_NAME_LEN)
			to_chat(user,"<span class='danger'>Name is too long!</span>")
			return FALSE
		if(custom_name)
			name = custom_name
			desc = "A large pillow depicting [custom_name] in a compromising position. Featuring as many dimensions as you."
	else
		switch(user.combat_mode)
			if(FALSE)
				var/num = rand(1, 3)
				switch(prob(75) && num)
					if(1)
						user.visible_message("<span class='notice'>[user] hugs the [name].</span>")
						playsound(src, "rustle", 50, 1, -5)
					if(2)
						user.visible_message("<span class='notice'>[user] kisses the [name].</span>")
						playsound(src, "rustle", 50, 1, -5)
					if(3)
						user.visible_message("<span class='warning'>[user] holds the [name]!</span>")
						playsound(src, 'sound/items/bikehorn.ogg', 50, 1)
			if(TRUE)
				user.visible_message("<span class='danger'>[user] punches the [name]!</span>")
				playsound(src, 'sound/effects/shieldbash.ogg', 50, 1)
		user.changeNext_move(CLICK_CD_MELEE)

////////////////////////////
