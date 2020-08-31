-- Переменные локации
_burning_quarter_walking_dead = false;

-- Функции локации
-- Функция текста исчезновения проповедника
burning_quarter_priest_disappear = function()
	return [[
		^
		-- Червь решает сражаться? -- проповедник скрывает ухмылку за руковом рясы.
		^
		Его тряпьё растворяется в ночи, словно разлетевшаяся стая воронов.
		^
		-- Хорошо, давай сыграем в эту игру, -- шипит голос проповедника, -- пусть Она позабавится!
	]];
end;

-- Функция оживления проповедником мёртвых
burning_quarter_en_garde = function()
	_burning_quarter_walking_dead = true;

	objs('burning_quarter_fight'):del('burning_quarter_armed_corpses');

	objs('burning_quarter_fight'):del('burning_quarter_priest');
	objs('burning_quarter_fight'):del('burning_quarter_dagger');

	objs('burning_quarter_fight'):add('burning_quarter_zombies');
	objs('burning_quarter_fight'):add('burning_quarter_zombie_fighter');
	objs('burning_quarter_fight'):add('burning_quarter_zombie_thug');
	objs('burning_quarter_fight'):add('burning_quarter_zombie_guard');

	objs('burning_quarter_fight'):del('burning_quarter_knuckle');
	objs('burning_quarter_fight'):del('burning_quarter_knife');
	objs('burning_quarter_fight'):del('burning_quarter_halberd');

	return [[
		^
		Лоскуты-тени сгущаются в чёрном небе над трупами.
		Вихрями спустившись вниз, они вгрызаются в лица мертвецов.
		^
		На твоих глазах мертвые оживают и поднимаются на ноги.
	]];
end;

-- Разделываемся с мертвецами
burning_quarter_dmz = function()
	_burning_quarter_walking_dead = false;

	objs('burning_quarter_fight'):add('burning_quarter_priest');
	objs('burning_quarter_fight'):add('burning_quarter_dagger');

	objs('burning_quarter_fight'):del('burning_quarter_zombies');
	objs('burning_quarter_fight'):del('burning_quarter_zombie_fighter');
	objs('burning_quarter_fight'):del('burning_quarter_zombie_thug');
	objs('burning_quarter_fight'):del('burning_quarter_zombie_guard');

	return [[
		^
		Ты поворачиваешься, чтобы разделаться со вторым мертвецом,
		но не сразу его находишь.
		^
		Труп обнаруживается лежащим на земле, с головой пригвоздённой копьём.
		Ты замечаешь, как по древку странным образом поднимается тень.
		Добравшись до конца копья, тень струйкой дыма въётся к небу, свиваясь в облако дыма.
		Облако приходит в движение, и закружившись спиралью, опускается вниз,
		приобретая очертания проповедника.
		^
		-- Нам, кажется, помешали, -- брезгливо вытягивает тот, -- иначе бы ты уже был мёртв.
		^
		Ты смотришь за спину проповедника,
		туда где подножие склона квартала превратилось в пылающие руины.
		Где-то там следи пляшущего огня, ты видишь зыбкий силуэт человека в доспехах.
		Он ещё далеко, но неотвратимо приближается к вам.
	]];
end;

