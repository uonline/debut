-- Переменные локации
_burning_quarter_walking_dead = false;

-- Функции локации
-- Функция оживления проповедником мёртвых
burning_quarter_en_garde = function()
	_burning_quarter_walking_dead = true;

	objs('burning_quarter_fight'):del('burning_quarter_armed_corpses');

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
		-- Червь решает сражаться? -- шипит голос проповедника. Его тряпьё растворяется в ночи,
		словно разлетевшаяся стая воронов, -- я уничтожу тебя!
		^
		Лоскуты-тени сгущаются в чёрном небе над трупами. Вихрем спустившись вниз они вгрызаются
		в их лица. на твоих глазах мертецы оживают и поднимаются на ноги. Двое урук-хай и стражник.
	]];
end;

-- Разделываемся с мертвецами
burning_quarter_dmz = function()
	_burning_quarter_walking_dead = false;

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
	]];
end;

-- Меняем молот на другое оружие
burning_quarter_weapon_change = function()
	if have('burning_quarter_fight_hammer') then
		if have('burning_quarter_knuckle') or have('burning_quarter_knife') or have('burning_quarter_halberd') then
			drop 'burning_quarter_fight_hammer';
			objs(burning_quarter_fight):del('burning_quarter_fight_hammer');
			return [[
				Решив, что молот не очень полезен в этой ситуации, ты бросаешь его
				куда-то в сторону.
				^
			]];
		end;
	end;
	return ''
end

-- Переходы локации
--burning_quarter_to_lane_room = vroom('Переулок', 'lane_room');

