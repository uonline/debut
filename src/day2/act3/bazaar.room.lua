-- Переменные глобальные
_bazaar_old_woman_is_burned = false
-- Переменные локации
local _thief_leader_quest = false
local _thief_leader_has_gotten_help = false
local _orc_is_angry = false

-- Переходы
bazaar_to_lane = vroom('На встречу с торгашом', 'lane')
bazaar_to_lane:disable()

-- Локация
bazaar = room {
	nam = 'Торговая площадь';
	dsc = [[
		Ты стоишь на шумной торговой площади. Вокруг кипит жизнь. Среди рядов лотков-палаток
		снуют многочисленные покупатели в перемешку с попропошайками разного толка.
		Местные торговцы и заезжие купцы пытаются перекричать друг друга. Булочники
		катят тележки со своим товаром и предлагают продавцам и покупателям подкрепиться.
		^
		Ты замечаешь, что несмотря на переполненность площади, ты здесь единственный
		солдат Режима, что кажется тебе весьма странным.
	]];
	obj = {
		'bazaar_gamemaster';
		'bazaar_old_woman';
		'bazaar_jewels_saler';
		'bazaar_thief_leader';
		'bazaar_prystay_seller';
		'bazaar_competitors';
		'bazaar_competitors_counters';
		'bazaar_wolf_man';
	};
	way = {
		'berlinstrasse';
		bazaar_to_lane;
	};
}

-- События
-- Старуха даёт предсказание
on_event('take prediction', function()
	-- Запоминаем это событие
	_bazaar_old_woman_is_burned = true;
	-- Убираем старуху с рынка
	objs('bazaar'):del('bazaar_old_woman');
	-- Добавляем старуху в Переулок
	objs('lane'):add('lane_old_woman');
end)

-- Помогаем главарю воров, нейтрализуя конкурентов
on_event('help to thief leader', function()
	-- Убираем конкурентов с рынка
	objs('bazaar'):del('bazaar_competitors');
	objs('bazaar'):del('bazaar_competitors_counters');
	-- Делаем продавца пряностей счастливым
	objs('bazzar'):del('bazaar_prystay_seller');
	objs('bazzar'):add('bazaar_happy_prystay_seller');
	-- Задание главря воров выполнено
	_thief_leader_quest = false;
	-- Рязвязываем язык главарю воров
	_thief_leader_has_gotten_help = true;
end)

-- Главарь воров нас признал и рассказал, как попасть в подполье
on_event('learned about guild', function()
	bazaar_to_lane:enable();
	-- Убираем главаря воров с рынка
	objs('bazaar'):del('bazaar_thief_leader');
end)

-- Объекты
-- Напёрсточник
bazaar_gamemaster = obj {
	nam = 'Напёрсточник';
	dsc = [[
		Залихватского вида {малый} предлагает всем желающим испытать удачу в напёрстки.
	]];
	act = [[
		-- Сыграть не хочешь, солдатик? -- подзывает он тебя.
		^
		-- Свалить не хочешь отсюда, отребье? -- огрызаешься ты.
		^
		-- Обижаешь, режимник, -- паренёк с нарочитой серьёзностью грозит тебе пальцем.
		^
		Краем глаза ты замечаешь какое-то движение. Обернувшись ты видешь как из толпы
		машет здоровенный дентина машет тебе огромной ладонью. Ещё один мордоворот
		стоит у входа на площадь.
		^
		-- Пошёл к чёрту! -- бросаешь ты и уходишь.
	]];
}

