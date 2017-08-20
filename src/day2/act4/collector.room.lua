_collector_drunk = false

collector = room {
	nam = 'Коллектор';
	dsc = [[
		Ты стоишь по колено в говне и вспоминаешь, как прекрасен закат.
	]];
	obj = {
		'collector_man';
	};
	way = {
		'sewer';
	};
}

collector_man = obj {
	nam = 'Старик';
	dsc = [[
		{Горбатый старик} сидит на какой-то трубе.
	]];
	act = function()
		if not _collector_drunk then
			return [[
				-- Эй, старик! А давай вспоминать старые времена.
				^
				Старик жестами объясняет, что ему нужно промочить горло.
			]]
		end
	end;
}
