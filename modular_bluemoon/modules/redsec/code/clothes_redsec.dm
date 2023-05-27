/*
*	SS220: Actual Skyrat Bluesec to Redsec overrides.
*
*	Tips:
*		- I used `current_skin` for disabling skin choose
		- If you're not sure why you can't select a skin (but you have one), you may need to set `current_skin` to null
*		- All clothing is took his path from his parent, so you should override it on your code if you need it
*		- Make sure every icon, worn_icon, icon_state, inhand_icon_state is correct
*
*	There's may be some `not needed` overridings but it'll took ages for me to clean this up
*/

/*
* SUITS
*/
/obj/item/clothing/suit/hooded/wintercoat/security
	name = "security winter jacket"
	desc = "A red, armour-padded winter coat. It glitters with a mild ablative coating and a robust air of authority. The zipper tab is a pair of jingly little handcuffs that get annoying after the first ten seconds."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	worn_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	icon_state = "coatsecurity"
	inhand_icon_state = "coatsecurity"
	hoodtype = /obj/item/clothing/head/hooded/winterhood/security

/obj/item/clothing/suit/armor/vest/alt/sec
	name = "armored security vest"
	desc = "A Type-II-AD-P armored vest that provides decent protection against most types of damage."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/suit.dmi'
	icon_state = "armor_sec"
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Red Variant" = list(
			RESKIN_ICON_STATE = "armor_sec",
			RESKIN_WORN_ICON_STATE = "armor_sec"
		),
		"Black Variant" = list(
			RESKIN_ICON_STATE = "vest_black",
			RESKIN_WORN_ICON_STATE = "vest_black"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "vest_blue",
			RESKIN_WORN_ICON_STATE = "vest_blue"
		),
		"White Variant" = list(
			RESKIN_ICON_STATE = "vest_white",
			RESKIN_WORN_ICON_STATE = "vest_white"
		),
		"Peacekeeper Variant" = list(
			RESKIN_ICON_STATE = "peacekeeper_armor",
			RESKIN_WORN_ICON_STATE = "peacekeeper"
		)
	)

/obj/item/clothing/suit/armor/vest/warden
	icon = 'icons/obj/clothing/suits/armor.dmi'
	worn_icon = 'icons/mob/clothing/suits/armor.dmi'
	icon_state = "warden_jacket"
	inhand_icon_state = "armor"
	unique_reskin = list(
		"Basic Warden Armor" = list(
			RESKIN_ICON = 'icons/obj/clothing/suits/armor.dmi',
			RESKIN_ICON_STATE = "warden_jacket",
			RESKIN_WORN_ICON = 'icons/mob/clothing/suits/armor.dmi',
			RESKIN_WORN_ICON_STATE = "warden_jacket"
		),
		"Standard" = list(
			RESKIN_ICON = 'modular_skyrat/master_files/icons/obj/clothing/suits.dmi',
			RESKIN_ICON_STATE = "warden_jacket",
			RESKIN_WORN_ICON = 'modular_skyrat/master_files/icons/mob/clothing/suit.dmi',
			RESKIN_WORN_ICON_STATE = "warden_jacket"
		)
	)

/obj/item/clothing/suit/armor/hos
	unique_reskin = list(
		"Greatcoat" = list(
			RESKIN_ICON = 'icons/obj/clothing/suits/armor.dmi',
			RESKIN_ICON_STATE = "hos",
			RESKIN_WORN_ICON = 'icons/mob/clothing/suits/armor.dmi',
			RESKIN_WORN_ICON_STATE = "hos"
		),
		"Trenchcoat" = list(
			RESKIN_ICON = 'icons/obj/clothing/suits/armor.dmi',
			RESKIN_ICON_STATE = "hostrench",
			RESKIN_WORN_ICON = 'icons/mob/clothing/suits/armor.dmi',
			RESKIN_WORN_ICON_STATE = "hostrench"
		),
		"Trenchcloak" = list(
			RESKIN_ICON = 'modular_skyrat/master_files/icons/obj/clothing/suits.dmi',
			RESKIN_ICON_STATE = "trenchcloak",
			RESKIN_WORN_ICON = 'modular_skyrat/master_files/icons/mob/clothing/suit.dmi',
			RESKIN_WORN_ICON_STATE = "trenchcloak"
		),
		"Black" = list(
			RESKIN_ICON = 'modular_skyrat/master_files/icons/obj/clothing/suits.dmi',
			RESKIN_ICON_STATE = "hos_black",
			RESKIN_WORN_ICON = 'modular_skyrat/master_files/icons/mob/clothing/suit.dmi',
			RESKIN_WORN_ICON_STATE = "hos_black",
			RESKIN_SUPPORTS_VARIATIONS_FLAGS = NONE
		)
	)

