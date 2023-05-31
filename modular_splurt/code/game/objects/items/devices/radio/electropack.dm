/obj/item/electropack/shockcollar/security
	name = "security shock collar"
	desc = "A reinforced security collar. It has two electrodes that press against the neck, for disobedient pets."
	icon = 'modular_splurt/icons/obj/clothing/neck/cit_neck.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'
	icon_state = "shockseccollar"
	icon_state = "shockseccollar"

/obj/item/electropack/Topic(href, href_list)
	var/mob/living/carbon/C = usr
	if(usr.stat || C.back == src)
		return

	if(!usr.can_perform_action(src, BE_CLOSE))
		usr << browse(null, "window=radio")
		onclose(usr, "radio")
		return

	if(href_list["set"])
		if(href_list["set"] == "freq")
			var/new_freq = input(usr, "Input a new receiving frequency", "Electropack Frequency", format_frequency(frequency)) as num|null
			if(!usr.can_perform_action(src, BE_CLOSE))
				return
			new_freq = unformat_frequency(new_freq)
			new_freq = sanitize_frequency(new_freq, TRUE)
			set_frequency(new_freq)

		if(href_list["set"] == "code")
			var/new_code = input(usr, "Input a new receiving code", "Electropack Code", code) as num|null
			if(!usr.can_perform_action(src, BE_CLOSE))
				return
			new_code = round(new_code)
			new_code = clamp(new_code, 1, 100)
			code = new_code

		if(href_list["set"] == "power")
			if(!usr.can_perform_action(src, BE_CLOSE))
				return
			on = !(on)
			icon_state = "electropack[on]"

	if(usr)
		attack_self(usr)

	return