-- Меняем молот на другое оружие
burning_quarter_weapon_change = function()
	if have('burning_quarter_fight_hammer') then
		if have('burning_quarter_knuckle') or have('burning_quarter_knife') or have('burning_quarter_halberd') then
			drop 'burning_quarter_fight_hammer';
			objs(burning_quarter_fight):del('burning_quarter_fight_hammer');
			return [[
				Уступив ноящей боли в мышцах, ты отбрасываешь молот.
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
		local pd_text = burning_quarter_priest_disappear();
		return ([[
			Ты наклоняешься, и выдохнув поднимаешь молот.
		]] .. pd_text .. s);
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
			^
			О кольце и её метках.
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
			local pd_text = burning_quarter_priest_disappear();
			return ([[
				Тебя обуревает неожиданный приступ ярости.
				Тебе хочется взмахнуть своим тяжеленным молотом и смести этот ухмыляющийся ворох рванья.
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
				^
				Ты вываливаешься из тьмы обратно в горящий квартал и затравленно озираешься по сторонам.
				Проповедника нигде не видно.
			]] .. s);
		end;

		-- GO6
		local dagger_death_text = [[
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
			На одном из пальцев угольком тлеет золотое кольцо, приковывающее к себе взгляд.
			^
			Глядя на призрачное свечение кольца, тебе приходит в голову дерзкая мысль.
			Пусть проповедник и выше тебя ростом, и руки у него явно длиннее,
			ты можешь попробовать выбить у него кинжал.
		]];
	end;
	used = function(self, what)
		if what == burning_quarter_fight_hammer then
			drop 'burning_quarter_fight_hammer';
			objs('burning_quarter_fight'):del('burning_quarter_fight_hammer');
			return [[
				Не отрывая глаз от кольца, странным образом притягивающего твоё внимание, ты нападаешь.
				Вложив в удар всю силу, ты тычешь молотом как копьём прямо в руку с кинжалом.
				Но удар так и не достигает цели:
				скрюченные пальцы проповедника крепко удерживают молот.
				Ты пробуешь высвободить оружие, но безумная улыбка становится только шире.
				^
				Кольцо проповедника начинает сиять ещё ярче.
				Молот покрывается сетью трещин, а его рукоять наливается теплом.
				Прежде чем ты успеваешь хоть что-то понять, молот рассыпается в прах,
				а тебе под ноги падает раскалённая рукоять.
			]];
		end;

		-- GOx
		if what == burning_quarter_hands then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты отбрасываешь оружие в сторону, и прикидываешь как отвлечь внимание
				проповедника, чтобы отобрать у него кинжал.
				Подняв в воздух столб пыли, ты хватаешь с земли камень и швыряешь его
				прямо в оскал зубов.
				^
				Проповедник отмахивается от камня ладонью и подскакивает к тебе,
				ударяя кинжалом сверху. Ты перехватываешь его руку с клинком и пытаешься её вывернуть.
				Но лезвие продолжает сокращать расстояние к твоему сердцу.
				Скрюченные пальцы удерживают тебя за плечо, не давая убежать.
				^
				Тебе остаётся только наблюдать, как серая полоса металла вгрызается тебе в грудь.
			]];
		end;

		-- S10
		local priest_death_text = [[
				^
				-- Довольно! -- цедит проповедник, снова натягивая на искажённое болью лицо
				свою безумную улыбку, -- прими свою участь!
				^
				Он расправляет плечи, вытянув шею, и разводит руки в стороны.
				Не зная чего ещё ожидать от этого сумасшедшего, ты инстинктивно делаешь шаг назад.
				^
				Но проповедник ничего больше сделать не успевает.
				Красный всполох бъёт по глазам, и голова проповедника катится тебе под ноги.
				Его тело плавно оседает, и перед тобой оказывается закованный в броню воин
				с мечом в руке.
				^
				-- Ты дождался меня, дезертир, -- спокойно произносит богоизбранный.
		]];
		if what == burning_quarter_halberd then
			priest_death_text = [[
				Ты набрасываешься на проповедника с алебардой на перевес.
				Твой быстрый удар-обманка был нацелен прямо в бледную гримасу сумасшествия.
				Кинжал отводит секиру в сторону, и тогда ты проворачиваешь древко и резко
				дёргаешь алебарду на себя. Лезвие рассекает костлявую руку проповедника.
				^
				Описав широкую дугу, лезвие секиры обрушивается на клубок лохмотьев.
				Кинжал запаздывает, удар алебарды вырывает его из ладони проповедника
				вместе с несколькими пальцами.
				^
				Шипя проклятья, проповедник пятится, сжавшись от боли.
				Теперь он уже не кажется таким высоким.
			]] .. priest_death_text;
		end;
		if what == burning_quarter_knife then
			priest_death_text = [[
				Ты набрасываешься на проповедника, размахивая орочьим ножом.
				Твой быстрый удар-обманка был нацелен в ногу,
				но как только кинжал начинает парировать этот выпад,
				ты резко уводишь орочий нож вверх, рассекая костяшки пальцев остриём.
				Ты бьёшь снова, найскось, уже без обмана, и проповедник снова пытается парировать.
				^
				Шипя проклятья проповедник роняет на землю кинжал и несколько пальцев.
				Он отходит назад, сжавшись от боли, и уже не кажется таким высоким.
			]] .. priest_death_text;
		end;

		if (what == burning_quarter_halberd) or (what == burning_quarter_knife) then
			objs('burning_quarter_fight'):del('burning_quarter_priest');
			objs('burning_quarter_fight'):del('burning_quarter_dagger');

			objs('burning_quarter_fight'):add('burning_quarter_priest_dead');
			objs('burning_quarter_fight'):add('burning_quarter_dagger_dead');
			objs('burning_quarter_fight'):add('burning_quarter_ring');

			objs('burning_quarter_fight'):add('burning_quarter_godchosen');

			return priest_death_text;
		end;
	end;
}

