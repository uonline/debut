_tower_stage1_guard_searched = false

tower_stage1 = room {
	nam = 'Первый этаж';
	dsc = [[
		Минуя запутанные тоннели канализации, вы через лаз пробрались в башню
		наместника. Полукровка оглушает стражника, пока вы в безопасности,
		но нужно двигаться дальше.
	]];
	obj = {
		'tower_stage1_thieves_leader';
		'tower_halfblood';
		'tower_guard';
	};
	way = {
		'tower_stage1_room1';
		'tower_stage1_room2';
		'tower_stage1_room3';
		'tower_stage1_room4';
	};
}

tower_stage1_room1 = room {
	nam = 'Дальняя левая комната';
	enter = function()
		return 'Заперто.', false
	end;
}

tower_stage1_room2 = vroom('Ближняя левая комната', 'tower_stage2');

tower_stage1_room3 = room {
	nam = 'Дальняя правая комната';
	enter = function()
		return 'В комнате соврешенно пусто.', false
	end;
}

tower_stage1_room4 = room {
	nam = 'Ближняя правая комната';
	enter = function()
		return 'За дверью оказалась кирпичная стена с табличкой "вход на 9¾"', false
	end;
}

tower_stage1_thieves_leader = obj {
	nam = 'Главарь воров';
	dsc = [[
		{Главарь воров} о чём-то размышляет.
	]];
	act = [[
		-- Нынешний наместник давно не живёт в башне, он полностью снимает
		один из лучших постоялых дворов в городе.
	]];
}

tower_halfblood = obj {
	nam = 'Полукровка';
	dsc = [[
		{Полукровка} осматривается вокруг.
	]];
	act = [[
		-- Не раз проникала в башню раньше, но каждый раз в ней всё по другому.
	]];
}

tower_guard = obj {
	nam = 'Оглушённый стражник';
	dsc = [[
		{Стражник} лежит на полу.
	]];
	act = function()
		if not _tower_stage1_guard_searched then
			take 'tower_map'
			_tower_stage1_guard_searched = true
			return [[
				В кармане у охранника нашлась карта.
			]]
		end;
	end;
}

tower_map = obj {
	nam = 'Карта башни';
	inv = [[
		Карта. Башни.
	]];
}
