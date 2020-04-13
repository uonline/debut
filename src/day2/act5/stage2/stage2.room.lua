-- Переменные локации
_tower_stage2_where_is_halfblood = true;
_tower_stage2_skeleton_is_dropped = false;   -- признак осмотра ящиков со скелетом
_tower_stage2_skeleton_is_bewitched = false;
_tower_stage2_skeleton_is_broken = false;
_tower_stage2_new_loop_puzzle = false;       -- признак отслеживающий новое прохождение загадок в текущем цикле прохождения башни
_tower_stage2_current_puzzle_number = 1;     -- признак отслеживающий загадку для текущего прохождения

-- События
on_event('thieves leader disappeared', function()
	tower_stage2_thieves_leader:disable();
end)

on_event('skeleton was bited', function()
	-- Включаем диалог о кинжале для квеста
	tower_stage2_stock_storekeeper_dlg:pon('book_guard_quest');
	_tower_stage2_stock_dagger_quest = true;
end)

-- Локация
tower_stage2 = room {
	nam = 'Башня';
	dsc = function()
		ret = [[
			После продолжительного винтового пролёта
		]];

		-- Описание этажа
		tower_stage2_def=[[
			...
		]];

		-- Проверяем не пропал ли ещё главарь
		if tower_stage2_thieves_leader:disabled() then
			--когда пропал главарь, убираем заодно и текст про полукровку
			return ret .. 'ты оказываешься на следующем этаже башни.';
		else
			return ret .. [[ вы оказываетесь на следующем этаже ... и обнаруживаете, что Полукровка исчезла.
				^
				Пока вы поднимались, ты был абсолютно уверен, что она идёт за тобой.
				Тебе даже казалось, что ты чувствовал, как она подталкивает тебя в спину ледяным
				взглядом своих необычных глаз.
				^
				В замешательстве ты отступаешь назад на лестницу, но там тебя ждёт лишь тишина.
				Озадченный, ты возвращаешься к главарю.
			]];
		end
	end;
	entered = function()
		-- Test
		inv():add 'tower_stone';
		inv():add 'capitan_docs';
	end;
	obj = {
		'tower_stage2_windows';
		'tower_stage2_thieves_leader';
		'tower_stage2_some_stuff';
	};
	way = {
		'tower_stage2_stock_room';
		vroom('Лестница', 'tower_stage3');
	};
}

-- Переходы
-- Склад
tower_stage2_stock_room = room {
	nam = 'Склад';
	enter = function()
		-- Главарь подполья не даёт нам проверить склад
		if tower_stage2_thieves_leader:disabled() then
			-- Переходим в склад
			walk 'tower_stage2_stock';
		else
			return [[
				-- Похоже, эта дверь ведёт на какой-то склад, -- замечаешь ты.
				^
				-- У нас нет на это времени, -- нетерпеливо отзывается главарь,
				-- нужно подниматься выше.
				^
			]], false
		end;
	end;
}

-- Объекты локации
-- Окна под потолком
tower_stage2_windows = obj {
	nam = 'Окна';
	dsc = [[
		Мягкий предзакатный свет пробирается в башню через узкие {окна} под потолком.
		Одно из них раскрыто, и солнечные лучи льются на пол, словно, золотистый водопад.
	]];
	act = function()
		return [[
			Ты осматриваешь окна, любуясь видом. Некоторые, как и на первом этаже, украшены
			витражами.
			^
			Пребывание в башне, после затхлых подземелий, ввергло тебя в какое-то
			странное вневременное состояние. Твоё тело отказывается спешить куда-либо,
			а разум словно увяз в этом золотом свете солнца.
		]];
	end;
}

-- Главарь подполья
tower_stage2_thieves_leader = obj {
	nam = 'Главарь подполья';
	dsc = [[
		{Бывший торгаш} в сияющем ореоле, аки святой, нервно потирает щетину,
		уставившись на
	]];
	act = function()
		-- Обсуждаем исчезновение Полукровки
		if _tower_stage2_where_is_halfblood then
			walk 'tower_stage2_thieves_leader_dlg';
		else
			return [[
				-- Нужно торопиться, -- бросает главарь подполья, не глядя в твою сторону.
			]];
		end;
	end;
}

