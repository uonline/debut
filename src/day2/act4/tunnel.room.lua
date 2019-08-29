-- Переменные локации
_tunnel_letsrock = false

-- События
on_event('ready to rock the boat', function()
	_tunnel_letsrock = true
	-- Удаляем темноту
	objs('tunnel'):del('tunnel_darkness');
	-- Добавляем главаря воров и полукровку
	objs('tunnel'):add('tunnel_leader');
	objs('tunnel'):add('tunnel_halfblood');
end)

-- Локация
tunnel = room {
	nam = 'Тоннель';
	dsc = function()
		if _tunnel_letsrock then
			return [[
				Пройдя по тоннелю некоторое время в полной темноте, ты
				в нерешительности останавливаешься.
			]];
		else
			return [[
				Ты видишь впереди тусклый огонёк.
				^
				Test
				^
				Стол, свеча, пара стульев, карта и какие-то ящики.
			]];
		end;
	end;
	obj = {
		'tunnel_darkness'
	};
	way = {
		'guild_camp';
	};
}

-- Объекты
-- Темнота
tunnel_darkness = obj {
	nam = 'Темнота';
	dsc = [[
		Кажется, что ты растворяешься в ней.
	]];
	act = function()
		return [[
			Армейская байка о культах и колодцах...
		]];
	end;
}

-- Главарь подполья
tunnel_leader = obj {
	nam = 'Главарь';
	dsc = [[
		Какой-то {мужик в плаще} курит самокат.
		^
		Test
		^
		Ещё один намёк в диалоге, что главарь принадлежит Чёрному Древу. Его мысли на счёт религии Блага? Сравнение с Благими? И подозрение в "нечеловечности".
	]];
	act = function()
		if _tunnel_letsrock then
			event 'tower penetration'
			return [[
				-- Старик? Заговор? Синяя птица удачи? Интим и гербалайф?
				Что ж ты сразу-то не сказал, ща соберёмся и пойдём.
			]]
		end

		return [[
			-- И чё ты щёлкаешь, как дятел?
   			-- Так уж ли много на свете правдивых историй. Память и ограниченность человеческого восприятия;
			-- Насколько ты охвачен течением, и что за сила тобой движет? Не использует ли тебя какая-либо
			-- сила? Сумеешь ли ты отвести Рок?
		]]
	end;
}

-- Полукровка
tunnel_halfblood = obj {
	nam = 'Полукровка';
	dsc = [[
		Видели или не видели до этого?
	]];
	act = function()
		-- Анализируем видели или не видели её до этого
		return [[
			...
		]];
	end;
}
