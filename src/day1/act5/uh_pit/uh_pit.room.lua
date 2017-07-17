_blacksmith_dead = false
_warren_dead = false
_goblin_dead = false
_teamed_goblin = false
_wild_is_here = false

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
		'pit_wild';
		'pit_blacksmith';
		'pit_warren';
		'pit_goblin';
		'pit_shield';
	};
	way = {
		-- ^_^
	};
	entered = function()
		disable 'pit_wild'
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
	act = function()
		if _blacksmith_dead then
			return [[
				Ты внимательно рассматриваешь труп. Полуметровое лезвие
				в сердце кого хочешь свалит.
			]];
		end
		return [[
			Ты внимательно смотришь на кузнеца. Кузнец хмурится в ответ.
		]];
	end;
	dsc = function()
		if _blacksmith_dead then
			return 'Труп кузнеца лежит на земле.'
		end
		return '{Кузнец} курит сигару, держа в руках топор.'
	end;
	used = function(self, what)
		if what == pit_thumb then
			return [[
				Ты показываешь кузнецу большой палец, но он только трясёт
				головой в ответ.
			]]
		end;
	end
}

pit_axe = obj {
	nam = 'Топор';
	dsc = [[
		На земле лежит {топор кузнеца}.
	]];
	tak = function()
		if not _warren_dead then
			return [[
				Ты подходишь, рассчитывая подобрать топор, но Уорри
				преграждает тебе путь.
			]], false;
		end;

		if not _goblin_dead then
			_goblin_dead = true
			drop_weapon()
			return [[
				Ты по-бырому подбираешь топор. В это время гоблин
				бросается на одичалого и несколько раз протыкает его копьём,
				но умирает от ответного удара.
			]];
		end;

		walk 'deserted'
		return [[
			Пока ты подбираешь топор, одичалый избивает тебя обломком мачты.
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
	act = function()
		if _warren_dead then
			return [[
				Ты внимательно рассматриваешь труп. Проткнут копьём. Ужас
				какой.
			]];
		end;
		return [[
			Ты внимательно смотришь на Уорри, а он внимательно смотрит
			на твою шею.
		]];
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
				_wild_is_here = true
				enable 'pit_wild'
				return [[
					Ты блокируешь выпад Уорри и таранишь его щитом.
					Гоблин добивает его ударом в спину.
					^
					В яму сбрасывают известного бандита-рецидивиста по кличке
					Одичалый.
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
	tak = function()
		if not _goblin_dead then
			_goblin_dead = true
			drop_weapon()
			return [[
				Ты по-бырому подбираешь меч. В это время гоблин
				бросается на одичалого и несколько раз протыкает его копьём,
				но умирает от ответного удара.
			]];
		end;

		walk 'deserted'
		return [[
			Пока ты подбираешь меч, одичалый избивает тебя обломком мачты.
		]]
	end;
}

pit_goblin = obj {
	nam = 'Сперкл';
	dsc = function()
		if _goblin_dead then
			return [[
				Рядом с тобой лежит труп гоблина.
				^
			]]
		end

		return [[
			{Гоблин} курит.
			^
		]]
	end;
	act = function()
		if _goblin_dead then
			return [[
				Ты внимательно рассматриваешь труп. Всё брюхо вспорото.
				Не выживет.
			]];
		end;
		if _teamed_goblin then
			return [[
				Ты переглядываешься с гоблином. Тот обнадёживающе кивает
				в ответ и стискивает гопьё в руках.
			]];
		end;
		return [[
			Ты внимательно смотришь на гоблина. Гоблин внимательно смотрит
			на тебя.
		]];
	end;
	used = function(self, what)
		if what == pit_thumb then
			inv():del 'pit_thumb'
			take 'pit_fists'
			_teamed_goblin = true
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
	tak = function()
		walk 'deserted'
		return [[
			Пока ты подбираешь копьё, одичалый избивает тебя обломком мачты.
		]]
	end;
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

pit_wild = obj {
	nam = 'Одичалый';
	act = [[
		Ты внимательно рассматриваешь одичалого. Его глаза, как два бриллианта
		в три карата (очень мелкие).
	]];
	dsc = '{Одичалый} злобно глядит по сторонам.';
	used = function(self, what)
		if what == pit_fists then
			walk 'deserted'
			return [[
				Ты бросаешься на одичалого. Одичалый выбивает из твоих рук щит
				и хреначит тебя ведром. Ты умираешь от сотрясения мозга.
			]]
		end
		if (what == pit_sword) or (what == pit_axe) then
			walk 'tract_camp'
			return [[
				Ты принимаешь в себя пару ударов одичалого, но потом
				разворачиваешься и на ему по черепу, а он такой хопа и умер.
				^
				Дальнейшее вспоминается с трудом. Сначала тебя вытащили
				с арены. Потом пришли какие-то люди. Потом стемнело.
			]]
		end
	end;
}
