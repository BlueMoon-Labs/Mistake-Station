/mob/proc/AddSpell(datum/action/cooldown/spell/S)
	mob_spell_list += S
	S.action.Grant(src)

/datum/mind/proc/AddSpell(datum/action/cooldown/spell/S)
	spell_list += S
	S.action.Grant(current)

/datum/mind/proc/owns_soul()
	return soulOwner == src

//To remove a specific spell from a mind
/datum/mind/proc/RemoveSpell(datum/action/cooldown/spell/spell)
	if(!spell)
		return
	for(var/X in spell_list)
		var/datum/action/cooldown/spell/S = X
		if(istype(S, spell))
			spell_list -= S
			qdel(S)
	current?.client << output(null, "statbrowser:check_spells")

/datum/mind/proc/RemoveAllSpells()
	for(var/datum/action/cooldown/S in spell_list)
		RemoveSpell(S)

/client/proc/toggle_quirk(mob/living/carbon/human/H)
	if (!istype(H))
		to_chat(usr, "This can only be used on /mob/living/carbon/human.")
		return

	var/list/options = list("Clear"="Clear")
	for(var/x in subtypesof(/datum/quirk))
		var/datum/quirk/T = x
		var/qname = initial(T.name)
		options[H.has_quirk(T) ? "[qname] (Remove)" : "[qname] (Add)"] = T

	var/result = tgui_input_list(usr, "Choose quirk to add/remove", "Mob Quirks", options) // input(usr, "Choose quirk to add/remove","Quirk Mod") as null|anything in options

	if(QDELETED(H))
		to_chat(usr, "Mob doesn't exist anymore")
		return

	if(result)
		if(result == "Clear")
			for(var/datum/quirk/q in H.quirks)
				H.remove_quirk(q.type)
		else
			var/T = options[result]
			if(H.has_quirk(T))
				H.remove_quirk(T)
			else
				H.add_quirk(T,TRUE)

/client/proc/toggle_spell(mob/M)
	var/list/options = list("Clear"="Clear")
	for(var/x in GLOB.spells)
		var/datum/action/cooldown/spell/spell = x
		var/spell_name = initial(spell.name)
		options[M.has_spell(spell) ? "[spell_name] (Remove)" : "[spell_name] (Add)"] = spell

	var/spell_to_modify = tgui_input_list(usr, "Choose spell to add/remove", "Mob Spells", options) // input(usr, "Choose quirk to add/remove","Quirk Mod") as null|anything in options

	if(QDELETED(M))
		to_chat(usr, "Mob doesn't exist anymore")
		return

	if(spell_to_modify)
		if(spell_to_modify == "Clear")
			if (!M.mind)
				return
			for(var/datum/action/cooldown/spell/S in M.mind.spell_list)
				M.mind.RemoveSpell(S.type)
		else
			var/T = options[spell_to_modify]
			if(M.has_spell(T))
				M.mind.RemoveSpell(T)
			else
				if (M.mind)
					M.mind.AddSpell(new T)
				else
					M.AddSpell(new T)
					message_admins("<span class='danger'>Spells given to mindless mobs will not be transferred in mindswap or cloning!</span>")

/client/proc/teach_martial_art(mob/living/carbon/C)
	if (!istype(C))
		to_chat(usr, "This can only be used on /mob/living/carbon.")
		return

	var/list/artpaths = subtypesof(/datum/martial_art)
	var/list/artnames = list()
	for(var/i in artpaths)
		var/datum/martial_art/M = i
		artnames[initial(M.name)] = M
	var/result = tgui_input_list(usr, "Choose the martial art to teach", "JUDO CHOP", artnames) // input(usr, "Choose the martial art to teach","JUDO CHOP") as null|anything in artnames

	if(QDELETED(C))
		to_chat(usr, "Mob doesn't exist anymore")
		return
	if(result)
		var/chosenart = artnames[result]
		var/datum/martial_art/MA = new chosenart
		MA.teach(C)
		log_admin("[key_name(usr)] has taught [MA] to [key_name(C)].")
		message_admins("<span class='notice'>[key_name_admin(usr)] has taught [MA] to [key_name_admin(C)].</span>")

/client/proc/set_species(mob/living/carbon/human/H)
	if (istype(H))
		var/result = tgui_input_list(usr, "Choose a new species","Species", GLOB.species_list)
		if(QDELETED(H))
			to_chat(usr, "Mob doesn't exist anymore")
			return
		if(result)
			admin_ticket_log("[key_name_admin(usr)] has modified the bodyparts of [H] to [result]")
			H.set_species(GLOB.species_list[result])

