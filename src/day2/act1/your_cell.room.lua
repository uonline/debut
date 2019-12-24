_wants_cocaine = false
_wants_answers = true

_rat_talk_about_mission = true -- Разговор о делах мага в городе
_rat_talk_about_fail = false   -- Разговор о поимке мага
_rat_talk_about_you = false    -- Разговор о тебе
_rat_talk_about_tower = false  -- Разговор о башне
_rat_talk_about_dust = false   -- Разговор о субстрате

_mage_dialogs = false          -- Открываем ветки диалогов с магом в лагере подполья и с чёрной птицей в караульной, если true

your_cell_to_prison_hall = vroom('Тюремный коридор', 'prison_hall');
your_cell_to_prison_hall:disable();

your_cell = room {
	nam = 'Твоя камера';
	dsc = function()
		if _wants_cocaine then
			return [[
				Ты стоишь на холодном полу тюремной камеры. Рядом валяется жестяная миска.
				Её содержимое расплескалось по полу.
				^
				Вокруг темно и воняет.
			]];
		end;
		return [[
				Резкий звук выдёргивает тебя из небытия. Ты лежишь на холодном полу
				тюремной камеры. Рядом подрагивает жестяная миска, которую стражник
				услужливо швырнул тебе под ноги. Её содержимое расплескалось по полу.
				^
				Вокруг темно и воняет.
			]];
		end;

	obj = {
		'window';
		'hole';
		'meal';
		'your_cell_guard';
		'rat';
	};
	way = {
		your_cell_to_prison_hall;
	};
}

window = obj {
	nam = 'Прорезь';
	dsc = [[
		{Узкая прорезь} под потолком окрашена в тёмно-синий.
	]];
	act = function()
		return [[
			Ты всматриваешься в прорезь. Похоже, снаружи ранее утро.
		]];
	end;
}

hole = obj {
	nam = 'Дыра в стене';
	dsc = [[
		На смежной стене у пола что-то чернеет. Если присмотреться, можно различить
		совсем {крошечную дыру}.
	]];
	act = function()
		_wants_cocaine = true
		return [[
			Ты подбираешься к дыре поближе и нагнувшись, заглядываешь внутрь. По-началу
			ты видишь едва различимое пятно света, но оно быстро пропадает.
			^
			-- Нет желания выбраться отсюда? -- доносится из дыры шёпотом.
			^
			-- Желание есть, возможностей никаких.
			^
			-- Шевелиться можешь?
			^
			-- Пока да.
			^
			-- Уже что-то. У меня-то и с этим проблемы, -- слышишь ты вздох из дыры.
			^
			-- Не приглянулся тюремщикам?
			^
			-- Да нет. Тут другое. Видишь ли я студиоз Академии.
			^
			-- Что-то?
			^
			-- Маг из Магоса. Начинающий.
			^
			-- Чёрта с два!
			^
			-- Придётся поверить.
			^
			-- А эти парни в курсе?
			^
			-- К счастью нет. Меня приняли за контрабандиста.
			Иначе я был бы сейчас золой в костре, или на полпути в Режим.
			^
			-- Магический субстрат, -- догадался ты.
			^
			-- Он самый, причём в приличном количестве, -- он сделал паузу,
			-- видишь ли, на определённом этапе обучения маг-ученик зависит от этой дряни.
			Она едва ли не заменяет еду. Так что без неё, я не то что колдовать, даже
			двигаться не могу...
			^
			-- И? -- кажется, ты начинаешь догадываться, куда тот клонит.
			^
			-- Короче, делай что хочешь, но уговори стражника принести тебе, хоть немного
			субстрата. С ним я вытащу нас отсюда.
		]];
	end;
}