-- Ящики
tower_stage2_some_stuff = obj {
	nam = 'Ящики';
	dsc = function()
		-- Описание при наличии главаря
		if not tower_stage2_thieves_leader:disabled() then
			return [[
				 груду покрытых пылью {ящиков}. Позади них за лучами света виднеется
				большая дверь.
			]];
		end;

		-- Описание после исчезновения главаря
		return [[
			Посреди этого великолепия несуразно покоится пыльная груда каких-то
			{ящиков}, преграждающая путь к большой двери.
		]];
	end;
	act = function()
		-- Главарь подполья не даёт нам ознакомиться с ящиками
		if not tower_stage2_thieves_leader:disabled() then
			return [[
				-- Оставь их в покое, -- нервно бросает главарь бандитов в твою
				сторону, -- нам нужно идти дальше.
			]];
		end;

		-- Находим скелет, если ещё нет
		if not _tower_stage2_skeleton_is_dropped then
			_tower_stage2_skeleton_is_dropped = true;
			objs('tower_stage2'):add('tower_stage2_skeleton');
			return [[
				Ты осматриваешь ящики и поначалу не находишь в них ничего необычного.
				Простые деревянные доски обитые железом, кажется, не заслуживают твоего
				внимания. Но внезапно, ты решаешь попробовать ознакомиться с содержимым
				ящиков и подходишь ближе. Выбрав крайний, ты пытаешься открыть крышку,
				но та не поддаётся. Дёрнув изо всех сил ты опрокидываешь ящик набок, и он
				выплёвывает из своего нутра жуткого вида скелет.
			]];
		end;

		-- Описание ящиков без скелета
		return [[
			Ты осматриваешь ящики на расстоянии, более не испытывая желания заглянуть внутрь.
			На некоторых обнаруживаются странные маркировки в виде непонятных символов.
			Тебе кажется странным, что ты не обратил на них внимание раньше. После продолжительного
			изучения надписей тебе начинает казаться, что они мерцают, меняя цвет. Ты поспешно
			отводишь взгляд.
		]];
	end;
}

