-- Переменные локации
local lane_counter = 4;

-- Функции локации
-- Функция для обратного отсчёта до завершения игры в переулке
-- Вызывается при взаимодействиях с разными объектами локации, и генерирует разные события,
-- зависящие от счётчика наступления завершения игры
lane_action = function(act_text)
	act_text = act_text .. "^";

	-- Переводим счётчик
	lane_counter = lane_counter - 1;

	-- Герою мерещится
	if lane_counter == 3 then
		act_text = act_text .. [[
			До тебя снова доносится гулкий звук разрушений.
			Ты смотришь в глубину переулка, и обнаруживаешь,
			что теперь ты заперт здесь: огонь подступает с другой стороны,
			пожирая рушащиеся здания.
			^
			Насторожившись, ты оборачиваешься на завал,
			и долго смотришь на него, сам не зная что ты хочешь разглядеть.
			Эта груда камней волнует тебя куда больше, чем пламя.
			Ты решаешь, что просто сходишь с ума.
		]];
	end;

	-- Герой слышит шорох
	if lane_counter == 2 then
		act_text = act_text .. [[
			Резкий звук со стороны завала заставляет тебя обернуться.
			Тебе под ноги скатывается несколько камней.
			^
			Зарево пожара в квартале заметно угасло.
			Теперь о нём напоминает лишь оранжевые оттенки ночного неба.
			Тени в переулке теряют очертания и сливаются в единое покрывало.
			Они накрывают всё вокруг, и ты уже не можешь сказать изменилось ли что-то в завале.
		]];
	end;

	-- Герой видит как завал "оживает"
	if lane_counter == 1 then
		act_text = act_text .. [[
			Новый стук совсем рядом заставляет тебя вздрогуть.
			Он раздаётся снова и снова, превращаясь в ритмичную дробь.
			Ты слышишь её так отчётливо, что у тебя уже не остаётся сомнений,
			что завал ожил и готов наброситься на тебя.
		]];
	end;

	-- Кевраза выбирается из-под завала
	if lane_counter <= 0 then
		walk 'destroyed_in_lane';
		return act_text .. [[
			Звук внутри завала становится нестерпимым, ты больше не можешь игнорировать его.
			Но ты не успеваешь приготовиться к новой угрозе.
			Гора крошева взрывается изнутри, несколько каменных осколков рассекают тебе лицо.
			Ты видишь лишь размытое движение, перерождающееся в сияющий метал прямо перед тобой.
			Глаза богоизбранного в которых нет ничего человеческого...
			Резкий порыв ветра подхватывает тебя и поднимает в воздух.
			...
		]];
	end;

	return act_text;
end;

-- Локация
lane_room = room {
	nam = 'Переулок';
	dsc = function()
		if lane_wall:disabled() then
			return [[
				Тебя окружают громадные кучи обломков и чёрные остовы зданий.
				Свет пятнами выплясывает на руинах.
				Сухой горячий ветер разбивается об уцелевшие скалы зданий.
			]];
		end;

		return [[
			Тебя окружают потрескавшиеся стены, на которых дрожат чёрные жирные тени.
			Узкая полоска света разрезает влажный полумрак надвое,
			напоминая тебе о трепещущем пламени, пожирающем квартал откуда ты сбежал.
			Переулок заботливо заглушает треск огня, грохот разрушений и вой ветра,
			будто желая преуменьшить опасность.
		]];
	end;
	obj = {
		'lane_covered_hatch';
		'lane_covered_hatch_blocked';
		'lane_wall';
		'lane_huge_beam';
		'lane_huge_beam_shifted';
		'lane_pile_of_boxes';
		'lane_pile_of_trash';
		'lane_spear';
		'lane_blockage';
		'lane_godchosen';
		'lane_godchosens_sword';
		'lane_dead_citizen';
	};
	enter = function()
		-- Debug
		take 'burning_quarter_knife';
		return [[
			Едва ты оказался в полутьме зажатой между рядами покосившихся зданий,
			как над твоей головой просвистело копьё.
			Подрагивая, оно воткнулось прямо за канализационной решёткой.
		]];
	end;
}