-- Старуха
bazaar_old_woman = obj {
	nam = 'Старуха';
	dsc = [[
		Неподалёку от него прямо на земле сидит {старуха} в лохмотьях,
		и то ли просит милостыню, то ли гадает.
	]];
	act = function()
		event 'take prediction';
		return [[
				Ты подходишь к старухе, чтобы расспросить, но понимаешь,
				что у тебя нет ни гроша.
				Ты собираешься было уйти, но она останавливает тебя жестом.
				^
				-- Подходи, не бойся. Солдатам Режима я будущее открывается бесплатно.
				^
				Она хватает тебя за руку и жадно впивается в неё взглядом.
				^
				-- Так, -- протягивает старуха, -- вижу, служишь ты долго. Ни детей, ни
				добра не нажил. Женщины рядом тоже не вижу, да и друзей у тебя нет.
				Предательство? Нет, предательства не вижу. Или вижу...
				^
				Внезапно, гадалка приходит в замешательство.
				^
				-- Погоди ка, а это что такое? Вижу дым, вижу пламя. Слышу крики.
				Что же это такое? -- она впивается своими длинными ногтями в твою
				ладонь, так что на коже проступает кровь. Ты криком выдёргиваешь руку.
				Но гадалка продолжает говорить.
				^
				-- Что же это? Пожар? -- она пристально смотрит прямо перед собой и
				внезапно вкакивает на ноги.
				^
				-- Пожар! Пожар! Горю!
				^
				Размахивая руками и крича, гадалка бросается прочь, оставляя
				потрясённого тебя под множеством лобопытствующих взглядов.
		]];
	end;
}

-- Торговец камнями
bazaar_jewels_saler = obj {
	nam = 'Тоговец камнями';
	dsc = [[
		На краю площади стоит стол под навесом, за которым восседает
		вычурно одетый {торговец}.
	]];
	act = function()
		if not _orc_is_angry then
			-- Ты ещё не грубил орку
			_orc_is_angry = true
			return [[
				На большом столе скромно покоится искусно cделанная плоская шкатулка.
				Будучи раскрытой она являяет покупателю коллекцию драгоценных камней в
				оправах и без. В качестве защиты от рук камни покоятся под стеклянной крышкой,
				а сама шкатулка цепями крепится к столу. И всё равно такие меры предосторожности
				кажутся тебе незначительными на рынке под открытым небом и с прорвой народу. Если
				бы только рядом с торговцем не стоял огромный громила-орк, мелкие глазки которого
				буравили всякого, кто приближался к столу.
				^
				Рядом с тобой ещё один покупатель протягивает было руку, чтобы указать на
				понравишийся ему камень, как орк тут же издаёт что-то вроде рычания.
				Покупатель в страхе отшатывается от стола.
				^
				-- Без рук, пожалуйста, -- обходительно предупреждает хозяин шкатулки,
				-- Граннарк их выдирает с корнем. Пожалуйста, описывайте словами
				что вам показать.
				^
				-- Я быстрее описаю штаны, -- ворчливо отзывается покупатель и уходит.
				^
				-- Что-то не так? У меня всё по закону, -- обращается к тебе торговец.
				^
				-- А обезьяна дрессированная? -- спрашиваешь ты, кивая головой в сторону
				громилы. Орк в ответ свирепо скалит огромные клыки, а брови торговца
				переползают на лоб. Ты и сам удивляешься собственной дерзости.
				Кажется, этот герб на твоём нагруднике плохо на тебя влияет,
				ты снова ощущаешь себя солдатом Режима с мечом и полномочиями.
				Хотя сейчас ты всего лишь дезертир и меча у тебя никакого нет.
				^
				-- Это что, какая-то шутка? -- обиженно спрашивает торговец, --
				Хотите, чтобы Граннарк здесь всё разнёс? Оставил меня без гроша
				в кармане, да ещё и в тюрьме, а стража Режима без некоторых частей тела?
				^
				-- Удачного дня, -- отвечаешь ты, поспешно ретируясь.
			]];
		end
		-- Ты нагрубил орку
		return [[
			Кажется, ты видел как торговец давал орку какое-то пойло, чтобы успокоить.
			И всё равно тебе больше не хочется связываться с ними.
		]]
	end;
}

