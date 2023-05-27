/// One of the potential shuttle loans you might recieve.
/datum/shuttle_loan_situation
	/// Who sent the shuttle
	var/sender = "Centcom"
	/// What they said about it.
	var/announcement_text = "Unset announcement text"
	/// What the shuttle says about it.
	var/shuttle_transit_text = "Unset transit text"
	/// Supply points earned for taking the deal.
	var/bonus_points = 10000
	/// Response for taking the deal.
	var/thanks_msg = "Грузовой шаттл должен вернуться в течении пяти минут. Have some supply points for your trouble."
	/// Small description of the loan for easier log reading.
	var/logging_desc

/datum/shuttle_loan_situation/New()
	. = ..()
	if(!logging_desc)
		stack_trace("No logging blurb set for [src.type]!")

/// Spawns paths added to `spawn_list`, and passes empty shuttle turfs so you can spawn more complicated things like dead bodies.
/datum/shuttle_loan_situation/proc/spawn_items(list/spawn_list, list/empty_shuttle_turfs)
	SHOULD_CALL_PARENT(FALSE)
	CRASH("Unimplemented get_spawned_items() on [src.type].")

/datum/shuttle_loan_situation/antidote
	sender = "Стартапы Центрального Командования"
	announcement_text = "Снабжение: Ваша станция была выбрана для эпидемиологического исследовательского проекта. Отправьте нам ваш грузовой шаттл для получения образцов для исследования."
	shuttle_transit_text = "Вирусные Образцы уже в пути."
	logging_desc = "Virus shuttle"

/datum/shuttle_loan_situation/antidote/spawn_items(list/spawn_list, list/empty_shuttle_turfs)
	var/obj/effect/mob_spawn/corpse/human/assistant/infected_assistant = pick(list(
		/obj/effect/mob_spawn/corpse/human/assistant/beesease_infection,
		/obj/effect/mob_spawn/corpse/human/assistant/brainrot_infection,
		/obj/effect/mob_spawn/corpse/human/assistant/spanishflu_infection,
	))
	for(var/i in 1 to 10)
		if(prob(15))
			spawn_list.Add(/obj/item/reagent_containers/cup/bottle)
		else if(prob(15))
			spawn_list.Add(/obj/item/reagent_containers/syringe)
		else if(prob(25))
			spawn_list.Add(/obj/item/shard)
		var/turf/assistant_turf = pick_n_take(empty_shuttle_turfs)
		new infected_assistant(assistant_turf)
	spawn_list.Add(/obj/structure/closet/crate)
	spawn_list.Add(/obj/item/reagent_containers/cup/bottle/pierrot_throat)
	spawn_list.Add(/obj/item/reagent_containers/cup/bottle/magnitis)

/datum/shuttle_loan_situation/department_resupply
	sender = "Отдел Снабжения Центрального Командования"
	announcement_text = "Снабжение: Похоже, в этом месяце мы заказали в два раза больше посылок для пополнения запасов нашего департамента. Мы можем отправить их к вам?"
	shuttle_transit_text = "Дополнительные припасы приближаются."
	thanks_msg = "Грузовой шаттл должен вернуться в течении пяти минут."
	bonus_points = 0
	logging_desc = "Resupply packages"

/datum/shuttle_loan_situation/department_resupply/spawn_items(list/spawn_list, list/empty_shuttle_turfs)
	var/list/crate_types = list(
		/datum/supply_pack/emergency/equipment,
		/datum/supply_pack/security/supplies,
		/datum/supply_pack/organic/food,
		/datum/supply_pack/emergency/weedcontrol,
		/datum/supply_pack/engineering/tools,
		/datum/supply_pack/engineering/engiequipment,
		/datum/supply_pack/science/robotics,
		/datum/supply_pack/science/plasma,
		/datum/supply_pack/medical/supplies
		)
	for(var/crate in crate_types)
		var/datum/supply_pack/pack = SSshuttle.supply_packs[crate]
		pack.generate(pick_n_take(empty_shuttle_turfs))

	for(var/i in 1 to 5)
		var/decal = pick(/obj/effect/decal/cleanable/food/flour, /obj/effect/decal/cleanable/robot_debris, /obj/effect/decal/cleanable/oil)
		new decal(pick_n_take(empty_shuttle_turfs))

