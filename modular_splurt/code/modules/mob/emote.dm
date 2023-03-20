/mob/emote(act, m_type, message, intentional, force_silence)
	SEND_SIGNAL(src, COMSIG_MOB_EMOTE, args)
	. = ..()
