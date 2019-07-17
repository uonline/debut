-- Переменные локации
_guild_camp_horny = false
_guild_camp_hadsex = false
_guild_camp_want_axe = false
_guild_camp_got_axe = false
_guild_camp_fueled = false
_guild_camp_cooked = false
_guild_camp_nameless_greeting = false
_guild_camp_priest_greeting = false
_guild_camp_smuggler_greeting = false

-- События
_guild_camp_giveaway = false
on_event('old man needs his drink', function()
	_guild_camp_giveaway = true
end)

-- Локация
guild_camp = room {
	nam = 'Лагерь подполья';
	dsc = [[
		Ты выходишь в просторный зал. Помещение заполняет несколько рядов колон,
		на которых закреплена пара факелов.
		В потолке местами проделаны небольшие отверстия, через
		которые поступает дневной свет и воздух. Несмотря на это, здесь
		всё равно чувствуется затхлость и неприятный запах. Но собравшихся в зале
		людей это не смущает.
	]];
	obj = {
		'guild_camp_fire';
		'guild_camp_wood';

		'guild_camp_nameless';
		'guild_camp_axe';
		'guild_camp_priest';
		'guild_camp_smuggler';
		'guild_camp_lord';

		'guild_camp_knight';
		'guild_camp_slut';
		'guild_camp_mage';
		'guild_camp_halfblood';

		'todo'
	};
	way = {
		'sewer';
		'tunnel';
	};
}

-- Объекты
-- Костёр
guild_camp_fire = obj {
	nam = 'Костёр';
	dsc = [[
	]];
	dsc = function()
		-- Ты разжёг костёр
		if _guild_camp_fueled == true then
			return [[
			Большая часть подполья пребывает перед {костром}, что
			горит в центре зала.
			]];
		end;
		return [[
			Большая часть подполья пребывает перед {костром}, что
			тлеет в центре зала.
		]];
	end;
	act = [[
		...
	]];
}

-- Дрова
guild_camp_wood = obj {
	nam = 'Дрова';
	dsc = [[
		Рядом свалена куча {дров}, 
	]];
	act = [[
		Ты нежно гладишь полено.
	]];
	used = function(self, what)
		if what == guild_camp_axe then
			if not _guild_camp_fueled then
				_guild_camp_fueled = true
				disable 'guild_camp_wood'
				return [[
					К твоему удивлению топор весьма неплохо справляется с поленом. Ты...
					быстро рубишь и бросаешь дрова в костёр...
				]]
			end
		end
	end;
}

-- Лжеурук из Харгфхейма
guild_camp_nameless = obj {
	nam = 'Урук из Харгфхейма'; -- ещё как серьёзно, даже статься в вики есть, про этот город.
	dsc = function()
		-- Ты разжёг костёр
		if _guild_camp_fueled == true then
			return [[
				На его пламя как завороженный смотрит татуированный {урук}.
			]];
		end;
		return [[
			к которой прислонился массивный {урук}, разрисованный причудливыми татуировками.
		]];
	end;
	act = function()
		-- Приветствие
		if not _guild_camp_nameless_greeting then
			_guild_camp_nameless_greeting = true;
			return [[
				Ты присматриваешься к орку. Он выглядит весьма странно для урук.
				Длинные жёсткие волосы стального цвета заплетены в две толстенные косы,
				покоящиеся на широкой груди. Ты никогда не видел орка с волосами
				такого цвета. Узор татуировок выглядит не менее причудливо. Ты заключаешь, что
				это не просто орочьи каракули, а рисунки, в которых просматривается
				определённый сюжет. На таком расстоянии тебе не удаётся разглядеть их
				как следует.
				^
				Твой интерес не остаётся незамеченным, и урук отвечает тебе не менее
				внимательным взглядом.
				^
				-- Тебе не хватает меча, режимник, -- замечает он.
				^
				-- Я не солдат, -- отвечаешь ты, -- это маскировка шпиона.
				^
				-- Ваше племя очень изобретательно.
				^
				Ты опешил от сказанного.
				^
				-- Неожиданно слышать такое от орка. Ты сам выглядишь нездешним,
				-- твой взгляд падает на длинные косы.
				^
				-- Так и есть. Мы прибыли с далёкого юга, оттуда, где море вгрызается глубоко
				 в скалы, а ветра повелевают в тундрах.
				^
				-- Ты сказал -- вы?
				^
				-- Я и мои собратья. Такое путешествие в одиночку опасно даже для орка.
				^
				-- А где же твои собратья сейчас? -- тебе удивительно слышать от
				орка слово "опасность".
				^
				-- В этой земле наши пути разошлись.
				^
				-- Зачем вы тогда затеяли этот поход?
				^
				-- Мы странствующие воители урук, -- просто ответил орк.
				^
				-- Кажется, я слышал о таких. Вы бродите по миру в поисках сражений
				и достойных противников.
				^
				-- Теперь каждый из нас идёт своей дорогой. Я направляюь на запад, в
				край Разломов. Слухи о тамошних чудовищах можно услышать по всему миру.
				^
				-- Почему вы не остались у себя на родине, если там настолько опасно?
				^
				-- Там достаточно других охотников, -- морда орка изобразила подобие
				улыбки. Ты понимаешь, что разговор окончен.
			]];
		end;

		-- Просим топор
		if _guild_camp_want_axe and not _guild_camp_got_axe then
			take 'guild_camp_axe'
			_guild_camp_got_axe = true
			return [[
				-- Тебе всё-таки не хватает меча, -- орк протягивает тебе свой топор.
				^
				-- Ты останешься безоружным?
				^
				-- Эти руки уже оружие, -- ты лицезреешь два огромных кулака, -- но не беспокойся
				у меня ещё есть чем себя защитить.
				^
				В южных тундрах...
				^
				-- Из Харгфхейма, --
				^
				-- Никогда о таком не слышал.
				^
				-- Не удивительно. Он стоит у самого побережья, намного дальше, чем кончается южная
				граница Режима. Если боги ветров позволят, то наши моряки отправляются в Тантикул,
				для торговли.
			]]
		end;

		return [[
			Ты присматриваешься к урук. Он полностью поглощён своим занятием: сидя на полу
			со скрещенными ногами наблюдает за танцем огня в костре. Ты чувствуешь что-то
			знакомое в этих позе и горделивой осанке.
		]];
	end;
}

