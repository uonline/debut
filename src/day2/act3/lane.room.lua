-- Переменные локации
-- Переходы
lane_to_sewer = vroom('В подполье', 'sewer')
lane_to_sewer:disable()

-- Локация
lane = room {
	nam = 'Переулок';
	dsc = [[
		Ты стоишь в переулке...
	]];
	obj = {
		'lane_todo';
	};
	way = {
		'berlinstrasse';
		lane_to_sewer;
	};
}

-- События
-- Главарь воров нас признал и рассказал, как попасть в подполье
on_event('learned about sewer', function()
	lane_to_sewer:enable()
end)

-- Объекты
-- TODO
lane_todo = obj {
	nam = 'Todo';
	dsc = [[
		{...}
	]];
	act = function()
		event('learned about sewer');
		return [[
			- Воспоминания ГГ о городах Приграничья и людях. Нужно влюбить игрока в город, чтобы он сопереживал его гибели в огне;
			^
			- Нужно добавить комнату с местом встречи с главарём в переулке.
			- Ты вспоминаешь, что твоё детсво прошло примерно в таком же переулке
		]];
	end;
}
