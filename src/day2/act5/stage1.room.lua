-- Переменные локации
_tower_stage1_guard_searched = false
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
	walk 'tower_stage1'
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
	entered = _tower_penetration;
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
	act = [[
		Жестом ты обращаешь на себя внимание бывшего торгаша, отвлекая
		его от раздумий.
		^
		-- Мы в башне, что дальше? -- спрашиваешь ты, строя догадки
		о том, что же у него в голове.
		^
		-- Проверь, что там за другими дверьми. Покои наместника должны
		быть где-то наверху, -- ты не чувствуешь в его голосе уверенности,
		-- ищи лестницу на следующие этажи.
		^
		-- A cтража не нагрянет? -- беспокоишься ты.
		^
		-- Не думаю, -- главарь покачал головой, -- башня сама себя неплохо охраняет.
		Нынешний наместник здесь не бывает. Его резиденция -- один из лучших постоялых
		дворов в городе. Кроме советника Конроя других важных шишек
		в башне нет. А этого старика не особно торопятся охранять.
		^
		-- Хочешь сказать, можно ничего не бояться?
		^
		-- Проверь двери, -- повторяет главарь, нахмурившись.
	]];
}

-- Полукровка
tower_halfblood = obj {
	nam = 'Полукровка';
	dsc = [[
		{Полукровка}, напротив, постоянно осматривается вокруг, словно выискивает что-то.
	]];
	act = [[
		-- Озноб берёт от этой башни. Сколько раз я здесь не была, здесь
		каждый раз всё по-новому, -- ловит твой взгляд девушка.
		^
		-- И что ты здесь делала?
		^
		-- Он, -- Полукровка кивает в сторону бывшего торгаша,
		-- подумывал устроить здесь схрон. Не такая уже плохая идея, учитывая,
		что все боятся эту башню как огня.
		^Test
		^
		-- Сложно объяснить. не хочу показаться тебе сумасшедшим.
		Уверен, чуть позже ты сам всё поймёшь.
	]];
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