-- Топор
guild_camp_axe = obj {
	nam = 'Топор';
	dsc = [[
		Орк занят тем, что водит точильным камнем по лезвию топора.
	]];
	inv = [[
		Ты взвешиваешь топор в руке. В лапищах его хозяина он казался тебе игрушечным.
		Ты знаешь, что урук используют такие топоры как метательные,
		но врядли ты сможешь орудовать им одной рукой.
	]];
}

-- Проповедник
guild_camp_priest = obj {
	nam = 'Проповедник';
	dsc = [[
		На стопке книг неподалёку сидит печального вида {человек}, и что-то
		бормочет себе под нос со сложенными перед собой ладонями.
	]];
	act = function()
		-- Приветствие
		if _guild_camp_priest_greeting == false then
			_guild_camp_priest_greeting = true;
			return [[
				Ты подходишь к человеку, и убеждаешься, что он занят молитвой. Впрочем
				он прерывает её, чтобы поприветствовать тебя.
				^
				-- Ещё одна заблудшая душа, -- ты сразу вспоминаешь глашатая на площади
				Режима. Человек тем временем изучает древо на твоём нагруднике, --
				ещё один слуга этой лжерелигии.
				^
				-- По твоему лучше верить в Благих, чем в Благо? -- спрашиваешь ты,
				пытаясь скрыть усмешку. Но человек отрицательно качает головой.
				^
				-- Благо или Благие. Орочьи боги или эльфийские. Какая разница?
				Все эти религии за пределами нашего мира. Мы же питаем их
				своей верой.
				^
				-- Посмотри на них, -- он обводит рукой людей в зале, --
				-- что они могут сделать со своими жизнями? Разве
				в их руках выбор как влачить своё существование? Нет, они не знают
				другой доли, кроме своей смертной участи, возни в грязи и грехе.
				Другое дело эти книги, -- он привстал и извлёк одну
				книгу из стопки. Ты узнал в ней писание Святых, --
				прочитай их и ты скажешь: вот где настоящая жизнь!
				Эти подвиги героев древности. Какую храбрость они проявляли,
				какие опасности встречали! А их награды, их страсти и чувства будоражащие
				сознание?! Когда я читаю эти книги, я чувствую на себе их взгляд.
				Они смотрят на меня. Эти бессмертные существа, живущие настоящей жизню.
				Они ждут от меня продолжения своих историй.
				Ждут, когда их покорный раб вообразит для них новые подвиги и свершения.
				Они меняют наряды, лица и образы от читателя к читателю.
				Даже властителям целых империй не снились такие капризы.
				^
				Он переводит дыхание после своей проповеди.
				^
				-- Настоящая жизнь, открывается нам лишь из книг. В них обитают
				реальные люди, не здесь среди тьмы, отбросов и вони, -- заключает
				проповедник, -- покуда существует хотя бы одна книга, они продолжают
				жить.
				^
				Человек возвращается к своей тихой молитве. Из его проповеди ты так
				и не понял, что же нужно делать: хранить книги или сжигать.
			]];
		end;

		return [[
			Ты решаешь, что одной проповеди в день вполне достаточно.
		]];
	end;
}