-- Локация
burning_quarter_fight = room {
	nam = 'Горящий квартал';
	dsc = [[
		Ты стоишь посреди охваченного пламенем квартала.
		Над тобой чёрная воронка неба впитывает в себя столбы дыма и языки огня.
		Грохот и треск рушащихся зданий смешивается с рёвом бушующего пожара.
	]];
	obj = {
		'burning_quarter_away';
		'burning_quarter_priest';
		'burning_quarter_dagger';
		-- 'burning_quarter_ring';
		'burning_quarter_armed_corpses';
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
	end;
	way = {
		--burning_quarter_to_lane_room;
	};
}

-- Инвентарь
-- Руки
burning_quarter_hands = obj {
	nam = 'Руки';
	inv = [[
		Ты с волнением смотришь на свои измождённые руки.
		Взмахи неприподъёмным орочьим молотом наполнили их свинцовой тяжестью.
		Даёт о себе знать и накопившаяся за день усталось.
	]];
}

-- Объекты локации
-- Молот
burning_quarter_fight_hammer = obj {
	nam = 'Молот урук-хай';
	dsc = [[
		^
		Громоздкий {молот урук-хай} у тебя под ногами будто бы врос в землю.
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
		local s = burning_quarter_en_garde();
		return ([[
			Ты наклоняешься, и выдохнув поднимаешь молот.
		]] .. s);
	end;
}

-- Путь в переулок
burning_quarter_away = obj {
	nam = 'Путь в переулок';
	dsc = [[
		Позади тебя -- {проход в переулок}, сопротивляется пожирающему всё вокруг огню.
		^
	]];
	act = function()
		-- GO10
		local godchosen_present = false;
		-- Проверяем, есть ли на сцене Богоизбранный
		for k, v in pairs(objs('burning_quarter_fight')) do
			if v == burning_quarter_godchosen then
				godchosen_present = true;
				break;
			end
		end
		-- Если на сцене есть Богоизбранный, то он убивает героя, при попытке сбежать в Переулок
		if godchosen_present then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты пытаешься сбежать в переулок, но удар в спину немножко
				мешает, а второй чёт вообще мешает очень сильно.
			]];
		end;

		-- S11
		-- Проверяем есть ли на сцене "упавший Богоизбранный"
		local godchosen_down_present = false;
		for k, v in pairs(objs('burning_quarter_fight')) do
			if v == burning_quarter_godchosen_down then
				godchosen_down_present = true;
			end;
		end;
		-- Если есть, то спасаемся бегством в Переулок
		if godchosen_down_present then
			walk 'lane_room';
			return [[
				Оставив супостата позади, ты быстро ретируешься в переулок.
			]];
		end;

		-- S2
		-- Если пытаемся сразу сбежать с молотом
		if have('burning_quarter_fight_hammer') and (not _burning_quarter_walking_dead) then
			drop 'burning_quarter_fight_hammer';
			objs('burning_quarter_fight'):add('burning_quarter_fight_hammer');
			return [[
				Не долго думая, ты резко разворачиваешься на пятках и бросаешься в переулок.
				Но непостижимым образом на месте чернеющего среди руин прохода, оказывается
				жуткая фигура проповедника в изорванной рясе.
				^
				С разбегу ты натыкаешься грудью на кулак, и тут же повисаешь на нём, обмякнув.
				Разом выпустив из лёгких весь воздух и по-рыбьи разевая рот,
				ты всё же удерживаешь молот в руках.
				И от этого безумная улыбка на бледном лице становится только шире.
				^
				Проповедник легонько толкает тебя в плечо,
				но ты летишь на землю и проезжаешь метр на спине.
				Молот вырывается из твоих пальцев, и падает в грязь.
			]];
		end;

		-- in other cases, GO1
		-- Умираем в Переулке
		walk 'burning_quarter_part_II_gameover';
		return [[
			Не долго думая, ты резко разворачиваешься на пятках и бросаешься в переулок.
			^
			Пробравшись через завал, ты видишь где-то впереди во мраке пятно, похожее
			на канализационную решётку. Ты отбрасываешь молот в сторону и устремляешься
			к спасительному спуску, не замечая как танцующие тени вокруг начинают удлинняться.
			^
			Резкий скрежещущий голос, заставляет тебя остановиться.
			^
			-- Ничтожный глупец, -- шепчет тебе в ухо проповедник,
			-- что может быть наивней, чем прятаться от тени в темноте!
			^
			Ты снова бежишь к решётке, хотя уже не видишь её в сгущающейся тьме.
			^
			Тонкой нитью боль неторопливо просачивается тебе под рёбра,
			разливая неприятное тепло в боку и вниз по ноге.
			Ты спотыкаешься и падаешь на колени.
			^
			Последнее, что ты чувствуешь: лед лезвия кинжала на горле.
		]];
	end;
}

-- Проповедник
burning_quarter_priest = obj {
	nam = 'Проповедник';
	dsc = [[
		Перед тобой возвышается {проповедник}, объятый вихрем из чёрных
		лохмотьев.
	]];
	act = function()
		-- Условие, при котором проповедник говорит разные фразы
		return [[
			-- Червь, ничтожество, которое несмотря на это ставит себя в центр вселенной.
			^
			-- Ты когда-нибудь бывал на дне колодца? Когда весь мир сжимается в пятно белого
			света в кольце тьмы?
			^
			-- Откуда ты всё это знаешь?
			-- Тени вездесущи: их отбрасывает что угодно.
		]];
	end;
	used = function(self, what)
		-- GOx
		if what == burning_quarter_hands then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты решаешь напасть на проповедника с голыми руками.
				Довольно безрассудная затея, но ты пытаешься компенсировать
				недостаток стратегического
				мышления энтузиазмом и красотой исполнения. Но тому хватает
				двух ударов, чтобы нанести тебе две несовместимые с жизнью раны.
			]];
		end;

		-- S4
		if what == burning_quarter_fight_hammer then
			local s = burning_quarter_en_garde();
			return ([[
					Тебя обуревает неожиданный приступ ярости.
					Тебе хочется взмахнуть своим тяжеленным молотом и смести этот ворох рванья.
					^
					Ты срываешься с места и пускаешь оружие в боковой удар, дав левой руке скользить по рукояти.
					Ты ожидаешь услышать звук ломающихся костей, но вместо этого молот увлекает тебя за собой.
					^
					Так и не столкнувшись с препятствием, оружие лишь срывает чёрные лоскуты рясы.
					Изорванная ткань облепляет тебя со всех сторон.
					^
					-- Неужели!? В тебе есть гнев? -- раздаётся ликующий возглас проповедника,
					сменяющийся смехом, -- пожалуй мне стоит опасаться такого свирепого противника!
					^
					Ты машешь рукой, пытаясь высвободиться из опутавших тебя лохмотьев,
					но избавившись от пут, обнаруживаешь себя в полной темноте.
					^
					-- Это должно остудить твою ярость, -- шепчет проповедник.
			]] .. s);
		end;

		-- GO6
		dagger_death_text = [[
			^
			Отвратительно улыбаясь, проповедник надвигается на тебя, занося клинок для удара.
			Ты вскидываешь руки, чтобы закрыться, но бесполезно.
			С чёрного неба прямо тебе на грудь пикирует хищный кинжал, без труда достигая сердца.
		]];
		if (what == burning_quarter_knife) then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты набрасываешься на проповедника, размахивая орочьим ножом.
				Ты бьёшь снизу вверх, рассчитывая вспороть ему грудную клетку.
				Но появившийся на пути твоего ножа кинжал, легко отводит удар в сторону.
				Проповедник усмехается тебе в лицо. Выдохнув, ты наносишь новый удар,
				заходя с боку. Кинжал в бледной руке сталкивается с ножом урук-хай,
				после чего ты пятишься, пошатываясь и потирая онемевшую руку.
			]] .. dagger_death_text;
		end;
		if (what == burning_quarter_halberd) then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты набрасываешься на проповедника с алебардой на перевес.
				Описав широкую дугу, лезвие секиры обрушивается на клубок лохмотьев.
				Но выставленный кинжал с лёгкостю отражает твой удар.
				Ты отступаешь, пытаясь удержать в немеющих руках дрожащее древко.
			]] .. dagger_death_text;
		end;
	end;
}

