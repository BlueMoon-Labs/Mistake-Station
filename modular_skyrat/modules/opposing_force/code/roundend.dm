/datum/controller/subsystem/ticker/proc/opfor_report()
	var/list/result = list()

	result += "<div class='panel stationborder'><span class='header'>Отчет о Антисоциальных Элементах:</span><br>"

	if(!SSopposing_force.approved_applications.len)
		result += span_red("Ни одна заявка не была одобрена.")
	else
		for(var/datum/opposing_force/opfor in SSopposing_force.approved_applications)
			result += opfor.roundend_report()

	result += "</div>"

	return result.Join()
