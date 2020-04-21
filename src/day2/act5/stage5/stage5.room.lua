-- Локация
tower_stage5 = room {
	nam = 'Башня';
	dsc = [[
		Ощущая зуд в ногах, ты преодолеваешь последний лестничный подъём
		и выходишь на этаж отличающийся от предыдущих весьма скромной
		обстановкой.
	]];
	way = {
		'tower_stage5_room1';
		'tower_stage5_room2';
		'tower_stage5_room3';
		'tower_stage5_room4';
	};
	obj = {
		'tower_stage5_window';
	};
}

-- Переходы локации
tower_stage5_room1 = vroom('Дальняя левая комната', 'tower_stage5_vicar_room');

tower_stage5_room2 = vroom('Ближняя левая комната', 'tower_stage5_adviser_room');

tower_stage5_room3 = room {
	nam = 'Дальняя правая комната';
	enter = function()
		return 'В комнате совершенно пусто.', false
	end;
}

tower_stage5_room4 = room {
	nam = 'Ближняя правая комната';
	enter = function()
		return 'Закрыто', false
	end;
}

-- Объекты локации
-- Окно
tower_stage5_window = obj {
	nam = 'Окно';
	dsc = [[
	]];
	act = [[
	]];
}
