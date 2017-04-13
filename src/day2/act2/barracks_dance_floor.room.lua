barracks_dance_floor = room {
	nam = 'Зал';
	dsc = [[
		Ты осторожно заглядываешь в залу. Тут идёт какой-то банкет и все бухают.
	]];
	obj = {
		'dance_floor_guards';
	};
	way = {
		'barracks_hall';
	};
}

dance_floor_guards = obj {
	nam = 'Стражники';
	dsc = [[
		Недалеко от тебя {группа стражников} охраняет дверь на улицу.
	]];
	act = function()
		if not have('guard_armor') then
			return [[
				Вряд ли они поверят, что я один из них. На мне даже брони нет.
			]];
		end
		return [[
			Чёт они какие-то страшные.
		]];
	end;
}
