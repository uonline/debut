-- Переменные локации
_tower_stage1_guard_searched = false
_tower_stage1_look_map = false
_tower_penetration = [[
	Бывший торгаш зажигает факел и делает тебе знак рукой, следовать за ним.
	Полукровка оказывается за твоей спиной и легонько подталкивает сзади.
	Ты послушно шагаешь вперёд. Миновав несколько перекрёстков и залов,
	вы подходите к обитой железом двери. За ней обнаруживается крутая
	винтовая лестница.
	^
	Девушка отталкивает тебя и пробирается вперёд. Она исчезает на лестнице,
	и главарь показывает тебе, что нужно подождать. После того как сверху
	раздаётся какой-то шум, вы поднимаетесь следом.
]];

-- События
-- Проникаем в башню на первый этаж
on_event('tower penetration', function()
	walk 'tower_stage1';
end)

-- Локация
tower_stage1 = room {
	nam = 'Башня';
	dsc = [[
		Ты стоишь на первом этаже башни. По крайней мере, ты сам совершенно в этом
		уверен. Это просторная круглая зала с высокими потолками и узкими полосами
		витражных окон. На потолке красуется полотнище с гербом Режима.
		^
		Помимо двери, через которую вы оказались в этой зале, здесь есть ещё несколько.
		Все они закрыты, как и массивные ворота -- главный вход в башню.
	]];
	-- Описание дороги в башню
	entered = function()
	inv():add 'capitan_docs';
		return _tower_penetration;
	end;
	obj = {
		'tower_stage1_stained_glass_windows';
		'tower_stage1_thieves_leader';
		'tower_halfblood';
		'tower_guard';
	};
	way = {
		'tower_stage1_room1';
		'tower_stage1_room2';
		'tower_stage1_room3';
		'tower_stage1_room4';
	};
}

-- Переходы
-- Дальняя левая комната
tower_stage1_room1 = room {
	nam = 'Дальняя левая комната';
	enter = function()
		return [[
			Ты пытаешься открыть дверь, но тщетно.
			Прислушавшись, ты различаешь за ней какие-то
			звуки.
			^
			Заключив, что по ту сторону двери кто-то
			есть, ты оставляешь её в покое.
		]], false
	end;
}

-- Ближняя левая комната
tower_stage1_room2 = vroom('Ближняя левая комната', 'tower_stage2');

-- Дальняя правая комната
tower_stage1_room3 = room {
	nam = 'Дальняя правая комната';
	enter = function()
		return [[
			Ты открываешь дверь и обнаруживаешь небольшую комнатку,
			которую заполняет один лишь полумрак. В голове у тебя
			возникает мысль, что башня, видимо, заброшена,
			и пустые комнаты не должны удивлять.
		]], false
	end;
}

-- Ближняя правая комната
tower_stage1_room4 = room {
	nam = 'Ближняя правая комната';
	enter = function()
		return [[
			Ты открываешь дверь и, к своему удивлению,
			обнаруживаешь за ней кирпичную стену.
		]], false
	end;
}

-- Объекты локации
-- Витражи
tower_stage1_stained_glass_windows = obj {
	nam = 'stained_glass_windows';
	dsc = [[
		Лучи солнца, просачиваясь сквозь {витражи}, покрывают
		пол залы причудливым рисунком.
	]];
	act = [[
		Задрав голову, ты рассматриваешь витражи. На большей их части запечатлены сады
		каменных древ, горы и город, как ты подозреваешь, Тантикул. Единственное исключение
		-- витраж с профилем императора Ремана. От лицезрения этой красоты у тебя
		перехватывает дыхание и начинает кружиться голова.
	]];
};

