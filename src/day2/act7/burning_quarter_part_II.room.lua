-- Переменные локации

-- Функции локации

-- Переходы локации
burning_quarter_to_lane_room = vroom('Переулок', 'lane_room');
--burning_quarter_to_lane_room:disable();

-- Локация
burning_quarter_fight = room {
	nam = 'Горящий квартал';
	dsc = [[]];
	obj = {
		'burning_quarter_broken_cart';
		'burning_quarter_rolled_barrels';
		'burning_quarter_dead_guardsmen';
	};
	enter = function()
		return [[
		]];
	end;
	way = {
		burning_quarter_to_lane_room;
	};
}

-- Объекты локации
