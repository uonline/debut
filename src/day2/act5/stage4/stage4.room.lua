-- Перходы
-- Переход на 5 этаж
tower_stage4_to_stage5 = vroom('Лестница', 'tower_stage5')
tower_stage4_to_stage5:disable()

-- Возврат на второй этаж
tower_stage4_back_to_stage2 = room {
	nam = 'Лестница';
	enter = function()
		-- Включаем признак начала нового цикла прохождения по этажам
		_tower_stage2_new_loop_puzzle = true;
		-- Возвращаемся на второй этаж
		walk 'tower_stage2'
	end;
}

-- События локации
on_event('learned stairway symbols', function()
	tower_stage4_to_stage5:enable()
	tower_stage4_back_to_stage2:disable()
end)

-- Локация
tower_stage4 = room {
	nam = 'Башня';
	dsc = [[
		В очередной раз ты поднимаешься по лестнице, чтобы оказаться на этаж выше.
	]];
	obj = {
		'tower_stage4_symbols';
		'tower_stage4_windows';
	};
	way = {
		'tower_stage4_sentry';
		'tower_stage4_back_to_stage2';
		tower_stage4_to_stage5;
	};
}

-- Объекты локации
-- Символы
tower_stage4_symbols = obj {
	nam = 'Окна';
	dsc = [[
		В отличие от предыдущих этажей, здесь низкие потолки.
		На этаже есть лестница. Рядом с ней на стене {странные символы}.
	]];
	act = [[
		Мягкая темнота. Тёплые лучи солнца пятнами падают на стены и пол.
	]];
}

-- Окна
tower_stage4_windows = obj {
	nam = 'Окна';
	dsc = [[
		{Окна}
	]];
	act = [[
		Мягкая темнота. Тёплые лучи солнца пятнами падают на стены и пол.
	]];
}