-- Четырёхгранный кинжал проповедника
burning_quarter_dagger = obj {
	nam = 'Кинжал проповедника';
	dsc = [[
		На его белом как мел лице играет хорошо знакомая тебе безумная улыбка.
		Хищно мерцает {кинжал в руке}.
		^
	]];
	act = function()
		return [[
			Ты бросаешь косой взгляд на его меловую руку.
			Длинные пальцы впиваются в рукоясь кинжала,
			на клинке которого виден узор, изображающий нечто вроде змеи.
			На одном из пальцев угольком тлеет золотое кольцо,
			приковывающее к себе взгляд.
		]];
	end;
	used = function(self, what)
		if what == burning_quarter_fight_hammer then
			drop 'burning_quarter_fight_hammer';
			objs('burning_quarter_fight'):del('burning_quarter_fight_hammer');
			return [[
				Призрачное свечение кинжала наталкивает тебя на мысль.
				Хоть проповедник и выше тебя ростом, и руки у него явно длиннее, ты можешь
				попробовать...
				^
				Не отрывая глаз от кольца, странным образом привлекающего твоё внимание,
				ты бросаешся в атаку. Ты тычешь молотом как копьём, вкладывая в удар всю силу,
				надеясь выбить кинжал. Но навершие молота словно натыкается на стену.
				Рука проповедника перехватывает молот рукой.
				И ты видишь, что кольцо стало блестеть ещё ярче;ть выбить из них кинжал.
				^
				Ты делаешь удар молотом, целясь супостату в руку, но тот без
				особого труда перехватывает молот в полёте и одним движением
				бледных пальцев переламывает его пополам. Прежде чем ты
				успеваешь хоть что-то понять, молот рассыпается в прах.
			]];
		end;

		-- GOx
		if what == burning_quarter_hands then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты решаешь напасть на проповедника с голыми руками.
				Довольно безрассудная затея, но ты пытаешься компенсировать
				недостаток стратегического
				мышления энтузиазмом и красотой исполнения. Но тому хватает
				двух ударов, чтобы нанести тебе две несовместимые с жизнью раны.
			]];
		end;

		-- S10
		-- Текст зависит от оружия
		if (what == burning_quarter_halberd) or (what == burning_quarter_knife) then
			objs('burning_quarter_fight'):del('burning_quarter_priest');
			objs('burning_quarter_fight'):del('burning_quarter_dagger');

			objs('burning_quarter_fight'):add('burning_quarter_priest_dead');
			objs('burning_quarter_fight'):add('burning_quarter_dagger_dead');
			objs('burning_quarter_fight'):add('burning_quarter_ring');

			objs('burning_quarter_fight'):add('burning_quarter_godchosen');

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
			]];
		end;
	end;
}

