_blacksmith_dead = false
_warren_dead = false

local drop_weapon = function()
	local weapons = { 'pit_fists', 'pit_axe', 'pit_sword', 'pit_spear' }
	for _, x in ipairs(weapons) do
		if have(x) then
			inv():del(x)
		end
	end
end

uh_pit = room {
	nam = 'Бойцовая яма';
	dsc = [[
		Ты в бойцовой яме. Дюжий раб по имени Петрович медленно и нежно
		бьёт тебя по лицу.
	]];
	obj = {
		'pit_blacksmith';
		'pit_warren';
		'pit_goblin';
		'pit_shield';
	};
	way = {
		'tract_camp';
	};
	entered = function()
		inv():zap()
		take 'pit_thumb'
	end;
}

pit_thumb = obj {
	nam = 'Большой палец';
	inv = [[
		Средства коммуникации в таком шуме ограничены, но всегда можно
		обойтись языком жестов.
	]];
}

pit_fists = obj {
	nam = 'Кулаки';
	inv = [[
		Некоторые вещи ты всегда носишь с собой.
	]];
}

pit_blacksmith = obj {
	nam = 'Кузнец';
	dsc = function()
		if _blacksmith_dead then
			return 'Труп кузнеца лежит на земле.'
		end
		return '{Кузнец} курит сигару, держа в руках топор.'
	end;
}

pit_axe = obj {
	nam = 'Топор';
	dsc = [[
		На земле лежит {топор кузнеца}.
	]];
	tak = function()
		drop_weapon()
		return [[
			Ты быстрым движением подбираешь топор.
		]]
	end;
	inv = [[
		Ты внимательно рассматриваешь топор. Топор похож на кабана, только он
		не кабан, а топор.
	]];
}

pit_warren = obj {
	nam = 'Уорри';
	dsc = function()
		if _warren_dead then
			return 'Труп Уорри лежит на земле.'
		end
		return '{Уорри} злобно озирается, держа в руках меч.'
	end;
	used = function(self, what)
		if what == pit_thumb then
			return [[
				Уорри игнорирует твой жест.
			]]
		end
		if (what == pit_fists) or (what == pit_axe) then
			if have 'pit_shield' then
				_warren_dead = true
				objs():add 'pit_sword'
				return [[
					Ты блокируешь выпад Уорри и таранишь его щитом.
					Гоблин добивает его ударом в спину.
				]]
			else
				walk 'deserted'
				return [[
					Уорри делает внезапный выпад. Закрыться нечем.
					Меч врезается тебе в печень.
				]]
			end
		end;
	end;
}

pit_sword = obj {
	nam = 'Меч';
	dsc = [[
		На земле лежит {меч Уорри}.
	]];
}

pit_goblin = obj {
	nam = 'Сперкл';
	dsc = [[
		{Гоблин} курит.
	]];
	used = function(self, what)
		if what == pit_thumb then
			inv():del 'pit_thumb'
			take 'pit_fists'
			_blacksmith_dead = true
			objs():add 'pit_axe'
			return [[
				Гоблин прекрасно понимает жест и, коротко кивнув,
				встаёт рядом с тобой.
				^
				Уорри убивает кузнеца сигаретой.
			]]
		end
	end;
}

pit_spear = obj {
	nam = 'Копьё';
	dsc = [[
		На земле лежит {копьё гоблина}.
	]];
}

pit_shield = obj {
	nam = 'Щит';
	dsc = [[
		Рядом с тобой лежит {щит}.
	]];
	tak = [[
		Пригнувшись, ты быстро подбираешь щит, ни на секунду не сводя глаз
		с остальных.
	]];
	inv = [[
		Ты внимательно рассматриваешь щит. Какое-то говно деревянное.
	]];
}
