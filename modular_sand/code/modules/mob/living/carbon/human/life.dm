//Hyper change, adds cumdrip
/mob/living/carbon/human/Life(seconds, times_fired)
	if(!(. = ..()))
		return
	if(cumdrip_rate > 0 && stat != DEAD)
		handle_creampie()