-- Объекты локации
-- Руки
lane_arms = obj {
	nam = 'Руки';
	inv = function()
		if have 'lane_mystical_artifact' then
			return [[
				Ты рассматриваешь свои руки, и тебе кажется будто,
				они странным образом увеличились в размерах.
				Кольцо жадно впилось в палец, но ты легко игнорируешь боль.
				^
				Так же легко ты выносишь неожиданную тяжесть амулета,
				притаившегося у тебя на груди.
				Глядя на него, ты отмечаешь, что земля под ногами выглядит
				дальше чем обычно, словно ты прибавил в росте.
			]];
		end;

		return [[
			Ты рассматриваешь свои руки словно видишь их впервые.
			И хотя выглядят они как обысно, под кожей среди мышц и жил
			пульсирует небывалое ощущение силы.
			^
			В такт пульсу крови кольцо на пальце то жжёт, то холодит кожу.
		]];
	end;
}

-- Мистический артефакт
lane_mystical_artifact = obj {
	nam = 'Амулет';
	inv = [[
		Ты осматриваешь свой амулет-оберег.
		Удивительно, но ты без труда можешь рассмотреть его в полумраке.
		В руках карлика по прежнему зажат драгоценный камень,
		излучающий спокойное сияние.
		С момента вашей последней встречи, поза карлика поменялась.
		Или это тебе лишь мерещится.
	]];
}

-- Люк
lane_covered_hatch = obj {
	nam = 'Люк';
	dsc = [[
		Совсем рядом замерла стиснутая булыжником {решётка}, ведущая в канализацию.
	]];
	act = function()
		return [[
			Ты осматриваешь решётку коллектора, прикидывая, сможешь ли ты сдвинуть её в одиночку,
			до того как богоизбранный до тебя доберётся.
			Ты сомневаешься стоит ли вообще пробовать.
		]];
	end;
	used = function(self, what)
		if what == lane_arms then
			walk 'killed_in_lane';
			return [[
				Ты пытаешься приподнять решётку и после неимоверных усилий тебе это удаётся.
				Обливаясь потом, ты сдвигаешь металлическую пластину, открывая проход в канализацию.
				^
				Протерев глаза, ты увидел перед собой закованного в сталь богоизбранного.
				Удар латной руковицы опрокидывает тебя на спину.
			]];
		end;
	end;
}

-- Люк заваленный
lane_covered_hatch_blocked = obj {
	nam = 'Люк';
	dsc = function()
		if (not lane_pile_of_boxes:disabled()) or (not lane_pile_of_trash:disabled()) then
			return [[
				{Решётка} теперь погребена где-то под слоем рухляди и мусора.
			]];
		end;

		return [[
			Совсем рядом замерла стиснутая булыжником {решётка}, ведущая в канализацию.
		]];
	end;
	act = function()
		if (not lane_pile_of_boxes:disabled()) or (not lane_pile_of_trash:disabled()) then
			return [[
				Ты пытаешься отыскать взглядом решётку коллектора,
				но среди этого хлама трудно что-то разглядеть.
			]];
		end;

		if not lane_huge_beam_shifted:disabled() then
			return [[
				Ты рассматриваешь решётку, но сомневаешься, что у тебя сдвинуть её,
				пока сверху придавлен упавшей балкой.
			]];
		end;

		return [[
			Ты рассматриваешь решётку коллектора.
			Посередине отчеканено что-то вроде герба -- ворон c туловищем льва.
			^
			Несмотря на то что, выглядит решётка внушительно,
			ты не теряешь надежы попасть в коллектор.
		]];
	end;
	used = function(self, what)
		if what == lane_arms then
			if not lane_pile_of_boxes:disabled() or not lane_pile_of_trash:disabled() then
				return [[
					Ты пытаешься отыскать взглядом решётку коллектора,
					но среди этого хлама трудно что-то разглядеть.
				]];
			end;

			if not lane_huge_beam_shifted:disabled() then
				return lane_action([[
					Ты пытаешься приподнять решётку, но тщетно, крышка лаза остаётся неподвижной.
				]]);
			end;

			-- Конец
			walk 'the_end';
		end
	end;
}
lane_covered_hatch_blocked:disable()

