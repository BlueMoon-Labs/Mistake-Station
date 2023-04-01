/obj/item/storage/secure/briefcase/hos/hos_e45_pack
	name = "\improper \'Enforcer\' gun kit"
	desc = "A storage case for a Enforcer Handgun. Bullets for everyone! !"


/obj/item/storage/secure/briefcase/hos/hos_e45_pack/PopulateContents()
	new /obj/item/gun/ballistic/automatic/pistol/enforcerred(src)
	new /obj/item/ammo_box/magazine/e45/lethal(src)
	new /obj/item/ammo_box/magazine/e45/lethal(src)
	new /obj/item/ammo_box/magazine/e45(src)
	new /obj/item/ammo_box/magazine/e45(src)
	new /obj/item/ammo_box/magazine/e45(src)
	new /obj/item/ammo_box/magazine/e45/taser(src)
	new /obj/item/ammo_box/magazine/e45/taser(src)
	new /obj/item/ammo_box/magazine/e45/taser(src)

// Sec Officer Boxes

/obj/item/storage/secure/briefcase/cop/advtaser_box
	name = "\improper Hybrid taser gun box"
	desc = "A storage case for a high-tech energy firearm."

/obj/item/storage/secure/briefcase/cop/advtaser_box/PopulateContents()
	new /obj/item/gun/energy/e_gun/advtaser(src)

/obj/item/storage/secure/briefcase/cop/e45_box
	name = "\improper Enforcer handgun box"
	desc = "A storage case for a Mk. 58 Enforcer. Peace through power!"

/obj/item/storage/secure/briefcase/cop/e45_box/PopulateContents()
	new /obj/item/gun/ballistic/automatic/pistol/enforcer/nomag(src)
	new /obj/item/ammo_box/magazine/e45/taser(src)
	new /obj/item/ammo_box/magazine/e45/taser(src)
	new /obj/item/ammo_box/magazine/e45/taser(src)

//Blueshield melee options

/obj/item/storage/secure/briefcase/bsbaton/stunbaton
	name = "\improper Stun Baton box"
	desc = "A storage case for a high-tech Stun baton. Pick up that can."

/obj/item/storage/secure/briefcase/bsbaton/stunbaton/PopulateContents()
	new  /obj/item/melee/baton(src)
	new /obj/item/storage/belt/security/full(src)

/obj/item/melee/baton/stunsword
	name = "stunsword"
	desc = "Not actually sharp, this sword is functionally identical to its baton counterpart."
	icon_state = "stunsword"
	inhand_icon_state =  "sword"

/obj/item/melee/baton/stunsword/get_belt_overlay()
	if(istype(loc, /obj/item/storage/belt/sabre))
		return mutable_appearance('icons/obj/clothing/belt_overlays.dmi', "stunsword")
	return ..()

/obj/item/proc/get_worn_belt_overlay(icon_file)
	return

/obj/item/melee/baton/stunsword/get_worn_belt_overlay(icon_file)
	return mutable_appearance(icon_file, "-stunsword")

/obj/item/melee/baton/stunsword/on_exit_storage(datum/storage/S)
	var/obj/item/storage/belt/sabre/secbelt/B = S.parent
	if(istype(B))
		playsound(B, 'sound/items/unsheath.ogg', 25, 1)
	..()

/obj/item/melee/baton/stunsword/on_enter_storage(datum/storage/D)
	var/obj/item/storage/belt/sabre/secbelt/B = D.parent
	if(istype(B))
		playsound(B, 'sound/items/sheath.ogg', 25, 1)
	..()

/obj/item/ssword_kit
	name = "stunsword kit"
	desc = "a modkit for making a stunbaton into a stunsword"
	icon = 'icons/obj/vending_restock.dmi'
	icon_state = "refill_donksoft"
	var/product = /obj/item/melee/baton/stunsword //what it makes
	var/list/fromitem = list(/obj/item/melee/baton, /obj/item/melee/baton/security/loaded) //what it needs