-- Контрабандист
guild_camp_smuggler = obj {
	nam = 'Контрабандист';
	dsc = [[
		Пользуясь светом одного из факелов, {усатый мужчина} поглощён изучением карты.
	]];
	act = function()
		-- Приветствие
		if _guild_camp_smuggler_greeting == false then
			_guild_camp_smuggler_greeting = true;
			return [[
				-- Режимник! -- хватается за кинжал на поясе.
				^
				-- Спокойно, это просто нагрудник. Думаешь, орк на
				входе пропустил бы режника.
				^
				-- Проклятье. и правда.
				^
				...
				^
				Там наверху если кто и задумывается над тем, как они живут, то
				никто не смеет и слова сказать. Режимников, возможно, и сравнивают с нами,
				бандитами... но лишь мы готовы, что-то с этим сделать. Люди продолжат
				нести любое бремя, какое на них возложат и этот город с радостью
				примет любое истезание.
				^
				-- Кого тут только не собралось, и все недовольны Режимом.
				^
				-- ... Полно возможностей. Например, этот господин он кивает в сторону МАГА,
				сделал мне весьма интересное предложение.
			]];
		end;

		if _guild_camp_giveaway then
			_guild_camp_giveaway = false
			take 'rocky_island'
			return [[
				-- Слышь, там какой-то старик сидит.
				^
				-- Все мы когда-нибудь сядем. Так печально, аж слезу пустил.
				На, выпей за моё здоровье.
			]]
		end

		return [[
			...
		]]
	end;
}

-- Лорд
guild_camp_lord = obj {
	nam = 'Лорд-изгнанник';
	dsc = [[
		{Статный блондин} в изорванном платье из красного шёлка сидит на камне
		и чистит свои сапоги.
	]];
	act = function()
		if _guild_camp_giveaway then
			_guild_camp_giveaway = false
			take 'lord_sign'
			return [[
				-- Слышь, там какой-то старик сидит.
				^
				-- Я тоже сидел. Вот сувенир.
			]]
		end

		return [[
			-- Я много знаю, про знать Приграничья и Режима, потому что я сам
			из их числа.
		]]
	end;
}

-- Рыцарь
guild_camp_knight = obj {
	nam = 'Кархэрд Чёрный рыцарь';
	dsc = [[
		^
		По правую сторону от костра {темнокожий рыцарь} в белых доспехах сидит
		на табуретке и сосредоточенно зашивает дыру на портянке,
		изредка поглядывая на тебя единственным глазом.
	]];
	act = function()
		if _guild_camp_hadsex then
			return [[
				-- Ну вроде норм.
			]]
		end

		if _guild_camp_horny then
			_guild_camp_hadsex = true
			return [[
				Test
				^
				-- Сайри Душка? -- суровость рыцаря как-то сразу сходит на нет.
				-- лет десять назад у неё была куча поклонников. Да вот только, и
				она мало кому отказывала. Прозвища не берутся просто так. Скажи ей
				что мы встретимся в полночь. А я что-нибудь придумаю. Кто-знает,
				может наш усач сводит за меня.
				^
				Test
				-- Рассказать тебе о рыцарях? Тут нечего и рассказывать.
				В прежние времена рыцарские ордена правили в Приграничье.
				Тогда рыцари считались кем-то вроде сверхлюдей. Что сказать,
				они наравных выступили против орков. Другое государство эта волна
				дикарей просто смела бы.
				^
				Я стараюсь собирать всевозможную
				информацию о рыцарях, лелея надежду, что когда-нибудь
				удасться восстановить Единый Орден. Но сегодня рыцари никому
				не нужны. Люди уповают на Режим и его богоизбранных, и их
				чудотворные дела. В силу меча и доблести веры больше нет.
				^
				Сейчас от рыцарей и не осталось и следа. Уцелел лишь титул,
				которым тебя могут наделить какой-нибудь толстозадый лорд.
				Впрочем, некоторым не нужен и он. Я например, сам провозгласил
				себя рыцарем, обойдясь без посвящения.
				^
				В рыцарстве главное поступки которые ты совершаешь. Несмотря
				на то что мой титут ненастоящий, моё имя известно в Приграничье
				благодаря моим деяниям.
			]]
		end

		return [[
			"Мы-ы-ы-ы-ы чемпионы, брата-а-а-а-ан, и мы будем жа-а-а-а-арить
			до конца-а," -- напевает рыцарь.
		]]
	end;
}

