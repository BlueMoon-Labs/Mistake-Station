/obj/item/organ/external/genital
	var/datum/reagents/climax_fluids
	var/datum/reagent/original_fluid_id
	var/datum/reagent/default_fluid_id
	var/list/writtentext = ""

/// for specific build_from_dna behavior that also checks the genital accessory.
/obj/item/organ/external/genital/proc/build_from_accessory(datum/sprite_accessory/genital/accessory, datum/dna/DNA)
	return

/obj/item/organ/external/genital/proc/climax_modify_size(mob/living/partner, obj/item/organ/external/genital/source_gen)
    return

/obj/item/organ/external/genital/proc/get_fluid_id()
	if(fluid_id)
		return fluid_id
	else if(linked_organ?.fluid_id)
		return linked_organ.fluid_id
	return

/obj/item/organ/external/genital/proc/get_fluid_name()
	var/milkies = get_fluid_id()
	var/message
	if(!milkies) //No milkies??
		return
	var/datum/reagent/R = find_reagent_object_from_type(milkies)
	message = R.name
	return message

/obj/item/organ/external/genital/proc/get_default_fluid()
	if(default_fluid_id)
		return default_fluid_id
	else if(linked_organ?.default_fluid_id)
		return linked_organ.default_fluid_id
	return

/obj/item/organ/external/genital/proc/set_fluid_id(new_fluidtype)
	if(genital_flags & GENITAL_FLUID_PRODUCTION)
		fluid_id = new_fluidtype
	else if(linked_organ?.genital_flags & GENITAL_FLUID_PRODUCTION)
		linked_organ?.fluid_id = new_fluidtype

/obj/item/organ/external/genital
	var/list/obj/item/equipment = list()
