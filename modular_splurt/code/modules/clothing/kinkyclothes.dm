//From Hyper
/obj/item/clothing/gloves/latexsleeves
	name = "latex sleeves"
	desc = "A pair of shiny latex sleeves that covers ones arms."
	icon_state = "latex"
	icon_state = "latex"
	icon = 'modular_splurt/icons/obj/clothing/gloves.dmi'
	worn_icon = 'modular_splurt/icons/mobs/gloves.dmi'
	supports_variations_flags = NONE

/obj/item/clothing/gloves/latexsleeves/security
	name = "security sleeves"
	desc = "A pair of latex sleeves, with a band of red above the elbows denoting that the wearer is part of the security team."
	icon_state = "latexsec"
	icon_state = "latexsec"

/obj/item/clothing/head/dominatrixcap
	name = "dominatrix cap"
	desc = "A sign of authority, over the body."
	icon_state = "dominatrix"
	icon_state = "dominatrix"
	icon = 'modular_splurt/icons/obj/clothing/head.dmi'
	worn_icon = 'modular_splurt/icons/mobs/head.dmi'
	supports_variations_flags = NONE

/obj/item/clothing/shoes/highheels
	name = "high heels"
	desc = "They make the wearer appear taller, and more noisey!"
	icon_state = "highheels"
	icon_state = "highheels"
	icon = 'modular_splurt/icons/obj/clothing/shoes.dmi'
	worn_icon = 'modular_splurt/icons/mobs/feet.dmi'


/obj/item/clothing/shoes/highheels/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, list('modular_splurt/sound/effects/footstep/highheel1.ogg' = 1,'modular_splurt/sound/effects/footstep/highheel2.ogg' = 1), 20)
//the classic click clack

/obj/item/clothing/neck/stole
	name = "white boa"
	desc = "Fluffy neck wear to keep you warm, and attract others."
	icon = 'modular_splurt/icons/obj/clothing/neck.dmi'
	worn_icon = 'modular_splurt/icons/mob/clothing/neck.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "stole"
	icon_state = ""	//no inhands

/obj/item/clothing/neck/stole/black
	name = "black boa"
	desc = "Fluffy neck wear to keep you warm, and attract others."
	icon = 'modular_splurt/icons/obj/clothing/neck.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "stole"
	icon_state = ""	//no inhands
	color = "#3d3d3d"

/obj/item/clothing/suit/fluffyhalfcrop
	name = "fluffy half-crop jacket"
	desc = "A fluffy synthetic fur half-cropped jacket, less about warmth, more about style!"
	icon_state = "fluffy"
	icon_state = "fluffy"
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_splurt/icons/mobs/suits.dmi'
	body_parts_covered = CHEST|LEGS|ARMS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	supports_variations_flags = NONE

/obj/item/clothing/under/centcomdress
	name = "CentCom Dress Uniform"
	desc = "A stylish yet revealing dress uniform worn in extravagant black and gold, worthy of those who sit around and watch cameras all day in an office."
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	icon_state = "ccdress"
	worn_icon = 'modular_splurt/icons/mobs/suits.dmi'
	icon_state = "r_suit"
	can_adjust = FALSE
	//We will never know why CC can make their skimpy outfits tough as nails
	body_parts_covered = CHEST|GROIN|ARMS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	cold_protection = CHEST|GROIN|ARMS
	max_heat_protection_temperature = FIRE_SUIT_MAX_TEMP_PROTECT
	heat_protection = CHEST|GROIN|ARMS
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/centcomdress/vk
	name = "Virginkiller CentCom Dress Uniform"
	desc = "This black and gold beauty does not help paperwork get done, it seems."
	icon_state = "ccdressvk"

/obj/item/clothing/under/raccveralls
	name = "form fitting overalls"
	desc = "A tight form fitting pair of overalls."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	icon_state = "raccveralls"
	worn_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	icon_state = "raccveralls"
	can_adjust = FALSE
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/officesexy
	name = "Revealing office uniform"
	desc = "A sexy office uniform, that has a low cropped front to show off some chest, or bra. And a tall dress that covers the stomach, complete with a set of buttons."
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	icon_state = "office_revealing"
	worn_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	icon_state = "office_revealing"
	can_adjust = FALSE
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/vaultsuit
	name = "vault suit"
	desc = "A tight form fitting Vault-Tec standard issue Vault Jumpsuit! Snazzy!"
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	icon_state = "vaultsuit"
	worn_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	icon_state = "b_suit"
	icon_state = "b_suit"
	can_adjust = FALSE
	worn_icon_digi = 'modular_splurt/icons/mob/clothing/uniform_digi.dmi'
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION | STYLE_TAUR_ALL
	var/firstpickup = TRUE
	var/pickupsound = TRUE

/obj/item/clothing/under/vaultsuit/no_sound
	pickupsound = FALSE

/obj/item/clothing/under/vaultsuit/equipped(mob/user, slot)
	. = ..()
	if(!pickupsound)
		return
	if(!ishuman(user))
		return
	if(slot == ITEM_SLOT_ICLOTHING)
		if(!firstpickup)
			SEND_SOUND(user, sound('modular_splurt/sound/effects/vaultsuit/FalloutEXPUp.ogg', volume = 50))
		else
			firstpickup = FALSE
			SEND_SOUND(user, sound('modular_splurt/sound/effects/vaultsuit/FalloutLevelUp.ogg', volume = 50))
			SEND_SOUND(user, sound('modular_splurt/sound/effects/vaultsuit/InkSpotsSting.ogg', volume = 60))
	return

/obj/item/clothing/suit/toggle/tunnelfox
	name = "tunnel fox jacket"
	desc = "Tunnel Foxes Rule!"
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	icon_state = "tunnelfox"
	worn_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	icon_state = "tunnelfox"
	body_parts_covered = CHEST|LEGS|ARMS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	toggle_noun = "buttons"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON

/obj/item/clothing/under/rank/cargo/miner/lavaland/stripper
	name = "explorer stripper outfit"
	desc = "This can't be dress code compliant, can it?"
	icon = 'modular_splurt/icons/obj/clothing/uniforms.dmi'
	icon_state = "explorerstripper"
	worn_icon = 'modular_splurt/icons/mob/clothing/uniform.dmi'
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION|CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