// Stuff that helps the TGUI player panel transform section to work

GLOBAL_LIST_INIT(pp_transformables, list(
	list(
	name = "Common",
	color = "",
	types = list(
		list(
			name = "Human",
			key = /mob/living/carbon/human
			),
		list(
			name = "Monkey",
			key = /mob/living/carbon/monkey
			),
		list(
			name = "Cyborg",
			key = /mob/living/silicon/robot
			)
		)
	),
	list(
	name = "Xenomorph",
	color = "purple",
	types = list(
		list(
			name = "Larva",
			key = /mob/living/carbon/alien/larva
			),
		list(
			name = "Drone",
			key = /mob/living/carbon/alien/adult/drone
			),
		list(
			name = "Hunter",
			key = /mob/living/carbon/alien/adult/hunter
			),
		list(
			name = "Sentinel",
			key = /mob/living/carbon/alien/adult/sentinel
			),
		list(
			name = "Praetorian",
			key = /mob/living/carbon/alien/adult/royal/praetorian
			),
		list(
			name = "Queen",
			key = /mob/living/carbon/alien/adult/royal/queen
			)
		)
	),
	list(
	name = "Lavaland",
	color = "orange",
	types = list(
		list(
			name = "Goliath",
			key = /mob/living/simple_animal/hostile/asteroid/goliath/beast
			),
		list(
			name = "Legion",
			key = /mob/living/simple_animal/hostile/asteroid/hivelord/legion
			),
		list(
			name = "Blood-Drunk Miner",
			key = /mob/living/simple_animal/hostile/megafauna/blood_drunk_miner
			),
		list(
			name = "Gladiator",
			key = /mob/living/simple_animal/hostile/megafauna/gladiator
			),
		list(
			name = "Dragon",
			key = /mob/living/simple_animal/hostile/megafauna/dragon
			),
		list(
			name = "Legion Hivelord",
			key = /mob/living/simple_animal/hostile/asteroid/elite/legionnaire
			)
		)
	),
	list(
	name = "Cultist",
	color = "violet",
	types = list(
		list(
			name = "Shade",
			key = /mob/living/simple_animal/shade
			),
		list(
			name = "Artificer",
			key = /mob/living/simple_animal/hostile/construct/artificer
			),
		list(
			name = "Harvester",
			key = /mob/living/simple_animal/hostile/construct/harvester
			),
		list(
			name = "Wraith",
			key = /mob/living/simple_animal/hostile/construct/wraith
			),
		list(
			name = "Juggernaut",
			key = /mob/living/simple_animal/hostile/construct/juggernaut
			)
		)
	)
))

// M: Mob to change
// newType: Path of new type e.g: /mob/living/carbon/alien/humanoid/drone
// newTypeName (optional): Name of the new type (used in logging): e.g: "Drone"
/datum/admins/proc/transformMob(mob/M, mob/adminMob, newType, newTypeName)
	if(!check_rights(R_SPAWN))
		return

	if(!ismob(M))
		to_chat(usr, "This can only be used on instances of type /mob.")
		return

	if (!newTypeName)
		newTypeName = newType

	log_admin("[key_name(usr)] transformed [key_name(M)] into a [newTypeName].")
	message_admins("<span class='adminnotice'>[key_name_admin(usr)] transformed [key_name_admin(M)] into a [newTypeName].</span>")

	var/mob/newMob = M.change_mob_type(newType, delete_old_mob = TRUE)

	if (M == adminMob)
		adminMob = newMob
	addtimer(CALLBACK(newMob.mob_panel, /datum.proc/ui_interact, adminMob), 0.1 SECONDS)

GLOBAL_LIST_INIT(mute_bits, list(
	list(name = "IC", bitflag = MUTE_IC),
	list(name = "OOC", bitflag = MUTE_OOC),
	list(name = "Pray", bitflag = MUTE_PRAY),
	list(name = "Ahelp", bitflag = MUTE_ADMINHELP),
	list(name = "Deadchat", bitflag = MUTE_DEADCHAT)
))

GLOBAL_LIST_INIT(pp_limbs, list(
	"Head" 		= BODY_ZONE_HEAD,
	"Left leg" 	= BODY_ZONE_L_LEG,
	"Right leg" = BODY_ZONE_R_LEG,
	"Left arm" 	= BODY_ZONE_L_ARM,
	"Right arm" = BODY_ZONE_R_ARM
))

