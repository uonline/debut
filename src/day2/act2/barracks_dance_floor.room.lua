barracks_dance_floor = room {
	nam = 'Зал';
	dsc = [[
		Ты осторожно заглядываешь в залу. В этом просторном помещении с высокими потолками
		и множеством узких окон словно витает дух какого-то затянувшегося праздника.
		Столы, расставленые в два ряда друг напротив друга, несут на себе отпечаток ночной
		попойки. Факелы погашены, но утренний свет уже разгоняет полумрак,
		а воздух с улицы, врываясь через раскрытые двери, разбавляет свежестью затхлый
		запах пива и снеди.
	]];
	obj = {
		'dance_floor_guards';
	};
	way = {
		'barracks_hall';
	};
}

dance_floor_guards = obj {
	nam = 'Караульные';
	dsc = [[
		Несмотря на обстановку у противоположной стены {группа солдат} честно караулит
		двери на улицу.
	]];
	act = function()
		if not have('guard_armor') then
			return [[
				-- В таком виде они тебя точно никуда не выпустят, -- слышишь
				ты голос мага.
				^
				-- Может быть и меня превратишь в крысу?
				^
				-- Если только навсегда, -- ты чувствуешь усмешку в голосе мага.
				^
				-- Очень смешно.
			]];
		end

		if not have('guard_docs') then
			return [[
				Ты осматриваешь своё облачение -- вылитый режимник. Но чувство тревоги
				тебя не отпускает. Конечно, врядли найдётся хоть кто-нибудь, кто помнит
				каждого солдата в лицо. Но тебе почему-то не хочется рисковать.
				Нужно придумать что-то ещё, чтобы миновать караульных на выходе.
			]];
		end

		if not have('barracks_hq_docs') then
			-- Теоретически в эту ветвь игрок попасть не может, т.к. документы рекрута и капитана берутся
			-- в одном и том же действии. Но на всякий случай пусть будет.
			return [[
				-- Хорошо, сейчас ты выберешься отсюда, -- доноситься до тебя голос мага,
				-- и что дальше? Твой портрет наверняка красуется на доске у городских ворот,
				а стража со времён войны тщательно проверяет всех, кто входит или выходит из города.
				Твоё отсутствие в камере в конце-концов обнаружат, не сегодня, так завтра.
				Собираешься скрываться в городе полном солдат, которые тебя ищут?
				^
				-- А что ты предлагаешь?
				^
				-- Тебя может спасти только местное подполье. Попробуй раздобыть в штабе
				информацию о делах Режима в городе, и сможешь обменять её на помощь.
				^
				-- Ты не забыл, что на мне доспехи Режима? Они повесят меня, как только увидят.
				^
				-- Хорошо, я превращу тебя в крысу. Сбежишь из города через канализацию, если
				тебя не сожрут по дороге.
				^
				-- Иди к чёрту.
			]];
		end

		inv():zap();
		walk 'regimenstrasse';
		take 'capitan_docs';
		take 'magic_substrate';
		return [[
			Сделав каменное лицо, ты направляешься прямо к выходу мимо караульных.
			Попытка была хорошей, но один из них всё же обращает на тебя внимание.
			^
			-- Эй, притормози! Что-то я тебя не припоминаю, -- бросает тот, что поближе
			к дверям.
			^
			-- Да брось ты, Грейв, -- вмешивается второй, -- ты всю память на дне бутылки
			оставил.
			^
			-- Я оставил? Посмотри на Джеральда, -- он кивнул в сторону привалившегося к стене
			солдата, усердно массировавшего лоб.
			^
			Видя разлад в карауле, ты берёшь инициативу в свои руки.
			^
			-- Я, Реджинальд -- рекрут. На днях заключил договор. Вот документы, --
			Ты дрожащей рукой, протягиваешь солдату бумагу.
			^
			-- Вот видишь, Грейв, уже напугал новичка, -- вступается за тебя второй.
			^
			-- Да погоди ты, говорю, -- солдат выхватывает у тебя бумаги и хмурясь пробегает
			по ним взглядом.
			^
			-- Значит, Кирсан. Слышал про тебя. А я то думал, ты совсем молокосос, но по
			щетине не скажешь, -- ворчливо проговаривает он сквозь густые усы, -- Хотя меча
			что-то не видно. Видать, всё-таки молокосос. --
			^
			Ворчание переходит в булькающий смешок.
			^
			-- Знаешь, рекрут, солдату Режима опасно ходить по городу без оружия, -- теперь
			ты замечаешь в глазах усатого откровенную неприязнь, -- Некоторые местные
			недолюбливают режимников. И чем больше их друзей, братьев или сыновей становятся
			солдатами Режима, тем быстрее растёт их "недоброжелательность". Но тебе то
			это должно быть хорошо известно, Кирсан?
			^
			Солдат делает ударение на последнем слове. Ты поспешно киваешь.
			^
			-- Ну всё, хватит, Грейв, хватит, -- второй солдат примиряюще похлопывает усатого
			по плечу. Но тот отстраняется, вплотную подойдя к тебе.
			^
			-- Мы следим за тобой и твоей семейкой, Кирсан, -- шепчет тебе на ухо солдат,
			обхватив ладонью твой затылок. В нос бьёт крепкий запах перегара,
			-- будь примерным режимником.
			^
			Ты вырываешься, и усатый силой толкает тебя в плечо. Ты чуть ли не вываливаешься
			на улицу.
			^
			-- Всё, иди парень, иди, -- машет тебе второй солдат, вставая перед усатым, --
			И что на тебя нашло, чёрт тебя побери?!
			^
			Ты поспешно удаляешься прочь от штаба, глотая свежий утренний воздух. Солнце уже
			поднялось над горизонтом, и его тёплый свет заливает улочки города, просыпающиеся
			ото сна. Заскрипели ставни открывающихся окон и дверей. Люди начали заполнять улицы,
			разжигая огонь повседневной жизни.
			^
			-- Чтож, вот и свобода, -- слышишь ты довольный голос в своей голове,
			-- Мы неплохо сработались, но пора расставаться.
			^
			-- Подожди, я думал ты поможешь мне найти это подполье, -- ты чувствуешь как крыса
			завозилась под панцирем.
			^
			-- Прости, но мне ещё нужно кое-что сделать.
			^
			-- А что делать мне?
			^
			-- Ты же солдат Режима. Проведи расследование. Поспрашивай местных.
			Меча у тебя нет, но язык-то на месте, -- крыса выбралась из-под нагрудника
			и хлестнув тебя по лицу хвостом, в пару прыжков оказалась на земле.
			^
			-- Да помогут тебе Благие, или во что вы там верите, -- доносится до тебя
			тихий голос мага, -- Возможно, ещё увидимся.
		]];
	end;
}
