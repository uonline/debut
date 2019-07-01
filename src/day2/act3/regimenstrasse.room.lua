-- Переменные локации
_girl_has_gotten_help = false

-- Переходы
regimenstrasse_to_berlinstrasse = vroom('Главная улица', 'berlinstrasse')
regimenstrasse_to_berlinstrasse:disable()

-- Локация
regimenstrasse = room {
	nam = 'Площадь Режима';
	dsc = [[
		Ты стоишь на небольшой площади, которую окружает кольцо трёхэтажных зданий. Судя
		по относительно свежей краске и качеству строительства, здания были возведены
		после войны. Режим великодушно отстраивал те города, где сажал своих наместников
		с богоизбранными и размещал своих солдат. В каждом городе появлялась площадь Режима,
		на которой воздвигали соответствующий монумент -- массивную раскрытую книгу, а рядом
		сажали знаменитое каменное древо. Этот город не стал исключением.
		^
		Хотя солнце только встало, горожане уже заполнили площадь.
	]];
	obj = {
		'regimenstrasse_staff';
		'regimenstrasse_monument';
		'regimenstrasse_salers';
		'regimenstrasse_crowd';
		'regimenstrasse_propagandist';
		'regimenstrasse_singer';
		'regimenstrasse_girl';
		'regimenstrasse_todo';
	};
	way = {
		regimenstrasse_to_berlinstrasse;
	};
	entered = function()
		-- Clear inventory, add whitelisted items
		inv():zap();
	end;
}

-- События
-- Прогоняем глашатая
on_event('regimenstrasse belongs to singer', function()
	-- Удаляем старые описания глашатая и менестреля, разгоняем толпу
	objs('regimenstrasse'):del('regimenstrasse_propagandist')
	objs('regimenstrasse'):del('regimenstrasse_singer')
	objs('regimenstrasse'):del('regimenstrasse_crowd')

	-- Если мы не помогли девочке, то удаляем её вместе с толпой
	if not _girl_has_gotten_help then
		objs('regimenstrasse'):del('regimenstrasse_girl')
	end;

	-- Добавляем обновлённого менестреля
	objs('regimenstrasse'):add('regimenstrasse_singer_silent')
	-- Добавляем странника
	objs('regimenstrasse'):add('regimenstrasse_stranger')

	regimenstrasse_to_berlinstrasse:enable()
end)

-- Прогоняем менестреля
on_event('regimenstrasse belongs to propagandist', function()
	-- Удаляем старые описания глашатая и менестреля, разгоняем толпу
	objs('regimenstrasse'):del('regimenstrasse_propagandist')
	objs('regimenstrasse'):del('regimenstrasse_singer')
	objs('regimenstrasse'):del('regimenstrasse_crowd')

	-- Если мы не помогли девочке, то удаляем её вместе с толпой
	if not _girl_has_gotten_help then
		objs('regimenstrasse'):del('regimenstrasse_girl')
	end;

	-- Добавляем обновлённого глашатая
	objs('regimenstrasse'):add('regimenstrasse_propagandist_silent')
	-- Добавляем странника
	objs('regimenstrasse'):add('regimenstrasse_stranger')

	regimenstrasse_to_berlinstrasse:enable()
end)

-- Помогаем девочке
on_event('help to child', function()
	objs('regimenstrasse'):del('regimenstrasse_girl')
end)

-- Объекты
-- Штаб
regimenstrasse_staff = obj {
	nam = 'Штаб Режима';
	dsc = [[
		Мрачной глыбой среди новостроев на площади темнеет {штаб Режима}. В его узких
		окнах-бойницах ещё можно разглядеть свет факелов. Ты замечаешь, что местные
		предпочитают обходить это здание стороной.
	]];
	act = function()
		return [[
			Ты осматриваешь каменную кладку крепости штаба. Снаружи здание выглядит куда
			более грозно, чем изнутри с его храпящими во всю глотку солдатами и запахом
			кислого пива.
		]];
	end;
}

-- Монумент
regimenstrasse_monument = obj {
	nam = 'Монумент';
	dsc = [[
		^
		На площади перед штабом, напротив многолюдно. {Монумент Режима} окружён палатками
		 торговцев.
	]];
	act = function()
		return [[
			Ты осмативаешь громоздкую гранитную книгу, покоющуюся на огромном плоском булыжнике.
			Внутри книги вырезана небольшая ниша, засыпаная землёй на которую неуверенно роняет
			листву саженец каменного древа. Ты слышал, что деревья для городов Приграничья
			привозили прямиком из Каменных садов Тантикула -- столицы Режима.
		]];
	end;
}

-- Торгаши
regimenstrasse_salers = obj {
	nam = 'Торговцы';
	dsc = [[
		Бодрясь утренней свежестью, {торгаши} разминают голоса, зазывая первых покупателей.
	]];
	act = function()
		return [[
			Ты осматриваешь палатки и их владельцев. Судя по нарядам, на площади Режима торгуют
			преимущественно заезжие купцы. Ты решаешь, что пользы от них тебе не будет.
		]];
	end;
}

--- Толпа зевак
regimenstrasse_crowd = obj {
	nam = 'Толпа зевак';
	dsc = [[
		Впрочем, их усилия пропадают даром, и большая часть людей окружает вовсе не лотки
		с товарами. {Толпа} обступила пару препирающихся, крики которых
		заглушают зазывания торговцев.
	]];
	act = function()
		return [[
			Ты осматриваешь толпу зевак. В движениях некоторых, читается определённый азарт.
			Похоже, люди ждут драки. Некоторые с опаской посматривают в твою сторону.
			Ты вспоминаешь, что облачён в доспех Режима, и люди могут ожидать, что ты
			вмешаешься в перепалку.
		]];
	end;
}