/datum/admins/proc/show_player_panel2(mob/M)
	if(!M)
		to_chat(owner, "You seem to be selecting a mob that doesn't exist anymore.")
		return

	// this is stupid, thanks byond
	if(istype(src, /client))
		var/client/C = src
		src = C.holder

	if(!check_rights())
		to_chat(owner, "Error: you are not an admin!")
		return

	if(!M.mob_panel)
		M.create_player_panel()

	M.mob_panel.ui_interact(owner.mob)

/datum/player_panel
	var/mob/targetMob
	var/client/targetClient
	var/list/roleStatus // A list of each role and whether they are banned or not for this player.
	var/antagBanReason
	var/activeRoleBans
	var/mobSize // Because aparently there is no variable that tracks this on the mob??

/datum/player_panel/New(mob/target)
	. = ..()
	targetMob = target

	var/mob/living/L = targetMob
	if (istype(L))
		mobSize = L.mob_size

/datum/player_panel/Destroy(force, ...)
	targetMob = null
	targetClient = null
	roleStatus = null
	antagBanReason = null
	activeRoleBans = null
	mobSize = null

	SStgui.close_uis(src)
	return ..()

/datum/player_panel/ui_interact(mob/user, datum/tgui/ui)
	if(!targetMob)
		return

	ui = SStgui.try_update_ui(user, src, ui)
	if (!ui)
		ui = new(user, src, "PlayerPanel2", "[targetMob.name] Player Panel")
		ui.open()

/datum/player_panel/ui_state(mob/user)
	return GLOB.admin_state

/datum/player_panel/ui_data(mob/user)
	. = list()
	.["mob_name"] = targetMob.real_name
	// .["current_permissions"] = user.client?.holder?.rank.rights
	.["mob_type"] = targetMob.type
	.["admin_mob_type"] = user.client?.mob.type
	.["godmode"] = targetMob.status_flags & GODMODE

	var/mob/living/L = targetMob
	if (istype(L))
		.["is_frozen"] = L.admin_frozen
		.["is_slept"] = L.admin_sleeping
		.["mob_scale"] = mobSize

	if(targetMob.client)
		targetClient = targetMob.client
		.["client_ckey"] = targetClient.ckey
		.["client_muted"] = targetClient.prefs.muted
		.["client_rank"] = targetClient.holder ? targetClient.holder.ranks : "Player"

		.["roles"] = roleStatus
		.["antag_ban_reason"] = antagBanReason
		.["active_role_ban_count"] = activeRoleBans

	else
		targetClient = null
		roleStatus = null
		antagBanReason = null
		.["client_ckey"] = null

/datum/player_panel/ui_static_data()
	. = list()

	.["transformables"] = GLOB.pp_transformables
	.["glob_limbs"] = GLOB.pp_limbs
	.["glob_mute_bits"] = GLOB.mute_bits
	.["current_time"] = time2text(world.timeofday, "YYYY-MM-DD hh:mm:ss")

	.["initial_scale"] = 1

	if(targetClient)
		var/byond_version = "Unknown"
		if(targetClient.byond_version)
			byond_version = "[targetClient.byond_version].[targetClient.byond_build ? targetClient.byond_build : "xxx"]"
		.["data_byond_version"] = byond_version
		.["data_player_join_date"] = targetClient.player_join_date
		.["data_account_join_date"] = targetClient.account_join_date
		.["data_related_cid"] = targetClient.related_accounts_cid
		.["data_related_ip"] = targetClient.related_accounts_ip

		.["initial_scale"] = targetClient.prefs.features["body_size"]

		if(CONFIG_GET(flag/use_exp_tracking))
			.["playtimes_enabled"] = TRUE
			.["playtime"] = targetMob.client.get_exp_living()

