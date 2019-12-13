-- Переменные локации
_tower_stage2_where_is_halfblood = true;

-- События
on_event('thieves leader disappeared', function()
	tower_stage2_thieves_leader:disable();
end)

-- Локация
tower_stage2 = room {
	nam = 'Башня';
	dsc = function()
		ret = [[
			После продолжительного винтового пролёта
		]];

		-- Описание этажа
		tower_stage2_def=[[
			...
		]];

		-- Проверяем не пропал ли ещё главарь
		if tower_stage2_thieves_leader:disabled() then
			--когда пропал главарь, убираем заодно и текст про полукровку
			return ret .. 'ты оказываешься на следующем этаже башни.';
		else
			return ret .. [[ вы оказываетесь на следующем этаже ... и обнаруживаете, что Полукровка исчезла.
				Пока вы поднимались, ты был абсолютно уверен, что она идёт за тобой. Даже чувствовал, как
				она подталкивает тебя в спину.
				^
				В замешательстве ты отступаешь на лестницу, но там тебя ждёт лишь тишина. Ты возвращаешься
				к главарю.
			]];
		end
	end;
	obj = {
		'tower_stage2_windows';
		'tower_stage2_thieves_leader';
		'tower_stage2_some_stuff';
	};
	way = {
		'tower_stage2_stock_room';
		vroom('Лестница', 'tower_stage3');
	};
}

-- Переходы
-- Склад
tower_stage2_stock_room = room {
	nam = 'Склад';
	enter = function()
		-- Главарь подполья не даёт нам проверить склад
		if tower_stage2_thieves_leader:disabled() then
			-- Переходим в склад
			walk 'tower_stage2_stock';
		else
			return [[
				-- Похоже эта дверь ведёт на какой-то склад, -- замечаешь ты.
				^
				-- У нас нет на это времени, -- нетерпеливо отзывается главарь,
				-- нужно подниматься выше.
				^
			]], false
		end;
	end;
}

-- Объекты локации
-- Окна под потолком
tower_stage2_windows = obj {
	nam = 'Окна';
	dsc = [[
		{Окна} под потолком.
	]];
	act = function()
		return [[
			Как и на первом этаже они украшены витражами...
		]];
	end;
}

-- Главарь подполья
tower_stage2_thieves_leader = obj {
	nam = 'Главарь подполья';
	dsc = [[
		{Бывший торгаш} нервно потирает щетину, уставившись в пол.
	]];
	act = function()
		walk 'tower_stage2_thieves_leader_dlg';
	end;
}

-- Ящики
tower_stage2_some_stuff = obj {
	nam = 'Ящики';
	dsc = [[
		{Покрытые пылью ящики}...
	]];
	act = function()
		objs('tower_stage2'):add('tower_stage2_skeleton');
		return [[
			...
		]];
	end;
}

-- Скелет
tower_stage2_skeleton = obj {
	nam = 'Скелет';
	dsc = [[
		{Скелет}...
	]];
	act = [[
		Скелет неизвестного существа.
	]];
}

-- Диалог с главарём подполья
tower_stage2_thieves_leader_dlg = dlg {
	nam = 'Главарь подполья';
	hideinv = true;
	entered = function()
		-- Спрашиваем, где Полукровка
		if _tower_stage2_where_is_halfblood then
			return [[
				-- Куда она подевалась? -- спрашиваешь ты бывшего торгаша.
				^
				-- ...
			]];
		end;

		return [[
		]];
	end;
	phr = {
		-- Где полукровка
		{
			tag = 'about_halfblood';
			true;
			'Будем её искать?';
			[[
				-- Тогда мы отсюда никогда не выберемся, -- ...
				-- нам нужно найти советника. Уж кто-то, а Полукровка
				точно не пропадёт.
			]];
			function()
				_tower_stage2_where_is_halfblood = false;
				tower_stage2_thieves_leader_dlg:pon('new_way');
			end;
		};
		-- Куда дальше
		{
			tag = 'new_way';
			false;
			'Куда дальше?';
			[[
				-- Покои советнка должны быть на самом верху башни. Поднимаемся дальше.
			]];
			function()
				tower_stage2_thieves_leader_dlg:pon('about_religion');
				tower_stage2_thieves_leader_dlg:pon('go_go_go');
				tower_stage2_thieves_leader_dlg:poff('new_way');
			end;
		};
		-- О религии Благих
		{
			tag = 'about_religion';
			false;
			'???';
			[[
				-- Ещё один намёк в диалоге, что главарь принадлежит Чёрному Древу. Его мысли на счёт религии Блага? Сравнение с Благими? И подозрение в "нечеловечности".
				-- Единый бог? Разве люди могли придумать такое?
				^
			]];
			function()
				-- ...
				tower_stage2_thieves_leader_dlg:pon('go_go_go');
			end;
		};
		-- Уходим
		{
			tag = 'go_go_go';
			false;
			'Думаю, нам пора.';
			[[
				Вперёд.
			]];
			function()
				tower_stage2_thieves_leader_dlg:poff('about_religion');
				tower_stage2_thieves_leader_dlg:pon('go_go_go');
				back();
			end;
		};
	};
}