-- Мёртвый проповедник
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

-- Кинжал мёртвого проповедника
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
			]];
		end;
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
				]];
			end;

			-- S11
			take 'burning_quarter_ring';
			objs('burning_quarter_fight'):del('burning_quarter_godchosen');
			objs('burning_quarter_fight'):add('burning_quarter_godchosen_down');
			return [[
				Ты наклоняешься, чтобы подобрать кольцо, и в этот же момент
				человек в плаще делает резкое движение, целясь оружием тебе
				в плечо. Каким-то чудом ты успеваешь отбить удар. Схватив кольцо,
				ты отпрыгиваешь и встаёшь в боевую стойку.

				Твой противник наносит ещё два удара. Первый ты пропускаешь,
				получив в качестве награды ссадину на лбу, но на втором тебе
				удаётся удачно контратаковать, отбросив врага на землю.
			]];
		end;
	end;
}

-- Трупы с оружием
burning_quarter_armed_corpses = obj {
	nam = 'Трупы';
	dsc = [[
		Вокруг вас раскиданы {трупы} людей и орков.
		Некоторые из них сжимают в окоченевших руках оружие.
	]];
	act = function()
		burning_quarter_knuckle:enable();
		burning_quarter_knife:enable();
		burning_quarter_halberd:enable();
		burning_quarter_armed_corpses:disable();

		return [[
			Ты отыскиваешь взглядом...
		]];
	end;
}

-- Кастет урук-хай
burning_quarter_knuckle = obj {
	nam = 'Кастет урук-хай';
	dsc = [[
		Чуть поодаль лежит труп здоровенного урука с {кастетом} в руке.
	]];
	act = function()
		return [[
			Ты бросаешь взгляд на бандита и его странное оружие.
			Похоже, что орк сваял свой кастет из солдатского шлема, гвоздей и ремней.
			Таким приспособлением можно без страха парировать удары от мечей и топоров.
		]];
	end;
	used = function(self, what)
		if what == burning_quarter_hands then
			-- Взять оружие
			objs('burning_quarter_fight'):del(self);
			inv():add(self);
			local s1 = burning_quarter_weapon_change();
			-- Убрать одного зомбака
			burning_quarter_zombie_fighter:disable();
			-- Поднять остальных (S4 S5 S6 S7)
			local s = burning_quarter_en_garde();
			return (s1 .. [[
				Ты с трудом стягиваешь это подобие кастета с лапы орка,
				под насмешливым взглядом проповедника.
				Кое-как затянув ремни вокруг локтя, ты надеешься,
				что всё это не разлетиться после первого же удара.
			]] .. s);
		end;
	end;
}
burning_quarter_knuckle:disable();

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
			]];
		end;

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
			]];
		end;

		-- S9
		if what == burning_quarter_halberd then
			local s = burning_quarter_dmz();
			return ([[
				Ты бросаешься на ближайшего мертвеца с алебардой и сравнительно
				легко выбиваешь из его рук оружие. Ещё один резкий замах --
				и дело сделано.
			]] .. s);
		end;

		-- GO2
		if what == burning_quarter_hands then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты решаешь напасть на мертвеца с голыми руками. Довольно безрассудная
				затея, но ты пытаешься компенсировать недостаток стратегического
				мышления энтузиазмом и красотой исполнения. Тебе даже удаётся
				отобрать оружие у одного мертвеца и отбросить его на землю,
				но второй в этот же момент наносит удар тебе в спину.
			]];
		end;

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
			]];
		end;
	end;
}

