-- Переменные локации
_wh_counter = 4;


-- Функции локации
-- Функция для обратного отсчёта до завершения игры в доме Уорри
-- Вызывается при взаимодействиях с разными объектами локации, и генерирует разные события,
-- зависящие от счётчика наступления завершения игры
wh_action = function(act_text)
	act_text = act_text .. "^";

	-- Переводим счётчик
	_wh_counter = _wh_counter - 1;

	-- Герою мерещится
	if _wh_counter == 3 then
		act_text = act_text .. [[
			Осталось 3 действия
		]];
	end;

	-- Герой слышит кашель
	if _wh_counter == 2 then
		act_text = act_text .. [[
			Осталось 2 действия
		]];
	end;

	-- Герой слышит шаги
	if _wh_counter == 1 then
		act_text = act_text .. [[
			Осталось 1 действие
		]];
	end;

	-- Уорри заходит в комнату
	if _wh_counter <= 0 then
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
	inv():del('wh_arms');
	inv():del('wh_oil');
	inv():del('wh_picklock');
	inv():del('wh_axe');
end;

-- Функция выхода из дома Уорри
function leave_from_wh()
	_give_crossbow_to_warren();

	-- Выбрасываем награбленное
	drop_wh_items();

	warren_house:disable();
	warren_house_exit:disable();
end;

-- Функция бегства из дома Уорри
function escape_from_wh()
	leave_from_wh();

	walk 'fields';

	return [[
		Ты испугался и сбежал. Уорри тебя застукал на выходе.
		...
		-- Темно там у тебя, -- говоришь ты, не отрывая взгляда от арбалета.
		^
		-- Ты не бывал в по-настоящему чёрной комнате, -- говорит тебе Уорри,
		-- но возможно тебе ещё это предстоит.
		^
		-- А теперь выаорачивай карманы!
	]];
end;

-- Функция бегства из дома Уорри с добычей
function escape_from_wh_with_loot()

	-- Если герой покидает сцену, то больше не сможет вернуться
	-- Уорри понимает, что его взломали и берёт арбалет
	-- Герой сбегает на центральную площадь
	-- Удивиться откуда у Уорри есть замок в двери
	leave_from_wh();

	walk 'square';

	return [[
	]];
end;

-- Функция появления Уории из-за шума
function make_some_noise()
	leave_from_wh();

	walk 'fields';

	return [[
		Тебя застукали на горячем.
	]];
end;


-- Локации
-- Дом Уорри
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
		'wh_chest_oiled';
	};
	way = {
		'warren_house_exit';
	};
	entered = function()
		warren_house_exit:enable();

		-- Удаляем отмычки
		inv():del('picklock');

		-- Даём одну отмычку
		take 'wh_picklock';

		-- Даём руки
		take 'wh_arms';
	end;
}
warren_house:disable()

-- Выход из дома Уорри
warren_house_exit = room {
	nam = 'На улицу';
	enter = function()
		return [[]] .. escape_from_wh();
	end;
}
warren_house_exit:disable()

-- Debug
warren_house_debug = room {
	nam = 'Отладка дома Уорри';
	enter = function()
		warren_house:enable();
		walk 'warren_house';
	end;
}

-- * {-} Если долго ковыряться,
--   то на действия игрока придёт Уорри и прогонит героя,
--   заставив оставить некоторые вещи (в том числе отмычки):
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

-- Руки
wh_arms = obj {
	nam = 'Руки';
	inv = function()
		return [[
			Ты рассматриваешь свои руки словно видишь их впервые.
			И хотя выглядят они как обысно, под кожей среди мышц и жил
			пульсирует небывалое ощущение силы.
			^
			Кольцо на пальце странно переливается...
		]];
	end;
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
		'wh_table';
		'wh_table_items';
		'wh_board';
		'wh_board_items';
		'wh_floor';
		'wh_floor_items';
		'wh_dark_room_side';
		'wh_dark_room_side_items';
	};
}
wh_trash_items:disable()

