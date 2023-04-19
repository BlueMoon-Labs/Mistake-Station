/obj/item/organ/external/genital/breasts/Insert(mob/living/carbon/M, special, drop_if_replaced)
	. = ..()
	var/obj/item/organ/external/genital/womb/W = M.get_organ_slot(ORGAN_SLOT_WOMB)
	if(!W)
		return
	if(!W.impregnated)
		return

	fluid_rate *= 2

/obj/item/organ/external/genital/breasts/Remove(special, moving)
	var/obj/item/organ/external/genital/womb/W = owner.get_organ_slot(ORGAN_SLOT_WOMB)
	if(!W)
		return ..()
	if(!W.impregnated)
		return ..()

	fluid_rate *= 0.5
	. = ..()
