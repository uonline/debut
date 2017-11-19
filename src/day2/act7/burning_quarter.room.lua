burning_quarter_to_lane_room = vroom('Переулок', 'lane_room');
burning_quarter_to_lane_room:disable();

burning_quarter = room {
	nam = 'Горящий квартал';
	dsc = [[
		Квартал пустует, орки уже прошлись по нему железным кулаком вкатав в мостовую городскую стражу. Здания принялись от огня разорителей. Крики и лязг оружия мешаются с треском горящего дерева. Ты понимаешь, что если задержишься здесь, то сгоришь. Здания у Переулка уже вовсю пылают.
	]];
	obj = {
		'broken_cart';
		'rolled_barrels';
		'dead_guardsmen';
	};
	enter = function()
		if not have 'coldier_sword' then
			walk 'halfed_by_panglolin'
		end;
		drop 'coldier_sword';
	end;
	way = {
		burning_quarter_to_lane_room;
	};
}

halfed_by_panglolin = room {
	nam = 'Game over';
	dsc = [[
		Полуящер тебя заметил и укусил. Пополам.
	]];
}

broken_cart = obj {
	nam = 'Огромная телега';
	dsc = [[
		{Огромная телега} преградила путь к Переулку.
	]];
	act = [[
		За телегой проход в переулок, но просто так через неё не перелезть.
	]];
}

rolled_barrels = obj {
	nam = 'Бочки';
	dsc = [[
		Вокруг нее раскатились {бочки}.
	]];
	act = [[
		Тяжёлые.
	]];
}

dead_guardsmen = obj {
	nam = 'Тела стражников';
	dsc = [[
		По всему кварталу раскиданы {тела стражников}.
	]];
	act = function()
		burning_quarter_to_lane_room:enable();
		return [[
			Ты перетащил тела к телеге и сложил из них гору. Можно попробовать перебраться через телегу.
		]]
	end;
}

