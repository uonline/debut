-- Переменные локации
_lane_counter = 4;

-- Функции локации
-- Функция для обратного отсчёта до завершения игры в переулке
-- Вызывается при взаимодействиях с разными объектами локации, и генерирует разные события,
-- зависящие от счётчика наступления завершения игры
lane_action = function(act_text)
	act_text = act_text .. "^";

	-- Переводим счётчик
	_lane_counter = _lane_counter - 1;

	-- Герою мерещится
	if _lane_counter == 3 then
		act_text = act_text .. [[
		]];
	end;

	-- Герой слышит шорох
	if _lane_counter == 2 then
		act_text = act_text .. [[
		]];
	end;

	-- Герой видит как завал "оживает"
	if _lane_counter == 1 then
		act_text = act_text .. [[
		]];
	end;

	-- Кевраза выбирается из-под завала
	if _lane_counter <= 0 then
		walk 'killed_in_lane';
		return act_text .. [[
			GG WP!
		]];
	end;

	return act_text;
end;

-- Функция проверки доступности люка
function lane_hatch_is_covered()
	return not lane_huge_beam_shifted:disabled() or not lane_pile_of_boxes:disabled();
end

-- Локация
lane_room = room {
	nam = 'Переулок';
	dsc = [[
		Ты перебираешься через телегу, которая уже начинает заниматься огнём.
		В последний момент ты видишь, как на квартал забегает Кевраза
		с отрядом стражников. Богоизбранный замечает тебя, вырывает копьё из трупа,
		повторно убитого урук-хай и снова отправляет в полёт. К счастью, тебе удаётся вовремя
		спрыгнуть, и копьё пролетает выше. Со стороны квартала становятся слышны
		новые крики и лязг оружия. Ты понимаешь, что это подоспели орки
		и нужно торопиться.
	]];
	obj = {
		'lane_wall';
		'lane_covered_hatch';
		'lane_covered_hatch_blocked';
		'lane_huge_beam';
		'lane_huge_beam_shifted';
		'lane_pile_of_boxes';
		'lane_spear';
		'lane_pile_of_trash';
		'lane_blockage';
		'lane_godchosen';
		'lane_godchosens_sword';
		'lane_dead_citizen';
	};
	enter = function()
		-- Debug
		take 'burning_quarter_knife';
		take 'burning_quarter_ring';
		return [[
			Либо герой должен обрушить балку первым действием, чтобы нейтрализовать Кевразу.
			Иначе Кевраза его убивает.
		]];
	end;
}

-- Объекты локации
-- Руки
lane_arms = obj {
	nam = 'Руки';
	inv = function()
		if have 'lane_mystical_artifact' then
			return [[
				Руки, кольцо и амулет...
			]];
		end;
		return [[
			Ты рассматриваешь свои руки словно видишь их впервые.
			И хотя выглядят они как обычно, под кожей среди мышц и жил
			пульсирует небывалое ощущение силы.
			^
			Кольцо на пальце странно переливается...
		]];
	end;
}

-- Кладка стены
lane_wall = obj {
	nam = 'Кладка стены';
	dsc = [[
		{Разваливающаяся стена}.
	]];
	act = [[
		Бросаем в Кевразу...
	]];
	used = function(self, what)
		if what == lane_arms then
			self:disable();
			return [[
				Ты вытаскиваешь камень из стены и тут же бросаешь его в Кевразу.
			]];
		end;
	end;
}

-- Люк
lane_covered_hatch = obj {
	nam = 'Люк';
	dsc = [[
		Виднеется {люк}.
	]];
	act = function()
	end;
	used = function(self, what)
		if what == lane_arms then
			walk 'killed_in_lane';
			return [[
				Ты хочешь открыть люк, но ничего не выходит. Кевраза тебя убивает.
			]];
		end;
	end;
}