-- Кладка стены
lane_wall = obj {
	nam = 'Кладка стены';
	dsc = [[
		На стене напротив решётки чернеет трещина-змея похожая скорее на тень,
		но только тень эта совсем не боится отсветов пламени.
		{Кладка} этой стены уже начала осыпаться.
	]];
	act = [[
		Ты мимоходом осматриваешь стену,
		и твой взгляд останавливается на большом камне.
		Тебе кажется, что он вот-вот вывалится сам.
	]];
	used = function(self, what)
		if what == lane_arms then
			lane_wall:disable();
			return [[
				Быстрым движением, ты выхватываешь камень из стены,
				и не мешкая, швыряешь его в латника.
				Наплечник богоизбранного украшает новая вмятина,
				и теперь он не сводит с тебя глаз.
			]];
		end;
	end;
}

-- Огромная балка
lane_huge_beam = obj {
	nam = 'Огромная балка';
	dsc = [[
		Из бока соседнего, початого огнём здания, ребром торчит {огромная балка},
		удерживающая его от разрушения.
	]];
	act = [[
		Ты осматриваешь балку, и приходишь к выводу,
		что у тебя может получиться сдвинуть её с места.
	]];
	used = function(self, what)
		if what == lane_arms then
			local crush_text = [[
				Разбежавшись, ты таранишь балку плечом.
				С треском она обрушивается на стену с трещиной-змеёй.
				^
			]];

			-- Проверяем разрушена ли кладка стены
			if lane_wall:disabled() then
				self:disable();
				lane_huge_beam_shifted:enable();
				lane_covered_hatch:disable();
				lane_covered_hatch_blocked:enable();
				lane_pile_of_boxes:enable();
				lane_pile_of_trash:enable();
				lane_godchosen:disable();
				lane_godchosens_sword:disable();
				lane_blockage:enable();
				lane_dead_citizen:enable();

				return crush_text .. [[
					Змея стремительно превращается в гидру, отращивая с десяток новых головов.
					Но уже в следующее мгновение головы превращаются в крылья, покрывая собой всю стену.
					Камень водопадом сыпется вниз, а вслед за ним обрушиваются доски и брёвна крыши.
					Всё это под оглушительный грохот лавиной накрывает переулок.
					Ты пригибаешься и закрываешь голову руками, надеясь, что тебя не завалит.
					К счастью для тебя, всё ограничивается синяками на спине и плечах.
				]];
			end;

			walk 'killed_in_lane';
			return crush_text .. [[
				Здание гулко вздыхает, но к твоему ужасу каким-то чудом остаётся стоять.
				^
				Богоизбранный проникает в переулок и оказывается перед тобой совершенно невредимым.
				Ты с трудом подныриваешь под гудящий меч, но не успеваешь увернуться от эфеса.
				Удар приходится прямо в скулу, и ты валишься богоизбранному под ноги.
			]];
		end;
	end;}

-- Огромная сдвинутая балка
lane_huge_beam_shifted = obj {
	nam = 'Огромная балка';
	dsc = function()
		if (not lane_pile_of_boxes:disabled()) or (not lane_pile_of_trash:disabled()) then
			return [[
				На том месте, где ты ожидал её увидеть, покоится {поваленная балка}.
			]];
		end;

		return [[
			Прямо на ней покоится {поваленная балка}.
		]];
	end;
	act = [[
		Ты толкаешь балку ногой, но она никак не реагирует.
	]];
	used = function(self, what)
		if what == lane_spear then
			lane_huge_beam_shifted:disable();
			return lane_action([[
				Ты втискивает остриё копья под балку и, используя древко как рычаг,
				сдвигаешь балку в сторону.
			]]);
		end

		if what == lane_arms then
			-- Проверяем есть ли мистический артефакт у героя
			if have 'lane_mystical_artifact' then
				lane_huge_beam_shifted:disable()
				return lane_action([[
					Широко расставив ноги и обхватив балку обеими руками, ты отрываешь её о земли.
					Сам удивляясь откуда в тебе столько силы, ты бросаешь свой груз в сторону.
				]]);
			end;

			return lane_action([[
				Попытавшись сдвинуть балку, ты чувствуешь, что у тебя недостаточно силы.
			]]);
		end;
	end;
}
lane_huge_beam_shifted:disable()

