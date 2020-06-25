-- Чтобы освободить проход к переулку и преградить улицу для Кевразы, герой должен столкнуть повозку
-- в горящее здание, которое обрушившись перекроет улицу.
-- Для этого нужно выполнить в определённой последовательности 4 действия, иначе Кевраза убивает героя
-- броском копья.
--
-- Герой также умирает, если попытается убежать в Переулок, при отодвинутой повозке.
--
-- Правильная последовательность действий: достать из-под телеги трупы, снести лоток, закинуть бочки в телегу, разбить цепь телеги.
--
-- После того как герой выполнили эти действия из переулка выходит проповедник. Начинается диалог и драка с ним.
-- Затем Кевраза убивает проповедника броском копья, спасая героя от смерти. Герой поднимает мистическое нечто,
-- которое наделяет его силой проповедника.
--
-- Сначала нужно будет убегать от Кевразы в переулок, а там расчистить люк канализации.

-- Переменные локации
local burning_quarter_counter = 4;

-- Функции локации
-- Функция для обратного отсчёта до завершения игры в горящем квартале
-- Вызывается при взаимодействиях с разными объектами локации, и генерирует разные события,
-- зависящие от счётчика наступления завершения игры
burning_quarter_action = function(act_text)
	act_text = act_text .. "^";

	-- Переводим счётчик
	burning_quarter_counter = burning_quarter_counter - 1;

	-- Герой слышит приближение отряда Кевразы
	if burning_quarter_counter == 3 then
		act_text = act_text .. [[
			3...
		]];
	end;

	-- Герой слышит приближение орков
	if burning_quarter_counter == 2 then
		act_text = act_text .. [[
			2...
		]];
	end;

	-- Отряд Кевразы побеждает орков
	if burning_quarter_counter == 1 then
		act_text = act_text .. [[
			1...
		]];
	end;

	-- Время вышло, отряд Кевразы попадает в квартал
	if burning_quarter_counter <= 0 then
		walk 'killed_in_burning_quarter';
		return act_text .. [[
			Кевраза бросает копьё...
		]];
	end;

	return act_text;
end;

-- Переходы локации
-- Попытка героя пробраться в Переулок
burning_quarter_to_lane_fail_room = room {
	nam = 'Переулок';
	enter = function()
		-- Проверять есть ли в телеге бочки
		if not burning_quarter_loaded_cart:disabled() then
			return [[Повозка забита бочками, не пролезть.]], false;
		end;

		-- Проверяем не укатилась ли телега
		if burning_quarter_cart:disabled() then
			-- Пытаемся пробраться в переулок
			local fail_text = '';

			-- 2 Залп стрел, может убить героя, если нет телеги
			if burning_quarter_counter == 3 then
				fail_text = [[
					Залп стрел убивает героя.
				]];
			end;

			-- 1 Орки убивают героя, если телега скатилась негружённой
			if burning_quarter_counter == 2 then
				fail_text = [[
					Орки убивают героя.
				]];
			end;

			walk 'killed_in_burning_quarter';

			return [[
				Путь открыт, и ты пытаешься сбежать в переулок
				^
			]] .. fail_text;
		end;

		-- Пытаемся пролезть в переулок и теряем время
		if burning_quarter_counter == 1 then
			return burning_quarter_action('Ты забираешься на телегу и пытаешься пролезть в переулок, но балка мешает.'), true;
		else
			return burning_quarter_action('Ты забираешься на телегу и пытаешься пролезть в переулок, но балка мешает.'), false;
		end;
	end;
}

