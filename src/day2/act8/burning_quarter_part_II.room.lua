-- Переменные локации

-- Функции локации
burning_quarter_en_garde = function()
	objs('burning_quarter_fight'):del('burning_quarter_priest');
	objs('burning_quarter_fight'):del('burning_quarter_dagger');

	objs('burning_quarter_fight'):add('burning_quarter_zombie_fighter');
	objs('burning_quarter_fight'):add('burning_quarter_zombie_thug');
	objs('burning_quarter_fight'):add('burning_quarter_zombie_guard');

	objs('burning_quarter_fight'):del('burning_quarter_knuckle');
	objs('burning_quarter_fight'):del('burning_quarter_knife');
	objs('burning_quarter_fight'):del('burning_quarter_halberd');

	return [[
		^
		Проповедник внезапно превращается в тень
		и радостно вселяется в ближайшие трупы. Они встают и
		с энтузиазмом выдвигаются в твою сторону.
	]]
end;

burning_quarter_weapon_change = function()
	-- TODO
end

-- Переходы локации
--burning_quarter_to_lane_room = vroom('Переулок', 'lane_room');

-- Локация
burning_quarter_fight = room {
	nam = 'Горящий квартал';
	dsc = [[
		Вокруг всё горит. Мечутся тени. Ото всяких там зданий отваливаются
		разные части.
	]];
	obj = {
		'burning_quarter_away';
		'burning_quarter_priest';
		'burning_quarter_dagger';
		-- 'burning_quarter_ring';
		'burning_quarter_knuckle';
		-- 'burning_quarter_zombie_fighter';
		'burning_quarter_knife';
		-- 'burning_quarter_zombie_thug';
		'burning_quarter_halberd';
		-- 'burning_quarter_zombie_guard';
		-- 'burning_quarter_godchosen';
	};
	enter = function()
		inv():zap();
		take 'burning_quarter_hands';
		take 'burning_quarter_fight_hammer';
		return [[
			^
			Небо как чёрная губка впитывает столбы дыма и пламя в себя.
		]];
	end;
	way = {
		--burning_quarter_to_lane_room;
	};
}


burning_quarter_hands = obj {
	nam = 'Руки';
	inv = [[
		Кулаки чешутся.
	]];
}


-- Молот
burning_quarter_fight_hammer = obj {
	nam = 'Молот урук-хай';
	dsc = [[
		^
		{Молот урук-хай} лежит на земле.
	]];
	act = [[
		Ты с отвращением осматриваешь уродливый молот урук-хай.
		Тупой кусок железа вместо навершия и грубая металлическая рукоять.
	]];
	inv = [[
		Ты с отвращением осматриваешь уродливый молот урук-хай.
		Тупой кусок железа вместо навершия и грубая металлическая рукоять.
		Наверняка, когда-то его урук-хозяин с лёгкостью проламывал им черепа
		одной рукой. Но ты с трудом удерживаешь это страшилище в двух.
	]];
	tak = function()
		burning_quarter_en_garde();
	end;
}

-- Объекты локации
-- Проповедник
burning_quarter_priest = obj {
	nam = 'Проповедник';
	dsc = [[
		{Проповедник} стоит вдали от тебя,
	]];
	act = function()
		return [[
			-- Червь, ничтожество, которое несмотря на это ставит себя в центр вселенной.
			^
			-- Ты когда-нибудь бывал на дне колодца. Когда весь мир сжимается в пятно белого
			света в кольце тьмы?
		]];
	end;
	used = function(self, what)
		if what == burning_quarter_fight_hammer then
			-- S4
			s = burning_quarter_en_garde()
			return ([[
				Ты делаешь замах молотом, но проповедник даже не пытается
				уклониться от удара.
			]] .. s);
		end;
	end;
}

-- Четырёхгранный кинжал проповедника
burning_quarter_dagger = obj {
	nam = 'Кинжал проповедника';
	dsc = [[
		держа {кинжал в правой руке}.
		^
	]];
	act = function()
		return [[
			Ты бросаешь косой взгляд на его бледную руку. На рукояти кинжала
			виден знак -- что-то вроде змеи.
		]];
	end;
	used = function(self, what)
		if what == burning_quarter_fight_hammer then
			drop 'burning_quarter_fight_hammer';
			return [[
				Ты делаешь удар молотом, целясь супостату в руку, но тот без
				особого труда перехватывает молот в полёте и одним движением
				бледных пальцев переламывает его пополам. Прежде чем ты
				успеваешь хоть что-то понять, молот рассыпается в прах.
			]];
		end;
	end;
}

burning_quarter_priest_dead = obj {
	nam = 'Мёртвый проповедник';
	dsc = [[
		Рядом лежит {труп проповедника}.
	]];
	act = function()
		return [[
			Ты плюёшь на мертвеца. Кайф.
		]];
	end;
}