/datum/player_panel/ui_act(action, params, datum/tgui/ui)
	if(..())
		return

	var/client/admin = usr.client

	if (!check_rights(R_ADMIN))
		message_admins("<span class='adminhelp'>WARNING: NON-ADMIN [ADMIN_LOOKUPFLW(admin)] ACCESSING ADMIN PANEL. WARN Casper#3044.</span>")
		to_chat(admin, "Error: you are not an admin!")
		return

	switch(action)
		if ("edit_rank")
			if (!targetMob.client?.ckey)
				return

			var/list/context = list()

			context["key"] = targetMob.client.ckey

			if (GLOB.admin_datums[targetMob.client.ckey] || GLOB.deadmins[targetMob.client.ckey])
				context["editrights"] = "rank"
			else
				context["editrights"] = "add"

			admin.holder.edit_rights_topic(context)

		if ("access_variables")
			admin.debug_variables(targetMob)

		if ("access_playtimes")
			if (targetMob.client)
				admin.holder.cmd_show_exp_panel(targetMob.client)

		if ("private_message")
			admin.cmd_admin_pm_context(targetMob)

		if ("subtle_message")
			admin.cmd_admin_direct_narrate(targetMob)

		if ("set_name")
			targetMob.vv_auto_rename(params["name"])

		if ("heal")
			admin.cmd_admin_rejuvenate(targetMob)

		if ("ghost")
			if(targetMob.client)
				log_admin("[key_name(admin)] ejected [key_name(targetMob)] from their body.")
				message_admins("[key_name_admin(admin)] ejected [key_name_admin(targetMob)] from their body.")
				to_chat(targetMob, "<span class='danger'>An admin has ejected you from your body.</span>")
				targetMob.ghostize(FALSE)

		if ("offer_control")
			offer_control(targetMob)

		if ("take_control")
			var/mob/adminMob = admin.mob

			// Disassociates observer mind from the body mind
			if(targetMob.client)
				targetMob.ghostize(FALSE)
			else
				for(var/mob/dead/observer/ghost in GLOB.dead_mob_list)
					if(targetMob.mind == ghost.mind)
						ghost.mind = null

			targetMob.ckey = adminMob.ckey
			qdel(adminMob)

			message_admins("<span class='adminnotice'>[key_name_admin(usr)] took control of [targetMob].</span>")
			log_admin("[key_name(usr)] took control of [targetMob].")
			addtimer(CALLBACK(targetMob.mob_panel, /datum.proc/ui_interact, targetMob), 0.1 SECONDS)

		if ("smite")
			admin.smite(targetMob)

		if ("bring")
			admin.Getmob(targetMob)

		if ("orbit")
			if(!isobserver(admin.mob))
				admin.admin_ghost()
			var/mob/dead/observer/O = admin.mob
			O.ManualFollow(targetMob)

		if ("jump_to")
			admin.jumptomob(targetMob)

		if ("freeze")
			var/mob/living/L = targetMob
			if (istype(L))
				L.toggle_admin_freeze(admin)

		if ("sleep")
			var/mob/living/L = targetMob
			if (istype(L))
				L.toggle_admin_sleep(admin)

		if ("lobby")
			if(!check_rights(R_ADMIN))
				return

			if(!isobserver(targetMob))
				to_chat(usr, span_notice("You can only send ghost players back to the Lobby."), confidential = TRUE)
				return

			if(!targetMob.client)
				to_chat(usr, span_warning("[targetMob] doesn't seem to have an active client."), confidential = TRUE)
				return

			if(tgui_alert(usr, "Send [key_name(targetMob)] back to Lobby?", "Message", list("Yes", "No")) != "Yes")
				return

			log_admin("[key_name(usr)] has sent [key_name(targetMob)] back to the Lobby.")
			message_admins("[key_name(usr)] has sent [key_name(targetMob)] back to the Lobby.")

			var/mob/dead/new_player/NP = new()
			NP.ckey = targetMob.ckey
			qdel(targetMob)

		if ("select_equipment")
			admin.cmd_select_equipment(targetMob)

		if ("strip")
			for(var/obj/item/I in targetMob)
				targetMob.dropItemToGround(I, TRUE) //The TRUE forces all items to drop, since this is an admin undress.

		if ("cryo")
			for (var/obj/machinery/cryopod/F as anything in GLOB.cryopod_computers)
				F.cryoMob()

		if ("force_say")
			targetMob.say(params["to_say"], forced="admin")

		if ("force_emote")
			targetMob.emote("me", EMOTE_VISIBLE, params["to_emote"])

		if ("prison")
			if(isAI(targetMob))
				to_chat(usr, "This cannot be used on instances of type /mob/living/silicon/ai.")
				return

			targetMob.forceMove(pick(GLOB.prisonwarp))
			to_chat(targetMob, "<span class='userdanger'>You have been sent to Prison!</span>")

			log_admin("[key_name(admin)] has sent [key_name(targetMob)] to Prison!")
			message_admins("[key_name_admin(admin)] has sent [key_name_admin(targetMob)] to Prison!")

		if ("kick")
			//admin.holder.kick(targetMob)
			return

		if ("ban")
			//admin.holder.newBan(targetMob)
			return

		if ("sticky_ban")
			var/list/ban_settings = list()
			if(targetMob.client)
				ban_settings["ckey"] = targetMob.ckey
			admin.holder.stickyban("add", ban_settings)

		if ("notes")
			if (targetMob.client)
				browse_messages(target_ckey = targetMob.ckey)

		if ("logs")
			var/source = LOGSRC_MOB
			if (targetMob.client)
				source = LOGSRC_CKEY

			show_individual_logging_panel(targetMob, source)

		if ("job_ban")
			return
			//if(targetMob.client)
			//	process_banlist(params["selected_role"], params["is_category"], params["want_to_ban"])

		if ("mute")
			if(!targetMob.client)
				return

			targetMob.client.prefs.muted = text2num(params["mute_flag"])
			log_admin("[key_name(admin)] set the mute flags for [key_name(targetMob)] to [targetMob.client.prefs.muted].")

		if ("mute_all")
			if(!targetMob.client)
				return

			for(var/bit in GLOB.mute_bits)
				targetMob.client.prefs.muted |= bit["bitflag"]

			log_admin("[key_name(admin)] mass-muted [key_name(targetMob)].")

		if ("unmute_all")
			if(!targetMob.client)
				return

			for(var/bit in GLOB.mute_bits)
				targetMob.client.prefs.muted &= ~bit["bitflag"]

			log_admin("[key_name(admin)] mass-unmuted [key_name(targetMob)].")

		if ("related_accounts")
			if(targetMob.client)
				var/related_accounts
				if (params["related_thing"] == "CID")
					related_accounts = targetMob.client.related_accounts_cid
				else
					related_accounts = targetMob.client.related_accounts_ip

				related_accounts = splittext(related_accounts, ", ")

				var/list/dat = list("Related accounts by [params["related_thing"]]:")
				dat += related_accounts
				usr << browse(dat.Join("<br>"), "window=related_[targetMob.client];size=420x300")

		if ("transform")
			var/choice = params["newType"]
			if (choice == "/mob/living")
				choice = tgui_input_list(usr, "What should this mob transform into", "Mob Transform", subtypesof(choice))
				if (!choice)
					return

			admin.holder.transformMob(targetMob, admin.mob, choice, params["newTypeName"])

		if ("toggle_godmode")
			admin.cmd_admin_godmode(targetMob)

		if ("spell")
			admin.toggle_spell(targetMob)

		if ("martial_art")
			admin.teach_martial_art(targetMob)

		if ("quirk")
			admin.toggle_quirk(targetMob)

		if ("species")
			admin.set_species(targetMob)

		if ("limb")
			if(!params["limbs"] || !ishuman(targetMob))
				return

			var/mob/living/carbon/human/H = targetMob

			for(var/limb in params["limbs"])
				if (!limb)
					continue

				if (params["delimb_mode"])
					var/obj/item/bodypart/L = H.get_bodypart(limb)
					if (!L)
						continue
					L.dismember()
					playsound(H, 'modular_splurt/sound/effects/cartoon_pop.ogg', 70)
				else
					H.regenerate_limb(limb)

		if ("scale")
			var/mob/living/L = targetMob
			if(!isnull(params["new_scale"]) && istype(L))
				L.vv_edit_var("resize", params["new_scale"])
				mobSize = params["new_scale"]

		if ("explode")
			var/power = text2num(params["power"])
			var/empMode = text2num(params["emp_mode"])


			var/turf/T = get_turf(usr)
			message_admins("[ADMIN_LOOKUPFLW(usr)] created an admin [empMode ? "EMP" : "explosion"] at [ADMIN_VERBOSEJMP(T)].")
			log_admin("[key_name(usr)] created an admin [empMode ? "EMP" : "explosion"] at [usr.loc].")

			if (empMode)
				empulse(usr, power, TRUE)
			else
				explosion(usr, power / 3, power / 2, power, power, ignorecap = TRUE)

		if ("narrate")
			var/list/stylesRaw = params["classes"]

			var/styles = ""
			for(var/style in stylesRaw)
				styles += "[style]:[stylesRaw[style]];"

			if (params["mode_global"])
				to_chat(world, "<span style='[styles]'>[params["message"]]</span>")
				log_admin("GlobalNarrate: [key_name(usr)] : [params["message"]]")
				message_admins("<span class='adminnotice'>[key_name_admin(usr)] Sent a global narrate</span>")
			else
				for(var/mob/M in view(params["range"], usr))
					to_chat(M, "<span style='[styles]'>[params["message"]]</span>")

				log_admin("LocalNarrate: [key_name(usr)] at [AREACOORD(usr)]: [params["message"]]")
				message_admins("<span class='adminnotice'><b> LocalNarrate: [key_name_admin(usr)] at [ADMIN_VERBOSEJMP(usr)]:</b> [params["message"]]<BR></span>")

		if ("languages")
			var/datum/language_holder/H = targetMob.get_language_holder()
			H.open_language_menu(usr)

		if ("ambitions")
			var/datum/mind/requesting_mind = targetMob.mind
			if(!istype(requesting_mind) || QDELETED(requesting_mind))
				to_chat(usr, "<span class='warning'>This mind reference is no longer valid. It has probably since been destroyed.</span>")
				return
			requesting_mind.do_edit_objectives_ambitions()

		if("makementor")
			var/datum/mentors/mentors
			mentors.New(ckey = targetMob.ckey)

		if("removementor")
			var/datum/mentors/mentors
			mentors.remove_mentor()

		if ("traitor_panel")
			admin.holder.show_traitor_panel(targetMob)