-- Мёртвый проповедник
burning_quarter_priest_dead = obj {
	nam = 'Мёртвый проповедник';
	dsc = [[
		У тебя под ногами лежит {труп проповедника}.
	]];
	act = function()
		return [[
			Ты смотришь на обезглавленное тело в рваной рясе.
			Свернувшееся на земле среди лохмотьев, оно уже не кажется таким большим.
			^
			Ты находишь голову неподалёку. Лицо на ней сохранило прежние ликование и
			спятившую улыбку.
		]];
	end;
}

-- Кинжал мёртвого проповедника
burning_quarter_dagger_dead = obj {
	nam = 'Кинжал мёртвого проповедника';
	dsc = [[
		Рядом с ним валяется {кинжал} в окружении отрубленных пальцев.
	]];
	act = function()
		return [[
			Ты присматриваешься к кинжалу.
			Тебе начинает казаться, что его рукоять отделана золотом и драгоценными камнями.
			Тебе остаётся лишь догадываться откуда у этого оборванца такая дорогая вешь.
		]];
	end;
	used = function(self, what)
		-- GO8
		if what == burning_quarter_hands then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Странное чувство подмывает тебя подобрать кинжал.
				Его металл соблазнительно мерцает серым сиянием.
				Поддавшись слепому желанию, ты отбрасываешь своё оружие,
				чтобы поднять драгоценный клинок.
				^
				На дожидаясь пока ты завладеешь кинжалом, молния меча поражает тебя в шею.
				^
				-- Правосудие свершилось, -- произносит богоизбранный, вытирая
				клинок о твою одежду.
				^
				Но ты этого уже не слышишь.
			]];
		end;
	end;
}

-- Кольцо проповедника
burning_quarter_ring = obj {
	nam = 'Кольцо';
	dsc = [[
		На одном из них поблескивает {кольцо}.
	]];
	act = function()
		return [[
			Ты внимательно смотришь на кольцо, и в памяти вспыхивает воспоминание.
			Тот амулет, что ты нашёл в пещере, точно так же притягивал твой взгляд.
			^
			Тебе начинает казаться, что руки сами тянутся за кольцом.
		]];
	end;
	used = function(self, what)
		if what == burning_quarter_hands then
			local take_text = [[
				Ты встаёшь на колено, чтобы подобрать кольцо, и латник заносит над тобой меч.
				^
				-- Это прекрасно, что ты сам ищешь правосудия, -- громко произносит богоизбранный.
				^
				Ты едва успеваешь отпрыгнуть, когда меч глубоко вонзается в землю прямо перед тобой.
				Во взгляде латника читается осуждение.
				Ты вскакиваешь на ноги, зачем-то нацепив кольцо на палец.
				^
				Богоизбранный с усилием выдёргивает клинок из земли и сразу же отправляет его в бой.
			]];

			-- GO9
			if have('burning_quarter_halberd') then
				walk 'burning_quarter_part_II_gameover';
				return take_text .. [[
					Ты машинало закрываешься древком алебарды,
					но меч без труда разрубает его, оставив у тебя на груди кровавую полосу.
					Покачнувшись, ты уже не успеваешь отреагировать на следующий удар, крушащий тебе ключицу.
					^
					Ты падаешь на колени, ослепнув от боли и не видя занесённого над тобой меча.
				]];
			end;

			-- S11
			take 'burning_quarter_ring';
			objs('burning_quarter_fight'):del('burning_quarter_godchosen');
			objs('burning_quarter_fight'):add('burning_quarter_godchosen_down');
			return take_text .. [[
				Ты машинало закрываешься ножом урук-хай,
				и с удивлением видишь как латник отшатывается после удара,
				словно его меч налетел на стену.
				^
				Оправившись, он снова нападает,
				и полуторный меч сцепляется с орочьим ножом-переростком, высекая искры.
				Ухватившись за эфесы двумя руками, вы застыли в борьбе лицом к лицу.
				Ты смотришь как под шрамами и морщинами богоизбранного проступают вены.
				Твои мышцы переполняет сила, и стук крови в висках заглушает скрежет металла.
				Твоего противника, напротив, покидают силы.
				^
				Неожиданно меч уступает,
				и ты обрушиваешь на богозибранного всю накопившуюся в руках мощь.
				Закованный в броню латник как кукла летит на землю, громыхая и звеня.
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
			Ты осматриваешь взглядом трупы, по армейской привычке примечая какое-нибудь сносное оружие.
			Ближе всего к тебе покоится пара вооружённых урук-хай и стражник.
		]];
	end;
}