burning_quarter_dagger_dead = obj {
	nam = 'Кинжал мёртвого проповедника';
	dsc = [[
		{Кинжал} выскользнул из его руки и теперь лежит на земле.
	]];
	act = function()
		return [[
			На рукояти кинжала
			виден знак - что-то вроде змеи.
		]];
	end;
}

-- Кольцо проповедника
burning_quarter_ring = obj {
	nam = 'Кольцо';
	dsc = [[
		Рядом валяются его отрубленные пальцы, на одном из которых
		поблескивает {кольцо}.
	]];
	act = function()
		return [[
		]];
	end;
}

-- Кастет урук-хай
burning_quarter_knuckle = obj {
	nam = 'Кастет урук-хай';
	dsc = [[
		Чуть поодаль лежит труп здорового урука с {кастетом} в руке.
	]];
	act = function()
		return [[
			Ты бросаешь взгляд на кастет. Неудобное, но грозное оружие.
		]];
	end;
	used = function(self, what)
		if what == burning_quarter_hands then
			-- Взять оружие
			objs('burning_quarter_fight'):del(self)
			inv():add(self)
			burning_quarter_weapon_change()
			-- Убрать одного зомбака
			burning_quarter_zombie_fighter:disable()
			-- Поднять остальных (S4 S5 S6 S7)
			s = burning_quarter_en_garde()
			return ([[
				Ты подбираешь тяжёлый кастет.
			]] .. s)
		end
	end;
}

-- Зомби боец урук-хай
burning_quarter_zombie_fighter = obj {
	nam = 'Зомби боец урук-хай';
	dsc = [[
		{Мёртвый урук} внимательно смотрит на тебя.
	]];
	act = function()
		return [[
			О бойцах урук-хай.
		]];
	end;
	used = function(self, what)
		-- GO3
		if what == burning_quarter_knuckle then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты пытаешься ударить мертвеца кастетом и осознаёшь, что совсем
				не умеешь обращаться с этим оружием. После пары неудачных
				замахов ты теряешь равновесие, и удар алебарды рассекает тебе
				артерию на шее. Смерть приходит быстро.
			]]
		end

		-- GO2
		if what == burning_quarter_hands then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты решаешь напасть на мертвеца с голыми руками. Довольно безрассудная
				затея, но ты пытаешься компенсировать недостаток стратегического
				мышления энтузиазмом и красотой исполнения. Тебе даже удаётся
				отобрать оружие у одного мертвеца и отбросить его на землю,
				но второй в этот же момент наносит удар тебе в спину.
			]]
		end
	end;
}

-- Нож головореза урук
burning_quarter_knife = obj {
	nam = 'Нож головореза урук';
	dsc = [[
		Где-то рядом лежит труп урука-головореза, около него -- {нож}.
	]];
	act = function()
		return [[
			Ты присматриваешься к орочьему ножу. Ну, это для орка он нож,
			для тебя это скорее кинжал.
		]];
	end;
	used = function(self, what)
		if what == burning_quarter_hands then
			-- Взять оружие
			objs('burning_quarter_fight'):del(self)
			inv():add(self)
			burning_quarter_weapon_change()
			-- Убрать одного зомбака
			burning_quarter_zombie_thug:disable()
			-- Поднять остальных (S4 S5 S6 S7)
			s = burning_quarter_en_garde()
			return ([[
				Ты подбираешь нож. Он тяжеловат, как ты и ожидал, но зато
				очень острый.
			]] .. s)
		end
	end;
}

-- Зомби головорез урук
burning_quarter_zombie_thug = obj {
	nam = '';
	dsc = [[
		{Мёртвый головорез} изучает тебя.
	]];
	act = function()
		return [[
		]];
	end;
	used = function(self, what)
		-- GO3
		if what == burning_quarter_knuckle then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты пытаешься ударить мертвеца кастетом и осознаёшь, что совсем
				не умеешь обращаться с этим оружием. После пары неудачных
				замахов ты теряешь равновесие, и удар алебарды рассекает тебе
				артерию на шее. Смерть приходит быстро.
			]]
		end

		-- GO2
		if what == burning_quarter_hands then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты решаешь напасть на мертвеца с голыми руками. Довольно безрассудная
				затея, но ты пытаешься компенсировать недостаток стратегического
				мышления энтузиазмом и красотой исполнения. Тебе даже удаётся
				отобрать оружие у одного мертвеца и отбросить его на землю,
				но второй в этот же момент наносит удар тебе в спину.
			]]
		end
	end;
}

-- Алебарда
burning_quarter_halberd = obj {
	nam = 'Алебарда';
	dsc = [[
		Чуть дальше лежит труп орка с {алебардой}.
	]];
	act = function()
		return [[
			Ты смотришь на алебарду. Ничё такая, острая.
		]];
	end;
	used = function(self, what)
		if what == burning_quarter_hands then
			-- Взять оружие
			objs('burning_quarter_fight'):del(self)
			inv():add(self)
			burning_quarter_weapon_change()
			-- Убрать одного зомбака
			burning_quarter_zombie_guard:disable()
			-- Поднять остальных (S4 S5 S6 S7)
			s = burning_quarter_en_garde()
			return ([[
				Ты подбираешь алебарду и делаешь пару пробных замахов.
				Ты довольно легко управляешься с ней, несмотря на вес.
			]] .. s)
		end
	end;
}