/datum/shuttle_loan_situation/syndiehijacking
	sender = "Контрразведка Центрального Командования"
	announcement_text = "Снабжение: Террористическая Группировка InteQ пытается проникнуть на вашу станцию. Если вы позволите им угнать ваш грузовой шаттл, вы избавите нас от головной боли."
	shuttle_transit_text = "Команда Террористов приближается к вашей станции."
	logging_desc = "Syndicate boarding party"

/datum/shuttle_loan_situation/syndiehijacking/spawn_items(list/spawn_list, list/empty_shuttle_turfs)
	var/datum/supply_pack/pack = SSshuttle.supply_packs[/datum/supply_pack/imports/specialops]
	pack.generate(pick_n_take(empty_shuttle_turfs))

	spawn_list.Add(/mob/living/basic/syndicate/ranged/infiltrator)
	spawn_list.Add(/mob/living/basic/syndicate/ranged/infiltrator)
	if(prob(75))
		spawn_list.Add(/mob/living/basic/syndicate/ranged/infiltrator)
	if(prob(50))
		spawn_list.Add(/mob/living/basic/syndicate/ranged/infiltrator)

/datum/shuttle_loan_situation/lots_of_bees
	sender = "Подразделение Уборщиков Центрального Командования"
	announcement_text = "Снабжение: Один из наших грузовиков с пчелами подвергся нападению со стороны эко-террористов. Можно убрать там всё за нас?"
	shuttle_transit_text = "Биологическая угроза приближается."
	bonus_points = 20000 //Toxin bees can be unbeelievably lethal
	logging_desc = "Shuttle full of bees"

/datum/shuttle_loan_situation/lots_of_bees/spawn_items(list/spawn_list, list/empty_shuttle_turfs)
	var/datum/supply_pack/pack = SSshuttle.supply_packs[/datum/supply_pack/organic/hydroponics/beekeeping_fullkit]
	pack.generate(pick_n_take(empty_shuttle_turfs))

	spawn_list.Add(/obj/effect/mob_spawn/corpse/human/bee_terrorist)
	spawn_list.Add(/obj/effect/mob_spawn/corpse/human/cargo_tech)
	spawn_list.Add(/obj/effect/mob_spawn/corpse/human/cargo_tech)
	spawn_list.Add(/obj/effect/mob_spawn/corpse/human/nanotrasensoldier)
	spawn_list.Add(/obj/item/gun/ballistic/automatic/pistol/no_mag)
	spawn_list.Add(/obj/item/gun/ballistic/automatic/pistol/m1911/no_mag)
	spawn_list.Add(/obj/item/honey_frame)
	spawn_list.Add(/obj/item/honey_frame)
	spawn_list.Add(/obj/item/honey_frame)
	spawn_list.Add(/obj/structure/beebox/unwrenched)
	spawn_list.Add(/obj/item/queen_bee/bought)
	spawn_list.Add(/obj/structure/closet/crate/hydroponics)

	for(var/i in 1 to 8)
		spawn_list.Add(/mob/living/simple_animal/hostile/bee/toxin)

	for(var/i in 1 to 5)
		var/decal = pick(/obj/effect/decal/cleanable/blood, /obj/effect/decal/cleanable/insectguts)
		new decal(pick_n_take(empty_shuttle_turfs))

	for(var/i in 1 to 10)
		var/casing = /obj/item/ammo_casing/spent
		new casing(pick_n_take(empty_shuttle_turfs))

/datum/shuttle_loan_situation/jc_a_bomb
	sender = "КСБ Центрального Командования"
	announcement_text = "Снабжение: Мы обнаружили действующую синди-бомбу рядом с топливными линиями нашего VIP шаттла и мы считаем, что это часть плана InteQ. Если вы чувствуете, что справитесь с этой задачей, мы заплатим вам за ее разрядку."
	shuttle_transit_text = "Шаттл, начинённый взрывчаткой, приближается к вашей станции. Соблюдайте предельную осторожность."
	thanks_msg = "Шаттл, начинённый взрывчаткой, приближается к вашей станции. Соблюдайте предельную осторожность."
	bonus_points = 45000 //If you mess up, people die and the shuttle gets turned into swiss cheese
	logging_desc = "Shuttle with a ticking bomb"

/datum/shuttle_loan_situation/jc_a_bomb/spawn_items(list/spawn_list, list/empty_shuttle_turfs)
	spawn_list.Add(/obj/machinery/syndicatebomb/shuttle_loan)
	if(prob(95))
		spawn_list.Add(/obj/item/paper/fluff/cargo/bomb)
	else
		spawn_list.Add(/obj/item/paper/fluff/cargo/bomb/allyourbase)