-- Локация
burning_quarter = room {
	nam = 'Горящий квартал';
	dsc = [[
		Квартал пустует. Орки уже прошлись по нему железным кулаком,
		вкатав в мостовую почти всю городскую стражу. Здания сильно пострадали
		от огня разорителей. Крики и лязг оружия мешаются с треском горящего
		дерева.
		^
		"Если я задержусь здесь надолго, я просто сгорю", -- думаешь ты.
		Здания у Переулка уже вовсю пылают.
		^
		Залиты солнечным светом город, теперь был залит светом зарева пожара.
		Почему-то, тебе кажется, что именно этот вид города выглядит наиболее естественным.
		Не тот что ты видел днём, со всеми теми людьми, копошащимися в своей иллюзии жизни.
		Этот жар пожара, словно расплавил восковые иллюзии, обнажив истинное лицо города --
		страдание в бурление хаоса случайности.
		^
		Утренние воспоминания.
	]];
	obj = {
		'burning_quarter_cart';
		'burning_quarter_loaded_cart';
		'burning_quarter_broken_cart';
		'burning_quarter_cart_chain';
		'burning_quarter_rolled_barrels';
		'burning_quarter_corpses';
		'burning_quarter_corpses_shifted';
		'burning_quarter_salers_counter';
	};
	way = {
		'burning_quarter_to_lane_fail_room';
	};
	enter = function()
		-- Debug
		take 'soldier_sword';

		if not have 'soldier_sword' then
			walk 'halfed_by_panglolin'
			return;
		end;

		drop 'soldier_sword';
		take 'burning_quarter_hammer';

		return [[
			Ты идёшь в сторону тёмного переулка. Полуящер немедленно замечает
			тебя, окидывает злобным взглядом и, видимо, придя к какому-то
			умозаключению, бросает свою добычу и резво убегает
			в противоположную сторону.
			^
			Test
			^
			Полуящер убегает в тёмный переулок. Шепча проклятия, ты бросаешься
			следом за ним.
			^
			Нападение орка с молотом. Поломка меча. В шею орка впивается недобитый ящер.
			Добиваешь ящера обломком меча и берёшь молот.
			^
			Обозначить цель для игрока: люк канализации в переулке.
		]];
	end;
}

-- Объекты локации
-- Повозка
burning_quarter_cart = obj {
	nam = 'Повозка';
	dsc = [[
		{Огромная повозка} преградила путь к Переулку.
	]];
	act = function()
		return [[
			Ты рассматриваешь повозку. За ней находится проход в переулок.
			Балка позади телеги, не протиснуться.
		]];
	end;
}

-- Загруженная повозка
burning_quarter_loaded_cart = obj {
	nam = 'Загруженная повозка';
	dsc = function()
		return [[
			{Загруженная повозка}.
		]];
	end;
	act = function()
		return [[
			Повозка с бочками.
		]];
	end;
}
burning_quarter_loaded_cart:disable()

-- Сломанная повозка
burning_quarter_broken_cart = obj {
	nam = 'Сломанная повозка';
	dsc = function()
		return [[
			Сломанная повозка.
		]];
	end;
	act = function()
		return [[
			...
		]];
	end;
}
burning_quarter_broken_cart:disable()

-- Цепь, держащая повозку
burning_quarter_cart_chain = obj {
	nam = 'Цепь повозки';
	dsc = [[
		{Цепь} держащая повозку.
	]];
	act = function()
		return [[
			Крепкая на вид.
		]]
	end;
	used = function(self, what)
		-- Разбиваем цепь повозки
		if what == burning_quarter_hammer then
			burning_quarter_cart_chain:disable();

			-- Проверяем наличие трупов под колёсами телеги
			if burning_quarter_corpses:disabled() then
				-- Проверяем снесли ли мы палатку
				if burning_quarter_salers_counter:disabled() then
					-- Проверка наличия бочек в телеге
					if not burning_quarter_loaded_cart:disabled() then
						-- Убираем загруженную телегу
						burning_quarter_loaded_cart:disable();
						walk 'burning_quarter_fight';
						return [[
							Ты закидываешь молот на плечо и выдохнув
							обрушиваешь его на крепление цепи к повозке.
						]];
					else
						-- Телега без бочек скатывается и ломается
						burning_quarter_broken_cart:enable();

						return burning_quarter_action([[
							Телега скатывается вниз и ломается.
						]]);
					end;
				else
					-- Телега сносит палатку и ломается
					-- Убираем загруженную и обычную повозки, если они есть
					burning_quarter_cart:disable();
					burning_quarter_loaded_cart:disable();

						return burning_quarter_action([[
							Телега сносит палатку, скатывается вниз и ломается.
						]]);
				end;
			else
				-- У телеги под колёсами лежат трупы
				return burning_quarter_action([[
					Колёса телеги упираются в трупы.
				]]);
			end;

			return burning_quarter_action([[
				Телега скатывается вниз и врезается с треском в здание и
				разваливается.
			]]);
		end;
	end;
}

