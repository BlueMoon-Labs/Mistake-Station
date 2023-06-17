GLOBAL_LIST_INIT(command_positions, list(
	JOB_CAPTAIN,
	JOB_HEAD_OF_PERSONNEL,
	JOB_HEAD_OF_SECURITY,
	JOB_CHIEF_ENGINEER,
	JOB_RESEARCH_DIRECTOR,
	JOB_CHIEF_MEDICAL_OFFICER))

GLOBAL_LIST_INIT(engineering_positions, list(
	JOB_CHIEF_ENGINEER,
	JOB_STATION_ENGINEER,
	JOB_ATMOSPHERIC_TECHNICIAN))

GLOBAL_LIST_INIT(medical_positions, list(
	JOB_CHIEF_MEDICAL_OFFICER,
	JOB_MEDICAL_DOCTOR,
	JOB_PARAMEDIC,
	JOB_VIROLOGIST,
	JOB_CHEMIST,
	JOB_PSYCHOLOGIST))

GLOBAL_LIST_INIT(science_positions, list(
	JOB_RESEARCH_DIRECTOR,
	JOB_SCIENTIST,
	JOB_GENETICIST,
	JOB_ROBOTICIST))

GLOBAL_LIST_INIT(supply_positions, list(
	JOB_QUARTERMASTER,
	JOB_CARGO_TECHNICIAN,
	JOB_SHAFT_MINER))

GLOBAL_LIST_INIT(service_positions, list(
	JOB_HEAD_OF_PERSONNEL,
	JOB_BARTENDER,
	JOB_BOTANIST,
	JOB_COOK,
	JOB_JANITOR,
	JOB_CURATOR,
	JOB_PSYCHOLOGIST,
	JOB_LAWYER,
	JOB_CHAPLAIN,
	JOB_CLOWN,
	JOB_MIME,
	JOB_ASSISTANT))

//we really need to split service into civillian positions officially, until then this is my solution
GLOBAL_LIST_INIT(service_food_positions, list(
	JOB_BARTENDER,
	JOB_BOTANIST,
	JOB_COOK,
))

GLOBAL_LIST_INIT(security_positions, list(
	JOB_HEAD_OF_SECURITY,
	JOB_WARDEN,
	JOB_DETECTIVE,
	JOB_SECURITY_OFFICER))

GLOBAL_LIST_INIT(scum_positions, list(
	JOB_PRISONER))

GLOBAL_LIST_INIT(nonhuman_positions, list(
	JOB_AI,
	JOB_CYBORG,
	ROLE_PAI))

/datum/ambition_objective
	var/datum/mind/owner = null			//владелец амбиции
	var/completed = 0					//завершение амбиции для конца раунда
	var/description = "Пустая амбиция ((перешлите это разработчику))"
	var/chance_generic_ambition = 40	//шанс выпадения ОБЩЕЙ амбиции
	var/chance_other_departament_ambition = 30	//шанс выпадения амбиции чужого департамента

/datum/ambition_objective/New(datum/mind/new_owner)
	owner = new_owner
	owner.ambition_objectives += src

/datum/ambition_objective/proc/get_random_ambition()
	var/result

	//Шанс выпадения общей амбиции или амбиции отдела
	if(prob(chance_generic_ambition))
		result = pick_list_weighted("ambitions/generic.json", "Common")
	else
		result = get_job_departament_ambition()
		if (!result)
			result = pick_list_weighted("ambitions/generic.json", "Common")

	return ambition_code(result)

