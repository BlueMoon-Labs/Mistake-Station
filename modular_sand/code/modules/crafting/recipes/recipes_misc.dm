////////////
//Unsorted//
////////////

/datum/crafting_recipe/shower
	name = "Shower"
	reqs = list(/obj/item/stack/sheet/iron = 3)
	result = /obj/machinery/shower
	tool_behaviors = list(TOOL_WELDER)

	category = CAT_MISC

/datum/crafting_recipe/a357ammospeed
	name = "Speed loader (.357)"
	reqs = list(/obj/item/stack/sheet/iron = 2,
				/obj/item/ammo_casing/a357 = 7)
	result = /obj/item/ammo_box/a357
	tool_behaviors = list(TOOL_WELDER, TOOL_SCREWDRIVER, TOOL_WRENCH)
	category = CAT_WEAPON_AMMO

/datum/crafting_recipe/double_o2
	name = "Double emergency oxygen tank"
	reqs = list(/obj/item/tank/internals/emergency_oxygen/engi = 2,
				/obj/item/stack/sheet/iron = 1)
	result = /obj/item/tank/internals/emergency_oxygen/double/empty
	tool_behaviors = list(TOOL_WELDER)

	category = CAT_MISC

/datum/crafting_recipe/case_cosmos
	name = "Cosmos Compartment Case"
	reqs = list(/obj/item/storage/backpack/case = 1,
				/obj/item/bedsheet/cosmos = 1)
	result = /obj/item/storage/backpack/case/cosmos
	tool_behaviors = list(TOOL_SCREWDRIVER)

	category = CAT_MISC
