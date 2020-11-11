-- Переменные локации
_wh_counter = 4;


-- Функции локации
-- Функция для обратного отсчёта до завершения игры в доме Уорри
-- Вызывается при взаимодействиях с разными объектами локации, и генерирует разные события,
-- зависящие от счётчика наступления завершения игры
wh_action = function(act_text)
	act_text = act_text .. "^";

	-- Переводим счётчик
	_lane_counter = _lane_counter - 1;

	-- Герою мерещится
	if _lane_counter == 3 then
		act_text = act_text .. [[
			Осталось 2 действия
		]];
	end;

	-- Герой слышит шорох
	if _lane_counter == 2 then
		act_text = act_text .. [[
			Осталось 2 действия
		]];
	end;

	-- Герой видит как завал "оживает"
	if _lane_counter == 1 then
		act_text = act_text .. [[
			Осталось 1 действие
		]];
	end;

	-- Кевраза выбирается из-под завала
	if _lane_counter <= 0 then
		make_some_noise();
		return act_text .. [[
			GG WP!
		]];
	end;

	return act_text;
end;

-- Функция удаления предметов взятых в доме Уорри
function drop_wh_items()
	-- Удаляем предметы, подобранные в доме Уорри
	inv():del('wh_oil');
	inv():del('wh_picklock');
	inv():del('wh_axe');
end;

-- Функция бегства из дома Уорри
function escape_from_wh()
	-- Если герой покидает сцену, то больше не сможет вернуться]
	-- Уорри понимает, что его взломали и берёт арбалет
	-- Герой сбегает на центральную площадь
	-- Удивиться откуда у Уорри есть замок в двери

	drop_wh_items();

	return [[
	]];
end;

-- Функция появления Уории из-за шума
function make_some_noise()
	drop_wh_items();

	warren_house:disable();

	walk 'fields';

	return [[
	]];
end;


-- Локация
warren_house = room {
	nam = 'Дом Уорри';
	dsc = [[
		Ты не раз бывал у Уорри в гостях.
		В отличие от твоей жалкой хижины дом Уорри, довольно просторный.
		Здесь несколько комнат и есть даже чёрный ход и погреб.
	]];
	obj = {
		'wh_trash';
		'wh_trash_items';
		'wh_chest';
	};
	way = {
		'fields';
	};
	entered = function()
		-- Удаляем отмычки
		inv():del('picklock');

		-- Даём одну отмычку
		take 'wh_picklock';
	end;
}
warren_house:disable()

-- Debug
warren_house_debug = room {
	nam = 'Отладка дома Уорри';
	enter = function()
		warren_house:enable();
		walk 'warren_house';
	end;
}

-- * {-} Если долго ковыряться, то на действия игрока придёт Уорри и прогонит героя, заставив оставить некоторые вещи (в том числе отмычки):
--    * {-} 3 действия: достать масло, смазать замок, открыть отмычкой сундук
--       * {-} Сразу после этого герой уходит из дома
--       * {-} Герой может уйти из дома Уорри в любой момент (например, если он нашёл лук)


-- Объекты
wh_picklock = obj {
	nam = 'Отмычка';
	inv = [[
		Отмычка осталась одна...
	]];
}

-- Беспорядок
wh_trash = obj {
	nam = 'Беспорядок';
	dsc = function()
		return [[
			В полумраке царит настоящий хаос.
			Ты деже не знаешь куда смотреть в этом {беспорядке}.
		]];
	end;
	act = function()
		wh_trash_items:enable();
		wh_trash:disable();
		return [[
		]];
	end;
}

-- Объекты внутри беспорядка
wh_trash_items = obj {
	nam = 'Беспорядок';
	obj = {
		'wh_board';
		'wh_board_items';
		'wh_floor';
		'wh_floor_items';
		'wh_dark_room_side';
		'wh_dark_room_side_items';
	};
}
wh_trash_items:disable()

-- Полка
wh_board = obj {
	nam = 'Полка';
	dsc = function()
		return [[
			{Полка}
		]];
	end;
	act = function()
		wh_board_items:enable();
		wh_board:disable();
	end;
}

-- Объекты внутри полки
wh_board_items = obj {
	nam = 'Объеты на полке полки';
	obj = {
		'wh_bottles';
		'wh_oil';
		'wh_flasks';
	};
}
wh_board_items:disable()

-- Бутылки
wh_bottles = obj {
	nam = 'Бутылки';
	dsc = [[
		{Бутылки}
	]];
}

-- Масло
wh_oil = obj {
	nam = 'Масло';
	dsc = function()
		return [[
			{Масло}
		]];
	end;
	tak = [[
	]];
	inv = [[
	]];
}

-- Склянки
wh_flasks = obj {
	nam = 'Склянки';
	dsc = [[
		{Склянки}
	]];
	act = function()
	end;
}

-- Пол
wh_floor = obj {
	nam = 'Пол';
	dsc = [[
		^
		{Пол}
	]];
	act = function()
		wh_floor_items:enable();
		wh_floor:disable()
	end;
}