-- Люк заваленный
lane_covered_hatch_blocked = obj {
	nam = 'Люк';
	dsc = [[
		Под кучей обломков виднеется {люк}.
	]];
	act = function()
		if lane_hatch_is_covered() then
			return [[
				Ты рассматриваешь люк. Пока что к нему не подобраться,
				слишком плотно он завален.
			]];
		elseif not lane_pile_of_trash:disabled() then
			return [[
				Ты рассматриваешь люк, но сомневаешься, что у тебя хватит сил открыть его.
				Твоё внимаение привлекает странный блеск в куче хлама.
			]];
		else
			return [[
				Ты рассматриваешь люк. Неплохой люк, между прочим. Посередине
				изображён герб города - орёл и пламя - а края украшены
				какими-то рунами на неизвестном тебе языке. Композицию
				дополняет год основания города и печать городской стражи.
			]];
		end
	end;
	used = function(self, what)
		if what == lane_arms then
			if lane_hatch_is_covered() then
				return [[
					Ты хочешь открыть люк, но пока что к нему не подобраться, слишком плотно он завален.
				]];
			elseif not lane_pile_of_trash:disabled() then
				return lane_action([[
					Ты пытаешься открыть люк, но даже напрягая все силы тебе не удаётся поднять крышку достаточно высоко.
				]]);
			else
				-- Конец
				walk 'the_end';
			end
		end
	end;
}
lane_covered_hatch_blocked:disable()

-- Огромная балка
lane_huge_beam = obj {
	nam = 'Огромная балка';
	dsc = [[
		{Огромная балка} лежит...
	]];
	act = [[
		Ты пытаешься хоть немного приподнять балку. Тщетно.
	]];
	used = function(self, what)
		if what == lane_arms then
			-- Проверяем разрушена ли кладка стены
			if lane_wall:disabled() then
				self:disable();
				lane_huge_beam_shifted:enable();
				lane_covered_hatch:disable();
				lane_covered_hatch_blocked:enable();
				lane_pile_of_boxes:enable();
				lane_pile_of_trash:enable();
				lane_godchosen:disable();
				lane_godchosens_sword:disable();
				lane_blockage:enable();
				lane_dead_citizen:enable();
				return [[
					Тебе удаётся столкнуть балку на Кевразу. Всё рушиться.
				]];
			end;

			walk 'killed_in_lane';
			return [[
				Ты пытаешься сдвинуть балку, но Кевраза уворачивается.
			]];
		end;
	end;}

-- Огромная сдвинутая балка
lane_huge_beam_shifted = obj {
	nam = 'Огромная балка';
	dsc = [[
		Прямо на нём лежит {огромная балка}.
	]];
	act = [[
		Ты пытаешься хоть немного приподнять балку. Тщетно.
	]];
	used = function(self, what)
		if what == lane_spear then
			self:disable()
			return lane_action([[
				Ты втиснул копьё под балку и, используя его как рычаг,
				отодвинул балку в сторону.
			]]);
		end

		if what == lane_arms then
			-- Проверяем есть ли мистический артефакт у героя
			if have 'lane_mystical_artifact' then
				self:disable()
				return lane_action([[
					Ты без проблем сдвигаешь балку в сторону.
				]]);
			end;

			return lane_action([[
				Попытавшись сдвинуть балку, ты чувствуешь,
				что сил всё-таки не достаёт.
			]]);
		end;
	end;
}
lane_huge_beam_shifted:disable()

-- Груда ящиков
lane_pile_of_boxes = obj {
	nam = 'Груда ящиков';
	dsc = [[
		Сверху накидана {груда каких-то ящиков}.
	]];
	act = [[
		Ты рассматриваешь ящики. Обычные деревянные ящики, какими пользуются
		торговцы.
	]];
	used = function(self, what)
		if what == lane_arms then
			self:disable();
			return lane_action([[
				Ты быстренько раскидываешь ящики в разные стороны.
			]]);
		end
	end;
}
lane_pile_of_boxes:disable()

-- Куча хлама
lane_pile_of_trash = obj {
	nam = 'Куча хлама';
	dsc = [[
		У стены лежит {груда какого-то хлама}.
	]];
	act = [[
		Ты рассматриваешь хлам. Обломки ящиков, доски, какие-то железяки,
		женские платья, рваная подушка, кусок сырого мяса, обломок стрелы,
		кирка, губная гармошка...
	]];
	used = function(self, what)
		if what == lane_arms then
			self:disable();
			take 'lane_mystical_artifact';
			return lane_action([[
				Немного пошарившись в куче, ты обнаруживаешь какой-то
				удивительно знакомый предмет.
			]]);
		end
	end;
}
lane_pile_of_trash:disable()

