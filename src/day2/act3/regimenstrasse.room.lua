regimenstrasse_to_berlinstrasse = vroom('Главная улица', 'berlinstrasse')
regimenstrasse_to_berlinstrasse:disable()

regimenstrasse = room {
	nam = 'Площадь Режима';
	dsc = [[
		Ты стоишь на площади. Понятно, что это центральная площадь, потому что
		весь булыжник тут окрашен в жёлтый цвет.
		^
		(Воспоминания ГГ об городах Приграничья и людях. Нужно влюбить игрока в город, чтобы он сопереживал его гибели в огне)
		^
		(куча НПС с которыми ты можешь поговорить, помимо мененстреля и глашатая)
		^
		(Будучи солдатом Режима, ГГ расспрашивает всех о подозрительных личностях и гильдии воров)
	]];
	obj = {
		'regimenstrasse_propagandist';
		'regimenstrasse_singer';
	};
	way = {
		regimenstrasse_to_berlinstrasse;
	};
	entered = function()
		-- Clear inventory, add whitelisted items
		inv():zap();
	end;
}

on_event('regimenstrasse belongs to singer', function()
	objs('regimenstrasse'):del('regimenstrasse_propagandist')
	objs('regimenstrasse'):del('regimenstrasse_singer')

	objs('regimenstrasse'):add('regimenstrasse_singer_silent')
	regimenstrasse_to_berlinstrasse:enable()
end)

on_event('regimenstrasse belongs to propagandist', function()
	objs('regimenstrasse'):del('regimenstrasse_propagandist')
	objs('regimenstrasse'):del('regimenstrasse_singer')

	objs('regimenstrasse'):add('regimenstrasse_propagandist_silent')
	regimenstrasse_to_berlinstrasse:enable()
end)

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

regimenstrasse_singer = obj {
	nam = 'Менестрель';
	dsc = [[
		Какой-то {другой чёрт} орёт ему в ухо, что он лах.
	]];
	act = function()
		walk 'regimenstrasse_conflict'
	end;
}

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