/obj/item/clothing/suit/armor/cossack/sec
	icon_state = "kuban_cossak"

/obj/item/clothing/suit/toggle/jacket/sec
	desc = "A comfortable jacket in security red. Probably against uniform regulations."
	icon_state = "sec_dep_jacket_old"

/*
* BACKPACKS
*/
/obj/item/storage/backpack/security
	icon = 'modular_skyrat/master_files/icons/obj/clothing/backpacks.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/back.dmi'
	icon_state = "backpack_security"
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Red Variant" = list(
			RESKIN_ICON_STATE = "backpack_security",
			RESKIN_WORN_ICON_STATE = "backpack_security"
		),
		"Black Variant" = list(
			RESKIN_ICON_STATE = "backpack_security_black",
			RESKIN_WORN_ICON_STATE = "backpack_security_black"
		),
		"White Variant" = list(
			RESKIN_ICON_STATE = "backpack_security_white",
			RESKIN_WORN_ICON_STATE = "backpack_security_white"
		),
	)

/obj/item/storage/backpack/satchel/sec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/backpacks.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/back.dmi'
	icon_state = "satchel_security"
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Red Variant" = list(
			RESKIN_ICON_STATE = "satchel_security",
			RESKIN_WORN_ICON_STATE = "satchel_security"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "security_satchel",
			RESKIN_WORN_ICON_STATE = "security_satchel"
		),
	)

/obj/item/storage/backpack/duffelbag/sec
	icon = 'modular_skyrat/master_files/icons/obj/clothing/backpacks.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/back.dmi'
	icon_state = "duffel_security"
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"White Variant" = list(
			RESKIN_ICON_STATE = "security_duffle_white",
			RESKIN_WORN_ICON_STATE = "security_duffle_white"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "security_duffle_blue",
			RESKIN_WORN_ICON_STATE = "security_duffle_blue"
		),
		"Red Variant" = list(
			RESKIN_ICON_STATE = "duffel_security",
			RESKIN_WORN_ICON_STATE = "duffel_security"
		),
	)

/*
* UNDER
*/
//Officer
/obj/item/clothing/under/rank/security/officer
	icon = 'modular_skyrat/master_files/icons/obj/clothing/under/security.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/under/security.dmi'
	icon_state = "rsecurity"
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Red Variant" = list(
			RESKIN_ICON_STATE = "rsecurity",
			RESKIN_WORN_ICON_STATE = "rsecurity"
		),
		"Black Variant" = list(
			RESKIN_ICON_STATE = "security_black",
			RESKIN_WORN_ICON_STATE = "security_black"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "security_blue",
			RESKIN_WORN_ICON_STATE = "security_blue"
		),
		"White Variant" = list(
			RESKIN_ICON_STATE = "security_white",
			RESKIN_WORN_ICON_STATE = "security_white"
		),
	)

/obj/item/clothing/under/rank/security/skyrat/utility
	desc = "A utility uniform worn by trained Security officers."
	icon_state = "util_sec_old"

//Warden
/obj/item/clothing/under/rank/security/warden
	icon = 'modular_skyrat/master_files/icons/obj/clothing/under/security.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/under/security.dmi'
	icon_state = "rwarden"
	unique_reskin = list(
		"Red Variant" = list(
			RESKIN_ICON_STATE = "rwarden",
			RESKIN_WORN_ICON_STATE = "rwarden"
		),
		"Black Variant" = list(
			RESKIN_ICON_STATE = "warden_black",
			RESKIN_WORN_ICON_STATE = "warden_black"
		),
	)

