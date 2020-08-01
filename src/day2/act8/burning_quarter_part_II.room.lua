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


burning_quarter_dmz = function()
	objs('burning_quarter_fight'):add('burning_quarter_priest');
	objs('burning_quarter_fight'):add('burning_quarter_dagger');

	objs('burning_quarter_fight'):del('burning_quarter_zombie_fighter');
	objs('burning_quarter_fight'):del('burning_quarter_zombie_thug');
	objs('burning_quarter_fight'):del('burning_quarter_zombie_guard');

	return [[
		^
		Ты разворачиваешься, чтобы разделаться со вторым мертвецом,
		но внезапно осознаёшь, что в этом нет никакой необходимости --
		в его голове торчит огромное копьё, длинное и блестящее --
		безумно, невероятно блестящее посреди всех этих горящих домов,
		отражающее тебе в глаза всполохи пламени.
		^
		Из мертвеца вырывается бледная тень. Она закручивается спиралью чуть
		поодаль, быстро приобретая очертания проповедника. Он шипит и ругается
		сквозь зубы, но не похоже, что он настроен сдаваться.
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
		Наверняка когда-то его урук-хозяин с лёгкостью проламывал им черепа
		одной рукой. Но ты с трудом удерживаешь это страшилище в двух.
	]];
	tak = function()
		local s = burning_quarter_en_garde()
		return ([[
			Ты наклоняешься, чтобы подобрать молот.
		]] .. s)
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
		-- S4
		if what == burning_quarter_fight_hammer then
			s = burning_quarter_en_garde()
			return ([[
				Ты делаешь замах молотом, но проповедник даже не пытается
				уклониться от удара.
			]] .. s);
		end;

		-- GO6
		if (what == burning_quarter_halberd) or (what == burning_quarter_knife) then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты бросаешься на проповедника и наносишь ему прямой удар
				в область груди, но тот отбивает его с неожиданной прытью.
				Ты быстро понимаешь, что фехтовальщик из него лучше, чем из тебя.
				Ещё два быстрых удара лишают тебя равновесия, а неожиданный
				выпад снизу -- вспарывает тебе живот. Когда ты валишься на землю
				от безумной боли, проповедник милосердным ударом отрубает тебе
				голову.
			]]
		end
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

		-- S10
		if (what == burning_quarter_halberd) or (what == burning_quarter_knife) then
			objs('burning_quarter_fight'):del('burning_quarter_priest')
			objs('burning_quarter_fight'):del('burning_quarter_dagger')

			objs('burning_quarter_fight'):add('burning_quarter_priest_dead')
			objs('burning_quarter_fight'):add('burning_quarter_dagger_dead')
			objs('burning_quarter_fight'):add('burning_quarter_ring')

			objs('burning_quarter_fight'):add('burning_quarter_godchosen')

			return [[
				Ты бросаешься на проповедника и наносишь ему быстрый удар,
				целясь в кисть, держащую кинжал. Тот, похоже, ждал от тебя
				совсем другого -- он пытается закрыться, но недостаточно
				быстро, в результате чего подставляет руку под лезвие
				и теряет несколько пальцев. Грязно ругаясь, он роняет кинжал
				и отходит назад.
				^
				Знакомый голос за спиной заставляет тебя вздрогнуть.
				"Так-так. Какая интересная сцена."
				^
				Человек, выходящий под свет огней, кажется
				тебе слишком каким-то диким, неподходящим, не вписывающимся
				в эту обстановку. На его спине висит красный плащ,
				на правую руку надета белая перчатка, обшитая золотой нитью.
				Он делает шаг в твою сторону, и ты видишь на его ногах
				грубого вида сандалии с подошвами, выглядящими как деревянные.
				И ты узнаёшь этого человека.
			]]
		end
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
	used = function(self, what)
		-- GO8
		if what == burning_quarter_hands then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Решив, что тебе нужно другое оружие, ты наклоняешься,
				чтобы подобрать кинжал. В этот же момент
				человек в плаще резким движением вонзает оружие тебе в плечо.
				^
				Несмотря на это, ты всё-таки хватаешь кинжал, отпрыгиваешь и
				встаёшь в боевую стойку, но боль в плече отвлекает тебя и
				замедляет движения. Противник не балует тебя особым разнообразием
				техники -- сделав несколько пробных ударов, он наносит
				неожиданно сильный удар в область сердца. Закрыться ты
				не успеваешь.
			]]
		end
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
	used = function(self, what)
		if what == burning_quarter_hands then
			-- GO9
			if have('burning_quarter_halberd') then
				walk 'burning_quarter_part_II_gameover';
				return [[
					Ты наклоняешься, чтобы подобрать кольцо, и в этот же момент
					человек в плаще делает резкое движение, целясь оружием тебе
					в плечо. Ты пытаешься отбить удар, но алебарда оказывается
					слишком тяжёлой -- ты не успеваешь.
					^
					Ты отпрыгиваешь и
					встаёшь в боевую стойку, но боль в плече отвлекает и
					замедляет движения. Противник не балует тебя особым разнообразием
					техники -- он снова и снова делает быстрые удары, которые
					ты не успеваешь отбивать. Через несколько минут у тебя
					на теле красуется с десяток свежих ран.
					^
					Не в силах продолжать бой, ты валишься на землю.
				]]
			end;

			-- S11
			objs('burning_quarter_fight'):del('burning_quarter_godchosen')
			objs('burning_quarter_fight'):add('burning_quarter_godchosen_down')
			return [[
				Ты наклоняешься, чтобы подобрать кольцо, и в этот же момент
				человек в плаще делает резкое движение, целясь оружием тебе
				в плечо. Каким-то чудом ты успеваешь отбить удар. Схватив кольцо,
				ты отпрыгиваешь и встаёшь в боевую стойку.

				Твой противник наносит ещё два удара. Первый ты пропускаешь,
				получив в качестве награды ссадину на лбу, но на втором тебе
				удаётся удачно контратаковать, отбросив врага на землю.
			]]
		end;
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
		{Мёртвый урук} не спускает с тебя глаз.
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

		-- GO4
		if what == burning_quarter_knife then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты бросаешься на ближайшего мертвеца с мечом в руках
				и делаешь несколько быстрых выпадов, но тот каждый раз отбивает
				их своим тяжёлым кастетом. Ты пытаешься делать финты, но они
				тоже не оказываются слишком эффективными. Череда бесконечных
				взмахов и выпадов захватывает всё твоё внимание, и ты недостаточно
				быстро замечаешь, что второй мертвец куда-то исчез из поля
				зрения. Разворачиваешься слишком поздно: острое лезвие
				вспарывает тебе спину. Боль разливается по телу, и через
				несколько секунд второй удар лишает тебя головы.
			]]
		end

		-- S9
		if what == burning_quarter_halberd then
			local s = burning_quarter_dmz()
			return ([[
				Ты бросаешься на ближайшего мертвеца с алебардой и сравнительно
				легко выбиваешь из его рук оружие. Ещё один резкий замах --
				и дело сделано.
			]] .. s)
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
		-- GO2
		if what == burning_quarter_fight_hammer then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты решаешь напасть на мертвеца с молотом в руках, но это
				оружие оказывается слишком тяжёлым, чтобы драться с несколькими
				противниками сразу. Тебе просто не хватает скорости,
				и ты пропускаешь удар за ударом, постепенно покрываясь ранами
				и ссадинами. Ты не сдаёшься до последнего, но очередной удар
				валит тебя на землю, а следующий отзывается болью в груди
				и останавливает уставшее сердце.
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
		{Мёртвый головорез} изучает тебя взглядом.
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

		-- GO5
		if what == burning_quarter_halberd then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты бросаешься на ближайшего мертвеца с алебардой в руках,
				но это оружие оказывается слишком тяжёлым, чтобы реагировать
				на быстрые выпады ножа. Противнику хватает двух ударов, чтобы
				ранить тебя. Ты пытаешься собраться и встать в боевую стойку,
				несмотря на боль, но в это время второй мертвец наносит тебе удар
				в спину. Смерть оказывается мучительной.
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
		-- GO2
		if what == burning_quarter_fight_hammer then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты решаешь напасть на мертвеца с молотом в руках, но это
				оружие оказывается слишком тяжёлым, чтобы драться с несколькими
				противниками сразу. Тебе просто не хватает скорости,
				и ты пропускаешь удар за ударом, постепенно покрываясь ранами
				и ссадинами. Ты не сдаёшься до последнего, но очередной удар
				валит тебя на землю, а следующий отзывается болью в груди
				и останавливает уставшее сердце.
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
		{Мёртвый стражник} следит за твоими движениями, щёлкая тем, что
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

		-- S8
		if what == burning_quarter_knife then
			local s = burning_quarter_dmz()
			return ([[
				Ты бросаешься на ближайшего мертвеца с мечом в руках
				и делаешь несколько быстрых выпадов. Он пытается отбивать их
				своей алебардой, но твоё оружие намного легче и быстрее, поэтому
				ему удаётся это с большим трудом. Несколько обманных выпадов,
				изящно исполненный финт, удар, ещё удар -- и мертвец лишается
				головы.
			]] .. s)
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
		-- GO2
		if what == burning_quarter_fight_hammer then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты решаешь напасть на мертвеца с молотом в руках, но это
				оружие оказывается слишком тяжёлым, чтобы драться с несколькими
				противниками сразу. Тебе просто не хватает скорости,
				и ты пропускаешь удар за ударом, постепенно покрываясь ранами
				и ссадинами. Ты не сдаёшься до последнего, но очередной удар
				валит тебя на землю, а следующий отзывается болью в груди
				и останавливает уставшее сердце.
			]]
		end
	end;
}

