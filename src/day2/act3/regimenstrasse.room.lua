-- Переменные локации
_girl_is_gotten_help = false

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
		Хотя солнце ещё только встало, горожане уже заполнили площадь.
		^
		...
	]];
	obj = {
		'regimenstrasse_staff';
		'regimenstrasse_monument';
		'regimenstrasse_salers';
		'regimenstrasse_propagandist';
		'regimenstrasse_singer';
		'regimenstrasse_crown';
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
	objs('regimenstrasse'):del('regimenstrasse_propagandist')
	objs('regimenstrasse'):del('regimenstrasse_singer')
	objs('regimenstrasse'):del('regimenstrasse_crown')

	-- Если мы не помогли девочке, то удаляем её вместе с толпой
	if not _girl_is_gotten_help then
		objs('regimenstrasse'):del('regimenstrasse_girl')
	end;

	objs('regimenstrasse'):add('regimenstrasse_singer_silent')
	objs('regimenstrasse'):add('regimenstrasse_')

	regimenstrasse_to_berlinstrasse:enable()
end)

-- Прогоняем менестреля
on_event('regimenstrasse belongs to propagandist', function()
	objs('regimenstrasse'):del('regimenstrasse_propagandist')
	objs('regimenstrasse'):del('regimenstrasse_singer')
	objs('regimenstrasse'):del('regimenstrasse_crown')

	-- Если мы не помогли девочке, то удаляем её вместе с толпой
	if not _girl_is_gotten_help then
		objs('regimenstrasse'):del('regimenstrasse_girl')
	end;

	objs('regimenstrasse'):add('regimenstrasse_propagandist_silent')
	objs('regimenstrasse'):add('regimenstrasse_')

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
		Мрачной глыбой среди новостроев площади темнеет {штаб Режима}. В его узких
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

-- TODO
-- Монумент
regimenstrasse_monument = obj {
	nam = 'Монумент';
	dsc = [[
		^
		{Монумент}...
	]];
	act = function()
		return [[
			Около неё сажали знаменитое каменное древо, семя которого было привезено со Скалистого полуострова.
		]];
	end;
}

-- Торгаши
regimenstrasse_salers = obj {
	nam = 'Торговцы';
	dsc = [[
		{Торгаши}.
	]];
	act = function()
		walk 'regimenstrasse_conflict'
	end;
}

-- Глашатай
regimenstrasse_propagandist = obj {
	nam = 'Глашатай Благих';
	dsc = [[
		{Какой-то лысый чёрт} орёт в рупор про спасение души. Люди бросают ему
		в ермолку монетки.
	]];
	act = function()
		walk 'regimenstrasse_conflict'
	end;
}

-- Глашатай оставшийся
regimenstrasse_propagandist_silent = obj {
	nam = 'Глашатай Благих';
	dsc = [[
		{Глашатай Благих} орёт в рупор про спасение души. Люди бросают ему
		в ермолку монетки.
	]];
	act = [[
		Ты внимательно смотришь на глашатая. Этот картавый коршун занят работой.
	]];
}

-- Менестрель
regimenstrasse_singer = obj {
	nam = 'Менестрель';
	dsc = [[
		Какой-то {другой чёрт} орёт ему в ухо, что он лах.
	]];
	act = function()
		walk 'regimenstrasse_conflict'
	end;
}

-- Менестрель оставшийся
regimenstrasse_singer_silent = obj {
	nam = 'Менестрель';
	dsc = [[
		{Менестрель} играет на своей виолончели.
	]];
	act = [[
		Ты внимательно смотришь на менестреля. Тот нежно гладит струны,
		видимо, размышляя о чём-то своём.
	]];
}

-- Толпа зевак
regimenstrasse_crown = obj {
	nam = 'Толпа зевак';
	dsc = [[
		{Торгаши}.
	]];
	act = function()
		walk 'regimenstrasse_conflict'
	end;
}

-- Девочка
regimenstrasse_girl = obj {
	nam = 'Потерявшаяся девочка';
	dsc = [[
		{Девочка}.
	]];
	act = function()
		event 'help to child'
		_girl_is_gotten_help = true
		return [[Помогаем девочке. Мать и дочь благодарны Режиму.]]
	end;
}

-- Иностранец
regimenstrasse_ = obj {
	nam = 'Иностранец???';
	dsc = [[
		{Иностранец} из Вольных городов (Агалорда).
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