//HoS
/obj/item/clothing/under/rank/security/head_of_security
	icon = 'modular_skyrat/master_files/icons/obj/clothing/under/security.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/under/security.dmi'
	icon_state = "rhos"
	unique_reskin = list(
		"Red Variant" = list(
			RESKIN_ICON_STATE = "rhos",
			RESKIN_WORN_ICON_STATE = "rhos"
		),
		"Black Variant" = list(
			RESKIN_ICON_STATE = "hos_black",
			RESKIN_WORN_ICON_STATE = "hos_black"
		),
	)

/obj/item/clothing/under/rank/security/head_of_security/parade
	icon_state = "hos_parade_male"

/obj/item/clothing/under/rank/security/head_of_security/parade/female
	icon_state = "hos_parade_fem"

/obj/item/clothing/under/rank/security/head_of_security/alt
	icon_state = "hosalt"

/obj/item/clothing/under/rank/security/head_of_security/alt/skirt
	icon_state = "hosalt_skirt"

/obj/item/clothing/under/plasmaman/security
	icon = 'modular_skyrat/master_files/icons/obj/clothing/under/plasmaman.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/under/plasmaman.dmi'
	icon_state = "security_envirosuit"
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Red Variant" = list(
			RESKIN_ICON_STATE = "security_envirosuit",
			RESKIN_WORN_ICON_STATE = "security_envirosuit"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "security_envirosuit_new",
			RESKIN_WORN_ICON_STATE = "security_envirosuit_new"
		),
	)

/obj/item/clothing/under/plasmaman/security/warden
	icon_state = "warden_envirosuit"
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Red Variant" = list(
			RESKIN_ICON_STATE = "warden_envirosuit",
			RESKIN_WORN_ICON_STATE = "warden_envirosuit"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "warden_envirosuit_new",
			RESKIN_WORN_ICON_STATE = "warden_envirosuit_new"
		),
	)

/obj/item/clothing/under/plasmaman/security/head_of_security
	icon_state = "hos_envirosuit"
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Red Variant" = list(
			RESKIN_ICON_STATE = "hos_envirosuit",
			RESKIN_WORN_ICON_STATE = "hos_envirosuit"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "hos_envirosuit_new",
			RESKIN_WORN_ICON_STATE = "hos_envirosuit_new"
		),
	)

/obj/item/clothing/head/helmet/space/plasmaman/security
	icon = 'modular_skyrat/master_files/icons/obj/clothing/head/plasmaman_hats.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/head/plasmaman_head.dmi'
	icon_state = "security_envirohelm"
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Red Variant" = list(
			RESKIN_ICON_STATE = "security_envirohelm",
			RESKIN_WORN_ICON_STATE = "security_envirohelm"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "security_envirohelm_new",
			RESKIN_WORN_ICON_STATE = "security_envirohelm_new"
		),
	)

/obj/item/clothing/head/helmet/space/plasmaman/security/warden
	icon_state = "warden_envirohelm"
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Red Variant" = list(
			RESKIN_ICON_STATE = "warden_envirohelm",
			RESKIN_WORN_ICON_STATE = "warden_envirohelm"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "warden_envirohelm_new",
			RESKIN_WORN_ICON_STATE = "warden_envirohelm_new"
		),
	)

/obj/item/clothing/head/helmet/space/plasmaman/security/head_of_security
	icon_state = "hos_envirohelm"
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Red Variant" = list(
			RESKIN_ICON_STATE = "hos_envirohelm",
			RESKIN_WORN_ICON_STATE = "hos_envirohelm"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "hos_envirohelm_new",
			RESKIN_WORN_ICON_STATE = "hos_envirohelm_new"
		),
	)

/*
* SHOES
*/
/obj/item/clothing/shoes/jackboots/sec
	name = "Security Jackboots"
	desc = "Corporative-issue Security combat boots for combat scenarios or combat situations. All combat, all the time."
	icon_state = "jackboots_sec"
	icon = 'modular_skyrat/master_files/icons/obj/clothing/shoes.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/feet.dmi'
	clothing_traits = list(TRAIT_SILENT_FOOTSTEPS) // We have other footsteps.
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Red-Trimmed Variant" = list(
			RESKIN_ICON_STATE = "jackboots_sec",
			RESKIN_WORN_ICON_STATE = "jackboots_sec"
		),
		"Blue-Trimmed Variant" = list(
			RESKIN_ICON_STATE = "security_boots",
			RESKIN_WORN_ICON_STATE = "security_boots"
		),
		"White-Trimmed Variant" = list(
			RESKIN_ICON_STATE = "security_boots_white",
			RESKIN_WORN_ICON_STATE = "security_boots_white"
		),
		"Full White Variant" = list(
			RESKIN_ICON_STATE = "security_boots_fullwhite",
			RESKIN_WORN_ICON_STATE = "security_boots_fullwhite"
		),
	)

