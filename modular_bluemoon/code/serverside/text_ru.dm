// Для 513 в самый раз
// Люммокс пидорас

/proc/cp1252_to_utf8(text) //Временный прок. Транслирует не всё, но оно и не нужно
	var/t = ""
	for(var/i = 1, i <= length(text), i++)
		var/a = text2ascii(text, i)
		if (a < 224 || a > 255)
			t += ascii2text(a)
			continue
		t += ascii2text(a + 848)
	return t

/proc/up2ph(text) // реальный рабочий костыль для плеерпанели, желательно не трогать
	for(var/s in GLOB.rus_unicode_conversion)
		text = replacetext(text, s, "&#[GLOB.rus_unicode_conversion[s]];")
	return text

/proc/r_jobgen(text)
	var/list/strip_chars = list("_"," ","(",")")
	for(var/char in strip_chars)
		text = replacetext_char(text, char, "")
	return lowertext(text)

/proc/pointization(text)
	if (!text)
		return
	if (copytext_char(text,1,2) == "*") //Emotes allowed.
		return text
	if (copytext_char(text,-1) in list("!", "?", ".", ":", ";", ","))
		return text
	text += "."
	return text

/proc/r_antidaunize(t as text)
	if(t)
		t = lowertext(t[1]) + copytext(t, 1 + length(t[1]))
	return t

/proc/r_json_decode(text) //now I'm stupid
	for(var/s in GLOB.rus_unicode_conversion_hex)
		text = replacetext(text, "\\u[GLOB.rus_unicode_conversion_hex[s]]", s)
	return json_decode(text)

/proc/ru_comms(freq)
	if(freq == "Common")
		return "Основной"
	else if (freq == "Security")
		return "Безопасность"
	else if (freq == "Engineering")
		return "Инженерия"
	else if (freq == "Command")
		return "Командование"
	else if (freq == "Science")
		return "Научный"
	else if (freq == "Medical")
		return "Медбей"
	else if (freq == "Supply")
		return "Снабжение"
	else if (freq == "Service")
		return "Обслуживание"
	else if (freq == "Exploration")
		return "Рейнджеры"
	else if (freq == "AI Private")
		return "Приватный ИИ"
	else if (freq == "Syndicate")
		return "Синдикат"
	else if (freq == "CentCom")
		return "ЦентКом"
	else if (freq == "Red Team")
		return "Красные"
	else if (freq == "Blue Team")
		return "Синие"
	else if (freq == "Green Team")
		return "Зелёные"
	else if (freq == "Yellow Team")
		return "Жёлтые"
	else
		return freq

/proc/r_stutter(text) //ненавижу пиндосов
	var/list/soglasnie = list(
		"б","в","г","д","ж","з","к","л","м","н","п","р","с","т","ф","х","ц","ч","ш","щ",
		"Б","В","Г","Д","Ж","З","К","Л","М","Н","П","Р","С","Т","Ф","Х","Ц","Ч","Ш","Щ",
		"b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z",
		"B","C","D","F","G","H","J","K","L","M","N","P","Q","R","S","T","V","W","X","Y","Z"
	)
	var/t = ""
	for(var/i = 1, i <= length(text), i++)
		var/a = text2ascii(text, i)
		if (prob(80) && (ascii2text(a) in soglasnie))
			if (prob(10))
				t += text("[ascii2text(a)]-[ascii2text(a)]-[ascii2text(a)]-[ascii2text(a)]")
			else
				if (prob(20))
					t += text("[ascii2text(a)]-[ascii2text(a)]-[ascii2text(a)]")
				else
					if (prob(5))
						t += ""
					else
						t += text("[ascii2text(a)]-[ascii2text(a)]")
		t += ascii2text(a)
	return copytext_char(sanitize(replacetext_char(t, "�", "")),1,MAX_MESSAGE_LEN * length(ascii2text(text2ascii(t))))

/proc/ddlc_text(text)
	var/t = ""
	for(var/i = 1, i <= length_char(text), i++)
		t += pick(GLOB.ddlc_chars)
	return t