-- Главарь воров
bazaar_thief_leader = obj {
	nam = 'Главарь воров';
	dsc = [[
		Дальше в ряду палатка {смуглого мужчины} с чёрной щетиной. Он курит трубку, подолгу провожая
		взглядом каждого прохожего и приятельски улыбаясь.
	]];
	act = function()
		-- Проверяем не давал ли главарь нам задания
		if _thief_leader_quest then
			return [[
				-- Как там "подозрительные" торговцы из Вольных городов? --
				подмигивает тебе торгаш.
			]];
		end;
		-- Если мы ещё не помогли главарю воров, то он просит нас помочь
		if not _thief_leader_has_gotten_help then
			-- Главарь воров даёт нам задание
			_thief_leader_quest = true;
			if _orc_is_angry then
				talk_about_orc = [[
					-- Похоже, у стражей Режима мало проблем, если они решают
					позлить орка. Только вчера же двое умников хотели
					утащить пару камушков. Один думал въехать в стол
					тележкой и удрать от орка, а второй в суматохе разбить
					камнем стекло шкатуклки и прибарахлиться. В итоге
					первый безуспешно бежал не от орка, а от его топора.
					А второму разбил голову орочий кулак, -- торгаш
					усмехнулся, выпустив кольцо дыма, -- зачем ко мне
					пожаловал-то?
					^
				]]
			else
				talk_about_orc = '';
			end;
			return talk_about_orc .. [[
				-- Не видели ли в последнее время кого-нибудь подозрительного?
				^
				Торгаш смеряет тебя хитрым взглядом.
				^
				-- Кажется, я понимаю к чему ты клонишь, приятель.
				Вон те крикливые купцы из Вольных городов очень подозрительные, всех покупателей
				у меня отбили. Мне кажется, что-то тут нечисто.
				^
				-- Чем же они подозрительны?
				^
				-- А ты пораспрашивай сначала их,
				вдруг у них какие-нибудь проблемы с законом обнаружатся, например,
				или они так кричат, потому что хотят срочно покинуть город. Понимаешь, о чём я?
				-- через очередное кольцо дыма ты видишь как торгаш тебе подмигнул.
				^
				-- Как проверишь купцов, так и приходи опять ко мне, и тогда я расскажу тебe
				про что-то действительно "подозрительное".
			]];
		else
			-- Иначе рассказывает, как попасть в подполье
			event 'learned about guild';
			return [[
				-- Я смотрю у купцов, всё-таки были какие-то проблемы, --
				торгаш хитро улыбнулся.
				^
				-- Итак, ты хочешь найти кого-то подозрительного, верно? Как по мне
				так самый подозрительный на этой площади, -- торгаш выдерживает паузу,
				-- это  ты. У тебя какое-то подозрительное лицо.
				Я бы назвал его знакомо-незнакомым.
				^
				Ты взволнованно смотришь на очередное кольцо дыма из трубки, сжимая и разжимая
				кулаки.
				^
				-- Видишь ли, вкрадчиво продолжает торгаш, -- я стараюсь узнать в лицо каждого
				нового рекрута Режима в этом городе. И в силу моей профессии память
				на лица у меня очень хорошая. Но твоё лицо, не очень вяжется
				в моей памяти с древом и книгой.
				^
				-- Меня рекрутировали совсем недавно...
				^
				-- Последний новоиспечённый режимник -- Реджинальд Кирсан, -- трубка тычет
				тебе в грудь, -- и тебе очень не повезло, если это ты. Но ты не Кирсан.
				^
				Тограш глубоко затягивается.
				^
				-- Итак, мы прояснили почему, твоё лицо мне незнакомо. Но почему же оно в тоже
				время кажется мне знакомым? Потому что я видел его на одном из плакатов,
				что режимники развешивают на стенах. И вот мы наконец дошли до сути. Что
				беглый дезертир с гербом Режима на груди делает в городе полным солдат?
				^
				Довольный собой тограш замолкает. Ты в нерешительности смотришь как он
				вытряхивает пепел из трубки.
				^
				-- Понимаю, тут неудобно говорить о таких вещах, -- ты различаешь в его
				голосе некоторое участие твоему положению.
				^
				-- Ладно, смотри, -- он оглядывается по сторонам и берёт твою руку.
				^
				-- Ты здесь, -- мозолистый палец отмечает место на твоей ладони, --
				проходишь по этому ряду, до самого конца. Дальше идёшь направо, --
				палец рисует на твоей ладони короткие линии пути, -- вот здесь будет
				арка между домов, проходишь сюда, затем сворачиваешь,
				делаешь с десяток шагов и ждёшь меня. Ясно?
				^
				Ты хмуро киваешь сосредоточено глядя на свою ладонь, словно там теперь
				подробная карта местности.
				^
				-- Отлично, -- торгаш хлопает тебя по плечу, -- ну, у вас, наверное,
				служба, страж. Не буду больше отвлекать нести это бремя.
			]];
		end;
	end;
}