/*
* BELTS
*/
/obj/item/storage/belt/security
	icon = 'modular_skyrat/master_files/icons/obj/clothing/belts.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/belt.dmi'
	icon_state = "belt_slim"
	worn_icon_state = "belt_slim"
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Black Variant" = list(
			RESKIN_ICON_STATE = "belt_black",
			RESKIN_WORN_ICON_STATE = "belt_black"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "belt_blue",
			RESKIN_WORN_ICON_STATE = "belt_blue"
		),
		"White Variant" = list(
			RESKIN_ICON_STATE = "belt_white",
			RESKIN_WORN_ICON_STATE = "belt_white"
		),
		"Slim Variant" = list(
			RESKIN_ICON_STATE = "belt_slim",
			RESKIN_WORN_ICON_STATE = "belt_slim"
		),
	)

/obj/item/storage/belt/security/webbing
	icon = 'icons/obj/clothing/belts.dmi'
	uses_advanced_reskins = FALSE
	unique_reskin = NONE
	current_skin = "securitywebbing"

/*
* GLOVES
*/
/obj/item/clothing/gloves/color/black
	current_skin = "black"

/obj/item/clothing/gloves/color/black/security
	name = "Security Gloves"
	desc = "A pair of security gloves."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/gloves.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/hands.dmi'
	icon_state = "maagloves"
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Black-Red Variant" = list(
			RESKIN_ICON_STATE = "maagloves",
			RESKIN_WORN_ICON_STATE = "maagloves"
		),
		"Black Variant" = list(
			RESKIN_ICON_STATE = "gloves_black",
			RESKIN_WORN_ICON_STATE = "gloves_black"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "gloves_blue",
			RESKIN_WORN_ICON_STATE = "gloves_blue"
		),
		"White Variant" = list(
			RESKIN_ICON_STATE = "gloves_white",
			RESKIN_WORN_ICON_STATE = "gloves_white"
		),
	)

/*
* GLASSES
*/
/obj/item/clothing/glasses/hud/security
	icon = 'modular_skyrat/master_files/icons/obj/clothing/glasses.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/eyes.dmi'
	icon_state = "securityhud"
	glass_colour_type = /datum/client_colour/glass_colour/red
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Standart Red Variant" = list(
			RESKIN_ICON_STATE = "securityhud",
			RESKIN_WORN_ICON_STATE = "securityhud",
			glass_colour_type = /datum/client_colour/glass_colour/red
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "security_hud",
			RESKIN_WORN_ICON_STATE = "security_hud",
			glass_colour_type = /datum/client_colour/glass_colour/lightblue
		),
	)

/obj/item/clothing/glasses/hud/security/sunglasses
	icon_state = "sunhudsec"
	glass_colour_type = /datum/client_colour/glass_colour/red
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Standart Red Variant" = list(
			RESKIN_ICON_STATE = "sunhudsec",
			RESKIN_WORN_ICON_STATE = "sunhudsec",
			glass_colour_type = /datum/client_colour/glass_colour/red
		),
		"Dark-Tint Variant" = list(
			RESKIN_ICON_STATE = "security_hud_black",
			RESKIN_WORN_ICON_STATE = "security_hud_black",
			glass_colour_type = /datum/client_colour/glass_colour/blue
		),
		"Light-Tint Variant" = list(
			RESKIN_ICON_STATE = "security_hud_blue",
			RESKIN_WORN_ICON_STATE = "security_hud_blue",
			glass_colour_type = /datum/client_colour/glass_colour/blue
		),
	)