-- Нож головореза урук
burning_quarter_knife = obj {
	nam = 'Нож головореза урук';
	dsc = [[
		Рядом распласталось тело головореза урук-хай. В его кулаке зажат {большой нож}.
	]];
	act = function()
		return [[
			Ты присматриваешься к широкому лезвию орочьего ножа.
			По людским меркам, это полноценный короткий меч, но в руке орка
			оружие и в правду походит на нож.
		]];
	end;
	used = function(self, what)
		if what == burning_quarter_hands then
			-- Взять оружие
			objs('burning_quarter_fight'):del(self);
			inv():add(self);
			local s1 = burning_quarter_weapon_change();
			-- Убрать одного зомбака
			burning_quarter_zombie_thug:disable();
			-- Поднять остальных (S4 S5 S6 S7)
			local s = burning_quarter_en_garde();
			return (s1 .. [[
				Ты разжимаешь дубовые пальцы урук-хай и забираешь нож.
				Он тяжеловат, как ты и ожидал, и хорошо заточен.
			]] .. s);
		end;
	end;
}
burning_quarter_knife:disable();

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
			]];
		end;

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
			]];
		end;

		-- GO2
		if what == burning_quarter_hands then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты решаешь напасть на мертвеца с голыми руками. Довольно безрассудная
				затея, но ты пытаешься компенсировать недостаток стратегического
				мышления энтузиазмом и красотой исполнения. Тебе даже удаётся
				отобрать оружие у одного мертвеца и отбросить его на землю,
				но второй в этот же момент наносит удар тебе в спину.
			]];
		end;

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
			]];
		end;
	end;
}

-- Алебарда
burning_quarter_halberd = obj {
	nam = 'Алебарда';
	dsc = [[
		В другой стороне валяется растерзанный стражник,
		так и не расставшийся со своей {алебардой}.
	]];
	act = function()
		return [[
			Ты изучаешь алебарду взглядом.
			Лезвие и древко оружия покрыто густой орочьей кровью.
		]];
	end;
	used = function(self, what)
		if what == burning_quarter_hands then
			-- Взять оружие
			objs('burning_quarter_fight'):del(self);
			inv():add(self);
			local s1 = burning_quarter_weapon_change();
			-- Убрать одного зомбака
			burning_quarter_zombie_guard:disable();
			-- Поднять остальных (S4 S5 S6 S7)
			local s = burning_quarter_en_garde();
			return (s1 .. [[
				Ты отбираешь у мертвеца алебарду и делаешь пару пробных замахов.
				После пудового молота ты управляешься с ней на удивление легко.
			]] .. s);
		end;
	end;
}
burning_quarter_halberd:disable();

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
			]];
		end;

		-- S8
		if what == burning_quarter_knife then
			local s = burning_quarter_dmz();
			return ([[
				Ты бросаешься на ближайшего мертвеца с мечом в руках
				и делаешь несколько быстрых выпадов. Он пытается отбивать их
				своей алебардой, но твоё оружие намного легче и быстрее, поэтому
				ему удаётся это с большим трудом. Несколько обманных выпадов,
				изящно исполненный финт, удар, ещё удар -- и мертвец лишается
				головы.
			]] .. s);
		end;

		-- GO2
		if what == burning_quarter_hands then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты решаешь напасть на мертвеца с голыми руками. Довольно безрассудная
				затея, но ты пытаешься компенсировать недостаток стратегического
				мышления энтузиазмом и красотой исполнения. Тебе даже удаётся
				отобрать оружие у одного мертвеца и отбросить его на землю,
				но второй в этот же момент наносит удар тебе в спину.
			]];
		end;

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
			]];
		end;
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
			]];
		end;
	end;
}

-- Богоизрабнный после падения
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
			]];
		end;
	end;
}
