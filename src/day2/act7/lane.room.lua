lane_room = room {
	nam = 'Переулок';
	dsc = [[
		Вы перебрались через телегу, которая уже начинает заниматься огнем. В последний момент ты видишь как на квартал забегает Кевраза с отрядом стражников. Богоизбранный замечает тебя, вырывает копье у солдата и отправляет в полет. К счастью, тебе удается вовремя спрыгнуть и копье пролетает выше. На квартале становятся слышны новые крики и лязг оружия. Ты понимаешь, что это подоспели орки и нужно торопиться.
	]];
	obj = {
		'covered_hatch';
		'huge_beam';
		'pile_of_boxes';
		'lane_spear';
		'pile_of_trash';
		'dead_citizen';
	};
	enter = function()
		take 'lane_arms';
	end;
}

lane_arms = obj {
	nam = 'Руки';
	inv = [[
		Некоторые вещи ты всегда носишь с собой.
	]];
}

function lane_hatch_is_covered()
	return not huge_beam:disabled() or not pile_of_boxes:disabled();
end

not_sure_if_can_leave = [[
	Можно открывать, но шестое чувство подсказывает тебе,
	что тут ещё осталось что-то полезное.
]]

covered_hatch = obj {
	nam = 'Люк';
	dsc = [[
		Под кучей обломков виднеется {люк}.
	]];
	act = function()
		if lane_hatch_is_covered() then
			return [[Завален хламом, не подобраться.]];
		elseif not pile_of_trash:disabled() then
			return not_sure_if_can_leave;
		else
			return [[Можно открывать.]];
		end
	end;
	used = function(self, what)
		if what == lane_arms then
			if lane_hatch_is_covered() then
				return [[Завален хламом, не подобраться.]];
			elseif not pile_of_trash:disabled() then
				return not_sure_if_can_leave;
			else
				walk 'the_end';
			end
		end
	end;
}

huge_beam = obj {
	nam = 'Огромная балка';
	dsc = [[
		Прямо на нём лежит {огромная балка}.
	]];
	act = [[
		Тяжёлая.
	]];
	used = function(self, what)
		if what == lane_spear then
			self:disable()
			return [[
				Ты втиснул копьё под балку и, используя его как рычаг, отодвинул балку в сторону.
			]]
		end
	end;
}

pile_of_boxes = obj {
	nam = 'Груда ящиков';
	dsc = [[
		Сверху накидана {груда каких-то ящиков}.
	]];
	used = function(self, what)
		if what == lane_arms then
			self:disable()
			return [[
				Ты раскидал ящики в разные стороны.
			]]
		end
	end;
}

pile_of_trash = obj {
	nam = 'Куча хлама';
	dsc = [[
		У стены лежит {груда какого-то хлама}.
	]];
	used = function(self, what)
		if what == lane_arms then
			self:disable()
			take 'mystical_artifact';
			return [[
				Ты немного пошарил в куче и обнаружил какой-то непонятный предмет.
			]]
		end
	end;
}

lane_spear = obj {
	nam = 'Копьё';
	dsc = [[
		Неподалёку торчит пролетевшее мимо {копьё}.
	]];
	tak = [[
		Пригодится.
	]];
	used = function(self, what)
		if what == lane_arms then
			take 'lane_spear';
			return self.tak;
		end
	end;
}

dead_citizen = obj {
	nam = 'Тело горожанина';
	dsc = [[
		На земле лежит {тело горожанина}.
	]];
	act = [[
		Оно ему уже не понадобится.
	]];
}

mystical_artifact = obj {
	nam = 'Мистический артефакт';
	dsc = [[
		Испускает поток лучистой загадочности.
	]];
}