/obj/item/clothing/glasses/hud/security/sunglasses/eyepatch
	icon_state = "red_hudpatch"
	base_icon_state = "red_hudpatch"
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Standart Red Variant" = list(
			RESKIN_ICON_STATE = "red_hudpatch",
			RESKIN_WORN_ICON_STATE = "red_hudpatch",
			glass_colour_type = /datum/client_colour/glass_colour/red
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "hudpatch",
			RESKIN_WORN_ICON_STATE = "hudpatch",
			glass_colour_type = /datum/client_colour/glass_colour/lightblue
		),
	)

/obj/item/clothing/glasses/hud/security/night
	icon_state = "securityhudnight"
	glass_colour_type = /datum/client_colour/glass_colour/green
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Standart Red Variant" = list(
			RESKIN_ICON_STATE = "securityhudnight",
			RESKIN_WORN_ICON_STATE = "securityhudnight"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "security_hud_nv",
			RESKIN_WORN_ICON_STATE = "security_hud_nv"
		),
	)

/obj/item/clothing/glasses/hud/security/sunglasses/gars
	icon_state = "red_gar_sec"
	glass_colour_type = /datum/client_colour/glass_colour/red
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Standart Red Variant" = list(
			RESKIN_ICON_STATE = "red_gar_sec",
			RESKIN_WORN_ICON_STATE = "red_gar_sec",
			glass_colour_type = /datum/client_colour/glass_colour/red
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "gar_sec",
			RESKIN_WORN_ICON_STATE = "gar_sec",
			glass_colour_type = /datum/client_colour/glass_colour/lightblue
		),
	)

/obj/item/clothing/glasses/hud/security/sunglasses/gars/giga
	icon_state = "red_gigagar_sec"
	glass_colour_type = /datum/client_colour/glass_colour/red
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Standart Red Variant" = list(
			RESKIN_ICON_STATE = "red_gigagar_sec",
			RESKIN_WORN_ICON_STATE = "red_gigagar_sec",
			glass_colour_type = /datum/client_colour/glass_colour/red
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "gigagar_sec",
			RESKIN_WORN_ICON_STATE = "gigagar_sec",
			glass_colour_type = /datum/client_colour/glass_colour/lightblue
		),
	)

/obj/item/clothing/glasses/hud/eyepatch/sec/blindfold
	icon = 'modular_skyrat/master_files/icons/obj/clothing/glasses.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/eyes.dmi'

/*
* HEAD
*/
/obj/item/clothing/head/security_cap
	name = "Security Cap"
	desc = "A robust cap with the security insignia emblazoned on it. Uses reinforced fabric to offer sufficient protection."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/head.dmi'
	icon_state = "secsoft"
	uses_advanced_reskins = TRUE
	armor_type = /datum/armor/head_security_cap
	strip_delay = 60
	dog_fashion = null
	supports_variations_flags = CLOTHING_SNOUTED_VARIATION_NO_NEW_ICON
	unique_reskin = list(
		"Red Variant" = list(
			RESKIN_ICON_STATE = "secsoft",
			RESKIN_WORN_ICON_STATE = "secsoft"
		),
		"Black Variant" = list(
			RESKIN_ICON_STATE = "security_cap_black",
			RESKIN_WORN_ICON_STATE = "security_cap_black"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "security_cap_blue",
			RESKIN_WORN_ICON_STATE = "security_cap_blue"
		),
		"White Variant" = list(
			RESKIN_ICON_STATE = "security_cap_white",
			RESKIN_WORN_ICON_STATE = "security_cap_white"
		),
	)

/obj/item/clothing/head/hats/warden
	name = "warden's hat"
	desc = "A warden's red hat. Looking at it gives you the feeling of wanting to keep people in cells for as long as possible."
	icon_state = "wardenhat"

/obj/item/clothing/head/helmet/sec
	name = "Peacekeeper Helmet"
	icon = 'modular_skyrat/master_files/icons/obj/clothing/head/helmet.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/head/helmet.dmi'
	icon_state = "security_helmet"
	base_icon_state = "security_helmet"
	actions_types = list(/datum/action/item_action/toggle)
	supports_variations_flags = CLOTHING_SNOUTED_VARIATION
	flags_cover = HEADCOVERSEYES | PEPPERPROOF
	visor_flags_cover = HEADCOVERSEYES | PEPPERPROOF
	dog_fashion = null

