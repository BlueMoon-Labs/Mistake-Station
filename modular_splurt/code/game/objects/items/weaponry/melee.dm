/obj/item/melee
	var/hole = CUM_TARGET_VAGINA

/obj/item/melee/CtrlShiftClick(mob/living/carbon/human/user as mob)
	hole = hole == CUM_TARGET_VAGINA ? CUM_TARGET_ANUS : CUM_TARGET_VAGINA
	to_chat(user, span_notice("Я целюсь в...  \the [hole]."))

/obj/item/melee/attack(mob/living/target, mob/living/user)
	..()
	if (user.zone_selected == BODY_ZONE_PRECISE_GROIN && user.combat_mode == FALSE)
		do_eblya(target, user)

/obj/item/melee/proc/do_eblya(mob/living/target, mob/living/user)
	var/message = ""
	var/lust_amt = 0
	if(ishuman(target) && !user.client?.prefs?.read_preference(/datum/preference/toggle/erp))
		if(user.zone_selected == BODY_ZONE_PRECISE_GROIN)
			switch(hole)
				if(CUM_TARGET_VAGINA)
					if(target.has_vagina(REQUIRE_EXPOSED))
						message = (user == target) ? pick("крепко обхватывает '\the [src]' и начинает пихать это прямо в свою киску.", "запихивает '\the [src]' в свою киску", "постанывает и садится на '\the [src]'.") : pick("трахает <b>[target]</b> прямо в киску с помощью '\the [src]'.", "засовывает '\the [src]' прямо в киску <b>[target]</b>.")
						lust_amt = NORMAL_LUST
				if(CUM_TARGET_ANUS)
					if(target.has_anus(REQUIRE_EXPOSED))
						message = (user == target) ? pick("крепко обхватывает '\the [src]' и начинает пихать это прямо в свою попку.","запихивает '\the [src]' прямо в свою собственную попку.", "постанывает и садится на '\the [src]'.") : pick("трахает <b>[target]</b> прямо в попку '\the [src]'.", "активно суёт '\the [src]' прямо в попку <b>[target]</b>.")
						lust_amt = NORMAL_LUST
	if(message)
		user.visible_message(span_lewd("<b>[user]</b> [message]"))
		target.handle_post_sex(lust_amt, null, user)
		playsound(loc, pick('modular_sand/sound/interactions/bang4.ogg',
							'modular_sand/sound/interactions/bang5.ogg',
							'modular_sand/sound/interactions/bang6.ogg'), 70, 1, -1)

// Prova, cause I can

/obj/item/melee/baton/prova
	name = "Prova"
	desc = "An enhanced taser stick, a favorite of the legendary John Prodman."
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	icon_state = "prova"
	lefthand_file = 'modular_splurt/icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/weapons/melee_righthand.dmi'