-- Груда ящиков
lane_pile_of_boxes = obj {
	nam = 'Груда ящиков';
	dsc = function()
		if not lane_huge_beam_shifted:disabled() then
			return [[
				Балку окружает с десяток {каких-то ящиков}.
			]];
		end;

		return [[
			На том месте, где ты ожидал её увидеть, навалена {гора ящиков}.
		]];
	end;
	act = [[
		Ты рассматриваешь нагромождение ящиков.
		Объёмные и деревянные, такими обычно пользуются торговцы.
	]];
	used = function(self, what)
		if what == lane_arms then
			lane_pile_of_boxes:disable();
			return lane_action([[
				Ты торопливо раскидываешь ящики в разные стороны.
				Большая их часть бъётся об стену и обидчиво трещит древесиной.
			]]);
		end;
	end;
}
lane_pile_of_boxes:disable()

-- Куча хлама
lane_pile_of_trash = obj {
	nam = 'Куча хлама';
	dsc = function()
		if not lane_pile_of_boxes:disabled() then
			return [[
				Многие из них открыты или пробиты, и их содержимое образовало в настоящую {свалку}.
			]];
		end;

		if not lane_huge_beam_shifted:disabled() then
			return [[
				Балка утопает в {куче хлама}.
			]];
		end;

		return [[
			{Хлам} ковром покрывает всё вокруг тебя.
		]];
	end;
	act = [[
		Ты рассматриваешь хлам перемешанный с обломками.
		Он состоит по большей части из невразумительного мусора каких-то железяк,
		трепья и досок. Попадается так же и еда, вроде яблок или странных овощей.
	]];
	used = function(self, what)
		if what == lane_arms then
			lane_pile_of_trash:disable();
			take 'lane_mystical_artifact';
			return lane_action([[
				Ты начинаешь остервенело расшвыривать мусор ногами, но внезапно встаёшь как вкопанный.
				В куче у тебя под ногами, выжидает удивительно знакомый предмет.
				Затаив дыхание, ты наклоняешься, чтобы рассмотреть его.
				Поражённый увиденным, ты хватаешь его и быстро надеваешь на шею.
			]]);
		end;
	end;
}
lane_pile_of_trash:disable()

-- Копьё
function lane_spear_text_getting()
	return [[
		Приложив усилие ты выдёргиваешь копьё из земли.
		Тебе приходится ухватиться за древко обеими руками,
		чтобы подавить сопротивление глубоко засевшего наконечника.
	]];
end;

function lane_spear_text_fail_taking()
	return [[
		Ты мельком смотришь на копьё, и решаешь, что сейчас оно тебе ничем не поможет.
		Тесак урук-хай в твоей руке сидит как влитой, и не желает уступать своё место.
	]];
end;

function lane_spear_text_gameover()
	return lane_spear_text_getting() .. [[
		^
		Едва копьё попадает в твои руки,
		как перед тобой вырастает бронированная фигура богоизранного.
		Латник не даёт тебе и шанса пустить оружие в ход.
		Меч замысловато разрезает воздух, а заодно и древко копья.
		^
		Следующим движением богоизбранный укладывает тебя на лопатки, пнув в грудь ногой.
		На земле твой затылок уже поджидает что-то твёрдое и угловатое.
	]];
end;

function lane_spear_text_breaking()
	return [[
		Стоит тебе сомкнуть ладонь на древесине копья, как раздаётся неприятный треск.
		Древко ломается у тебя в руке как сухая ветка.
	]];
end;

lane_spear = obj {
	nam = 'Копьё';
	dsc = [[
		^
		Периодически напоминает о себе покачивающееся {копьё}.
	]];
	tak = function()
		-- Проверяем не заняты ли у героя руки
		if not have 'lane_arms' then
			return lane_spear_text_fail_taking(), false;
		end;

		-- Проверяем есть ли на сцене Кевразы
		if not lane_godchosen:disabled() then
			walk 'killed_in_lane';
			return lane_spear_text_gameover();
		end;

		-- Проверяем есть ли у героя мистический артефакт
		if have 'lane_mystical_artifact' then
			lane_spear:disable();
			return lane_action(lane_spear_text_breaking()), false;
		end;

		return lane_action(lane_spear_text_getting());
	end;
	inv = [[
		Ты разглядываешь копьё.
		Твои познания в оружии оставляют желать лучшего,
		но копьё которое обычно используют солдаты Режима ты узнаёшь без труда.
		^
		Острие и древко выпачканы в орочьей крови.
		Ты проводишь пальцем по древесине, и убеждаешься, что она уже высохла.
	]];
	used = function(self, what)
		if what == lane_arms then
			-- Проверяем не под завалом ли Кевраза
			if not lane_godchosen:disabled() then
				walk 'killed_in_lane';
				return lane_spear_text_gameover();
			end;

			-- Проверяем есть ли у героя мистический артефакт
			if have 'lane_mystical_artifact' then
				lane_spear:disable();
				return lane_action(lane_spear_text_breaking());
			end;

			take 'lane_spear';
			return lane_action(lane_spear_text_getting()), self.tak;
		end
	end;
}