/// Duplication of toggleable logic - only way to make it toggleable without worse hacks due to being in base maps.
/obj/item/clothing/head/helmet/sec/attack_self(mob/user)
	. = ..()
	if(.)
		return
	if(user.incapacitated() || !can_toggle)
		return
	up = !up
	flags_1 ^= visor_flags
	flags_inv ^= visor_flags_inv
	flags_cover ^= visor_flags_cover
	// This part is changed to work with the seclight.
	base_icon_state = "[initial(icon_state)][up ? "up" : ""]"
	update_icon_state()
	to_chat(user, span_notice("[up ? alt_toggle_message : toggle_message] \the [src]."))

	user.update_worn_head()
	if(iscarbon(user))
		var/mob/living/carbon/carbon_user = user
		carbon_user.head_update(src, forced = TRUE)

/obj/item/clothing/head/security_garrison
	name = "Security Garrison Cap"
	desc = "A robust garrison cap with the security insignia emblazoned on it. Uses reinforced fabric to offer sufficient protection."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/head.dmi'
	icon_state = "garrison_black"
	uses_advanced_reskins = TRUE
	armor_type = /datum/armor/head_security_garrison
	strip_delay = 60
	supports_variations_flags = CLOTHING_SNOUTED_VARIATION_NO_NEW_ICON
	unique_reskin = list(
		"Black Variant" = list(
			RESKIN_ICON_STATE = "garrison_black",
			RESKIN_WORN_ICON_STATE = "garrison_black"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "garrison_blue",
			RESKIN_WORN_ICON_STATE = "garrison_blue"
		),
	)

/obj/item/clothing/head/cowboy/skyrat/cattleman/sec
	greyscale_colors = "#39393F#EA3232"

/obj/item/clothing/head/cowboy/skyrat/cattleman/wide/sec
	greyscale_colors = "#39393F#EA3232"

/*
* NECK
*/
/obj/item/clothing/neck/security_cape
	name = "security cape"
	desc = "A fashionable cape worn by security officers."
	icon = 'modular_skyrat/master_files/icons/obj/clothing/neck.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/neck.dmi'
	icon_state = "cape_black"
	inhand_icon_state = "" //no unique inhands
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Black Variant" = list(
			RESKIN_ICON_STATE = "cape_black",
			RESKIN_WORN_ICON_STATE = "cape_black"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "cape_blue",
			RESKIN_WORN_ICON_STATE = "cape_blue"
		),
		"White Variant" = list(
			RESKIN_ICON_STATE = "cape_white",
			RESKIN_WORN_ICON_STATE = "cape_white"
		),
	)

/obj/item/clothing/neck/security_cape/armplate
	name = "security gauntlet"
	desc = "A fashionable full-arm gauntlet worn by security officers. The gauntlet itself is made of plastic, and provides no protection, but it looks cool as hell."
	icon_state = "armplate_black"
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Black Variant" = list(
			RESKIN_ICON_STATE = "armplate_black",
			RESKIN_WORN_ICON_STATE = "armplate_black"
		),
		"Blue Variant" = list(
			RESKIN_ICON_STATE = "armplate_blue",
			RESKIN_WORN_ICON_STATE = "armplate_blue"
		),
		"Capeless Variant" = list(
			RESKIN_ICON_STATE = "armplate",
			RESKIN_WORN_ICON_STATE = "armplate"
		),
	)

/obj/item/clothing/neck/mantle/hosmantle
	name = "\proper the head of security's mantle"
	desc = "A plated mantle that one might wrap around the upper torso. The 'scales' of the garment signify the members of security and how you're carrying them on your shoulders."
	icon = 'modular_skyrat/master_files/icons/mob/clothing/neck.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/neck.dmi'
	icon_state = "hosmantle"

/*
* ACCESSORY
*/
/obj/item/clothing/accessory/armband/deputy
	icon = 'icons/obj/clothing/accessories.dmi'
	worn_icon = 'icons/mob/clothing/accessories.dmi'
	icon_state = "redband"

/obj/item/clothing/accessory/armband/deputy/lopland
	icon = 'modular_skyrat/master_files/icons/obj/clothing/accessories.dmi'
	worn_icon = 'modular_skyrat/master_files/icons/mob/clothing/accessories.dmi'
	icon_state = "armband_lopland"
	desc = "A armband, showing the wearer to be certified by Lopland as a top-of-their-class Security Officer."