/datum/ambition_objective/proc/get_job_departament_ambition()
	var/result

	//Шанс выпадения общей роли из отдела
	var/job = owner.assigned_role
	if(prob(chance_generic_ambition))
		job = "Common"

	//Проверяем работы не в позициях и вынесенные в отдельный файл
	switch(owner.assigned_role)
		if(JOB_LAWYER)
			return pick_list_weighted("ambitions/law.json", job)

		if(JOB_CENTCOM_OFFICIAL)
			return pick_list_weighted("ambitions/representative.json", job)

	//Сначала выдаем амбиции силиконам, чтобы они не получили общих амбиций
	if(owner.assigned_role in GLOB.nonhuman_positions)
		return pick_list_weighted("ambitions/nonhuman.json", owner.assigned_role)

	//Проверяем работы вынесенные в позиции
	if(owner.assigned_role in (GLOB.service_positions + GLOB.scum_positions))
		return pick_list_weighted("ambitions/generic.json", "Common")

	if(owner.assigned_role in GLOB.command_positions)
		//шанс получить за главу работу одного из своих отделов
		if (prob(chance_other_departament_ambition))
			switch(owner.assigned_role)
				if(JOB_HEAD_OF_PERSONNEL)
					if (prob(50))
						job = pick(GLOB.service_positions)
						result = pick_list_weighted("ambitions/support.json", job)
					else
						job = pick(GLOB.supply_positions)
						result = pick_list_weighted("ambitions/supply.json", job)
				if(JOB_HEAD_OF_SECURITY)
					job = pick(GLOB.security_positions)
					result = pick_list_weighted("ambitions/security.json", job)
				if(JOB_CHIEF_ENGINEER)
					job = pick(GLOB.engineering_positions)
					result = pick_list_weighted("ambitions/engineering.json", job)
				if(JOB_RESEARCH_DIRECTOR)
					job = pick(GLOB.science_positions)
					result = pick_list_weighted("ambitions/science.json", job)
				if(JOB_CHIEF_MEDICAL_OFFICER)
					job = pick(GLOB.medical_positions)
					result = pick_list_weighted("ambitions/medical.json", job)
		if (!result)
			result = pick_list_weighted("ambitions/command.json", job)
		return result

	if(owner.assigned_role in (GLOB.service_positions))
		return pick_list_weighted("ambitions/support.json", job)

	if(owner.assigned_role in GLOB.engineering_positions)
		return pick_list_weighted("ambitions/engineering.json", job)

	if(owner.assigned_role in GLOB.medical_positions)
		return pick_list_weighted("ambitions/medical.json", job)

	if(owner.assigned_role in GLOB.science_positions)
		return pick_list_weighted("ambitions/science.json", job)

	if(owner.assigned_role in GLOB.supply_positions)
		return pick_list_weighted("ambitions/supply.json", job)

	if(owner.assigned_role in (GLOB.security_positions))
		if(prob(chance_other_departament_ambition))	//шанс что бригмедик возьмёт амбицию мед. отдела.
			job = pick(GLOB.medical_positions)
			return pick_list_weighted("ambitions/medical.json", job)
		return pick_list_weighted("ambitions/security.json", job)

	return result

/datum/ambition_objective/proc/ambition_code(text)
	var/list/choose_list = list()		//список повторов рандома у амбиции !(Приготовлю сегодня ПИВО и ПИВО)

	var/list/random_codes = list(
		"random_crew",
		"random_departament",
		"random_departament_crew",
		"random_pet",
		"random_food",
		"random_drink",
		"random_holiday"
	)

	var/list/items = splittext(text, "\[")
	text = ""
	for(var/item in items)
		for (var/code in random_codes)
			var/choosen = random_choose(code)
			choose_list.Add(choosen)
			item = replacetextEx_char(item, "[code]\]", choosen)
		text += item

	return uppertext(copytext_char(text, 1, 2)) + copytext_char(text, 2)	//переводим первым символ в верхний регистр

//выдача рандома, проверка на повторы
/datum/ambition_objective/proc/random_choose(list_for_pick, list/choose_list)
	if (list_for_pick == "random_crew")
		return random_player()

	var/picked = pick_list_weighted("ambitions/randoms.json", list_for_pick)

	//избавляемся от повтора
	while(picked in choose_list)
		picked = pick_list_weighted("ambitions/randoms.json", list_for_pick)

	return picked

/datum/ambition_objective/proc/random_player()
	var/list/players = list()
	for(var/mob/living/carbon/human/player in GLOB.player_list)
		if(!player.mind || player.mind.assigned_role == player.mind.special_role || player.client.inactivity > 10 MINUTES || player.mind == owner)
			continue
		players += player.real_name
	var/random_player = "Капитан"
	if(players.len)
		random_player = pick(players)
	return random_player
