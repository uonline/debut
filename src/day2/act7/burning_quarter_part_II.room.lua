-- Переменные локации

-- Функции локации

-- Переходы локации
burning_quarter_to_lane_room = vroom('Переулок', 'lane_room');
--burning_quarter_to_lane_room:disable();

-- Локация
burning_quarter_fight = room {
	nam = 'Горящий квартал';
	dsc = [[
		Финальная битва...
	]];
	obj = {
		'burning_quarter_corpses_shifted';
		-- Четырёхгранный кинжал проповедника
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
-- TODO
--
-- Удар молотом, который проповедник легко останавливает рукой.
--
-- Червь, ничтожество, которое несмотря на это ставит себя в центр вселенной.
--