-- Скелет
tower_stage2_skeleton = obj {
	nam = 'Скелет';
	dsc = [[
		На полу перед ящиками в лучах солнца греет свои кости {скелет}.
	]];
	act = function()
		-- Разбитый скелет
		if _tower_stage2_skeleton_is_broken then
			return [[
				Ты рассматриваешь разбросанные кости скелета. С грудной клеткой, прератившейся
				в кучу праха и осколков, он уже не выглядит таким пугающим как раньше.
				^
				Лишь оскал черепа по прежнему насмехается над тобой.
			]];
		end;

		-- Расколдованный скелет
		if _tower_stage2_skeleton_is_bewitched then
			return [[
				Выдохнув, ты осматриваешь пугающий скелет. Будучи изначально
				снежно белыми, кости скелета пожелтели и покрылись трещинами. Шипы исчезли,
				а череп уменьшился в размерах. Теперь скелет не отличить от человеческого.
				Движение внутри грудной клетки усилилось. Ты отчётливо видишь, как чёрное
				существо копошится под рёбрами.
				^
				Тебя одолевает неожиданное чувство жалости к этому странному пленнику.
			]];
		end;

		-- Изначальное описание скелета
		return [[
			Совладав с собой, ты осматриваешь скелет, направивший на тебя
			насмешливый оскал черепа. Кости в некоторых местах покрыты роговыми
			наростами шипов. Череп хоть и похож на человеческий, но слишком крупный.
			Твоё внимание привлекло странное движение внутри грудной клетки.
			Тебе кажется, что там свернулось в клубок нечто живое. Словно сгнившее сердце
			за рядом ребёр -- в грудной клетке пульсирует комок чёрной плоти.
			^
			Ты сбрасываешь оцепенение и пятишься прочь.
		]];
	end;
	used = function(self, what)
		-- Проверяем, не сломан ли уже скелет
		if _tower_stage2_skeleton_is_broken then
			return [[
				От скелета всё ещё исходит странный запах гари, и ты
				предпочитаешь оставить его впокое.
			]];
		end;

		-- Проверяем смотрим ли мы на скелет через трубу
		if what == tower_spyglass then
			return [[
				Ты подносишь трубу к глазу и направляешь её на скелет.
				Он никак не изменяется, но через несколько мгновений ты
				чувствуешь как земля уходит из под ног.
				^
				Скелет, башня и труба, всё куда-то пропадает. День сменяется
				ночью. Сквозь плотные облака проглядывает бледный череп луны.
				Ты видишь монолитную крепость без башен и ворот,
				лишь высокие стены с узкими бойницами. Бойницы излучают
				свет, схожий с лунным. Крепость начинает приближаться.
				Ты выставлешь перед собой руки, словно пытаясь оттолкнуть
				жуткую эту пирамиду, но тщетно. Ты оказваешься
				перед воротами, лежащими на земле. Они со скрежетом раскрываются
				и тьма поглощает тебя.
				^
				В темноте раздаются какие-то звуки. Ты различаешь шелест крыльев и
				странный клёкот. Тьма подёргивается, и вот ты уже видишь как перед тобой
				мелькают тысячи чёрных перьев. Мощный порыв ветраподхватывает их и собирается
				в сотни крыльев. Крылья раскрываются в стороны, обнажая
				огромное птичье око, вперившее в тебя свой пронзающий взгляд.
				^
				Вскрикнув, ты роняешь трубу из рук.
			]];
		end;

		-- Проверяем, воздействуем ли кинжалом, ломающим заклятья
		if what == tower_dagger then
			-- Проверяем, не расколдован ли уже скелет
			if _tower_stage2_skeleton_is_bewitched then
				return [[
					У тебя нет желания лишаться чувств ещё раз.
				]];
			end;

			-- Расколдовываем скелет
			_tower_stage2_skeleton_is_bewitched = true;
			-- Уничтожаем кинжал
			inv():del('tower_dagger');
			return [[
				Взглянув на лезвие кинжала, ты замечаешь, что лезвие
				начинает мерцать белым светом. Ты осторожно подносишь кинжал к скелету,
				и клинок отзывается лёгкой дрожью. Надрезав край кости, ты наблюдаешь
				как из надреза поднимается тонкая струйка дыма.
				Обхватив рукоять покрепче, ты вонзаешь кинжал в глазницу черепа.
				Клинок сопротивляется, словно пронзает живую плоть. Воздух заполняет
				шипение, запах гари и мерзкий желтоватый дым. Кости скелета начинает бить дрожь,
				а грудная клетка и вовсе заходится в дикой пляске.
				^
				Ты приходишь в себя, лёжа на полу в обнимку со скелетом. В руке у тебя дымящаяся
				рукоять кинжала без клинка.
			]];
		end;

		-- Проверяем, воздействуем ли каменем
		if what == tower_stone then
			-- Проверяем, расколдован ли скелет
			if _tower_stage2_skeleton_is_bewitched then
				-- Ломаем скелет
				_tower_stage2_skeleton_is_broken = true;
				-- Выпускаем птицу
				event 'freedom for black bird';
				return [[
					Взявшись за камень, ты начинаешь аккуратно обстукивать рёбра скелета.
					От каждого удара мелкая сетка трещин разрастается всё больше. Существо
					внутри замерло в ожидании. В конце концов ребра одно за другим рассыпаются,
					и ты оказываешься перед кучей обломков костей. Внутри нее начинает
					шевелиться нечто.
					^
					Осколки костей обращаются в прах от взмаха широких крыльев. Комок чёрной плоти
					оказывается птицей. Она взмывает в воздух и покружив у тебя над головой, вылетает
					в раскрытое окно.
				]];
			else
				-- Включаем диалог у кладовщика для получения кинжала
				event 'skeleton was bited';

				-- Намекаем, что сначала нужно расколодовать
				return [[
					Вооружившись камнем, ты пытаешься разбить рёбра скелета.
					К твоему изумлёнию удары выбивают снопы искр из костей, и
					отдадют сильной болью в руке. Убедившись в бесплодности своих усилий,
					ты оставляешь это занятие.
				]];
			end;
		end;
	end;
}