-- Богоизбранный
burning_quarter_godchosen = obj {
	nam = 'Кевраза';
	dsc = [[
		^
		{Человек в плаще} стоит рядом с тобой, ухмыляясь.
	]];
	act = function()
		return [[
			Ты пытаешься вспомнить, но память отказывает тебе в этот момент.
			Кто же он такой?..
		]];
	end;
	used = function(self, what)
		-- GO7
		if (
			(what == burning_quarter_knuckle) or
			(what == burning_quarter_knife) or
			(what == burning_quarter_halberd) or
			(what == burning_quarter_hands) or
			(what == burning_quarter_fight_hammer)
		) then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты пытаешься напасть на человека в плаще, но быстро понимаешь,
				что этот противник тебе не по зубам. Он виртуозно обращается
				со своим оружием, настолько, что его движения больше
				похожи на танец, а удары быстры и точны.
				^
				Бой длится не больше минуты, и ты успеваешь пропустить два удара
				в голову. Пульс бешено стучит в висках, ты падаешь на землю,
				не в силах продолжать. Твой противник что-то говорит, но ты
				не в силах разобрать ни слова.
			]]
		end
	end;
}


burning_quarter_godchosen_down = obj {
	nam = 'Кевраза';
	dsc = [[
		^
		{Человек в плаще}, чертыхаясь, встаёт на ноги.
	]];
	act = function()
		return [[
			Ты пытаешься вспомнить, но память отказывает тебе в этот момент.
			Кто же он такой?..
		]];
	end;
	used = function(self, what)
		-- GO7
		if (
			(what == burning_quarter_knuckle) or
			(what == burning_quarter_knife) or
			(what == burning_quarter_halberd) or
			(what == burning_quarter_hands) or
			(what == burning_quarter_fight_hammer)
		) then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты пытаешься напасть на человека в плаще, но быстро понимаешь,
				что этот противник тебе не по зубам. Он виртуозно обращается
				со своим оружием, настолько, что его движения больше
				похожи на танец, а удары быстры и точны.
				^
				Бой длится не больше минуты, и ты успеваешь пропустить два удара
				в голову. Пульс бешено стучит в висках, ты падаешь на землю,
				не в силах продолжать. Твой противник что-то говорит, но ты
				не в силах разобрать ни слова.
			]]
		end
	end;
}


burning_quarter_away = obj {
	nam = 'Путь в переулок';
	dsc = [[
		Сзади тебя -- {переулок}.
		^
	]];
	act = function()
		-- GO10
		local godchosen_present = false
		for k, v in pairs(objs('burning_quarter_fight')) do
			if v == burning_quarter_godchosen then
				godchosen_present = true
			end
		end
		if godchosen_present then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты пытаешься сбежать в переулок, но удар в спину немножко
				мешает, а второй чёт вообще мешает очень сильно.
			]]
		end

		-- S11
		local godchosen_down_present = false
		for k, v in pairs(objs('burning_quarter_fight')) do
			if v == burning_quarter_godchosen_down then
				godchosen_down_present = true
			end
		end
		if godchosen_down_present then
			walk 'lane_room';
			return [[
				Оставив супостата позади, ты быстро ретируешься в переулок.
			]]
		end

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