-- TODO
-- Глашатай
regimenstrasse_propagandist = obj {
	nam = 'Глашатай Благих';
	dsc = [[
		Один из них, {бритоголовый детина} в нелепого вида робе, визгливо изрекает молитву,
		перемежающуюся проклятьями. Причём, молитвы он умудряется адресовать
		толпе, а проклятия -- второму крикуну.
	]];
	act = function()
		walk 'regimenstrasse_conflict'
	end;
}

-- Глашатай оставшийся
regimenstrasse_propagandist_silent = obj {
	nam = 'Глашатай Благих';
	dsc = [[
		Рядом {глашатай Благих} воспевает спасение души, последующее за пламенем гнева Благих.
		Находятся и те кто бросают в ему в таз монетки, шепча молитвы спасения.
	]];
	act = [[
		Ты внимательно смотришь на глашатая. Хотя его речи и выдают в нём душевнобольного,
		 взгляд холодных глаз заставляет в этом усомниться.
	]];
}

-- Менестрель
regimenstrasse_singer = obj {
	nam = 'Менестрель';
	dsc = [[
		{Тот} одет приличней, но вещает не менее громогласно, потрясая свирелью.
	]];
	act = function()
		walk 'regimenstrasse_conflict'
	end;
}

-- Менестрель оставшийся
regimenstrasse_singer_silent = obj {
	nam = 'Менестрель';
	dsc = [[
		Рядом {менестрель} подыгрывает им на своей свирели.
	]];
	act = [[
		Ты внимательно смотришь на менестреля. Его пальцы ловко бегают по
		незатейливому инструменту, а взгляд хитрых глаз провожает прохожих,
		что подкидывают медяки в его шляпу.
	]];
}

-- Девочка
regimenstrasse_girl = obj {
	nam = 'Потерявшаяся девочка';
	dsc = [[
		Среди толпы тебе удаётся разглядеть маленькую {девочку}, потирающую глаза.
	]];
	act = function()
		event 'help to child'
		_girl_has_gotten_help = true
		return
		[[
			Ты протискиваешься между людей и протягиваешь девочке руку. Ребёнок с опаской
			изучает тебя взглядом снизу вверх, пока не натыкается на герб Режима на твоём
			потёртом панцире. Её маленькое личико проясняется и она послушно цепляется
			за твою ладонь. Выдохнув, ты выводишь девочку из толпы.
			^
			Не успел ты со своей новой приятельницей ступить пару шагов в сторону от монумента,
			как откуда-то послышались взволнованные крики.
			Прямо тобой стоит запыхавшаяся женщина. Из-под её платка выпадают пряди растрёпанных
			волос. С радостным криком девочка бросается к матери, и оказывается у той на руках.
			^
			-- Ох, я так балгодарна вам! Я не спала всю ночь, вот и зазевалась, не заметила,
			как Дайан отстала. В этом возврасте её привлекает любой шум,
			-- стыдливо объясняется женщина,
			-- Нам с ней повезло, что страж Режима оказался рядом. В округе сейчас неспокойно,
			а в городе полно разных проходимцев, -- она с неприязню бросает взгляд на двух
			спорщиков у постамента.
			^
			-- Что вы имеете ввиду? -- ты сам ещё не понял, что тебя заинтересовало больше,
			неспокойная округа или проходимцы.
			^
			-- Мы с Дайан проходили рядом с городскими воротами сегодня, как раз когда туда
			вошёл патруль. Краем уха мне удалось услышать, что несколько дней назад они
			наткнулись в лесу на разорённый караван. Просто ужас! Лошади, люди, все перебиты,
			повозки разграблены. Никто не понимает, зачем караванщиков понесло так далеко в чащу.
			^
			-- А проходимцы? Видели кого-то подозрительного? -- спрашваешь ты женщину. В голове
			у тебя путаются мысли о подполье.
			^
			-- Сейчас половину города можно назвать подозрительной, -- в голосе её слышится
			досада, -- Далеко не все в городе признают, что Режим защищает нас. Но когда орки
			разоряли деревни и города, лорды заботились лишь о своих землях и богатствах.
			Если бы Режим не вмешался в войну, кто знает, уцелел ли бы этот город? -- женщина
			опускает ребёнка на землю, и торопливо попавляет её простенький наряд,
			-- Но сейчас об этом уже не вспоминают. Коротка же людская память!
			Недоброжелателей у вас хватает, поэтому прошу, будьте осторожней! Да хранят нас Благие!
			^
			Она берёт дочь за руку и дарит тебе прощальную улыбку. Ты не знаешь,
			что ещё спросить, и не находишь ничего лучше, чем улыбнуться в ответ. Поборов
			детскую стеснительность девочка машет тебе ручкой.
			^
			Ты снова остаёшься наедине со своими исканиями.
		]]
	end;
}

-- Иностранец
regimenstrasse_stranger = obj {
	nam = 'Stranger';
	dsc = [[
		{Странник} из вольного города (Агалорда).
	]];
	tak = function()
		return [[К нам привязывается иностранец]]
	end;
}

-- TODO
regimenstrasse_todo = obj {
	nam = 'Todo';
	dsc = [[
		{...}
	]];
	act = function()
		return [[
			- Воспоминания ГГ о городах Приграничья и людях. Нужно влюбить игрока в город, чтобы он сопереживал его гибели в огне;
			^
			- куча НПС с которыми ты можешь поговорить, помимо мененстреля и глашатая;
			^
			- Будучи солдатом Режима, ГГ расспрашивает всех о подозрительных личностях и гильдии воров;
		]];
	end;
}
