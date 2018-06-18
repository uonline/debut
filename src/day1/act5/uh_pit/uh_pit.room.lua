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
		Ты в бойцовой яме. Вокруг собрались десятков пять орков, они кричат
		и радостно улюлюкают. Топла шумит так, что уши закладывает.
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
		Ты внимательно осматриваешь свои кулаки. Большие, тяжёлые. То, что надо.
	]];
}

pit_blacksmith = obj {
	nam = 'Кузнец';
	act = function()
		if _blacksmith_dead then
			return [[
				Ты мельком осматриваешь труп. Простая и бесславная смерть.
			]];
		end
		return [[
			Ты вопросительно смотришь на кузнеца. Кузнец хмурится в ответ.
		]];
	end;
	dsc = function()
		if _blacksmith_dead then
			return 'Труп кузнеца лежит на земле.'
		end
		return '{Кузнец} переминается с ноги на ногу, держа в руках топор.'
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
				Ты быстрым движением подбираешь топор. В это время гоблин
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
		Ты внимательно рассматриваешь топор. Орочья работа. Грубый и из
		низкокачественного железа.
	]];
}

pit_warren = obj {
	nam = 'Уорри';
	dsc = function()
		if _warren_dead then
			return 'Труп Уорри лежит на земле.'
		end
		return '{Уорри} злобно озирается, вращая в руках меч. Ох, не зря его прозвали ростовщик.'
	end;
	act = function()
		if _warren_dead then
			return [[
				Ты рассматриваешь труп и не находишь в нём ничего заслуживающего
				внимания.
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
		if (what == pit_fists) or (what == pit_shield) or (what == pit_axe) then
			if have 'pit_shield' then
				_warren_dead = true
				objs():add 'pit_sword'
				_wild_is_here = true
				enable 'pit_wild'
				return [[
					Ты блокируешь выпад Уорри и таранишь его щитом.
					Гоблин добивает его ударом в спину.
					^
					Наверху толпа орков расступается, и несколько из них
					подтаскивают странное существо и сбрасывают его в яму.
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
		Залитое кровью тело Уорри валяется на земле, {меч} лежит рядом с ним.
	]];
	tak = function()
		if not _goblin_dead then
			_goblin_dead = true
			drop_weapon()
			return [[
				Ты быстрым движением подбираешь меч. В это время гоблин
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
			{Гоблин} переводит взгляд из стороны в сторону.
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
				Кузнец неодобрительно смотрит на вас. Воспользовавшись тем, что
				он отвлёкся, Уорри вгоняет меч кузнецу в спину.
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
		Ты внимательно рассматриваешь щит. Очень грязный, но выглядит
		на удивление прочным. На лицевой стороне виден какой-то герб.
	]];
}

pit_wild = obj {
	nam = 'Одичалый';
	act = [[
		Ты внимательно рассматриваешь одичалого. Его мелкие глазки налиты
		яростью.
	]];
	dsc = '{Одичалый} злобно глядит по сторонам.';
	used = function(self, what)
		if what == pit_fists then
			walk 'deserted'
			return [[
				Ты бросаешься на одичалого. Одичалый выбивает из твоих рук щит
				и душит тебя голыми руками.
			]]
		end
		if (what == pit_sword) or (what == pit_axe) then
			walk 'tract_camp'
			return [[
				Одичалый наносит тебе несколько сильных ударов. В глазах темнеет.
				Тем не менее, ты умудряешься прыгнуть ему за спину и нанести удар
				в область шеи. Чудовище ревёт и падает на землю, истекая кровью.
				^
				Дальнейшее вспоминается с трудом. Сначала тебя вытащили
				с арены. Потом пришли какие-то люди. Потом стемнело.
			]]
		end
	end;
}