-- Душка Сайр
guild_camp_slut = obj {
	nam = 'Душка Сайр';
	dsc = [[
		{Барышня в очках} читает книгу "Увидительные приключения странствующего
		рыцаря Тампуки".
	]];
	act = function()
		if _guild_camp_cooked then
			return [[
				-- Правда, я хорошо готовлю? Меня мама научила.
			]]
		end

		if have('fatrat') and _guild_camp_fueled then
			_guild_camp_cooked = true
			inv():del 'fatrat'
			take 'ratkebab'
			return [[
				-- О, класс, давай это всё сюда.
				^
				Барышня забирает у тебя крысу, отрезает ей голову, потрошит
				внутренности и жарит тушу на костре, после чего отдаёт тебе
				с радостной улыбкой.
				^
				Test
				^
				-- Так посмотрим. Подожди, что это? Где крылья? Это что, крысы?!
				Я же сказала, летучих мышей! Ладно, давай сюда. В голодные годы
				войны ели и не такое.
			]]
		end

		if _guild_camp_hadsex then
			event 'we want meat'
			_guild_camp_want_axe = true
			return [[
				-- О, это было незабываемо! Чем бы мне тебе отплатить?
				Ну конечно, жареными крысами. Нужно только наловить крыс,
				а ещё нарубить дров. Топор? Топора у меня нет, я же девушка!
				Ой. Ну, в общем, как всё будет -- приходи!
				^
				Test
				^
				-- Знаешь, тот орк на входе умирает с голода. Можешь приготовить для него что-нибудь?
				^
				-- Для Заграка? Ох, даже не знаю. Етим оркам так сложно угодить. Что я только не готовила.
				Он от всего нос воротит!
				^
				-- Что, совсем без шансов? Да он такой голодный, что готовл был меня сожрать.
				^
				Женщина смеётся.
				^
				-- Тебя то он сожрал бы с радостью. Уж поверь. А знаешь. Надоел мне этот гурман!
				Сходи и налови ему мышей в канале. Посмотрим, что он скажет на такую экзотику! Кто
				поймёт этих орков?!
				^
				Ты пожимаешь плечами.
				^
				-- Ах да, заодно подкинь дровишек в костёр. Мне и правда пора браться за обед.
				Столько голодных ртов вокруг! Как всё будет готово, приходи.
			]]
		end

		if _guild_camp_horny then
			return [[
				-- Ну как? Ну как? Ну как?
			]]
		else
			_guild_camp_horny = true
			return [[
				-- Что читаешь, сестра? -- с улыбкой осведомляешься ты.
				^
				-- О, я так люблю книги о рыцарях! Они такие сильные, смелые,
				ну и вообще классные ребята. Вот прямо как тот негр.
				Только он даже смотреть в мою сторону не хочет. Замолви за меня
				словечко, а?
			]];
		end
	end;
}

-- Маг, бывшая крыса
guild_camp_mage = obj {
	nam = 'Маг';
	dsc = [[
		!!!
		{Дедушка в белом плаще} читает увесистый трактат -- и ты мог бы
		поклясться, что он вполголоса разговаривает с чёртовой книгой.
	]];
	act = function()
		walk 'guild_camp_stories';
	end;
}

-- Полукровка
guild_camp_halfblood = obj {
	nam = 'Полукровка';
	dsc = [[
		{Девушка} в кожаном плаще и с повязкой на глазу точит кинжал.
		В её движениях есть какая-то странная, нечеловеческая грациозность.
	]];
	act = [[
		-- Уважаемая леди, у вас рукав расстегнулся.
		^
		-- Тысяча чертей! Проглоти меня акула! Этот чёртов портной дорого
		заплатит за своё коварство!
		^
		^
		-- Со всеми сумасшедшими познакомился? Очередь дошла до меня?
	]];
}

-- TODO
todo = obj {
	nam = 'TODO';
	dsc = [[
		{...}
	]];
	act = [[
		^ Всем/некоторым нужно добавить приветсвие и обратить внимание на наряд режимника.
		^ Кто-то должен описать жизнь в подполье.
		^ Сайри должна заметить раненную ладонь героя.
		^ (Оттенить город, показать обратную сторону его жизни. Тёмную, настоящую?
		Приют сумасшедших?)
	]];
}
