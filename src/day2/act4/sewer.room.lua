-- Переменные локации
sewer_to_collector = vroom('Коллектор', 'collector')
sewer_to_guild_camp = vroom('Лагерь подполья', 'guild_camp')
sewer_to_collector:disable()
sewer_to_guild_camp:disable()
local sewer_entered = false

-- Локация
sewer = room {
	nam = 'Сточный канал';
	dsc = [[
		Ты стоишь в тоннеле по щиколотку в иле. По крайней мере, ты убеждаешь себя, что это ил.
		В дождь здесь наверняка по колено воды, но к счастью, его в городе не было давно.
		Вокруг темнота, сырость и вонь. Глаза привыкают ко мраку, и тебе удаётся разглядеть
		очертания кирпичных стен, заросших плесенью.
	]];
	obj = {
		'sewer_hatch';
		'sewer_bats';
		'sewer_door';
		'fatrat';
		'sewer_guard';
		'sewer_guard_key';
	};
	way = {
		sewer_to_collector;
		sewer_to_guild_camp;
	};
	entered = function()
		-- Поверяем не заходил ли уже игрок на эту локацию
		if not sewer_entered then
			-- Clear inventory, add whitelisted items
			inv():zap();
			inv():add('capitan_docs');
			inv():add('black_coin');
			sewer_entered = true;
		end;
	end;
}

-- Объекты
-- Люк через который ты оказался в канализации
sewer_hatch = obj {
	nam = 'Люк';
	dsc = [[
		Жиденький свет падает из колодца, заканчивающегося решётчатым {люком}. Через него ты сюда и попал.
	]];
	act = [[
		Ты поднимаешь голову, чтобы осмотреть люк и колодец.
		До прутьев лестницы в последнем теперь не добраться. Нужна стремянка или верёвка с крюком.
	]];
}
-- Летучие мыши
sewer_bats = obj {
	nam = 'Летучие мыши';
	dsc = [[
		На краях колодца ты наблюдаешь несколько {летучих мышей}.
	]];
	act = [[
		Ты осматриваешь чёрные силуэты летучих мышей.
		Похоже, они так крепко спят, что твой спуск по колодцу их совсем не потревожил.
	]];
	-- Швыряем топором в мышей
	used = function(self, what)
		if what == guild_camp_axe then
			objs():del 'sewer_bats';
			return [[
				Ты не придумываешь ничего лучше, чем швырнуть в тварей
				на потолке топором.
				Взвесив топор в руке и хорошенько прицелившись, ты
				отправляешь его в полёт. Лезвие высекает искры о камень
				, после чего топор отскакивает в темноту.
				С десяток летучих мышей в суматохе разлетаются в разные стороны.
				В этом мельтешении тебе кажется, что пара тушек упала на пол.
				Ты начинаешь шарить руками в иле, но безуспешно. К великой радости
				тебе удаётся найти хотя бы топор. Других плодов охота не приносит.
			]];
		end;
	end;
}

-- Решётка в коллектор, где сидит бывший советник
sewer_door = obj {
	nam = 'Решётка';
	dsc = [[
		Света из люка достаточно, чтобы разглядеть {дверь} из металлических прутьев
		в стене неподалёку.
	]];
	act = [[
		Напрягая зрение, ты осматриваешь решётку двери, и обнаруживаешь в ней тёмный
		квадрат замка.
	]];
	-- Открываем решётку
	used = function(self, what)
		objs():del 'sewer_door'
		enable 'sewer_to_collector'
		return [[
			Ты вставляешь ключ в скважину замка и пытаешься повернуть. Замок возмущённо
			скрипит, но поддаётся. Ты толкаешь решётку и затыкаешь уши от жуткого крика
			ржавых петель усиленного эхом.
		]]
	end;
}

-- Орк охранник
sewer_guard = obj {
	nam = 'Громила';
	dsc = function()
		-- Проверяем первый ли мы раз в Сточной трубе?
		return [[
			Ещё один источник света -- факел, закреплённый на стене в конце тоннеля.
			Огонь освещает ещё одну дверь, уже деревянную, и внушительного вида {орка}.
			Громила привалился к стене и дремет.
		]];
	end;
	act = function()
		if have 'ratkebab' then
			inv():del 'ratkebab'
			objs():del 'sewer_guard'
			objs():del 'sewer_guard_key'
			take 'sewer_guard_key'
			return [[
				Ты подходишь к громиле и протягиваешь ему шампур с нанизанными
				тушками жареных крыс.
				^
				-- Вот, я принёс тебе поесть, -- 
				^
				-- Отчего же нет, сударь, я с радостью проведу дегустацию.
				Подайте мне вилочку для омаров!
				^
				Он проводит следующие пять минут за лёгкой трапезой.
				^
				-- Белиссимо! Какой аромат, какой привкус! Прекрасная работа
				настоящего мастера! Пойду расскажу людям о его искусстве.
				^
				-- А ключ не оставишь? Мало ли.
				^
				-- Ну ладно, бери.
				^
				Test
				^
				-- Ладно, бери этот чёртов ключ. Этот старик у меня в печёнках уже сидит.
				Достало уже торчать здесь в одного.
			]]
		end;

		-- Показываем орку монету
		if have 'black_coin' then
			inv():del 'black_coin'
			enable 'sewer_to_guild_camp'
			return [[
				Ты делаешь несколько шагов в сторону орка, но тебя останавливает
				зычный голос, исполненный радости.
				^
				-- Стоять, задохлик. Ты как раз к обеду. Сейчас я вырежу из
				тебя кусок, как раз по форме дерева на твоей груди, --
				два уголька-глаза урук, горят не хуже факела. Со скрежетем он
				извлекает из ножен оргомный палаш. Клинок хищно облизывается бликом
				пламени факела.
				^
				-- Подожди, подожди, -- ты вскидываешь перед собой руку с монетой,
				словно, это оберег, -- Вот, смотри что у меня есть!
				^
				-- И куда тебе её засунуть? -- интересуется орк. Тебе кажется, что радость
				его сошла на нет.
				^
				-- Меня послал торговец чёрным деревом, -- выдавливаешь ты из себя, --
				и книжным пеплом.
				^
				-- Это мне нужно было послать тебя на встречу к твоим богам, как только ты
				здесь появился, -- громила с досадой возвращает меч в ножны.
				^
				Ты подходишь к двери и вопросительно смотришь на орка, снова привалившегося к стене.
				^
				-- Можно пройти?
				^
				-- Скройся, пока я не сожрал твои потроха, -- рычит орк, не глядя в твою сторону.
			]];
		end;

		return [[
			Ты обращаешься к громиле:
			^
			-- Что за той решёткой?
			^
			-- Тебе-то что за дело, косточка? -- нехотя откликается охранник.
			^
			-- Торговец чёрным деревом, сказал мне разыскать... -- начинаешь ты, но увидев
			свирепое лицо орка, ты тут же замолкаешь.
			^
			-- Не знаю я никаких торговцев! Я стою тут весь день без жратвы и мечтаю
			проломить кому-нибудь голову, и сожрать его печёнку.
			Проваливай со своими вопросами, или этим кем-то будешь ты.
			^
			Тяжело вздохнув, ты спешишь убраться подальше от голодного орка.
		]];
	end;
}

-- Ключ от решётки Коллектора
sewer_guard_key = obj {
	nam = 'Ключ';
	dsc = '';
	inv = [[
		Ты задумчиво рассматриваешь ключ и гадаешь, есть ли у старика по ту сторону
		решётки такой же.
	]];
}
