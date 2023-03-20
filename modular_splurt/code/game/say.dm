/atom/movable/proc/bark(list/hearers, distance, volume, pitch, queue_time)
	if(queue_time && vocal_current_bark != queue_time)
		return
	if(SEND_SIGNAL(src, COMSIG_MOVABLE_BARK, hearers, distance, volume, pitch))
		return //bark interception. this probably counts as some flavor of BDSM
	if(!vocal_bark)
		if(!vocal_bark_id || !set_bark(vocal_bark_id)) //just-in-time bark generation
			return
	volume = min(volume, 100)
	var/turf/T = get_turf(src)
	for(var/mob/M in hearers)
		M.playsound_local(T, vol = volume, vary = TRUE, frequency = pitch, max_distance = distance, falloff_distance = 0, falloff_exponent = BARK_SOUND_FALLOFF_EXPONENT(distance), sound_to_use = vocal_bark, distance_multiplier = 1)

/atom/movable/bark(list/hearers, distance, volume, pitch)
	if(!CONFIG_GET(flag/enable_global_barks))
		return
	. = ..()
