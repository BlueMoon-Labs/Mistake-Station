/obj/item/organ/external/genital/womb
	var/impregnated = FALSE

/obj/item/organ/external/genital/womb/Remove(special, moving)
	if(!impregnated)
		return ..()
	impregnated = FALSE
	var/obj/item/organ/external/genital/breasts/B = owner.get_organ_slot(ORGAN_SLOT_BREASTS)
	if(!B)
		return ..()

	B.fluid_rate *= 0.5
	. = ..()