/datum/mind/proc/show_memory(mob/recipient, window=1)
	if(!recipient)
		recipient = current
	var/output = ""
	if(window)
		output += "<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8'><title>Воспоминания [current.real_name]</title></head>"
	else
		output += "<B>Воспоминания [current.real_name]:</B><br>"
	output += memory


	var/list/all_objectives = list()
	for(var/datum/antagonist/A in antag_datums)
		output += A.antag_memory
		all_objectives |= A.objectives

	if(all_objectives.len)
		output += "<B>Objectives:</B>"
		var/obj_count = 1
		for(var/datum/objective/objective in all_objectives)
			output += "<br><B>Objective #[obj_count++]</B>: [objective.explanation_text]"
			var/list/datum/mind/other_owners = objective.get_owners() - src
			if(other_owners.len)
				output += "<ul>"
				for(var/datum/mind/M in other_owners)
					output += "<li>Conspirator: [M.name]</li>"
				output += "</ul>"

// Кнопки для амбиций и их отображение
	output += "<HR><B>Амбиции:</B><UL>"
	if(LAZYLEN(ambition_objectives))

		var/amb_count = 1
		for(var/datum/ambition_objective/objective in ambition_objectives)
			output += "<LI><B>Амбиция #[amb_count]</B>: [objective.description]</LI>"
			output += "<a href='?src=[REF(src)];amb_delete=[REF(objective)]'>Удалить</a> " // Удалить амбицию
			output += "<a href='?src=[REF(src)];amb_completed=[REF(objective)]'>" // Определить завершенность амбиции
			output += "<font color=[objective.completed ? "green" : "red"]>[objective.completed ? "Передумать" : "Выполнить"]</font>"
			output += "</a>"
			output += "<br>"
			amb_count++

	output += "<a href='?src=[REF(src)];amb_add=1'>Добавить амбицию</a><br><br>"
	output += "</UL>"

	if(window)
		output += "</body></html>"
		var/datum/browser/popup = new(recipient, "memory", "Воспоминания [current.real_name]", 350, 350)
		popup.set_content(output)
		popup.open()
	else if(all_objectives.len || memory)
		to_chat(recipient, "<i>[output]</i>")

