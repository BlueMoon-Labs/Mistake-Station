/// Put your [AddComponent] calls here
///atom/proc/ComponentInitialize()
//	return

/mob/living/carbon/human/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/mob_holder/micro, "micro")
