/obj/item/grenade/secbed
	name = "security bed grenade"
	desc = "A nice red and black pet bed, now in a compact, throwable package! No more wrestling entire beds out of vending machines!"
	icon = 'icons/obj/weapons/grenade.dmi'
	icon_state = "flashbang"
	icon_state = "flashbang"

/obj/item/grenade/secbed/detonate(mob/living/lanced_by)
	new /obj/structure/bed/secbed(get_turf(src.loc))
	qdel(src)
