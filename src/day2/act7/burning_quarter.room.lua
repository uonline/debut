burning_quarter_to_lane_room = vroom('Переулок', 'lane_room');
burning_quarter_to_lane_room:disable();

burning_quarter = room {
	nam = 'Горящий квартал';
	dsc = [[
		Квартал пустует. Орки уже прошлись по нему железным кулаком,
		вкатав в мостовую почти всю городскую стражу. Здания сильно пострадали
		от огня разорителей. Крики и лязг оружия мешаются с треском горящего
		дерева.
		^
		"Если я задержусь здесь надолго, я просто сгорю", -- думаешь ты.
		Здания у Переулка уже вовсю пылают.
		^
		Test
		^
		Залиты солнецным светом город, теперь был залит светом зарева пожара.
		Почему-то, тебе кажется, что именно этот вид города выглядит наиболее естественным.
		Не тот что ты видел днём, со всеми теми людьми, копошащимися в своей иллюзии жизни.
		Этот жар пожара, словно расплавил восковые иллюзии, обнажив истинное лицо города --
		страдание в бурление хаоса случайности.
	]];
	obj = {
		'broken_cart';
		'rolled_barrels';
		'dead_guardsmen';
	};
	enter = function()
		if not have 'soldier_sword' then
			walk 'halfed_by_panglolin'
			return
		end;
		drop 'soldier_sword';
		return [[
			Ты идёшь в сторону тёмного переулка. Полуящер немедленно замечает
			тебя, окидывает злобным взглядом и, видимо, придя к какому-то
			умозаключению, бросает свою добычу и резво убегает
			в противоположную сторону.
		]];
	end;
	way = {
		burning_quarter_to_lane_room;
	};
}

broken_cart = obj {
	nam = 'Огромная телега';
	dsc = [[
		{Огромная телега} преградила путь к Переулку.
	]];
	act = [[
		Ты рассматриваешь телегу. За ней находится проход в переулок,
		но просто так через неё не перелезть.
	]];
}

rolled_barrels = obj {
	nam = 'Бочки';
	dsc = [[
		Вокруг неё раскатились {бочки}.
	]];
	act = [[
		Ты пинаешь одну из бочек. Тяжёлая, зараза.
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
			Не придумав ничего лучше, ты перетаскиваешь несколько тел к телеге
			и складываешь из них гору. Что ж, теперь можно попробовать перебраться
			на ту сторону.
		]]
	end;
}
