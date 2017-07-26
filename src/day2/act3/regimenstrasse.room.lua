-- barracks_to_barracks_hq = vroom('Комната капитана', 'barracks_hq')
-- barracks_to_barracks_hq:disable()

regimenstrasse = room {
	nam = 'Площадь Режима';
	dsc = [[
		Ты стоишь на площади. Понятно, что это центральная площадь, потому что
		весь булыжник тут окрашен в жёлтый цвет.
	]];
	obj = {
		'regimenstrasse_propagandist';
		'regimenstrasse_singer';
	};
	way = {
		'berlinstrasse';
	};
}

on_event('regimenstrasse belongs to singer', function()
	objs('regimenstrasse'):del('regimenstrasse_propagandist');
	objs('regimenstrasse'):del('regimenstrasse_singer');

	objs('regimenstrasse'):add('regimenstrasse_singer_silent');
end)

on_event('regimenstrasse belongs to propagandist', function()
	objs('regimenstrasse'):del('regimenstrasse_propagandist');
	objs('regimenstrasse'):del('regimenstrasse_singer');

	objs('regimenstrasse'):add('regimenstrasse_propagandist_silent');
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
		Ты внимательно смотришь на глашатая. Тот нежно гладит струны,
		видимо, размышляя о чём-то своём.
	]];
}