-- Зомби стражник
burning_quarter_zombie_guard = obj {
	nam = 'Зомби стражник';
	dsc = [[
		{Мёртвый стражник} смотрит внимательным взглядом, щёлкая тем, что
		осталось от челюстей.
	]];
	act = function()
		return [[
		]];
	end;
	used = function(self, what)
		-- GO3
		if what == burning_quarter_knuckle then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты пытаешься ударить мертвеца кастетом и осознаёшь, что совсем
				не умеешь обращаться с этим оружием. После пары неудачных
				замахов ты теряешь равновесие, и удар алебарды рассекает тебе
				артерию на шее. Смерть приходит быстро.
			]]
		end

		-- GO2
		if what == burning_quarter_hands then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты решаешь напасть на мертвеца с голыми руками. Довольно безрассудная
				затея, но ты пытаешься компенсировать недостаток стратегического
				мышления энтузиазмом и красотой исполнения. Тебе даже удаётся
				отобрать оружие у одного мертвеца и отбросить его на землю,
				но второй в этот же момент наносит удар тебе в спину.
			]]
		end
	end;
}

-- Богоизбранный
burning_quarter_godchosen = obj {
	nam = '';
	dsc = [[
		{}.
	]];
	act = function()
		return [[
		]];
	end;
}

burning_quarter_away = obj {
	nam = 'Путь в переулок';
	dsc = [[
		Сзади тебя -- {переулок}.
		^
	]];
	act = function()
		-- S2
		if have('burning_quarter_fight_hammer') then
			drop 'burning_quarter_fight_hammer';
			objs('burning_quarter_fight'):add('burning_quarter_fight_hammer');
			return [[
				Ты пытаешься сбежать в переулок, но проповедник с неожиданной
				прытью бросается за тобой вслед. Ты чувствуешь шаги прямо у себя
				за спиной и разворачиваешься как раз вовремя, чтобы отбить
				удар его кинжала. Ты пытаешься отбить и второй удар,
				но он оказывается настолько сильным, что бросает тебя навзничь.
				Молот валится из твоих рук на землю.
			]]
		end

		------------------------------ TODO

		-- in other cases, GO1
		walk 'burning_quarter_part_II_gameover';
		return [[
			Ты пытаешься сбежать в переулок, но тень проповедника бросается
			за тобой и холодной хваткой хватает и хреначит по хребту.
		]];
	end;
}

-- TODO
-- Ударить молотом:
-- Призрачное свечение кинжала натолкнуло тебя на мысль.
-- Хоть проповедник и выше тебя ростом, и руки у него явно длиннее, ты можешь
-- попробовать выбить из них кинжал.
-- ^
-- Не отрывая глаз от кольца, странным образом привлекающего твоё внимание,
-- ты бросаешся в атаку. Ты тычешь молотом как копьём, вкладывая в удар всю силу,
-- надеясь выбить кинжал. Но навершие молота словно натыкается на стену.
-- Рука проповедника перехватывает молот рукой.
-- И ты видишь, что кольцо стало блестеть ещё ярче;

-- Ударить молотом:
-- Тебя обуревает неожиданный приступ ярости. Почувствовав вес молота тебе хочется
-- смести этот ворох рванья. Ты срываешься с места и пускаешь молот в боковой удар,
-- дав левой руке скользить по рукояти. Ты ожидаешь услышать звук ломающихся
-- костей, но вместо этого молот увлекает тебя за собой. Так и не столкнувшись
-- с препятствием, он срывает чёрные лоскуты рясы. Они охватывают тебя со всех сторон.
-- ^
-- -- Неужели! В тебе есть гнев? Пожалуй мне стоит опасаться такого сильного противника,
-- -- слышишь ты смех проповедника. Несколько раз обернувшись, ты обнаруживаешь
-- себя в полной темноте,
-- -- посмотрим хватит ли твоей ярости надолго!

-- Подбираешь оружие:
-- -- Червь решает сражаться? -- шипит голос проповедника. Его тряпьё растворяется в ночи,
-- словно разлетевшаяся стая воронов, -- я уничтожу тебя!
-- ^
-- Лоскуты-тени сгущаются в чёрном небе над трупами. Вихрем спустившись вниз они вгрызаются
-- в их лица. на твоих глазах мертецы оживают и поднимаются на ноги. Двое урук-хай и стражник.

-- Взаимодействие с проповедником:
-- -- Откуда ты всё это знаешь?
-- -- Тени вездесущи: их отбрасывает что угодно.