/datum/shuttle_loan_situation/papers_please
	sender = "CentCom Paperwork Division"
	announcement_text = "Соседней станции нужна помощь в оформлении документов. Не могли бы вы помочь оформить их для нас?"
	shuttle_transit_text = "Бумаги приближаются."
	thanks_msg = "Грузовой шаттл должен вернуться в течении пяти минут. Оплата будет произведена после оформления и возврата документов."
	bonus_points = 0 //Payout is made when the stamped papers are returned
	logging_desc = "Paperwork shipment"

/datum/shuttle_loan_situation/papers_please/spawn_items(list/spawn_list, list/empty_shuttle_turfs)
	spawn_list += subtypesof(/obj/item/paperwork) - typesof(/obj/item/paperwork/photocopy) - typesof(/obj/item/paperwork/ancient)

/datum/shuttle_loan_situation/pizza_delivery
	sender = "Отдел Космопиццы Центрального Командования"
	announcement_text = "Снабжение: Похоже, соседняя станция случайно доставила вам пиццу."
	shuttle_transit_text = "Доставка Пиццы!"
	thanks_msg = "Грузовой шаттл должен вернуться в течении пяти минут."
	bonus_points = 0
	logging_desc = "Pizza delivery"

/datum/shuttle_loan_situation/pizza_delivery/spawn_items(list/spawn_list, list/empty_shuttle_turfs)
	var/naughtypizza = list(/obj/item/pizzabox/bomb, /obj/item/pizzabox/margherita/robo) //oh look another blacklist, for pizza nonetheless!
	var/nicepizza = list(/obj/item/pizzabox/margherita, /obj/item/pizzabox/meat, /obj/item/pizzabox/vegetable, /obj/item/pizzabox/mushroom)
	for(var/i in 1 to 6)
		spawn_list.Add(pick(prob(5) ? naughtypizza : nicepizza))

/datum/shuttle_loan_situation/russian_party
	sender = "УФМС Центрального Командования"
	announcement_text = "Снабжение: Группа злых русских хочет устроить вечеринку. Можете отправить им ваш грузовой шаттл, чтобы заставить их исчезнуть?"
	shuttle_transit_text = "РУССКИЕ ИДУТ!!!"
	logging_desc = "Russian party squad"

/datum/shuttle_loan_situation/russian_party/spawn_items(list/spawn_list, list/empty_shuttle_turfs)
	var/datum/supply_pack/pack = SSshuttle.supply_packs[/datum/supply_pack/service/party]
	pack.generate(pick_n_take(empty_shuttle_turfs))

	spawn_list.Add(/mob/living/basic/syndicate/russian)
	spawn_list.Add(/mob/living/basic/syndicate/russian/ranged) //drops a mateba
	spawn_list.Add(/mob/living/simple_animal/hostile/bear/russian)
	if(prob(75))
		spawn_list.Add(/mob/living/basic/syndicate/russian)
	if(prob(50))
		spawn_list.Add(/mob/living/simple_animal/hostile/bear/russian)

/datum/shuttle_loan_situation/spider_gift
	sender = "Дипломатический Корпус Центрального Командования"
	announcement_text = "Снабжение: Клан Пауков прислал нам загадочный подарок. Мы можем отправить его вам, чтобы вы посмотрели, что внутри?"
	shuttle_transit_text = "Подарок уже приближается."
	logging_desc = "Shuttle full of spiders"

/datum/shuttle_loan_situation/spider_gift/spawn_items(list/spawn_list, list/empty_shuttle_turfs)
	var/datum/supply_pack/pack = SSshuttle.supply_packs[/datum/supply_pack/imports/specialops]
	pack.generate(pick_n_take(empty_shuttle_turfs))

	spawn_list.Add(/mob/living/basic/giant_spider)
	spawn_list.Add(/mob/living/basic/giant_spider)
	spawn_list.Add(/mob/living/basic/giant_spider/nurse)
	if(prob(50))
		spawn_list.Add(/mob/living/basic/giant_spider/hunter)

	var/turf/victim_turf = pick_n_take(empty_shuttle_turfs)

	new /obj/effect/decal/remains/human(victim_turf)
	new /obj/item/clothing/shoes/jackboots/fast(victim_turf)
	new /obj/item/clothing/mask/balaclava(victim_turf)

	for(var/i in 1 to 5)
		var/turf/web_turf = pick_n_take(empty_shuttle_turfs)
		new /obj/structure/spider/stickyweb(web_turf)
