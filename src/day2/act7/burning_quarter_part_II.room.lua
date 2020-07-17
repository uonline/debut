-- Переменные локации

-- Функции локации

-- Переходы локации
burning_quarter_to_lane_room = vroom('Переулок', 'lane_room');

-- Локация
burning_quarter_fight = room {
	nam = 'Горящий квартал';
	dsc = [[
		Финальная битва...
	]];
	obj = {
		'burning_quarter_priest';
		'burning_quarter_dagger';
		'burning_quarter_ring';
		'burning_quarter_corpses_armed';
		'burning_quarter_knuckle';
		'burning_quarter_zombie_fighter';
		'burning_quarter_knife';
		'burning_quarter_zombie_thug';
		'burning_quarter_halberd';
		'burning_quarter_zombie_guard';
		'burning_quarter_godchosen';
	};
	enter = function()
		return [[
			^
			Небо как чёрная губка впитывает столбы дыма и пламя в себя.
		]];
	end;
	way = {
		burning_quarter_to_lane_room;
	};
}

-- Объекты локации
-- Проповедник
burning_quarter_priest = obj {
	nam = 'Проповедник';
	dsc = [[
		{Проповедник}.
	]];
	act = function()
		return [[
			-- Червь, ничтожество, которое несмотря на это ставит себя в центр вселенной.
			^
			-- Ты когда-нибудь бывал на дне колодца. Когда весь мир сжимается в пятно белого
			света в кольце тьмы?
		]];
	end;
}

-- Четырёхгранный кинжал проповедника
burning_quarter_dagger = obj {
	nam = 'Кинжал проповедника';
	dsc = [[
		{}.
	]];
	act = function()
		return [[
		]];
	end;
}

-- Кольцо проповедника
burning_quarter_ring = obj {
	nam = 'Кольцо';
	dsc = [[
		{}.
	]];
	act = function()
		return [[
		]];
	end;
}

-- Трупы
burning_quarter_corpses_armed = obj {
	nam = 'Трупы с оружием';
	dsc = [[
		{}.
	]];
	act = function()
		return [[
		]];
	end;
}

-- Кастет урук-хай
burning_quarter_knuckle = obj {
	nam = 'Кастет урук-хай';
	dsc = [[
		{}.
	]];
	act = function()
		return [[
		]];
	end;
}

-- Зомби боец урук-хай
burning_quarter_zombie_fighter = obj {
	nam = 'Зомби боец урук-хай';
	dsc = [[
		{}.
	]];
	act = function()
		return [[
			О бойцах урук-хай.
		]];
	end;
}

-- Нож головореза урук
burning_quarter_knife = obj {
	nam = 'Нож головореза урук';
	dsc = [[
		{Нож}.
	]];
	act = function()
		return [[
		]];
	end;
}

-- Зомби головорез урук
burning_quarter_zombie_thug = obj {
	nam = '';
	dsc = [[
		{}.
	]];
	act = function()
		return [[
		]];
	end;
}

-- Алебарда
burning_quarter_halberd = obj {
	nam = 'Алебарда';
	dsc = [[
		{}.
	]];
	act = function()
		return [[
		]];
	end;
}

-- Зомби стражник
burning_quarter_zombie_guard = obj {
	nam = 'Зомби стражник';
	dsc = [[
		{}.
	]];
	act = function()
		return [[
		]];
	end;
}

-- Богоизбранный
burning_quarter_godchosen = obj {
	nam = '';
	dsc = [[
		{}.
	]];
	act = function()
		return [[
		]];
	end;
}