/datum/mind/proc/show_editable_objectives_and_ambitions()
	var/is_admin = check_rights(R_ADMIN, FALSE)
	var/self_mind = usr == current
	if(!is_admin && !self_mind)
		return ""
	var/list/output = list()
	for(var/a in antag_datums)
		var/datum/antagonist/antag_datum = a
		output += "<i><b>Objectives</b></i>:"
		if(is_admin)
			output += " <a href='?src=[REF(antag_datum.owner)];obj_add=[REF(antag_datum)];ambition_panel=1'>Add Objective</a>"
		output += "<ul>"
		if(!length(antag_datum.objectives))
			output += "<li><i><b>NONE</b></i>"
		else
			for(var/count in 1 to length(antag_datum.objectives))
				var/datum/objective/objective = antag_datum.objectives[count]
				output += "<li><B>[count]</B>: [objective.explanation_text]"
				if(self_mind)
					output += " <a href='?src=[REF(antag_datum.owner)];req_obj_delete=[REF(objective)];target_antag=[REF(antag_datum)]'>Request Remove</a> <a href='?src=[REF(antag_datum.owner)];req_obj_completed=[REF(objective)];target_antag=[REF(antag_datum)]'><font color=[objective.completed ? "green" : "red"]>[objective.completed ? "Request incompletion" : "Request completion"]</font></a><br>"
				if(is_admin)
					output += " <a href='?src=[REF(antag_datum.owner)];obj_edit=[REF(objective)];target_antag=[REF(antag_datum)]'>Edit</a> <a href='?src=[REF(antag_datum.owner)];obj_panel_delete=[REF(objective)];target_antag=[REF(antag_datum)]'>Remove</a> <a href='?src=[REF(antag_datum.owner)];obj_panel_complete_toggle=[REF(objective)];target_antag=[REF(antag_datum)]'><font color=[objective.completed ? "green" : "red"]>[objective.completed ? "Mark as incomplete" : "Mark as complete"]</font></a><br>"
		output += "</ul>"
		if(is_admin)
			output += "<a href='?src=[REF(antag_datum.owner)];obj_announce=1;ambition_panel=1'>Announce objectives</a><br>"
		output += "<br><i><b>Requested Objective Changes</b></i>:"
		if(self_mind)
			output += " <a href='?src=[REF(antag_datum.owner)];req_obj_add=1;target_antag=[REF(antag_datum)]'>Request objective</a>"
		output += "<ul>"
		if(!LAZYLEN(antag_datum.requested_objective_changes))
			output += "<li><i><b>NONE</b></i></ul><br>"
		else
			for(var/uid in antag_datum.requested_objective_changes)
				var/list/objectives_info = antag_datum.requested_objective_changes[uid]
				var/obj_request = objectives_info["request"]
				switch(obj_request)
					if(REQUEST_NEW_OBJECTIVE)
						var/datum/objective/type_cast_objective = objectives_info["target"]
						var/objective_text = objectives_info["text"]
						output += "<li><B>Request #[uid]</B>: ADD [initial(type_cast_objective.name)] - [objective_text]"
						if(self_mind)
							output += " <a href='?src=[REF(antag_datum.owner)];req_obj_cancel=[uid];target_antag=[REF(antag_datum)]'>Cancel Request</a>"
						if(is_admin)
							output += " <a href='?src=[REF(antag_datum.owner)];req_obj_accept=[REF(antag_datum)];req_obj_id=[uid]'>Accept</a> <a href='?src=[REF(antag_datum.owner)];req_obj_edit=[REF(antag_datum)];req_obj_id=[uid]'>Edit</a> <a href='?src=[REF(antag_datum.owner)];req_obj_deny=[REF(antag_datum)];req_obj_id=[uid]'>Deny</a>"
					if(REQUEST_DEL_OBJECTIVE)
						var/datum/objective/objective_ref = locate(objectives_info["target"]) in antag_datum.objectives
						if(QDELETED(objective_ref))
							stack_trace("Objective request found with deleted reference. UID: [uid] | Antag: [antag_datum] | Mind: [src] | User: [usr]")
							antag_datum.remove_objective_change(uid)
							continue
						output += "<li><B>Request #[uid]</B>: DEL [objective_ref.name] - [objective_ref.explanation_text] - [objectives_info["text"]]"
						if(self_mind)
							output += " <a href='?src=[REF(antag_datum.owner)];req_obj_cancel=[uid];target_antag=[REF(antag_datum)]'>Cancel Request</a>"
						if(is_admin)
							output += " <a href='?src=[REF(antag_datum.owner)];req_obj_accept=[REF(antag_datum)];req_obj_id=[uid]'>Accept</a> <a href='?src=[REF(antag_datum.owner)];req_obj_deny=[REF(antag_datum)];req_obj_id=[uid]'>Deny</a>"
					if(REQUEST_WIN_OBJECTIVE, REQUEST_LOSE_OBJECTIVE)
						var/datum/objective/objective_ref = locate(objectives_info["target"]) in antag_datum.objectives
						if(QDELETED(objective_ref))
							stack_trace("Objective request found with deleted reference. UID: [uid] | Antag: [antag_datum] | Mind: [src] | User: [usr]")
							antag_datum.remove_objective_change(uid)
							continue
						output += "<li><B>Request #[uid]</B>: [obj_request == REQUEST_WIN_OBJECTIVE ? "WIN" : "LOSE"] [objective_ref.name] - [objective_ref.explanation_text] - [objectives_info["text"]]"
						if(self_mind)
							output += " <a href='?src=[REF(antag_datum.owner)];req_obj_cancel=[uid];target_antag=[REF(antag_datum)]'>Cancel Request</a>"
						if(is_admin)
							output += " <a href='?src=[REF(antag_datum.owner)];req_obj_accept=[REF(antag_datum)];req_obj_id=[uid]'>Accept</a> <a href='?src=[REF(antag_datum.owner)];req_obj_deny=[REF(antag_datum)];req_obj_id=[uid]'>Deny</a>"
					else
						stack_trace("Objective request found with no request index. UID: [uid] | Antag: [antag_datum] | Mind: [src] | User: [usr]")
						continue
			output += "</ul><br>"
			if(self_mind)
				output += "<a href='?src=[REF(src)];req_obj_ping=1'>Ping the admins</a><br>"
			if(is_admin)
				output += "<a href='?src=[REF(src)];req_obj_ping_cd_clear=1'>Clear ping cooldown</a><br>"
	output += "<br><b>[current.real_name]'s Ambitions:</b>"
	if(LAZYLEN(ambitions) < CONFIG_GET(number/max_ambitions))
		output += " <a href='?src=[REF(src)];add_ambition=1'>Add Ambition</a>"
	output += "<ul>"
	if(!LAZYLEN(ambitions))
		output += "<li><i><b>NONE</b></i>"
	else
		for(var/count in 1 to LAZYLEN(ambitions))
			output += "<li><B>Ambition #[count]</B> (<a href='?src=[REF(src)];edit_ambition=[count]'>Edit</a>) (<a href='?src=[REF(src)];remove_ambition=[count]'>Remove</a>):<br>[ambitions[count]]"
	output += "</ul><br>(<a href='?src=[REF(src)];refresh_obj_amb=1'>Refresh</a>)"
	return output.Join()

