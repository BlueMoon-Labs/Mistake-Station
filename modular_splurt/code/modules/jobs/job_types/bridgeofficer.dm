/datum/job/bridgeofficer
	title = JOB_BRIDGE_OFFICER
	description = "<font color='red'>Bridge Officer are here to assist the bridge staff with whatever they need. You are not Secuirty and you are not in the line of secceustion. You have no power here.</font>"
	department_head = list(JOB_NT_REP, JOB_CAPTAIN)
	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 2
	supervisors = "Central Command, Nanotrasen Consultant and Captain of The Station"
	minimal_player_age = 20
	exp_requirements = 180
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_COMMAND
	exp_granted_type = EXP_TYPE_CREW
	config_tag = "BRIDGE_OFFICER"

	departments_list = list(
		/datum/job_department/command,
		/datum/job_department/central_command
	)

	outfit = /datum/outfit/job/bridgeofficer
	plasmaman_outfit = /datum/outfit/plasmaman/bridgeofficer
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_CMD

	display_order = JOB_DISPLAY_ORDER_BRIDGE_OFFICER
	bounty_types = CIV_JOB_SEC

	family_heirlooms = list(/obj/item/binoculars)

	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS

	alt_titles = list("Command Secretary", "Command Officer", "Bridge Secretary", "Ensign", "Bridge Bitch", "Bridge Advisor", "Bridge Intern")
/datum/outfit/job/bridgeofficer
	name = "Bridge Officer"
	jobtype = /datum/job/bridgeofficer
	id = /obj/item/card/id/advanced/centcom
	id_trim = /datum/id_trim/job/bridge_consultant
	belt = /obj/item/clipboard
	ears = /obj/item/radio/headset/headset_bo
	uniform = /obj/item/clothing/under/rank/bridgeofficer
	head = /obj/item/clothing/head/bridgeofficer
	gloves = /obj/item/clothing/gloves/color/black
	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/sneakers/brown
	l_pocket = /obj/item/pda

/datum/outfit/plasmaman/bridgeofficer
	name = "Bridge Officer Plasmaman"
	head = /obj/item/clothing/head/helmet/space/plasmaman
	uniform = /obj/item/clothing/under/plasmaman
	ears = /obj/item/radio/headset/headset_bo

/obj/item/radio/headset/headset_bo
	name = "bridge officer headset"
	desc = "This is used by bridge officers."
	icon_state = "com_headset"
	icon_state = "com_headset"
	keyslot = new /obj/item/encryptionkey/headset_bo
	command = TRUE

/obj/item/radio/headset/headset_bo/bowman
	name = "bridge officer bowman headset"
	desc = "This is used by bridge officers. It protects from flashbangs"
	icon_state = "com_headset_alt"

/obj/item/radio/headset/headset_bo/bowman/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(ITEM_SLOT_EARS_LEFT, ITEM_SLOT_EARS_RIGHT)) //BlueMoon edit

/obj/item/encryptionkey/headset_bo
	name = "bridge officer radio encryption key"
	icon_state = "com_cypherkey"
	channels = list(RADIO_CHANNEL_COMMAND = 1)

/obj/effect/landmark/start/bridgeofficer
	name = "Bridge Officer"
	icon_state = "Head of Personnel"

/datum/id_trim/job/bridge_consultant
	assignment = "Bridge Officer"
	trim_state = "trim_centcom"
	department_color = COLOR_GREEN
	subdepartment_color = COLOR_GREEN
	sechud_icon_state = SECHUD_NT_CONSULTANT
	extra_access = list()
	minimal_access = list(ACCESS_EVA, ACCESS_COMMAND, ACCESS_MAINT_TUNNELS, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_CENT_GENERAL)
	minimal_wildcard_access = list(ACCESS_CENT_GENERAL)
	template_access = list(ACCESS_CAPTAIN, ACCESS_CHANGE_IDS)
	job = /datum/job/bridgeofficer