-- Бочки
burning_quarter_rolled_barrels = obj {
	nam = 'Бочки';
	dsc = [[
		Вокруг неё раскатились {бочки}.
	]];
	act = function()
		-- Проверяем есть ли телега и, что это не первое действие на сцене
		if not burning_quarter_cart:disabled() and burning_quarter_counter < 4 then
			-- Если есть, то грузим в неё бочки
			burning_quarter_rolled_barrels:disable();
			burning_quarter_cart:disable();
			burning_quarter_loaded_cart:enable();

			return burning_quarter_action([[
				Ты пинаешь одну из бочек. Тяжёлая, зараза.
				Но к счастью пустые, поэтому ты умудряешься поднять их.
				Пыхтя, ты закидываешь в телегу бочки.
			]]);
		end;

		-- Разбрасываем бочки
		return burning_quarter_action([[
			Ты разбрасываешь бочки расчищая пространство вокруг повозки.
			Последняя надежда пролезть под повозкой окончательно
			развеивается. Там куча тел.
		]]);
	end;
	used = function(self, what)
		-- Разбиваем цепь повозки
		if what == burning_quarter_hammer then
			burning_quarter_rolled_barrels:disable();

			return burning_quarter_action([[
				Ты со злости ранзносишь бочки молотом.
			]]);
		end;
	end;
}

-- Трупы
burning_quarter_corpses = obj {
	nam = 'Трупы';
	dsc = [[
		По всему кварталу раскиданы {тела стражников}.
	]];
	act = function()
		-- Меняем тела
		burning_quarter_corpses_shifted:enable();
		burning_quarter_corpses:disable();

		-- Проверяем разорвана ли цепь
		if not burning_quarter_cart_chain:disabled() then
			-- Вытаскиваем трупы из-под телеги
			return burning_quarter_action([[
				Ты оттаскиваешь несколько трупов из-под колёс повозка немного
				проезжает.
				Повозка Цепь натягивается.
			]]);
		end;

		-- Цепь разорвана
		return burning_quarter_action([[
			Ты кое-как вытаскиваешь из под колёс телеги трупы, чтобы в конце концов она
			поехала вниз.
		]]);
	end;
}

-- Разбросанные трупы
burning_quarter_corpses_shifted = obj {
	nam = 'Трупы';
	dsc = [[
		По всему кварталу раскиданы отодвинутые {тела стражников}.
	]];
	act = [[...]];
}
burning_quarter_corpses_shifted:disable()

-- Лоток торговца
burning_quarter_salers_counter = obj {
	nam = 'Лоток торговца';
	dsc = [[{Палатка}, валяется полчья шкура в крови и перевёрнутый котелок...]];
	act = function()
		return [[
			...
		]];
	end;
	used = function(self,what)
		-- Разносим лоток молотом
		if what == burning_quarter_hammer then
			burning_quarter_salers_counter:disable();

			return burning_quarter_action([[
				Ты разносишь лоток молотком.
			]]);
		end;
	end;
}

-- Молот
burning_quarter_hammer = obj {
	nam = 'Молот урук-хай';
	inv = [[
		Уродливый молот урук-хай. Одноручный, но ты с трудом
		удерживаешь его двумя руками.
	]];
}
