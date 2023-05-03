/obj/item/clothing/mask/gas/sechailer
	name = "Security Gas Mask"
	desc = "Стандартный противогаз охраны с модификацией Compli-o-nator 3000. Применяется для убеждения не двигаться, пока офицер забивает преступника насмерть."

/obj/item/clothing/mask/gas/sechailer/proc/play_phrase(mob/user, datum/hailer_phrase/phrase)
	if(!COOLDOWN_FINISHED(src, hailer_cooldown))
		return
	COOLDOWN_START(src, hailer_cooldown, PHRASE_COOLDOWN)
	user.audible_message("[user]'s Compli-o-Nator: <font color='red' size='4'><b>[initial(phrase.phrase_text)]</b></font>")
	playsound(src, "modular_bluemoon/modules/hailer/complionator/[initial(phrase.phrase_sound)].ogg", 200, FALSE, 4)
	return TRUE

/datum/hailer_phrase/emag
	phrase_text = "Какого хуя ты только что, черт возьми, сказал обо мне, маленькая сучка? Я хочу, чтобы ты знал, что я получил высшую награду за деятельность в гражданской обороне, участвовал в многочисленных, очень опасных набегах против сопротивления, и у меня более трехсот подтвержденных ампутаций. Я обучен социостабилизации и являюсь главным снайпером во всем Союзе Вселенных. Ты для меня ничто, кроме как очередной антигражданин. Я уничтожу тебя, черт возьми, с точностью, подобной которой еще никогда не видели на этой земле, запомни мои гребаные слова! Думаешь, сможешь уйти и оскорбить меня за моей же спиной со своими дружками? Подумай еще раз, придурок. Пока мы говорим, я связываюсь со своей секретной сетью советников по всей планете, и твой идентификатор гражданина отслеживается прямо сейчас, чтобы ты лучше подготовился к шторму, личинка. К буре, которая уничтожит жалкую мелочь, которую ты называешь своей жизнью. Ты вырыл себе глубокую яму, малыш. Я могу быть где угодно, в любое время, и я могу убить тебя более чем семьюстами способами, и это только моими голыми руками. Я не только хорошо обучен рукопашному бою, у меня есть доступ ко всему арсеналу Солдат Патруля, и я буду использовать его в полной мере, чтобы стереть твою жалкую задницу с лица континента, кусок дерьма. Если бы ты только знал, какое нечестивое возмездие собиралось обрушить на тебя твой маленький «умный» комментарий, возможно, ты бы сдержали свой гребаный язык. Но ты не мог, ты не сделал, и теперь ты расплачиваешься, чертов идиот. Я ярость, и ты утонешь в ней. Ты вырыл себе очень глубокую яму, мальчик."
	phrase_sound = "emag"

/datum/hailer_phrase/halt
	phrase_text = "Не двигаться! Не двигаться!"
	phrase_sound = "lawful_ne_dvigatsya"

/datum/hailer_phrase/bobby
	phrase_text = "Ни с места!"
	phrase_sound = "lawful_ni_s_mesta"

/datum/hailer_phrase/compliance
	phrase_text = "Стоять! Стоять!"
	phrase_sound = "lawful_stoyat"

/datum/hailer_phrase/justice
	phrase_text = "Стоять на месте!"
	phrase_sound = "lawful_stoyat_na_meste"

/datum/hailer_phrase/running
	phrase_text = "Давай, попробуй побежать. Безмозглый идиот."
	phrase_sound = "davai_poprobui_pobejat"

/datum/hailer_phrase/dontmove
	phrase_text = "Неудачник выбрал не тот день для нарушения закона."
	phrase_sound = "neudachnik_vybral"

/datum/hailer_phrase/floor
	phrase_text = "Сейчас узнаешь что такое настоящее правосудие, мудак."
	phrase_sound = "seychas_uznaesh"

/datum/hailer_phrase/robocop
	phrase_text = "Стой! Преступное отродье."
	phrase_sound = "stoy_prestupnoe"

/datum/hailer_phrase/god
	phrase_text = "Только двинешься и я оторву тебе бошку."
	phrase_sound = "tolko_dvineshsya"

/datum/hailer_phrase/freeze
	phrase_text = "Укрыться от правосудия у тебя удастся только крышкой гроба."
	phrase_sound = "ukrytsya_ot_pravosudia"

/datum/hailer_phrase/imperial
	phrase_text = "Упал мордой в пол, тварь."
	phrase_sound = "upal_mordoy_v"

/datum/hailer_phrase/bash
	phrase_text = "У вас есть только право закрыть свой пиздак нахуй."
	phrase_sound = "u_vas_est_tolko"

/datum/hailer_phrase/harry
	phrase_text = "Виновен или невиновен - это лишь вопрос времени."
	phrase_sound = "vinoven_ili_nevinoven"

/datum/hailer_phrase/asshole
	phrase_text = "Я - закон. Ты - убогое ничтожество."
	phrase_sound = "ya_zakon_ty"

/datum/hailer_phrase/stfu
	phrase_text = "Живым или мертвым - ты пиздуешь со мной."
	phrase_sound = "zhivym_ili_mertvym"

/datum/hailer_phrase/shutup
	phrase_text = "Shut up crime!"
	phrase_sound = "shutup"

/datum/hailer_phrase/super
	phrase_text = "Face the wrath of the golden bolt."
	phrase_sound = "super"

/datum/hailer_phrase/dredd
	phrase_text = "I am, the LAW!"
	phrase_sound = "dredd"