/obj/item/ssword_kit/afterattack(obj/O, mob/user as mob)
	if(istype(O, product))
		to_chat(user,"<span class='warning'>[O] is already modified!")
		return
	if(O.type in fromitem) //makes sure O is the right thing
		var/obj/item/melee/baton/security/B = O
		if(!B.cell) //checks for a powercell in the baton. If there isn't one, continue. If there is, warn the user to take it out
			new product(usr.loc) //spawns the product
			user.visible_message("<span class='warning'>[user] modifies [O]!","<span class='warning'>You modify the [O]!")
			qdel(O) //Gets rid of the baton
			qdel(src) //gets rid of the kit
		else
			to_chat(user,"<span class='warning'>Remove the powercell first!</span>") //We make this check because the stunsword starts without a battery.
	else
		to_chat(user, "<span class='warning'> You can't modify [O] with this kit!</span>")

/obj/item/storage/belt/sabre/secbelt
	name = "security sheath"
	desc = "A statement on modern practical fashion; this limber black sheath is fitted to a lightened security belt, allowing one to look fashionable with their sword-shaped stun-baton, while of course carrying less things."
	icon_state = "secsheath"
	inhand_icon_state =  "secsheath"
	w_class = WEIGHT_CLASS_BULKY
	content_overlays = TRUE

/obj/item/storage/belt/sabre/Initialize(mapload)
	. = ..()

	atom_storage.max_slots = 5
	atom_storage.rustle_sound = FALSE
	atom_storage.max_specific_storage = WEIGHT_CLASS_BULKY
	atom_storage.set_holdable(
		list(
			/obj/item/melee/baton/stunsword,
			/obj/item/grenade,
			/obj/item/reagent_containers/spray/pepper,
			/obj/item/restraints/handcuffs,
			/obj/item/assembly/flash/handheld,
			/obj/item/clothing/glasses,
			/obj/item/food/donut,
			/obj/item/flashlight/seclite,
			/obj/item/radio,
			/obj/item/clothing/gloves,
			/obj/item/restraints/legcuffs/bola
			)
		)

/obj/item/storage/belt/sabre/secbelt/PopulateContents()
	new /obj/item/melee/baton/stunsword(src)
	update_icon()

/obj/item/storage/secure/briefcase/bsbaton/stunsword
	name = "\improper Stun Sword box"
	desc = "A storage case for a high-tech Stun sword. The ninjas will fear you."

/obj/item/storage/secure/briefcase/bsbaton/stunsword/PopulateContents()
	new /obj/item/storage/belt/sabre/secbelt(src)
	new /obj/item/stock_parts/cell/super(src)

/obj/item/storage/secure/briefcase/bsbaton/tele
	name = "\improper APS Baton Box"
	desc = "A storage case for a Telescopic Baton. Poke them with a stick!"

/obj/item/storage/secure/briefcase/bsbaton/tele/PopulateContents()
	new /obj/item/melee/baton/telescopic(src)
	new /obj/item/storage/belt/security(src)

/obj/item/storage/secure/briefcase/permits
	name = "\improper \'Weapon\' permits case"
	desc = "A storage case for weapon permits. Keep this secure!"


/obj/item/storage/secure/briefcase/permits/PopulateContents()
	new /obj/item/clothing/accessory/permit(src)
	new /obj/item/clothing/accessory/permit(src)
	new /obj/item/clothing/accessory/permit(src)
	new /obj/item/clothing/accessory/permit(src)
	new /obj/item/clothing/accessory/permit(src)
	new /obj/item/clothing/accessory/permit(src)
	new /obj/item/clothing/accessory/permit(src)
	new /obj/item/clothing/accessory/permit(src)
	new /obj/item/clothing/accessory/permit(src)
	new /obj/item/clothing/accessory/permit(src)
	new /obj/item/clothing/accessory/permit(src)
	new /obj/item/clothing/accessory/permit(src)
	new /obj/item/clothing/accessory/permit(src)
	new /obj/item/clothing/accessory/permit(src)
	new /obj/item/clothing/accessory/permit(src)
	new /obj/item/clothing/accessory/permit(src)
	new /obj/item/clothing/accessory/permit(src)
	new /obj/item/clothing/accessory/permit(src)
	new /obj/item/clothing/accessory/permit(src)
	new /obj/item/clothing/accessory/permit(src)
