/obj/item/circuitboard/machine/autodoc
	name = "Autodoc (Machine Board)"
	build_path = /obj/machinery/autodoc
	req_components = list(/obj/item/scalpel/advanced = 1,
		/obj/item/retractor/advanced = 1,
		/obj/item/surgicaldrill = 1,
		/datum/stock_part/servo = 1,
		/datum/stock_part/micro_laser = 3,
		/datum/stock_part/matter_bin = 1)

/obj/item/circuitboard/machine/cryptominer
	name = "Cryptocurrency Miner (Machine Board)"
	build_path = /obj/machinery/cryptominer
	req_components = list(
		/datum/stock_part/matter_bin = 2,
		/datum/stock_part/micro_laser = 2,
		/datum/stock_part/servo = 2,
		/datum/stock_part/scanning_module = 2,
		/obj/item/stack/ore/bluespace_crystal/refined = 2)

/obj/item/circuitboard/machine/cryptominer/syndie
	name = "Syndicate Cryptocurrency Miner (Machine Board)"
	build_path = /obj/machinery/cryptominer/syndie
	req_components = list(
		/datum/stock_part/matter_bin = 2,
		/datum/stock_part/micro_laser = 2,
		/datum/stock_part/servo = 2,
		/datum/stock_part/scanning_module = 2,
		/obj/item/stack/ore/bluespace_crystal/refined = 2)

/obj/item/circuitboard/machine/bluespace_miner
	name = "Bluespace Miner (Machine Board)"
	build_path = /obj/machinery/mineral/bluespace_miner
	req_components = list(
		/datum/stock_part/matter_bin = 5,
		/datum/stock_part/micro_laser = 5,
		/datum/stock_part/servo = 5,
		/datum/stock_part/scanning_module = 5,
		/obj/item/stack/ore/bluespace_crystal/refined = 5,
		ANOMALY_CORE_BLUESPACE = 1)
	needs_anchored = FALSE

/obj/item/circuitboard/machine/telecomms/message_server
	name = "Message Server (Machine Board)"
	build_path = /obj/machinery/telecomms/message_server
	req_components = list(
		/datum/stock_part/servo = 2,
		/obj/item/stack/cable_coil = 1,
		/obj/item/stock_parts/subspace/filter = 1)
