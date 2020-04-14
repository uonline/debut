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
		В очередной раз ты поднимаешься по лестнице, чтобы попасть на этаж выше.
	]];
	obj = {
		'tower_stage4_windows';
		'tower_stage4_symbols';
	};
	way = {
		'tower_stage4_sentry';
		'tower_stage4_back_to_stage2';
		tower_stage4_to_stage5;
	};
}

-- Объекты локации
-- Окна
tower_stage4_windows = obj {
	nam = 'Окна';
	dsc = [[
		Этаж, на котором ты находишься сейчас, представляет собой обширное помещение с низкими
		потолками и небольшими квадратами окон. Напротив тебя через приоткрытую дверь тихонько свистит ветерок.
		Мягкий предзакатный свет пробирается в башню через узкие {окна} под потолком.
		Он осторожно огибает солнечные пятна на стенах и на полу, и свободно гуляет в мягкой темноте
		между {окон}.
	]];
	act = [[
		Окошки расположенны почти под самым потолком, и лишены каких либо украшательств вроде витражей.
		Зато лучи света беспрепятственно просачиваются в помещение в своём первозданном виде.
		Постепенно пятна света переползают с пола на потолок.
		^
		Ветерок, что легонько дует тебе в лицо, обрушивает на тебя накопившуюся за день усталость.
	]];
}

-- Символы
tower_stage4_symbols = obj {
	nam = 'Необычные символы';
	dsc = [[
		Сквозняк осторожно обдувает тебя и исчезает на лестнице, рядом с которой изображены {странные символы}.
	]];
	act = [[
		Ты долго рассматриваешь необычные символы, но их внешний вид тебе ниочём не говорит.
	]];
}