-- Объекты на полу
wh_floor_items = obj {
	nam = 'Вещи на полу';
	obj = {
		'wh_subfield_hatch';
		'wh_bolts';
		'wh_mallet';
	};
	dsc = [[
		^
	]];
}
wh_floor_items:disable()

-- Подпол
wh_subfield_hatch = obj {
	nam = 'Лаз в подпол';
	dsc = [[
		{Лаз в подпол}
	]];
}

-- Колчан с болтами
wh_bolts = obj {
	nam = 'Колчан с болтами';
	dsc = [[
		{Колчан с болтами}
	]];
}

-- Киянка
wh_mallet = obj {
	nam = 'Киянка';
	dsc = [[
		{Киянка}
	]];
}

-- Тёмная часть комнаты
wh_dark_room_side = obj {
	nam = 'Тёмная часть комнаты';
	dsc = [[
		^
		{Тёмная часть комнаты}
	]];
	act = function()
		wh_dark_room_side_items:enable();
		wh_dark_room_side:disable();
	end;
}

-- Обстановка в тёмной части комнаты
wh_dark_room_side_items = obj {
	nam = 'Обстановка в тёмной части комнаты';
	obj = {
		'wh_wall_side';
		'wh_wall_side_items';
		'wh_book_shelf';
		'wh_book_shelf_items';
		'wh_bed';
		'wh_stove';
		'wh_letter';
	};
	dsc = [[
		^
	]];
}
wh_dark_room_side_items:disable()

-- Стена
wh_wall_side = obj {
	nam = 'Стена';
	dsc = [[
		{Стена}
	]];
	act = function()
		wh_wall_side_items:enable();
		wh_wall_side:disable();
	end;
}

-- Предметы на стене
wh_wall_side_items = obj {
	nam = 'Предметы на стене';
	obj = {
		'wh_axe';
		'wh_sword';
		'wh_empty_mount';
		'wh_goblin_skull';
	};
	dsc = [[
	]];
}
wh_wall_side_items:disable()

-- Топор
wh_axe = obj {
	nam = 'Топор';
	dsc = function()
		return [[
			{Топор}
		]];
	end;
	tak = [[
	]];
	inv = [[
	]];
}

-- Ятаган
wh_sword = obj {
	nam = 'Ятаган';
	dsc = [[
		{Ятаган}
	]];
}

-- Пустое крепление
wh_empty_mount = obj {
	nam = 'Пустое крепление';
	dsc = [[
		{Пустое крепление}
	]];
}

-- Череп гоблина
wh_goblin_skull = obj {
	nam = 'Череп гоблина';
	dsc = [[
		{Череп гоблина}
	]];
}

-- Книжная полка
wh_book_shelf = obj {
	nam = 'Книжная полка';
	dsc = [[
		^
		{Книжная полка}
	]];
	act = function()
		wh_book_shelf_items:enable();
		wh_book_shelf:disable();
	end;
}

-- Предметы на книжной полке
wh_book_shelf_items = obj {
	nam = 'Предметы на книжной полке';
	obj = {
		'wh_book';
		'wh_scrolls';
		'wh_envelopes';
	};
	dsc = [[
		^
	]];
}
wh_book_shelf_items:disable()

-- Книга
wh_book = obj {
	nam = 'Книга';
	dsc = [[
		{Книга}
	]];
}

-- Свитки
wh_scrolls = obj {
	nam = 'Свитки';
	dsc = [[
		{Свитки}
	]];
}

-- Конверты
wh_envelopes = obj {
	nam = 'Конверты';
	dsc = [[
		{Конверты}
	]];
}

-- Кровать
wh_bed = obj {
	nam = 'Кровать';
	dsc = [[
		^
		{Кровать}
	]];
	act = function()
		wh_stove:enable();

		return [[
		]];
	end;
}

-- Печка
wh_stove = obj {
	nam = 'Печка';
	dsc = [[
		{Печка}
	]];
	act = function()
		wh_letter:enable();

		return [[
		]];
	end;
}
wh_stove:disable()

-- Письмо Уорри
wh_letter = obj {
	nam = 'Письмо';
	dsc = function()
		return [[
			{Письмо}
		]];
	end;
	tak = [[
	]];
	inv = [[
		Ммм...
	]];
}
wh_letter:disable()

-- Сундук
wh_chest = obj {
	nam = 'Сундук';
	dsc = function()
		return [[
			^
			{Сундук}.
		]];
	end;
	act = function()
		return [[
		]];
	end;
	used = function(self, what)
		-- Замок можно сломать топором, но тода на шум придёт Уорри
		if what == wh_axe then

			return [[
			]] .. escape_from_wh();
		end;

		-- Если замок смазать, то можно открыть его отмычкой:
		if what == wh_oil then
			-- Получаем молот
			take 'smith_hammer';


			return [[
				...
			]];
		end;

		-- Молота может не быть, если герой уже его выкупил
		if what == wh_picklock then
			return [[
			]];
		end;
	end;
}