-- Главарь подполья
tower_stage1_thieves_leader = obj {
	nam = 'Главарь подполья';
	dsc = [[
		Глядя на него, о чём-то размышляет {главарь подполья}.
	]];
	act = function()
		-- Проверяем залутал ли герой стражника
		if _tower_stage1_guard_searched then
			-- Показываем главарю карту, если он её ещё не видел
			if _tower_stage1_look_map then
				_tower_stage1_look_map = false;
				return [[
					Жестом ты обращаешь на себя внимание бывшего торгаша, отвлекая
					его от раздумий.
					^
					-- Вот взгляни, что я нашёл у стражника.
					^
					Главарь скептически берёт протянутую карту, и с кислой миной крутит
					её в руках.
					^
					-- Всё это бесполезно, -- говорит он, возвращая тебе карту, --
					я уже видел такое. Никакого толку от этих почеркушек нет.
				]];
			end;

			-- Главарь уже смотрел на карту
			return [[
				-- Ты уже проверил двери? -- бросает главарь в твою сторону.
			]];
		end;

		-- Герой не лутал стражника
		return [[
			Жестом ты обращаешь на себя внимание бывшего торгаша, отвлекая
			его от раздумий.
			^
			-- Мы в башне, что дальше? -- спрашиваешь ты, строя догадки
			о том, что же у него в голове.
			^
			-- Проверь, что там за другими дверьми. Покои наместника должны
			быть где-то наверху, -- ты не чувствуешь в его голосе уверенности,
			-- ищи лестницу на следующий этаж.
			^
			-- A cтража не нагрянет? -- беспокоишься ты.
			^
			-- Не думаю, -- главарь отрицательно качает головой, -- башня сама себя неплохо
			охраняет. Нынешний наместник здесь не бывает. Его резиденция -- один из лучших
			постоялых дворов в городе. Кроме советника Конроя других важных шишек
			в башне нет. А этого старика не особно торопятся охранять.
			^
			-- Хочешь сказать, можно ничего не бояться?
			^
			-- Проверь двери, -- повторяет главарь, нахмурившись.
		]];
	end;
}

-- Полукровка
tower_halfblood = obj {
	nam = 'Полукровка';
	dsc = [[
		{Полукровка}, напротив, постоянно осматривается вокруг, словно выискивает что-то.
	]];
	act = function()
		-- Проверяем залутал ли герой стражника
		if not _tower_stage1_guard_searched then
			return [[
				Ты вопросительно глядишь на Полукровку.
				^
				-- Озноб берёт от этой башни. Сколько раз я здесь не была,
				каждый раз всё по-новому, -- ловит твой взгляд девушка.
				^
				-- Что ты здесь делала раньше?
				^
				-- Разнюхивала что и как. Он, -- Полукровка кивает в сторону бывшего торгаша,
				-- подумывал устроить здесь схрон. Не такая уж плохая идея, учитывая,
				что все как огня боятся эту башню.
				^
				-- А что в ней такого особенного? -- ты ещё раз осматриваешь залу, любуясь
				видом. Здесь тебе нравится куда больше, чем в темноте и вони канализации.
				^
				-- Странно, там в тонеле мне показалось, что ты уже достаточно напуган, --
				девушка многозначительно улыбнулась, -- поверь мне, у тебя у тебя ещё будет
				возможность беспокоиться о сухости пола под ногами.
			]];
		end;

		-- Герой залутал стражника
		return [[
			Ты с укором смотришь на девушку.
			^
			-- Что? -- холодно отзывается Полукровка, поймав твой взгляд.
			^
			-- Мы могли бы заставить его показать дорогу к советнику,
			-- ты указываешь на стражника.
			^
			-- Думаешь он был в курсе? -- усмехается девушка, пнув распростёртое тело,
			-- да он не знал, как подняться на следующий этаж. Все стараются держаться
			подальше отсюда. Единственный, кому есть дело до башни, так это нашему
			дорогому богоизбранному. Но наместник предпочитает держать его поближе к себе.
		]];
	end;
}

-- Оглушённый стражник
tower_guard = obj {
	nam = 'Оглушённый стражник';
	dsc = [[
		У её ног лежит {стражник}.
	]];
	act = function()
		if not _tower_stage1_guard_searched then
			take 'tower_map';
			_tower_stage1_guard_searched = true;
			_tower_stage1_look_map = true;
			-- Обыскиваем стражника
			return [[
				Ты наклоняешься над стражником, чтобы обыскать.
				Он кажется тебе оглушённым, только неестественно выгнутая
				шея вызывает некоторые подозрения.
				^
				Обшарив тело, тебе удаётся найти необычного вида карту.
			]];
		end;

		-- Герой уже обыскал стражника
		return [[
			Ты решаешь, что стражнику уже порядком досталось на сегодня,
			и оставляешь его в покое.
		]];
	end;
}

-- Карта башни
tower_map = obj {
	nam = 'Карта башни';
	inv = [[
		Ты рассматриваешь карту. С полминуты ты пытаешься понять,
		что же на ней изображено. Но чем дольше ты смотришь,
		тем более бредовой она тебе кажется.
		Ты не веришь, что это настоящая карта: даже нумерация
		этажей выглядит... странной.
	]];
}
