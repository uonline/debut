_wants_cocaine = false
_wants_answers = true

_rat_talk_about_mission = true
_rat_talk_about_fail = false
_rat_talk_about_you = false
_rat_talk_about_tower = false
_rat_talk_about_dust = false

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
			-- Да нет. Тут другое. Видишь ли я студиоуз Академии.
			^
			-- Что-то?
			^
			-- Маг из Магоса. Начинающий.
			^
			-- Чёрта с два!
			^
			-- Придёться поверить.
			^
			-- А эти парни в курсе?
			^
			-- К счатью нет. Меня приняли за контрабандиста.
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
		В углу камеры сидит {крыса}. Она что-то грызёт, поглядывая на тебя
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
				Вчера ты совершал более безумные поступки, чем говорить с крысой.
				^
				-- Слушай, а чего тебя вообще понесло в Приграничье? -- справшиваешь ты.
				^
				-- В Магосе есть исследователи, которые считают эту страну
				кладезем магических аномалий.
				^
				-- Да, чертовщины здесь немало...
				^
				-- Обывателяем это может показаться чертовщиной. На деле же аномалия --
				определённое искажение магических законов. Бывает, что она возникает
				сама по себе, но существуют и созданные умышленно.
				^
				-- И какую ищешь ты?
				^
				-- Моей целью как раз было, определить происхождение здешней аномалии.
				Я собирался исследовать башню местного наместника.
				Результаты позволили бы мне закончить обучение и стать признаным магом.
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
				в городе командует какой-то капитан. Меня схватили, когда его не былов городе.
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
				-- Когда на стройке пропадали люди никто особно не волновался.
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
				-- Такое ощущение, что пропавшие могли сущетвовать только внутри башни, такими
				какими она их запомнила.
			]];
		end;

		if _rat_talk_about_dust then
			_rat_talk_about_dust = false
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
				колдунов. Куда реже в истории попадаются государтсва, легализовавшие
				колдовство. Хватит пальцев одной руки.
				^
				-- А Магос видимо не только легализовал, но и решил сам делать магов?
				Для этого у вас придумали субстрат?
				^
				-- Субстрат придумали эльфийские вельможы, не согласные с политикой
				Лесного Совета. Это было задолго до создания Магоса, во времена, когда
				эльфы покровительствовали людям. Мятежники из эльфийской знати заключили
				с лидерами нескольких стран договор, по которому создавалось объединённое
				государство людей и эльфов. В обмен на это перворождённые должны были
				обучать колдовству любого желающего человека.
				^
				-- И давно это было?
				^
				-- Тысячи лет назад. Магос осколок этого древнего государства.
				И вообще хватит уже распросов, -- крыса недовольно запищала, --
				Если я хочу превратиться обрано в человека, мне лучше
				приберечь силы. А общение в этой форме тратит их очень быстро.
				^
				Ты не особо поверил этому волшебному грызуну, но покорно спрятал крысу обратно.
			]];
		end;

		return _rat_take .. [[
			Крыса выглядит уставшей.
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
				-- Братан, дай последнюю дозу, век воли не видать.
				^
				-- Не ссы, фраер, ща принесу.
				^
				Через некоторое время стражник действительно возвращается
				с мешком белого порошка.
				^
				-- Так, окей, теперь загадай число...
				^
				В течение десяти минут ты отвлекаешь стражника сложными
				расчётами, и за это время тебе удаётся незаметно пропихнуть
				10-килограммовый мешок через дырку в стене.
				^
				-- ...и получилось семь!
				-- Шайтан! Шо творится, шо творится, -- и стражник озадаченно
				уходит. Обернувшись, ты видишь рядом с собой совершенно
				обычную, ничем не примечательную ярко-синюю крысу с ключами
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
					-- Приляг, еще полежи, по-вспоминай. Ты тут надолго.
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
				-- Башка гудит. За что меня засадили-то? Ничерта не помню...
				^
				-- А ты кашки поешь, может вспомнишь, -- бросает тебе стражник, и отправляется
				дальше шататься по коридору.
			]];			
		end;
	end;
}