-- Богоизбранный
function lane_godchosen_gameover()
	return [[
		Не видя другого выхода, ты решаешь попробовать лишить богоизбранного его меча.
		Ты рассчитываешь, что старику в тяжёлом доспехе не достанет проворства,
		и тебе удасться проскользнуть ему за спину.
		^
		Стоит тебе сорваться с места, как ты чувствуешь,
		что воздух вокруг словно сгущается. Твои движения странным образом замедляются,
		а тело наливается тяжестью. Тебе кажется, что проходит бездна времени,
		прежде чем тебе удаётся добраться до богоизбранного.
		^
		Меч оглушительно свистит в воздухе, и плашмя бьёт тебя в висок.
		На глаза опускается пелена.
	]];
end;

lane_godchosen = obj {
	nam = 'Богоизбранный';
	dsc = [[
		^
		Скрежеща доспехами, через завал пробирается {богоизбранный}.
	]];
	act = function()
		if have 'burning_quarter_knife' then
			return [[
				Не отводя глаз, ты смотришь на богоизбранного.
				Если его не остановить, то он скоро доберётся до тебя.
				^
				Неожиданно, ты слышишь скрипучий голос старого вояки.
				^
				-- А ты оказался не так прост для дезертира,
				-- произносит латник, так будто тебя здесь нет,
				-- что это за странная сила? Колдовство?
				Может быть ты ещё и нечестивец или еретик?
				Возможно мне стоит схватить тебя и доставить в Режим выбраковщикам?
				Они допросят тебя как следует.
				^
				-- Чтобы попасть в Режим, нам нужно для начала выбраться отсюда,
				-- откликаешься ты.
				^
				-- Не стоит надеяться, что наказание миует тебя,
				-- отвечает богоизбранный,
				-- если ты думаешь, что знаешь, что тебе нужно,
				это еще не значит, что это действительно так.
				Возможно, ты уже давно устал бегать от судьбы, дезертир.
				Поэтому ты появился в этом городе и стал убийцей.
				^
				-- Я не убивал советника, -- только и можешь возразить ты.
				^
				-- Но суд решил иначе, -- жёстко пресекает латник,
				-- пусть меч проверит колдун ты или нет.
			]];
		end;

		return [[
			Не отводя глаз, ты смотришь как приближается богоизбранный.
			Ещё немного, и он неминуемо доберётся до тебя.
		]];
	end;
	used = function(self, what)
		if what == burning_quarter_knife then
			inv():del 'burning_quarter_knife';
			take 'lane_arms';
			return [[
				Взвесив тесак, ты прицеливаешься и отправляешь нож в полёт.
				Хотя ты никогда не учился метанию оружия, тебе показалось,
				что для первого раза вышло вполне неплохо.
				Богоизбранный оступился, и упав на одно колено,
				инстинктивно заслонился мечом.
				Метал столкнулся с металом, породив ворох искр,
				и орочий тесак исчез где-то в темноте.
				^
				Тебе показалось, что на лице старика что-то дрогнуло в момент удара.
			]];
		end;
		if what == lane_arms then
			walk 'killed_in_lane';
			return lane_godchosen_gameover();
		end;
	end;
}