-- Стол
wh_table = obj {
	nam = 'Стол';
	dsc = function()
		return [[
			{Стол}
		]];
	end;
	act = function()
		wh_table_items:enable();
		wh_table:disable();
	end;
}

-- Объекты на столе
wh_table_items = obj {
	nam = 'Объеты на столе';
	obj = {
		'wh_food';
		'wh_stuff';
		'wh_lamp';
	};
}
wh_table_items:disable()

-- Остатки еды
wh_food = obj {
	nam = 'Остатки еды';
	dsc = [[
		^
		{Еда}
	]];
}

-- Утварь
wh_stuff = obj {
	nam = 'Утварь';
	dsc = [[
		{Утварь}
	]];
}

-- Лампа
wh_lamp = obj {
	nam = 'Лампа';
	dsc = function()
		return [[
			{Лампа}
		]];
	end;
	act = [[
		Валяется на столе среди мусора.
		Под ней пятно.
		Ты вспоминаешь посиделки у Уорри...
	]];
	used = function(self, what)
		if what == wh_arms then
			take 'wh_lamp';
			wh_food:disable();
			wh_stuff:disable();

			local text = [[
				Ты разгребаешь хлам и берёшь лампу.
			]];

			return wh_action(text);
		end;
	end;
}

-- Полка
wh_board = obj {
	nam = 'Полка';
	dsc = function()
		return [[
			^
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
	nam = 'Объеты на полке';
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
	act = [[
		Какие-то бутылки.
	]];
	used = function(self, what)

		if what == wh_arms then
			wh_bottles:disable();

			local text = [[
				Ты ставишь бутылку на место и она звякает с другой.
			]];

			return wh_action(text);
		end;

		if what == wh_lamp then
			local text = [[
				Ты ставишь бутылку на место и она звякает с другой.
			]];

			return text;
		end;
	end;
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
	act = [[
	]];
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
	act = [[
	]];
}

-- Колчан с болтами
wh_bolts = obj {
	nam = 'Колчан с болтами';
	dsc = [[
		{Колчан с болтами}
	]];
	act = [[
	]];
}

-- Киянка
wh_mallet = obj {
	nam = 'Киянка';
	dsc = [[
		{Киянка}
	]];
	act = [[
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
		'journal';
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
	act = [[
	]];
}

-- Пустое крепление
wh_empty_mount = obj {
	nam = 'Пустое крепление';
	dsc = [[
		{Пустое крепление}
	]];
	act = [[
	]];
}

-- Череп гоблина
wh_goblin_skull = obj {
	nam = 'Череп гоблина';
	dsc = [[
		{Череп гоблина}
	]];
	act = [[
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
	act = [[
	]];
}

-- Свитки
wh_scrolls = obj {
	nam = 'Свитки';
	dsc = [[
		{Свитки}
	]];
	act = [[
	]];
}

-- Конверты
wh_envelopes = obj {
	nam = 'Конверты';
	dsc = [[
		{Конверты}
	]];
	act = [[
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
		journal:enable();

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
		Несожжённое письмо.
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
			]] .. make_some_noise();
		end;

		-- Если замок смазать, то можно открыть его отмычкой:
		if what == wh_oil then
			wh_chest_oiled:enable();
			wh_chest:disable();

			local text = [[
			]];

			return wh_action(text);
		end;

		-- Молота может не быть, если герой уже его выкупил
		if what == wh_picklock then
			local text = [[
			]];

			return wh_action(text);
		end;
	end;
}

-- Сундук со смазанным замком
wh_chest_oiled = obj {
	nam = 'Сундук со смазанным замком';
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
			]] .. make_some_noise();
		end;

		if what == wh_picklock then

			-- Молота может не быть, если герой уже его выкупил
			if true then

				-- Получаем молот
				take 'smith_hammer';

				return escape_from_wh_with_loot() .. [[
					Сбежал с молотом. Но Уорри всё равно берёт арбалет.
				]];
			end;
		end;
	end;
}

wh_chest_oiled:disable()