-- Диалог с главарём подполья
tower_stage2_thieves_leader_dlg = dlg {
	nam = 'Главарь подполья';
	hideinv = true;
	entered = function()
		-- Спрашиваем, где Полукровка
		if _tower_stage2_where_is_halfblood then
			return [[
				-- Куда она могла подеваться? -- спрашиваешь ты бывшего торгаша.
				^
				Тот нехотя пожимает плечами в ответ.
				^
				Только сейчас ты замечаешь небольшой кинжал в ножнах аккуратно устроившийся
				у него на поясе. Рука главаря в чёрной перчатке, то и дело поглаживает его рукоять.
				Ты уже начал думать, что она живёт отдельной жизнью от своего хозяина.
			]];
		end;

		return [[
			-- Нам нужно подняться выше.
		]];
	end;
	phr = {
		-- Где полукровка
		{
			tag = 'about_halfblood';
			true;
			'И что, мы не будем её искать?';
			[[
				-- Это бессмысленно. Тогда мы отсюда никогда не выберемся, -- устало
				отзывается бывший торгаш, -- нам нужно найти советника. Полукровка --
				последний человек о сохранности которого стоит беспокоиться.
			]];
			function()
				_tower_stage2_where_is_halfblood = false;
				tower_stage2_thieves_leader_dlg:pon('new_way');
			end;
		};
		-- Куда дальше
		{
			tag = 'new_way';
			false;
			'Тогда куда нам дальше?';
			[[
				-- Покои советника должны быть где-то наверху. Поднимаемся дальше,
				-- услышал ты в скупой ответ.
			]];
			function()
				tower_stage2_thieves_leader_dlg:pon('plans');
				tower_stage2_thieves_leader_dlg:pon('go_go_go');
				tower_stage2_thieves_leader_dlg:poff('new_way');
			end;
		};
		-- О планах
		{
			tag = 'plans';
			false;
			'Я как раз хотел спросить про это "дальше".';
			[[
				-- Мы уже обсуждали это, -- раздражённо замечает главарь.
				^
				-- Я не о том, -- ты не сводишь глаз с кинжала в ножнах,
				словно на самом деле разговариваешь с ним, а не с его владельцем.
				^
				-- Что будет после нападения на город орков, если у нас всё получится?
				^
				-- Люди должны наконец-то увидеть, что от режимнимков никакого толка,
				-- на мгновение к главарю подполья возвращается былое самообладание,
				-- мы поможем им понять, что город способен защитить себя сам.
				^
				-- Но как?
				^
				-- Я предупредил своих людей в гарнизоне. Они сделают всё необходимое,
				чтобы организовать оборону. Режимники же, будут не готовы. Они будут
				растеряны, и мы подставим их под удар. Останется только воспользоваться
				моментом и избавиться от наместника, богоизбранного и этого
				подозрительного капитана. Можно даже сказать, что орки окажут нам услугу.
				^
				-- Ты говоришь об убийстве? -- словно отозвавшись на твои слова,
				рука в чёрном стискивает рукоять кинжала.
				^
				-- Я говорю о справедливом возмездии, -- горячо возражает бывший торгаш,
				-- эти люди развращают мой город. Из-за таких как они, вырождается
				вся страна и всё человечество. Без них Режим в Приграничье развалится.
				Мы вернём себе долгожданную независимость.
				^
				Главарь подполья ловит твой взгляд. Тебе остаётся согласно кивнуть.
				^
				-- Мы заболтались, -- с удовлетворением заключает он,
				-- нужно скорее найти советника.
			]];
			function()
				back();
			end;
		};
		-- Уходим
		{
			tag = 'go_go_go';
			false;
			'Тогда вперёд.';
			[[
				Поторопимся.
			]];
			function()
				tower_stage2_thieves_leader_dlg:poff('plans');
				back();
			end;
		};
	};
}