rat = obj {
	nam = 'Крыса';
	dsc = [[
		В углу камеры сидит {крыса}. Она потирает передние лапки, поглядывая на тебя
		наглыми чёрными глазками.
	]];
	tak = [[
		Ты осторожно подходишь к крысе, наклоняешься и протягиваешь руку.
		Грызун послушно запрыгивает в твою раскрытую ладонь и замирает.
		Пожав плечами, ты прячешь крысу за пазуху.
	]];
	inv = function()
		_rat_take = [[
			Ты достаёшь крысу из-за пазухи и внимательно рассматриваешь.
			^
		]];

		_rat_talk = _rat_take .. [[
			В ответ в твоей голове раздаётся голос мага:
			^
		]];

		if _rat_talk_about_mission then
			_rat_talk_about_mission = false
			_rat_talk_about_fail = true
			return _rat_talk .. [[
				-- Чего смотришь? Говори.
				^
				Ты вздрагиваешь от неожиданности, но не видишь причин удивляться.
				Вчера ты совершал более безумные поступки, чем разговоры с крысой.
				^
				-- Слушай, а чего тебя вообще понесло в Приграничье? -- спрашиваешь ты.
				^
				-- В Магосе есть исследователи, которые считают эту страну
				кладезем магических аномалий.
				^
				-- Да, чертовщины здесь немало...
				^
				-- Обывателям это может показаться чертовщиной. На деле же аномалия --
				определённое искажение магических законов. Бывает, что она возникает
				сама по себе, но существуют и созданные умышленно.
				^
				-- И какую ищешь ты?
				^
				-- Моей целью как раз было, определить происхождение здешней аномалии.
				Я собирался исследовать башню местного наместника.
				Результаты позволили бы мне закончить обучение и стать признанным магом.
				^
				-- А как ты собирался в неё проникнуть?
				^
				-- Устроился бы на работу слугой к какому-нибудь городскому советнику.
				^
				-- Весёленькая у вас магов жизнь.
			]];
		end;

		if _rat_talk_about_fail then
			_rat_talk_about_fail = false
			_rat_talk_about_you = true
			return _rat_talk .. [[
				-- Что?
				^
				-- Всё хочу тебя спросить, а как ты попался?
				^
				-- Проклятый местный богоизбранный, -- крыса злобно сверкнула глазами-бусинками,
				-- Почувствовал магию субстрата.
				Хотя конечно, это я виноват. Нужно было больше мудрить с защитными заклятьями.
				^
				-- Погоди, если тебя поймал богоизбранный, он мог бы раскрыть в тебе мага и
				отправить в Режим.
				^
				-- Это довольно странный богоизбранный. Кажется, у него проблемы с, кхм, его
				богоизбранностью. И как я понял, он здесь не особо много решает. Штабом Режима
				в городе командует какой-то капитан. Меня схватили, когда его не было в городе.
				Сегодня ночью капитан вернулся, и я ждал аудиенции... А потом приволокли тебя.
				 ^
				 -- Интересно это всё.
			]];
		end;

		if _rat_talk_about_you then
			_rat_talk_about_you = false
			_rat_talk_about_tower = true
			return _rat_talk .. [[
				-- Знаешь, нет ничего приятного в том, чтобы
				сидеть у мужика подмышкой. И ждать на ладони, пока он на тебя пялится.
				Давай уже выбираться отсюда. И не забудь потом помыться.
				^
			]];
		end;

		if _rat_talk_about_tower then
			_rat_talk_about_tower = false
			_rat_talk_about_dust = true
			return _rat_talk .. [[
				-- Спрашивай уже.
				^
				-- А чем так примечательна эта башня наместника?
				^
				-- Чертовщиной, как ты изволил выразиться, -- ты уловил тень издёвки
				в голосе мага, -- Хотя ладно. Это не особо длинная история, расскажу.
				Когда война кончилась и Режим поставил наместника править городом,
				тот повелел построить эту башню.
				^
				-- Так.
				^
				-- Когда на стройке пропадали люди никто особо не волновался.
				Но башню достроили, а люди продолжили исчезать. Наместник не придавал
				этому значения. А потом пропал сам.
				^
				-- А что в этом необычного? Люди имеют свойство пропадать. Особенно
				с чужими деньгами.
				^
				-- Всё дело в том, что потом они находились. Причём там же в башне.
				Есть свидетельства, в которых люди не раз встречали наместника.
				Из плоти и крови, в здравом уме. Он мог раздавать распоряжения,
				строить планы, а потом снова исчезнуть. Башню обыскивали сверху до низу.
				Все лазы запечатали. Богоизбранные допрашивали строителей. Но безрезультатно.
				^
				Крыса приняла задумчивый вид, перед тем как подвести итог своего рассказа.
				^
				-- Такое ощущение, что пропавшие могли существовать только внутри башни, такими
				какими она их запомнила.
			]];
		end;

		if _rat_talk_about_dust then
			_rat_talk_about_dust = false
			_mage_dialogs = true
			return _rat_talk .. [[
				-- Ещё вопрос?!
				^
				-- Знаешь, я никогда не думал, что богоизбранные Режима колдуя, зависят от субстрата.
				^
				-- Глашатаи Режима, объясняют их колдовство чудесами веры
				и божественным вмешательством.
				На деле же, богоизбранные просто волшебники одарённые от природы.
				Им не нужен субстрат, чтобы развивать свои способности.
				^
				-- Природой избранные?
				^
				Крыса насмешливо пискнула.
				^
				-- Можно и так сказать. Во все времена среди людей можно было встретить
				колдунов. Куда реже в истории попадаются государства, легализовавшие
				колдовство. Хватит пальцев одной руки.
				^
				-- А Магос видимо не только легализовал, но и решил сам делать магов?
				Для этого у вас придумали субстрат?
				^
				-- Субстрат придумали эльфийские вельможи, не согласные с политикой
				Лесного Совета. Это было задолго до создания Магоса, во времена, когда
				эльфы покровительствовали людям. Мятежники из эльфийской знати заключили
				с лидерами нескольких стран договор, по которому создавалось объединённое
				государство людей и эльфов. В обмен на это перворождённые должны были
				обучать колдовству любого желающего человека.
				^
				-- И давно это было?
				^
				-- Тысячи лет назад. Магос осколок этого древнего государства.
				И вообще хватит уже расспросов, -- крыса недовольно запищала, --
				Если я хочу превратиться обратно в человека, мне лучше
				приберечь силы. А общение в этой форме тратит их очень быстро.
				^
				Ты не особо поверил этому волшебному грызуну, но покорно спрятал крысу обратно.
			]];
		end;

		return _rat_take .. [[
			Крыса выглядит уставшей и ты прячешь её назад.
		]];
	end;
}
rat:disable()

