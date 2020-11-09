-- Функции
function escape_from_warren_house()
	--[[      * {-} Если герой покидает сцену, то больше не сможет вернуться:]]
	--* {-} Уорри понимает, что его взломали и **берёт арбалет**;
	--[[* {-} Герой **сбегает на центральную площадь**;]]
	 -- Удивиться откуда у Уорри есть замок в двери

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
		'warren_house_trash';
		'warren_house_letter';
		'warren_house_oil';
		'warren_house_axe';
		'warren_house_chest';
	};
	way = {
		'fields';
	};
	entered = function()
		-- * {-} Если герой попадает в дом Уорри, то теряет все отмычки, т.е. он не сможет попасть в дом Уорри второй раз;
	end;
}
warren_house:disable()

--[[      * {-} Если долго ковыряться, то на действия игрока придёт Уорри и прогонит героя, заставив оставить некоторые вещи (в том числе отмычки):
--[[         * {-} 3 действия: достать масло, смазать замок, открыть отмычкой сундук:]]
--[[            * {-} Сразу после этого герой уходит из дома;]]
--[[            * {-} Герой может уйти из дома Уорри в любой момент (например, если он нашёл лук):]]

-- Объекты
warren_house_picklock = obj {
	nam = 'Отмычка';
}

-- Беспорядок
warren_house_trash = obj {
	nam = 'Беспорядок';
	dsc = function()
		return [[
			{Беспорядок}
		]];
	end;
	act = function()
		return [[
		]];
	end;
}

-- Письмо Уорри
warren_house_letter = obj {
	nam = 'Письмо';
	dsc = function()
		return [[
			{Письмо}
		]];
	end;
	act = function()
		return [[
		]];
	end;
}

-- Масло
warren_house_oil = obj {
	nam = 'Масло';
	dsc = function()
		return [[
			{Масло}
		]];
	end;
	act = function()
		return [[
		]];
	end;
}

-- Топор
warren_house_axe = obj {
	nam = 'Топор';
	dsc = function()
		return [[
			{Топор}
		]];
	end;
	act = function()
		return [[
		]];
	end;
}

-- Сундук
warren_house_chest = obj {
	nam = 'Сундук';
	dsc = function()
		return [[
			{Сундук}
		]];
	end;
	act = function()
		return [[
		]];
	end;
	used = function(self, what)
		if what == 'warren_house_axe' then
			--[[         * {-} Замок можно сломать топором, но тода на шум придёт Уорри;]]
			return [[
			]] .. escape_from_warren_house();
		end;

		if what == 'warren_house_oil' then
			--* {-} Если замок смазать, то можно открыть его отмычкой:
		end;

		if what == 'warren_house_picklock' then
			-- {-} Молота может не быть, если герой уже его выкупил;
		end;
	end;
}