-- Копьё
lane_spear = obj {
	nam = 'Копьё';
	dsc = [[
		Неподалёку торчит пролетевшее мимо {копьё}.
	]];
	tak = function()
		-- Проверяем не заняты ли у героя руки
		if not have 'lane_arms' then
			return [[
				Руки заняты...
			]], false;
		end;

		-- Проверяем есть ли на сцене Кевраза
		if not lane_godchosen:disabled() then
			walk 'killed_in_lane';
			return [[
				Копьё не помогает против меча...
			]];
		end;

		-- Проверяем есть ли у героя мистический артефакт
		if have 'lane_mystical_artifact' then
			lane_spear:disable();
			return lane_action([[
				Хватаешь копьё и ломаешь его...
			]]), false;
		end;

		return lane_action([[
			Ты выдёргиваешь копьё и берёшь его в руки.
		]]);
	end;
	inv = [[
		Ты разглядываешь копьё. Кажется, человеческая работа, но очень грубо
		сделанная.
	]];
	used = function(self, what)
		if what == lane_arms then
			-- Проверяем не под завалом ли Кевраза
			if not lane_godchosen:disabled() then
				walk 'killed_in_lane';
				return [[
					Копьё не помогает против меча...
				]];
			end;

			-- Проверяем есть ли у героя мистический артефакт
			if have 'lane_mystical_artifact' then
				lane_spear:disable();
				return lane_action([[
					Хватаешь копьё и ломаешь его...
				]]);
			end;

			take 'lane_spear';
			return lane_action([[
				...
			]]), self.tak;
		end
	end;
}

-- Завал
lane_blockage = obj {
	nam = 'Завал';
	dsc = [[
		Кевраза под {завалом}.
	]];
	act = function()
		local text = {
			[1] = [[
			]];
			[2] = [[
			]];
			[3] = [[
			]];
			[4] = [[
			]];
		};
		return [[
			...
		]];
	end;
}
lane_blockage:disable()

-- Богоизбранный
lane_godchosen = obj {
	nam = 'Богоизбранный';
	dsc = [[
		{Богоизбранный} с
	]];
	act = function()
		return [[
			-- Ты думаешь, что знаешь, что тебе нужно, но это еще не значит, что это действительно так.
		]];
	end;
	used = function(self, what)
		if what == burning_quarter_knife then
			inv():del 'burning_quarter_knife';
			take 'lane_arms';
			return [[
				Бросаем кинжал в богоизбранного.
			]];
		end;
		if what == lane_arms then
			walk 'killed_in_lane';
			return [[
				Пытаемся отобрать меч из рук богоизбранного.
			]];
		end;
	end;
}

-- Меч богоизбранного
lane_godchosens_sword = obj {
	nam = 'Меч';
	dsc = [[
		{мечом} в руке.
	]];
	act = function()
		return [[
		]];
	end;
	used = function(self, what)
		if what == burning_quarter_knife then
			walk 'killed_in_lane';
			return [[
				Пытаемся выбить меч из рук богоизбранного.
			]];
		end;
		if what == lane_arms then
			walk 'killed_in_lane';
			return [[
				Пытаемся отобрать меч из рук богоизбранного.
			]];
		end;
	end;
}

-- Тело горожанина
lane_dead_citizen = obj {
	nam = 'Тело горожанина';
	dsc = [[
		На земле лежит {тело горожанина}.
	]];
	act = [[
		Ты бросаешь быстрый взгляд на труп. На твой взгляд, он ничем
		не отличается от других таких же.
		^
		Ты узнаёшь своего сослуживца...
		С прежней жизнью покончено. Её остатки сгорели вместе с этим городом.
	]];
}
lane_dead_citizen:disable()

-- Мистический артефакт
lane_mystical_artifact = obj {
	nam = 'Амулет';
	inv = [[
		Ты рассматриваешь амулет. Тот слабо мерцает у тебя в руках.
	]];
}

-- TODO
-- Reflection:
-- Герой должен прийти к осознанию, того что его жизнь постоянно находится в руках чьих-то
-- чужих сил -- Режима (в который он вступил сам). Мысль о рождении в семье, которую он
-- уже не помнит.
--
-- Игра своим финалом должна напомнить игрокам, что безучастная жизнь в отрыве от каких
-- либо идеалов и идей ведёт к худшему концу для всех (ты становишься исполнителем
-- чужой воли и носителем чужих идей).
--
-- Показать крайность между равнодушием и амбициями.
--
-- Вина героя в том, что он не смог помешать планам капитана?;
--
-- Амулет (мистическое нечто) и голос? Стихи;
-- Цитирование второй половины стиха в финале (из диалогов птицы);
--
-- Нужно подвести игрока к выбору:
-- Ключевое деяние героя отсутсвие деяний даже, когда он пытается их совершить;
--
-- Мораль?:
-- Герой сегодняшнего мира -- винтик в механизме судьбы;
-- Кевраза через свою историю, которую он сравнивает с историей героем, должен подвести
-- игрока к сравнению с героем.
