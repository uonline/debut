-- Переменные локации
_tunnel_letsrock = false

-- События
on_event('ready to rock the boat', function()
	_tunnel_letsrock = true;
	-- Добавляем обстановку, главаря воров и полукровку
	objs('tunnel'):add('tunnel_table');
	objs('tunnel'):add('tunnel_leader');
	objs('tunnel'):add('tunnel_map');
	objs('tunnel'):add('tunnel_halfblood');
	objs('tunnel'):del('tunnel_darkness');
	objs('tunnel'):add('tunnel_darkness');
end)

-- Локация
tunnel = room {
	nam = 'Тоннель';
	dsc = function()
		-- Проверяем выполнили ли мы поручение главаря подполья
		if _tunnel_letsrock then
			return [[
				Ты видишь впереди тусклый огонёк.
				^
				Стол, свеча, пара стульев, карта и какие-то ящики.
			]];
		else
			return [[
				Пройдя по тоннелю некоторое время, ты оказываешься
				в полной темноте и в нерешительности останавливаешься.
				Оглянувшись, ты уже с трудом различаешь вдали точку
				костра в лагере подполья.
			]];
		end;
	end;
	obj = {
		'tunnel_darkness'
	};
	way = {
		'guild_camp';
	};
	entered = function()
		-- Test
		event 'ready to rock the boat';
	end;
}

-- Объекты
-- Темнота
tunnel_darkness = obj {
	nam = 'Темнота';
	dsc = function()
		-- Проверяем выполнили ли мы поручение главаря подполья
		if _tunnel_letsrock then
			return [[
				{Темнота} хищно окружает вас, словно стая волков -- добычу.
			]];
		else
			return [[
				В {темноте} ты без труда ощупываешь руками обе стены тоннеля.
				Два человека разойдутся здесь с трудом.
			]];
		end;
	end;
	act = function()
		-- Проверяем выполнили ли мы поручение главаря подполья
		if _tunnel_letsrock then
			return [[
				Тебе кажется, что она готова наброситься на тебя.
			]];
		else
			return [[
				Кажется, что ты растворяешься в ней.
				Армейская байка о культах и колодцах:
				- Духи мщения со днов колодцев -- создания культистов ПБ.
				- То что растёт, питаясь мраком внутри нас.
				- Слизь.
				- Колодец риска: вода-жизнь или тьма-смерть?;
			]];
		end;
	end;
}

-- Стол
tunnel_table = obj {
	nam = 'Стол';
	dsc = [[
		{Стол}
	]];
	act = [[
	]];
}

-- Главарь подполья
tunnel_leader = obj {
	nam = 'Главарь';
	dsc = [[
		Какой-то {мужик в плаще} сидит за столом,
	]];
	act = function()
		event 'tower penetration';
		return [[
		Ещё один намёк в диалоге, что главарь принадлежит Чёрному Древу. Его мысли на счёт религии Блага? Сравнение с Благими? И подозрение в "нечеловечности".
			-- Так уж ли много на свете правдивых историй. Память и ограниченность человеческого восприятия;
			-- Насколько ты охвачен течением, и что за сила тобой движет? Не использует ли тебя какая-либо
			-- сила? Сумеешь ли ты отвести Рок?
		]];
	end;
}

-- Карта
tunnel_map = obj {
	nam = 'Карта';
	dsc = [[
		склонившись над {картой}.
	]];
	act = [[
	]];
}
-- Полукровка
tunnel_halfblood = obj {
	nam = 'Полукровка';
	dsc = function()
		if _guild_camp_halfblood_greeting then
			return [[
				Уже знакомая тебе {девушка}...
			]];
		else
			return [[
				{Девушка}
			]];
		end;
	end;
	act = function()
		-- Анализируем видели или не видели её до этого
		if _guild_camp_halfblood_greeting then
			return [[
				-- Рада, что ты здесь.
				^
				-- Как ты здесь оказалась?
				^
				...
			]];
		else
			return [[
				-- Очень уж он доверчивый. Но я не такая, -- проводит пальцем по горлу.
				-- Про хаос.
			]];
		end;
	end;
}