-- Продавец пряностей
bazaar_prystay_seller = obj {
	nam = 'Продавец пряностей';
	dsc = [[
		Твоё внимание обращает на себя {продавец пряностей},
		который зазывает покупателей громче всех.
	]];
	act = function()
		walk 'bazaar_stories';
	end;
}
-- Продавец пряностей после того, как прогнали купцов
bazaar_happy_prystay_seller = obj {
	nam = 'Довольный продавец пряностей';
	dsc = [[
		Твоё внимание обращает на себя {продавец пряностей},
		который зазывает покупателей громче всех.
	]];
	act = function()
		return [[
			-- И чего мы так шумим? -- обращаешься ты к торговцу, на столе которого
			расставлено множество баночек самых разных размеров и форм.
			^
			-- Эти торгаши из Вольных городов, всех покупателей распугали своей тарабарщиной!
			Хорошо, что вы прогнали этих проходимцев. Теперь-то торговля пойдёт! Кстати, не
			желаете приобрести баночку специй? У меня есть кое-что весьма экзотическое.
			Прямиком с севера Полисов.
			Даже самоё жёсткое мясо превратит в изумительное блюдо.
			^
			Твой живот издал протяжные звуки. Ты всё утро гадал, когда он даст о себе знать.
			^
			-- Нет, спасибо. Удачного дня, -- отказываешься ты и отходишь подальше.
		]];
	end;
}

-- Конкуренты главаря воров
bazaar_competitors = obj {
	nam = 'Купцы из Вольныз городов';
	dsc = [[
		Больше шума чем от него только от каких-то странствующих {купцов},
		лопочущих на непонятном языке.
	]];
	act = [[
		Просто из интереса ты подходишь к купцам и пытаешься завязать разговор.
		Но диалога не получается. Торговцы окружают тебя и продолжают говорить
		все разом на своей тарабарщине. Одни дружески похлопывают тебя по плечам
		или спине, вторые предлагают какие-то напитки в чашах, третьи уже показывают
		свои товары. Очень быстро от всей этой суеты у тебя начинает кружиться
		голова, и ты решительно вырываешься из этого кольца.
	]];
}