/mob/proc/edit_objectives_and_ambitions()
	set name = "Objectives and Ambitions"
	set category = "IC"
	set desc = "View and edit your character's objectives and ambitions."
	mind.do_edit_objectives_ambitions()

/datum/mind/proc/do_edit_objectives_ambitions()
	var/datum/browser/popup = new(usr, "objectives and ambitions", "Objectives and Ambitions")
	popup.set_content(show_editable_objectives_and_ambitions())
	popup.open()

GLOBAL_VAR_INIT(requested_objective_uid, 0)

GLOBAL_LIST(objective_player_choices)

/proc/populate_objective_player_choices()
	GLOB.objective_player_choices = list()
	var/list/allowed_types = list(
		/datum/objective/custom,
		/datum/objective/protect,
		/datum/objective/escape,
		/datum/objective/survive,
		/datum/objective/martyr,
		/datum/objective/steal,
		)

	for(var/t in allowed_types)
		var/datum/objective/type_cast = t
		GLOB.objective_player_choices[initial(type_cast.name)] = t


GLOBAL_LIST(objective_choices)

/proc/populate_objective_choices()
	GLOB.objective_choices = list()
	var/list/allowed_types = list(
		/datum/objective/custom,
		/datum/objective/assassinate,
		/datum/objective/maroon,
		/datum/objective/debrain,
		/datum/objective/protect,
		/datum/objective/destroy,
		/datum/objective/hijack,
		/datum/objective/escape,
		/datum/objective/survive,
		/datum/objective/martyr,
		/datum/objective/steal,
		/datum/objective/nuclear,
		/datum/objective/absorb,
		/datum/objective/rescue_prisoner,
		/datum/objective/custom
		)

	for(var/t in allowed_types)
		var/datum/objective/type_cast = t
		GLOB.objective_choices[initial(type_cast.name)] = t

