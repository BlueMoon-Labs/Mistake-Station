#define SPECIES_SPECTRE		    "spectre"
#define BODYPART_ICON_SPECTRE 'modular_bluemoon/modules/kovac_modules/species/icons/spectre_bot_parts_grayscale.dmi'
// Attempt to purt splurt's spectre, skill issue this aint used atm
/obj/item/bodypart/head/robot/synth/spectre
	icon_greyscale = BODYPART_ICON_IPC
	limb_id = SPECIES_SPECTRE

/obj/item/bodypart/chest/robot/synth/spectre
	icon_greyscale = BODYPART_ICON_IPC
	limb_id = SPECIES_SPECTRE

/obj/item/bodypart/arm/left/robot/synth/spectre
	icon_greyscale = BODYPART_ICON_IPC
	limb_id = SPECIES_SPECTRE

/obj/item/bodypart/arm/right/robot/synth/spectre
	icon_greyscale = BODYPART_ICON_IPC
	limb_id = SPECIES_SPECTRE

/obj/item/bodypart/leg/left/robot/synth/spectre
	icon_greyscale = BODYPART_ICON_IPC
	limb_id = SPECIES_SPECTRE

/obj/item/bodypart/leg/right/robot/synth/spectre
	icon_greyscale = BODYPART_ICON_IPC
	limb_id = SPECIES_SPECTRE

/datum/species/synthetic/spectre
	name = "BDR-01 Spectre"
	id = SPECIES_SPECTRE
	digitigrade_customization = DIGITIGRADE_NEVER
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/robot/synth/spectre,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/robot/synth/spectre,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/robot/synth/spectre,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/robot/synth/spectre,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/robot/synth/spectre,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/robot/synth/spectre,
	)