-- Прилавки конкурентов главаря воров
bazaar_competitors_counters = obj {
	nam = 'Прилавки купцов';
	dsc = [[
		Их {прилавки} завалены всяческими товарами, но народ всё равно
		обходит эту компанию стороной.
	]];
	act = [[
		Ты осматриваешь добро купцов.
		Глядя на всё это разнообразие, разбегаются глаза. Ткани самых разных фактур,
		с узорами и без, прочее тряпьё, бутылки с экзотическими напитками,
		керамическая посуда.
	]];
	-- Подкидываем купцам субстрат
	used = function(self, what)
		if _thief_leader_quest == true then
			if what == magic_substrate then
				inv():del 'magic_substrate';
				event 'help to thief leader'
				return [[
					Ты подходишь к одному из лотков с тканями с зажатым в кулаке
					мешочком субстрата. Пара торговцев тут же обступает тебя,
					тыкая пальцами в разные свёртки цветастой материи. Ты делаешь вид,
					что выбираешь ткань, берёшь одно полотно в руки и
					разворачиваешь, показательно восхищаяясь узором. Мешочек с субстратом
					падает на землю. Отбросив ткань, ты оказываешься быстрей купцов
					и поднимаешь запрещённый порошок первым.
					^
					-- Это не моё, -- сразу же выпаливает купец, который также нагнулся
					за мешочком.
					^
					-- О, так вы оказывается разговариваете на общем языке! -- язвительно
					замечаешь ты.
					^
					-- Это не наше, -- вмешивается другой. Говор остальных купцов смолкает
					сам по себе. Они начинают взволнованно переглядыааться.
					^
					-- Откуда вы? Из Вольных городов? -- ты тресёшь мешочком перед носом у купца,
					-- И как далеко от вашего города находится Магос? В паре дней пути?
					Всем известно отношение к этой дряне в вашей стране.
					^
					-- Нам не нужны неприятности, -- купец поднимает руки в примирительном
					жесте, -- что вы хотите?
					^
					-- Если вам не нужны неприятности, то убирайтесь из города. Прямо сейчас.
					^
					-- Так быстро?! Но нам нужно обсудить дальнейший путь. Собрать товар,
					пригнать лошадей... --
					^
					-- Да, в тюрьме вы этим заняться не сможете, -- соглашаешься ты.
					^
					Купцы начинают суетиться вокруг своих палаток. Ты с удовольствием наблюдаешь
					за их сборами подбрасывая и ловя мешочек с субстратом.
					^
					Когда цепочка лошадей с нагруженными телегами удаляется с площади, ты с довольным
					видом бросаешь мешочек одному из купцов.
					^
					-- Оставь себе, в знак нашего гостеприимства, -- поясняешь ты и машешь каравану
					на прощание.
				]];
			end;
		end;
		return 'Не сработает.';
	end;
}

-- Человек в волчьей шкуре
bazaar_wolf_man = obj {
	nam = 'Человек в костюме из волчьей шкуры';
	dsc = [[
		На отшибе странного вида {человек} в волчьей шкуре, варит что-то в большом
		котелке на углях. Большая часть прохожих с удивлением поглядывают на эти
		таинства кулинарии и крутит пальцем у виска.
		Человек отвечает им оскалом морды волка, расположившейся у него на голове.
	]];
	act = [[
		Ты подходишь к повару и наблюдаешь, как он плавно помешивает варево в котелке.
		Тебе начинает казаться, что жидкость излучает свечение.
		^
		-- Это орочьий отвар на сушёных грибах, травах и печени, -- не глядя на тебя
		поясняет татуированный, -- один глоток, и раны начинают заживляться сами.
		^
		Во время войны ты уже слышал про чудодейственные зелья орков. Находились
		смельчаки, которые даже пробовали эти зелья. Но что хорошо для орка, для человека
		оборачивалось печальными последтсвиями.
		^
		-- А это ещё что? -- ты обращаешь внимание на стол заваленный всяческими
		костями и перьями.
		^
		-- Амулеты орков, -- отвечает торговец. Только теперь ты замечаешь,
		что его лицо и руки густо покрыты татуировками, -- они способны наделять
		свого владельца разными силами. Есть амулеты из костей и частей лесных зверей.
		Коготь медведя прибавит силы, клык волка -- выносливости, копыто вепря --
		свирепости в бою, -- человек водит испечерённой рисунками рукой по
		ковру своих товаров, -- Есть перья и глаза птиц: ворона, орла, коршуна, филина.
		Они прибавят остроту зрения или прыти в беге. Есть человеческие и орочьи кости...
		^
		-- Спасибо, я понял, -- останавливаешь ты торговца, с извинительной улыбкой,
		чтобы уйти.
	]];
}