-- Зомби
burning_quarter_zombies = obj {
	nam = 'Зомби';
	dsc = [[
		Тебя обступают покачивающиеся мертвецы с оружием в окоченевших руках.
	]];
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
			Таким приспособлением можно без страха парировать удары от мечей и топоров,
			или даже попытаться задержать лезвие между гвоздей-шипов.
			Но врядли у тебя получится провести с этой штукой хороший удар.
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
			local pd_text = burning_quarter_priest_disappear();
			return (s1 .. [[
				Ты с трудом стягиваешь это подобие кастета с лапы орка,
				под насмешливым взглядом проповедника.
				Кое-как затянув ремни вокруг локтя, ты надеешься,
				что всё это не разлетиться после первого же удара.
			]] .. pd .. s);
		end;
	end;
}
burning_quarter_knuckle:disable();

-- Зомби боец урук-хай
burning_quarter_zombie_fighter = obj {
	nam = 'Зомби боец урук-хай';
	dsc = [[
		Бледный {урук-боец} не спускает с тебя взгляда неморгающих глаз.
	]];
	act = function()
		return [[
			Ты ловишь пустой взгляд мертвеца.
			Вокруг множества ран на его теле запеклась кровь.
			Только сейчас ты обращаешь внимание, что на этом орке совсем нет брони.
			Кастет, которым орк вооружён, выдает в нём бойца.
			Когда урук-хай, принимают в банду неопытного урук, его заставляют драться
			без брони с кастетами вместо оружия.
			^
			Ты ещё раз осматриваешь несуразное оружие орка.
			Таким кастетом можно легко отводить удары мечей и кинжалов, и увечить плоть.
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
				Ты подбегаешь к бойцу урук-хай с тесаком в руках
				и делаешь быстрый выпад, метя шею. Мертвец нелепо отклоняется назад
				и нож врезается под ему ключицу. Ты с трудом высвобождаешь оружие,
				едва успев подставить тесак под удар кастета.
				Лезвие ножа намертво застревает между шипами.
				Ты лишь напрасно теряешь время, в попытках вернуть своё оружие,
				и дав смердящему трупу схватить тебя свободной рукой за шею.
				Вместе с удушьем ты чувствуешь как твои пятки отрываются от земли.
				Брыкаясь ногами и колотя кулаком мертвецу по морде,
				ты не в силах ослабить хватку орочьей лапы.
				^
				Раскат боли от вонзившейся в спину алебарды лишает тебя чувств.
			]];
		end;

		-- S9
		if what == burning_quarter_halberd then
			local s = burning_quarter_dmz();
			return ([[
				Перехватив алебарду по-удобней, ты наотмашь рубишь ближайшего мертвеца.
				Урук-хай делает неуклюжую попытку защититься кастетом,
				но секира просто срезает ему кисть и чертит ещё одну чёрную полосу на широкой груди.
				^
				Второй удар ты наносишь сверху вниз, и алебарда без труда раскалывает
				голову нерасторопного орка. Мертвец падает на землю.
			]] .. s);
		end;

		-- GO2
		if what == burning_quarter_hands then
			-- walk 'burning_quarter_part_II_gameover';
			return [[
				Пока ты смотришь на пошатывающегося урук-бойца,
				тебе в голову приходит безумная мысль попытаться выбить у него кастет из руки.
				^
				Но глядя на шипы, ты решаешь отказаться от этой безнадёжной затеи.
			]];
		end;

		-- GO2
		if what == burning_quarter_fight_hammer then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Занеся молот над головой, ты нападаешь на ближайшего мертвеца.
				От ужасного удара голова урук-бойца просто лопается,
				но твоё ликование сменяется жгучей болью в боку.
				Мертвец успел всадить кастет тебе под рёбра.
				Урук-хай с разможённой головой падает на спину и едва не увлекает
				тебя за собой. С криком вырвав кастет из раны,
				ты оказываешься на коленях, не в силах больше пошевелиться.
				^
				Секира алебарды прерывает твои мучения.
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
			оружие и вправду походит на тесак.
			Таким запросто можно разрубить древко копья или запястье.
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
			local pd_text = burning_quarter_priest_disappear();
			return (s1 .. [[
				Ты разжимаешь дубовые пальцы урук-хай и забираешь нож.
				Он тяжеловат, как ты и ожидал, и хорошо заточен.
			]] .. pd_text .. s);
		end;
	end;
}
burning_quarter_knife:disable();

