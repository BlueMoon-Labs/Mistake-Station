/mob/living/carbon/human/do_climax(datum/reagents/R, atom/target, obj/item/organ/external/genital/G, spill) //Now I know how to modularize it :D
	. = ..()
	set_lust(0)
	SEND_SIGNAL(src, COMSIG_ADD_MOOD_EVENT, "orgasm", /datum/mood_event/orgasm)

/mob/living/proc/pick_receiving_organ(mob/living/carbon/L, flag = CAN_CUM_INTO, title = "Climax", desc = "in what hole?")
	if (!istype(L))
		return
	var/list/receivers_list
	var/list/other_worn = L.get_equipped_items()
	for(var/obj/item/organ/external/genital/G in L.organs)
		if((!flag || (G.visibility_preference & flag)) && G.is_exposed(other_worn)) //filter out what you can't cum into
			LAZYADD(receivers_list, G)
	if(LAZYLEN(receivers_list))
		var/obj/item/organ/external/genital/ret_organ = input(src, desc, title, null) as null|obj in receivers_list
		return ret_organ
/*
/mob/living/proc/receive_climax(mob/living/partner, obj/item/organ/external/genital/receiver = null, obj/item/organ/external/genital/source_gen, spill = TRUE)
	if(!ishuman(src))
		return
	var/mob/living/carbon/human/h_self = src
	var/mob/living/carbon/human/h_partner = null
	if(ishuman(partner))
		h_partner = partner

	if(receiver)
		switch(receiver.slot) //Feel free to add more options for other receiving genitals if you desire
			if(ORGAN_SLOT_VAGINA)
				var/obj/item/organ/external/genital/womb/W = h_self.get_organ_slot(ORGAN_SLOT_WOMB)
				if(W && h_partner && !spill && !HAS_TRAIT(h_self, TRAIT_INFERTILE) && istype(source_gen, /obj/item/organ/external/genital/penis))
					var/obj/item/organ/external/genital/penis/Sp = source_gen
					if(prob(30 + clamp((70*(rand() + (h_self.sexual_potency + h_partner.sexual_potency)/200)), 0, 70)) && !W.impregnated && !Sp.equipment[GENITAL_EQUIPEMENT_CONDOM] && (Sp.linked_organ.fluid_id == /datum/reagent/consumable/semen))
						W.impregnated = TRUE
						log_game("Debug: [h_self] has been impregnated by [h_partner]")
						to_chat(src, "<span class='userlove'>You feel your hormones change, and a motherly instinct take over.</span>")
						var/obj/item/organ/external/genital/breasts/B = h_self.get_organ_slot(ORGAN_SLOT_BREASTS)
						if(B)
							B.fluid_rate *= 2
*/