/datum/mind/proc/ambition_topic(href, href_list)
	var/ambition_func = FALSE

	if(href_list["amb_add"])
		ambition_func = TRUE
		if (ambition_objectives.len < ambition_limit)
			to_chat(usr, "<span class='notice'>Новая амбиция: [assign_random_ambition()].</span>")
		else
			to_chat(usr, "<span class='warning'>МНОГОВАТО АМБИЦИЙ!</span>")
		log_game("[key_name(usr)] has added [key_name(current)]'s ambition.")

	else if(href_list["amb_delete"])
		ambition_func = TRUE
		var/datum/ambition_objective/objective = locate(href_list["amb_delete"])
		if(!istype(objective))
			return
		ambition_objectives.Remove(objective)

		log_game("[key_name(usr)] has removed one of [key_name(current)]'s ambitions: [objective]")
		qdel(objective)

	else if(href_list["amb_completed"])
		ambition_func = TRUE
		var/datum/ambition_objective/objective = locate(href_list["amb_completed"])
		if(!istype(objective))
			return
		objective.completed = !objective.completed

		if (objective.completed)
			to_chat(usr, "<span class='warning'>Амбиция выполнена!</span>")
		else
			to_chat(usr, "<span class='warning'>Амбиция не выполнена!</span>")
		log_game("[key_name(usr)] has toggled the completion of one of [key_name(current)]'s ambitions")

	// Обновляем открытую память
	if (ambition_func)
		show_memory()

	return ambition_func

/datum/mind/proc/assign_random_ambition()
	var/datum/ambition_objective/objective = new /datum/ambition_objective(src)
	objective.description = objective.get_random_ambition()
	if (!objective?.description)
		return FALSE
	for(var/datum/ambition_objective/amb in ambition_objectives)
		if (objective.description == amb.description)
			return objective.description
	return FALSE
