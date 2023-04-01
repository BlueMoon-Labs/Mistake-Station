/obj/item/organ/genital/breasts/Insert(mob/living/carbon/M, special, drop_if_replaced)
	. = ..()
	var/obj/item/organ/genital/womb/W = M.get_organ_slot(ORGAN_SLOT_WOMB)
	if(!W)
		return
	if(!W.impregnated)
		return

	fluid_rate *= 2

/obj/item/organ/genital/breasts/Remove(special)
	var/obj/item/organ/genital/womb/W = owner.get_organ_slot(ORGAN_SLOT_WOMB)
	if(!W)
		return ..()
	if(!W.impregnated)
		return ..()

	fluid_rate *= 0.5
	. = ..()
