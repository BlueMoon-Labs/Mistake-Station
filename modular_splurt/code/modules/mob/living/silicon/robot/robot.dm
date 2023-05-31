//Main code edits
/// Allows "cyborg" players to change gender at will - Modularised here
// FUNCTION MOVED TO living.dm AS PROC
/mob/living/silicon/robot/toggle_gender()
	set name = "Set Gender"
	set desc = "Allows you to set your gender."
	set category = "Robot Commands"
	change_gender()

/mob/living/silicon/robot/Initialize(mapload)
	.=..()
	AddComponent(/datum/component/personal_crafting)