-- Меч богоизбранного
lane_godchosens_sword = obj {
	nam = 'Меч';
	dsc = [[
		{Меч} в его руке пылает алыми бликами.
	]];
	act = function()
		return [[
			Ты внимательно смотришь на полуторный меч, стиснутый в железных пальцах,
			и отчётливо понимаешь, что поединке у тебя нет шансов.
			Ты вспоминаешь, что после того, как ты опрокинул старого вояку,
			что-то в нём поменялось.
			Его старческие глаза... несмотря на возраст, он превосходит тебя
			опытом и умением обращаться с мечом.
			Но если он воспользуется своей силой богоизбранного,
			он может сделать с тобой что угодно.
		]];
	end;
	used = function(self, what)
		if what == burning_quarter_knife then
			walk 'killed_in_lane';
			return [[
				Ты выступаешь против латника с тесаком урук-хай.
				Огромный нож приятно тяготит твою руку.
				Ты рассчитываешь, что старику в тяжёлом доспехе не достанет проворства,
				и тебе удасться проскользнуть ему за спину.
				^
				-- Вижу, в тебе ещё осталась щепотка храбрости, дезертир,
				-- кивает старый вояка, -- но мы ещё посмотрим,
				сможешь ли ты умереть как солдат, а не как преступник.
				^
				Стоит тебе сорваться с места, как ты чувствуешь,
				что воздух вокруг словно сгущается. Твои движения странным образом замедляются,
				а тело наливается тяжестью. Едва добравшись до неподвижного богоизбранного,
				ты отводишь тесак для удара. Тебе кажется, что проходит бездна времени
				после замаха, и теперь нож начинает приближаться ко всё ещё бездвижному латнику.
				^
				Но до старика орочье лезвие так и не добирается.
				Меч оглушительно свистит в воздухе, и плашмя бьёт тебя в висок.
				На глаза опускается пелена.
			]];
		end;
		if what == lane_arms then
			walk 'killed_in_lane';
			return lane_godchosen_gameover();
		end;
	end;
}

-- Завал
lane_blockage = obj {
	nam = 'Завал';
	dsc = function()
		text = [[
			который преграждал путь в переулок прибавил в размере,
			перекрыв проход окончательно.
		]];

		if lane_counter < 4 then
			return '^{Завал},' .. text;
		end;

		return '^Завал,' .. text;
	end;
	act = function()
		local text = {
			[1] = [[
				Ты смотришь на завал, уже не сомневаеясь, что под ним есть движение.
				Тебя бросает в холод, от мысли, что может выбраться из-под него.
			]];
			[2] = [[
				Ты с подозрением осматриваешь завал.
				Тебе кажется, что один из валунов дрогнул,
				как если бы его толкнули изнутри.
			]];
			[3] = [[
				Ты осматриваешь завал, раздумывая,
				мог ли старый вояка пережить такие разрушения.
				На него обрушился целый второй этаж и крыша.
				Даже человеку в доспехах будет сложно уцелеть после такого.
				Если он не богоизбранный.
			]];
		};
		return text[lane_counter];
	end;
}
lane_blockage:disable()

-- Тело горожанина
lane_dead_citizen = obj {
	nam = 'Тело горожанина';
	dsc = [[
		Среди руин виднеется неподвижное {тело}.
	]];
	act = [[
		Ты всматриваешься в лежащего, надеясь распознать в нём богоизбранного.
		Но...
		^
		Ты узнаёшь своего сослуживца...
		С прежней жизнью покончено. Её остатки сгорели вместе с этим городом.
	]];
}
lane_dead_citizen:disable()

-- TODO
-- Reflection:
-- Кевраза не предлагает ГГ выбора, хотя и чувствует схожесть с ним.
-- Напротив, он приводит ГГ к мысли, что никакого выбора не существует.
-- После ГГ исчезает в катакомбах. Это рассуждение остается для обдумывания игроком:
-- = разве у меня когда-нибудь был выбор?
--
-- Герой должен прийти к осознанию, того что его жизнь постоянно находится в руках чьих-то
-- чужих сил -- Режима (в который он вступил сам). Мысль о рождении в семье, которую он
-- уже не помнит.
--
-- Игра своим финалом должна напомнить игрокам, что безучастная жизнь в отрыве от каких
-- либо идеалов и идей ведёт к худшему концу для всех (ты становишься исполнителем
-- чужой воли и носителем чужих идей).
--
-- Вина героя в том, что он не смог помешать планам капитана?;
-- Ключевое деяние героя отсутсвие деяний даже, когда он пытается их совершить;
--
-- Показать крайность между равнодушием и амбициями.
--
-- Герой сегодняшнего мира -- винтик в механизме судьбы;
-- Кевраза через свою историю, которую он сравнивает с историей героем, должен подвести
-- игрока к сравнению с героем.
--
-- Изменится ли Приграничье, люди в нём и сам мир?
--
-- Амулет (мистическое нечто) и голос? Стихи;
-- Цитирование второй половины стиха в финале (из диалогов птицы);
