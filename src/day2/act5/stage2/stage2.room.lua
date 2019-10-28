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
				В замешательстве ты возвращаешься на лестницу, но там тебя ждёт лишь тишина.
			]];
		end
	end;
	obj = {
		'tower_stage2_thieves_leader';
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
			walk 'tower_stage2_stock';
		else
			return [[
				-- У нас нет на это времени. Нужно подняться выше.
				^
				-- Похоже эта дверь ведёт на какой-то склад.
			]], false
		end;
	end;
}

-- Объекты локации
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

-- Окна под потолком, как и на первом этаже они украшены витражами...

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
				-- нам нужно найти советника. Полукровка не пропадёт.
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
				-- Я думаю -- покои советнка на самом вреху башни. Но на всякий случай можешь
				проверить, что за той дверью.
			]];
			function()
				tower_stage2_thieves_leader_dlg:pon('about_religion');
				tower_stage2_thieves_leader_dlg:poff('new_way');
			end;
		};
		-- О религии благих
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
			tag='go_go_go';
			false;
			'Думаю, нам пора.';
			function()
				tower_stage2_thieves_leader_dlg:poff('about_religion');
				tower_stage2_thieves_leader_dlg:pon('go_go_go');
				back();
			end;
		};
	};
}