-- Зомби головорез урук
burning_quarter_zombie_thug = obj {
	nam = '';
	dsc = [[
		Утыканный стрелами {головорез} низко опустил голову, глядя себе под ноги.
	]];
	act = function()
		return [[
			Ты рассматриваешь головореза.
			Десяток стрел нисколько не мешает ему ковылять в твою сторону,
			размахивая здоровенным тесаком.
		]];
	end;
	used = function(self, what)
		-- GO3
		if what == burning_quarter_knuckle then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Обходя мертвеца с боку, ты бъёшь его кастетом в голову.
				Удар выходит неуклюжим, и ты едва не выворачиваешь себе кисть.
				На морде урук остаётся уродливый след от шипов и только.
				Ты повторяешь выпад, и на этот раз орк покачивается,
				но только для того чтобы полоснусть тебя ножём по руке.
				Она повисает плетью, и отвлёкшись на боль, ты не замечаешь как
				второй мертвец подступает к тебе сзади.
				Алебарда взлетает и опускается тебе на затылок.
			]];
		end;

		-- GO5
		if what == burning_quarter_halberd then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Перехватив алебарду по-удобней, ты наотмашь рубишь ближайшего мертвеца.
				Секира врезается в мясистое плечо урук-хай, и застревает в кости.
				В ответ головорез одним движением перерубает древко алебарды своим тесаком.
				С усилием ты выдёргиваешь секиру из смердящего трупа,
				и вонзаешь её в уродливую морду.
				^
				Твой победный крик обрывает удар кастета по затылку.
			]];
		end;

		-- GO2
		if what == burning_quarter_hands then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Пока ты смотришь на пошатывающегося урук-головореза,
				тебе в голову приходит безумная мысль попытаться выбить у него тесак из руки.
				^
				Ты обходишь мертвеца, и хватаешь его руку в захват.
				Но здоровенный орк, просто сбрасывает тебя.
				Упав на четвереньки, ты не успеваешь увернуться от тесака головореза.
			]];
		end;

		-- GO2
		if what == burning_quarter_fight_hammer then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Занеся молот над головой, ты нападаешь на ближайшего мертвеца.
				От ужасного удара голова урук-головореза просто лопается,
				но твоё ликование сменяется жгучей болью в боку.
				Мертвец успел всадить нож тебе под рёбра.
				Урук-хай с разможённой головой падает на спину и едва не увлекает
				тебя за собой. С криком вырвав тесак из раны,
				ты оказываешься на коленях, не в силах больше пошевелиться.
				^
				Секира алебарды прерывает твои мучения.
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
			local pd_text = burning_quarter_priest_disappear();
			return (s1 .. [[
				Ты отбираешь у мертвеца алебарду и делаешь пару пробных замахов.
				После пудового молота ты управляешься с ней на удивление легко.
			]] .. pd_text .. s);
		end;
	end;
}
burning_quarter_halberd:disable();

