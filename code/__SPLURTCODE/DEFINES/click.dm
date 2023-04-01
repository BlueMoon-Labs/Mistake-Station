/*
	Click code cleanup
	~Sayu
*/
//Delays the mob's next click/action by num deciseconds
// eg: 10-3 = 7 deciseconds of delay
// eg: 10*0.5 = 5 deciseconds of delay
// DOES NOT EFFECT THE BASE 1 DECISECOND DELAY OF NEXT_CLICK

/mob/proc/timeToNextMove()
	return max(0, next_move - world.time)

/mob/proc/altclick_listed_turf(atom/A)
	var/turf/T = get_turf(A)
	if(T == A.loc || T == A)
		if(T == listed_turf)
			listed_turf = null
		else if(TurfAdjacent(T))
			listed_turf = T
			client.statpanel = T.name
