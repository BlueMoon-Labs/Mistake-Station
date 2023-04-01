//Dildo changes.
/obj/item/dildo
	var/hole = CUM_TARGET_VAGINA

/obj/item/dildo/attack(mob/living/carbon/human/M, mob/living/carbon/human/user)
	//var/possessive_verb = user.ru_ego()
	user.changeNext_move(CLICK_CD_RANGE)
	var/message = ""
	var/lust_amt = 0
	if(ishuman(M) && !user.client?.prefs?.read_preference(/datum/preference/toggle/erp))
		switch(user.zone_selected)
			if(BODY_ZONE_PRECISE_GROIN)
				switch(hole)
					if(CUM_TARGET_VAGINA)
						if(M.has_vagina(REQUIRE_EXPOSED))
							message = (user == M) ? pick("крепко обхватывает '\the [src]' и начинает пихать это прямо в свою киску.", "запихивает '\the [src]' в свою киску", "постанывает и садится на '\the [src]'.") : pick("трахает <b>[M]</b> прямо в киску с помощью '\the [src]'", "засовывает '\the [src]' прямо в киску <b>[M]</b>.")
							lust_amt = NORMAL_LUST
					if(CUM_TARGET_ANUS)
						if(M.has_anus(REQUIRE_EXPOSED))
							message = (user == M) ? pick("крепко обхватывает '\the [src]' и начинает пихать это прямо в свою попку.","запихивает '\the [src]' прямо в свою собственную попку.", "постанывает и садится на '\the [src]'.") : pick("трахает <b>[M]</b> прямо в попку '\the [src]'", "активно суёт '\the [src]' прямо в попку <b>[M]</b>.")
							lust_amt = NORMAL_LUST
			if(BODY_ZONE_PRECISE_MOUTH)
				if(M.has_mouth() && !M.is_mouth_covered())
					message = (user == M) ? pick("крепко обхватывает '\the [src]' и начинает пихать это прямо в свой ротик.", "запихивает '\the [src]' прямо в свой собственный ротик.", "втыкает '\the [src]' прямо в свой ротик.") : pick("трахает <b>[M]</b> прямо в ротик при помощи '\the [src]'", "активно суёт '\the [src]' прямо в ротик <b>[M]</b>.")
	if(message)
		user.visible_message("<span class='lewd'><b>[user]</b> [message].</span>")
		M.handle_post_sex(lust_amt, null, user)
		playsound(loc, pick('modular_sand/sound/interactions/bang4.ogg',
							'modular_sand/sound/interactions/bang5.ogg',
							'modular_sand/sound/interactions/bang6.ogg'), 70, 1, -1)
	else if(user.combat_mode == TRUE)
		return ..()

/obj/item/dildo/attack_self(mob/living/carbon/human/user as mob)
	hole = hole == CUM_TARGET_VAGINA ? CUM_TARGET_ANUS : CUM_TARGET_VAGINA
	to_chat(user, "<span class='notice'>Я целюсь в...  \the [hole].</span>")

//begin redds code
/obj/item/dildo/cyborg
	name = "F.I.S.T.R. Machine"
	desc = "Fully Integrated Sexual Tension Relief Machine"
//end redds code