-- Зомби стражник
burning_quarter_zombie_guard = obj {
	nam = 'Зомби стражник';
	dsc = [[
		Позади тебя {выпотрошенный стражник} следит за твоими движениями, щёлкая тем,
		что осталось от челюстей.
	]];
	act = function()
		return [[
			Ты с омерзением смотришь на изуродованного стражника.
			Окровавленная алебарда у него в руках до сих пор выглядит грозно.
			Сложно будет подобраться близко к вооружённому подобным оружием.
			Хотя ты помнишь, как на войне урук-хай разрубали древки копий и пик.
			Может быть и у тебя получится что-то подобное.
		]];
	end;
	used = function(self, what)
		-- GO3
		if what == burning_quarter_knuckle then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты подскакиваешь к мертвецу и бъёшь его кастетом в месиво на месте рта.
				Удар выходит неуклюжим, и ты едва не выворачиваешь себе кисть.
				Но и этого хватает, чтобы бывший стражник полетел на землю.
				^
				Воодушевившись, ты с разбегу врезаешься в ходячий труп головореза.
				Кастет крушит орочьи клыки, но тот остаётся стоять на ногах.
				Ты повторяешь выпад, но выбрасываешь руку слишком далеко.
				Этой заминки хватает, чтобы урук успел полоснусть тебя ножём по руке.
				Она повисает плетью, и отвлёкшись на боль, ты не замечаешь как
				второй мертвец подползает к тебе сзади.
				Скрюченные пальцы смыкаются на твоей голени,
				и стражник со скрученной шеей дёргает тебя за ногу.
				Повалившись на колено, ты уже не успеваешь защититься от тесака головореза.
				Бурое лезвие рассекает тебе лицо, и глаза заливает кровью.
			]];
		end;

		-- S8
		if what == burning_quarter_knife then
			local s = burning_quarter_dmz();
			return ([[
				Ты бросаешься на бывшего стражника с ножом в руках и рубишь наотмашь.
				Орочий тесак с лёгкостью разрубает древко алебарды.
				Мертвец замахивается на тебя секирой, но ты ныряешь ему под руку,
				и пинком валишь на четвереньки.
				Тебе приходтся повозиться с ножом, чтобы угомонить труп окончательно.
			]] .. s);
		end;

		-- GO2
		if what == burning_quarter_hands then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Ты решаешь лишить мёртвого стражника его оружия.
				Ухватившись за древко, ты просто выхватываешь алебарду из скрюченных пальцев.
				Оттолкнув мертвеца, та замахиваешься для удара,
				но тот внезапно напрыгивает на тебя и сбивает с ног.
				В твою шею впиваются остатки зубов и обломки нижней челюсти.
				Ты пытаешься отбиться, от обезумевшего стражника,
				но силы покидают тебя вместе с кровю.
				Чёрное небо становится всё ближе, заполняя всё вокруг.
			]];
		end;

		-- GO2
		if what == burning_quarter_fight_hammer then
			walk 'burning_quarter_part_II_gameover';
			return [[
				Занеся молот над головой, ты нападаешь на ближайшего мертвеца.
				Удар молота сносит шатающегося стражника, раздробив ему грудную клетку.
				^
				Ты слышишь как сзади к тебе подбирается пара мёртвых урук-хай.
				Молот снова обрушивается на врага, но орк остаётся на ногах,
				несмотря на сломанные ключицу и рёбра.
				Чёрные пальцы смыкаются на рукояти молота, крепко удерживая твоё оружие.
				Ты разворачиваешься, чтобы поднять алебарду,
				но второй урук-хай оказывается неожиданно проворным.
				Тесак вонзается тебе под рёбра, на мгновение приподняв тебя над землёй.
				C засевшим в спине как крюк ножом, ты пытаешься спастись от надвигающейся смерти.
				Но огромная орочья лапа хватает тебя за голову, лишая зрения и возможности дышать.
			]];
		end;
	end;
}

-- Богоизбранный
burning_quarter_godchosen = obj {
	nam = 'Кевраза';
	dsc = [[
		^
		Напротив тебя стоит закованный в доспех {богоизбранный}.
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
