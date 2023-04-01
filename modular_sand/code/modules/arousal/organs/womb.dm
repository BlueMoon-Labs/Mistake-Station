/obj/item/organ/genital/womb
	var/impregnated = FALSE

/obj/item/organ/genital/womb/Remove(special)
	if(!impregnated)
		return ..()
	impregnated = FALSE
	var/obj/item/organ/genital/breasts/B = owner.get_organ_slot(ORGAN_SLOT_BREASTS)
	if(!B)
		return ..()

	B.fluid_rate *= 0.5
	. = ..()
