#define SPECIES_UNDEAD		    "undead"
#define SPECIES_UNDEADA		    "undead_anthropomorph"

// Undead Humans
/datum/species/human/undead
	name = "\improper Undead Human"
	id = SPECIES_UNDEAD
	wing_types = list(/obj/item/organ/external/wings/functional/skeleton)
	use_skintones = 1
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = JUNKFOOD | FRIED
	liked_food = GROSS | RAW | CLOTH | BUGS | GORE
	payday_modifier = 1
	meat = /obj/item/food/meat/slab/human/mutant/zombie
	mutanttongue = /obj/item/organ/internal/tongue/zombie
	mutantstomach = null
	mutantheart = null
	mutantliver = null
	mutantlungs = null
	inherent_traits = list(
		// SHARED WITH ALL ZOMBIES
		TRAIT_EASILY_WOUNDED,
		TRAIT_EASYDISMEMBER,
		TRAIT_FAKEDEATH,
		TRAIT_LIMBATTACHMENT,
		TRAIT_NOBREATH,
		TRAIT_NOCLONELOSS,
		TRAIT_NODEATH,
		TRAIT_NOHUNGER,
		TRAIT_NOMETABOLISM,
		TRAIT_RADIMMUNE,
		TRAIT_RESISTCOLD,
		TRAIT_RESISTHIGHPRESSURE,
		TRAIT_RESISTLOWPRESSURE,
		TRAIT_TOXIMMUNE,
		// HIGH FUNCTIONING UNIQUE
		TRAIT_NOBLOOD,
		TRAIT_SUCCUMB_OVERRIDE,
	)
	inherent_biotypes = MOB_UNDEAD|MOB_HUMANOID
	bodytemp_normal = T0C // They have no natural body heat, the environment regulates body temp
	bodytemp_heat_damage_limit = FIRE_MINIMUM_TEMPERATURE_TO_EXIST
	bodytemp_cold_damage_limit = MINIMUM_TEMPERATURE_TO_MOVE

/datum/species/human/undead/body_temperature_core(mob/living/carbon/human/humi, delta_time, times_fired)
	return

/datum/species/human/undead/on_species_gain(mob/living/carbon/human/new_undead, datum/species/old_species)
	. = ..()
	new_undead.skin_tone = "albino"
	new_undead.update_body(0)

/datum/species/human/undead/prepare_human_for_preview(mob/living/carbon/human/humi)
	humi.hairstyle = "Vox Ruffhawk"
	humi.hair_color = "#473333"
	humi.eye_color_left = "#ff3300"
	humi.eye_color_right = "#ff3300"
	humi.update_body_parts()

/datum/species/human/undead/get_species_description()
	return "A rotting zombie! They descend upon Space Station Thirteen Every year to spook the crew! \"Sincerely, the Zombies!\""

/datum/species/human/undead/get_species_lore()
	return list("Zombies have long lasting beef with Botanists. Their last incident involving a lawn with defensive plants has left them very unhinged.")

/datum/species/human/undead/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_NEUTRAL_PERK,
		SPECIES_PERK_ICON = "thermometer-half",
		SPECIES_PERK_NAME = "No Body Temperature",
		SPECIES_PERK_DESC = "Having long since departed, Undeads do not have anything \
			regulating their body temperature anymore. This means that \
			the environment decides their body temperature - which they don't mind at \
			all, until it gets a bit too hot.",
	))

	return to_add

// Undead Furries etc fuck this crap
/datum/species/mammal/undeada
	name = "Undead Anthromorph"
	id = SPECIES_UNDEADA
	wing_types = list(/obj/item/organ/external/wings/functional/skeleton)
	disliked_food = JUNKFOOD | FRIED
	liked_food = GROSS | RAW | CLOTH | BUGS | GORE
	mutanttongue = /obj/item/organ/internal/tongue/zombie
	inherent_traits = list(
		// SHARED WITH ALL ZOMBIES
		TRAIT_EASILY_WOUNDED,
		TRAIT_EASYDISMEMBER,
		TRAIT_FAKEDEATH,
		TRAIT_LIMBATTACHMENT,
		TRAIT_NOBREATH,
		TRAIT_NOCLONELOSS,
		TRAIT_NODEATH,
		TRAIT_NOHUNGER,
		TRAIT_NOMETABOLISM,
		TRAIT_RADIMMUNE,
		TRAIT_RESISTCOLD,
		TRAIT_RESISTHIGHPRESSURE,
		TRAIT_RESISTLOWPRESSURE,
		TRAIT_TOXIMMUNE,
		// HIGH FUNCTIONING UNIQUE
		TRAIT_NOBLOOD,
		TRAIT_SUCCUMB_OVERRIDE,
	)
	inherent_biotypes = MOB_UNDEAD|MOB_HUMANOID
	bodytemp_normal = T0C // They have no natural body heat, the environment regulates body temp
	bodytemp_heat_damage_limit = FIRE_MINIMUM_TEMPERATURE_TO_EXIST
	bodytemp_cold_damage_limit = MINIMUM_TEMPERATURE_TO_MOVE

/datum/species/mammal/undeada/body_temperature_core(mob/living/carbon/human/humia, delta_time, times_fired)
	return

/datum/species/mammal/undeada/prepare_human_for_preview(mob/living/carbon/human/humia)
	var/main_color = "#404040"
	var/secondary_color = "#1f2821"
	humia.dna.features["mcolor"] = main_color
	humia.dna.features["mcolor2"] = secondary_color
	humia.dna.features["mcolor3"] = secondary_color
	humia.eye_color_left = "#ff3300"
	humia.eye_color_right = "#ff3300"
	humia.dna.mutant_bodyparts["ears"] = list(MUTANT_INDEX_NAME = "Husky", MUTANT_INDEX_COLOR_LIST = list(main_color, secondary_color, "#464646"))
	humia.dna.mutant_bodyparts["snout"] = list(MUTANT_INDEX_NAME = "Husky", MUTANT_INDEX_COLOR_LIST = list(main_color, secondary_color, secondary_color))
	humia.dna.mutant_bodyparts["tail"] = list(MUTANT_INDEX_NAME = "Husky", MUTANT_INDEX_COLOR_LIST = list(main_color, "#4D4D4D", secondary_color))
	regenerate_organs(humia, src, visual_only = TRUE)
	humia.update_body(TRUE)

/datum/species/mammal/undeada/get_species_description()
	return "A rotting zombie! They descend upon Space Station Thirteen Every year to spook the crew! \"Sincerely, the Zombies!\""

/datum/species/mammal/undeada/get_species_lore()
	return list("Zombies have long lasting beef with Botanists. Their last incident involving a lawn with defensive plants has left them very unhinged.")

/datum/species/mammal/undeada/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(list(
		SPECIES_PERK_TYPE = SPECIES_NEUTRAL_PERK,
		SPECIES_PERK_ICON = "thermometer-half",
		SPECIES_PERK_NAME = "No Body Temperature",
		SPECIES_PERK_DESC = "Having long since departed, Undeads do not have anything \
			regulating their body temperature anymore. This means that \
			the environment decides their body temperature - which they don't mind at \
			all, until it gets a bit too hot.",
	))

	return to_add
