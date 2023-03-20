/obj/projectile/bullet/c22lr
	name = ".22 Long Rifle bullet"
	damage = 15

/obj/item/ammo_casing/c22lr
	name = ".22 Long rifle bullet casing"
	desc = "A .22LR bullet casing."
	caliber = ".22"
	projectile_type = /obj/projectile/bullet/c22lr

/obj/projectile/bullet/c22lr/rubber
	name = ".22 Long Rifle bullet"
	damage = 1
	stamina = 15
	sharpness = NONE
	embedding = null

/obj/item/ammo_casing/c22lr/rubber
	name = ".22 Long rifle bullet casing (rubber)"
	projectile_type = /obj/projectile/bullet/c22lr

/obj/item/ammo_casing/a357/rubber
	name = ".357 Rubber bullet casing"
	desc = "A .357 Rubber bullet casing."
	caliber = "357"
	projectile_type = /obj/projectile/bullet/a357/rubber

/obj/projectile/bullet/a357/rubber
	name = ".357 Rubber bullet"
	damage = 5
	stamina = 40
	sharpness = NONE
	embedding = null

/datum/design/a357rubber
	name = "Revolver Bullet (.357 Rubber)"
	id = "a357r"
	build_type = AUTOLATHE
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/item/ammo_casing/a357/rubber
	category = list("hacked", "Security")