meal = obj {
	nam = 'Грязна миска';
	dsc = [[
		 У массивной дубовой двери камеры валяется {миска} с чем-то дурно-пахнущим.
	]];
	act = function()
		return [[
			Ты рассматриваешь пятно вокруг миски, и решаешь, что на завтрак подавали кашу.
			Что-то похожее на эту кашу, сейчас у тебя в голове.
		]];
	end;
}

your_cell_guard = obj {
	nam = 'Скучающий стражник';
	dsc = [[
		Периодически в окошке двери камеры мелькает круглая башка {стражника},
		неумолимо топающего по коридору взад-вперёд.
	]];
	act = function()
		if _wants_cocaine then
			disable 'hole'
			disable 'your_cell_guard'
			enable 'rat'
			enable 'your_cell_to_prison_hall'
			return [[
				Ты подходишь к окошку со стальными прутьями и подзываешь стражника рукой.
				Скучающий верзила небрежно подходит ближе.
				^
				-- Заскучал?
				^
				-- Ты, я смотрю, тоже невесел. Может выручим друг-друга?
				^
				Тюремщик оценивающе прищурился, но ты смог разглядеть
				пробудившийся в его глазах интерес.
				^
				-- Слушай, тошно мне, сил нет, аж зубы сводит, -- ты изображаешь,
				выражение лица убиенного, -- Выручи, а. Мышь на хвостике весть
				принесла, что арестант у вас с грузом загремел. Мне бы совсем чуть-чуть,
				горсточку. А я уж тебя развлеку как-нибудь. Обоим польза.
				^
				-- Ты колдун, что ли, я не понял?
				Может мне за тебя монет выручить тогда? У церковников? --
				стражник хищно заулыбался пеньками жёлтых зубов.
				^
				-- Да ты чего?! Какой колдун?! Так, у бродячих циркачей кое-чего понахватался.
				Вот теперь расплачиваюсь. Выручишь, а?
				^
				Стражник молча уходит. Через некоторое время он возвращается
				с небольшим мешочком в кулаке.
				^
				-- Руку, -- шипит тюремщик, с опаской осмотрев коридор.
				Ты просовываешь раскрытую ладонь между прутьев, и её заполняет
				кучка поблескивающего порошка.
				^
				-- Только без фокусов. Верней без глупостей. А то я и войти могу,
				-- предостерегает стражник. В подтверждение своих слов, он угрожающе звенит
				связкой ключей.
				^
				Кивнув. Ты нагнулся, исчезнув из окошка, и изобразил шумный вдох
				скопившегося вожделения. Выдержав паузу ты заходишься в приступе
				неимоверного кашля и натурально сваливаешься на пол... Заглянув в окошко,
				стражник видит как корчась ты ползёшь по полу, не переставая кашлять.
				^
				-- Засранец снюханный, -- сквозь зубы цедит тюремщик, -- потом разберусь с тобой.
				Смотри только не сдохни.
				^
				Услышав шаги тюремщика, ты подбираешься к дыре и высыпаешь перед ней
				горсть порошка. Через пару мгновений порошок засасывает внутрь.
				Устроившись поудобней ты ждёшь, сам не зная чего. Но ожидание оправдывает
				себя, когда из дыры появляется крыса с ключами
				в зубах. Не мешкая ни минуты, ты открываешь камеру.
			]];
		end;

		if _wants_answers then
			_wants_answers = false
			return [[
					Ты подходишь к окошку со стальными прутьями и подзываешь стражника рукой.
					Скучающий верзила небрежно подходит ближе.
					^
					-- Оклемался?
					^
					Ты изображаешь, страдальческое выражение лица, столько раз наблюдаемое
					тобой у кузнеца в твоей деревне.
					^
					-- Котелок не варит вообще. Меня куда упрятали-то?
					^
					-- Приляг, ещё полежи, по-вспоминай. Ты тут надолго.
					^
					-- Да где, тут-то?! -- вопрошаешь ты затылок удаляющего стражника.
			]];
		else
			_wants_answers = true
			return [[
				Ты подходишь к окошку со стальными прутьями и подзываешь стражника рукой.
				Скучающий верзила небрежно подходит ближе.
				^
				-- Чего надо?
				^
				Ты изображаешь, страдальческое выражение лица, столько раз наблюдаемое
				тобой у кузнеца в твоей деревне.
				^
				-- Башка гудит. За что меня засадили-то? Ни черта не помню...
				^
				-- А ты кашки поешь, может вспомнишь, -- бросает тебе стражник, и отправляется
				дальше шататься по коридору.
			]];
		end;
	end;
}
