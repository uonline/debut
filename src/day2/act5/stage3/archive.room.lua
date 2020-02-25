-- Переходы
tower_stage3_archive_to_secret_room = vroom('Потайная комната', 'tower_stage3_secret_room');
tower_stage3_archive_to_secret_room:disable()

-- Переменные локации
tower_stage3_archive_first_enter = true;    -- признак первого посещения архива
tower_stage3_archive_book_4_goblins = true; -- признак чередования текстов о гоблинах и культах

-- Локация
tower_stage3_archive = room {
	nam = 'Архив';
	dsc = function()
		archive_description = [[
				Ты оказываешься в затхлом помещении заставленным стелажами с книгами. Здесь
				неожиданно темно, что несколько отрезвляет тебя. С десяток чадащих свечей
				в канделябрах служат ориентирами в этом книжном лабиринте. Темнота лишает
				помещение размеров: верхние полки стелажей исчезают во мраке, ты не видишь
				ни потолка, ни стен.
		]];

		if tower_stage3_archive_first_enter then
			tower_stage3_archive_first_enter = false;
			return archive_description .. [[
				^
				Затаив дыхание, ты напрягаешь слух, но различаешь лишь шипение разогретого
				воска. Тебе остаётся гадать, кто следит за свечами и всеми этими книгами.
			]];
		end;

		return archive_description;
	end;
	obj = {
		'tower_stage3_archive_table';
		'tower_stage3_archive_book_1';
		'tower_stage3_archive_book_2';
		'tower_stage3_archive_book_3';
		'tower_stage3_archive_book_4';
		'tower_stage3_archive_small_letters';
		'tower_stage3_archive_guard';
	};
	way = {
		vroom('Назад', 'tower_stage3');
		tower_stage3_archive_to_secret_room;
	};
}

-- Объекты локации
-- Стол
tower_stage3_archive_table = obj {
	nam = '';
	dsc = function()
		if tower_stage3_archive_first_enter then
			return	[[
				Ты прогуливаешься между стелажами, изучая их содержимое. Некоторым книгам удаётся
				заинтересовать тебя, и ты по наитию достаёшь их с полок и складываешь на
				одинокий стол у входа.
			]];
		end;

		return [[
			Прямо у входа одиноко стоит стол с собранными тобой книгами.
		]];
	end;
}

-- Книга 1
tower_stage3_archive_book_1 = obj {
	nam = '';
	dsc = [[
		{Первая книга} подкупила тебя своими размерами и ярко алым переплётом.
	]];
	act = [[
		Ты берёшь книгу в руки и раскрываешь на запомнившемся тебе месте --
		красочном развороте. Все те названия, которые ты не раз слышал в своей жизни,
		оказались собраны на бумаге в одном месте. Перед тобой искусно выполненная
		карта известного мира -- Эрии. В центре карты расположился огромный континент
		Линара, в сердце которого покоится Внутреннее море. Материк обрамлён тремя массивными
		горными хребтами. Один тянется с севера на юг по западной стороне и кончается
		в крае Разломов. Второй венчает северо-восточную часть континента, скрытую
		за обширными эльфийскими лесами. Последний берет своё начало на Скалистом
		полуострове. Здесь ты без труда находишь хорошо знакомые надписи: Режим Ремана --
		самое большое государство людей на материке, соседствует с Имперскими колониями на
		севере и Приграничьем на западе. Левее от людских стран расположились Земли Верховного
		Шамана -- первое известное истории государство орков. Севернее территорий урук
		во Внутреннем море таится Мистический архипелаг -- группа крупных островов, которые
		делят между собой Вольные Города, Магос и Чародейство Кэлдерис.
		^
		На этом земли Линары известные людскому роду заканчиваются. Большая часть материка
		выкрашена серым цветом, обозначающим территории, на которые не ступала нога человека.
		Вся северная половина континента, западная и южная части обозначены серым. Границы
		материка на них нарисованы гладкой линией без обозначений бухт, заливов и рифов.
		Редкие топонимы выписаны картографом на эльфийском языке. Впрочем, в некоторых местах
		пустое серое пространство разбавляют бурые пятна -- земли, считающиеся потерянными.
		Самое крупное пятно заливает Земли Верховного Шамана и протекает далее на запад до
		края Разломов и выхода к морю.
		^
		Помимо Линары на карте изображены ещё три континента. На западе раскинулись щитообразный
		южный Дарсу и похожий на коготь хищника северный Катор. Оба материка полностью
		закрашенны серым. В противоположенность им, на востоке от Линары пестреет бурым
		обширный Миритал -- легендарная родина людей. В каждом священном писании можно найти
		историю о Катастрофе, событии вынудившим род человеческий искать пристанище на Линаре.
		Тебе доводилось видеть изображения, на которых Миритал погружается под воду, а вереница
		кораблей устремляется на запад. Их первым пристанищем становится архипелаг,
		ныне известный как Имперский. Здесь обосновалась Империя Карающая, грозный надсмотрщик
		судьбы человечества и непримиримый враг всех нелюдей. Но имперский архипелаг
		не мог вместить всех беженцев, и часть людей отправилась дальше на запад, пока не
		достигла Скалистого Полусторова и залива Надежды. Так началась история людей
		на Линаре.
		^
		Общую серость карты разбавляют красные пунктирные линии, обозначающие маршруты
		крупнейших экспедиций людей. Больше всего линий тянется через Разломы к Дарсу,
		восточная граница которого обрамлена бурой рябью исчезнувших поселений.
		Один маршрут начинается с южных берегов Линары из точки под названием Харгфхейм,
		огибает материк по западной стороне, и оканчивается на Каторе. Ещё одна линия
		тянется из Тантикула к Мириталу, как известно поднявшемуся с морского дна.
		^
		Последним твоё внимание привлекает причудливый кусочек земли у северо-восточного
		побережья Линары под названием Лаш. В памяти у тебя пробуждаются истории о сказочном
		эльфийском острове, парящем над водой.
		^
		Ты со вздохом закрываешь книгу. Удивительно насколько велик и неизведан может быть
		мир. И всё в нём может не найтись для тебя места.
	]];
}

-- Книга 2
tower_stage3_archive_book_2 = obj {
	nam = '';
	dsc = [[
		{Следующую} ты выбрал из-за потёртости её обложки и желтизны страниц.
	]];
	act = [[
		Краткая история древнего государства людей, легенды о чёрных птицах
		Забытые королевства.
		Эрадор затмил Тантикул. Плодородные почвы Приграничья. Каменистые почвы
		на западе. Каменоломни. Крепости. Перенести столицу на запад к морю, где
		климат и условия были лучше. Недра разломов. Лихо. Проклятье. Черные птицы,
		король и забвение.
		^
		Вкладыш с некоторыми пометками: описание чёрной птицы, которую находит игрок.
		Герой обращает внимание на вкладыш, только когда выпускает птицу?
	]];
}

-- Книга 3
tower_stage3_archive_book_3 = obj {
	nam = '';
	dsc = [[
		В {третьей книге} тебя привлекло изображение на обложке -- вышитый пейзаж города.
	]];
	act = [[
		Тут хранится множество записей об истории города и об истории Башни наместника.
		^
		Книга-сборник странностей Приграничья, послденее издание.
		Ты находишь в ней заметку о здешней башне.
		^
		Рассуждения о городах древности и подземном мире.
		Города Приграничья на руинах и городищах прошлого.
		Нежить, нечисть и гоблины в глубинах.
		^
		В книге ты находишь записки бывшего советника о строительстве башни и подозрении
		о маге и сговоре о контрабанде субстрата.
	]];
}

-- Книга 4
tower_stage3_archive_book_4 = obj {
	nam = '';
	dsc = [[
		Ты не мог не взять {последнюю четвёрную книгу} в простой чёрной
		обложке, которая буквально притягивала к себе мрачными тайнами.
	]];
	act = function()
		stop_reading = [[
			Ты ловишь себя на мысли, что слишком увлёкся чтением. Усилием воли ты заставляешь
			себя отвести глаза от потёртых страниц и вернуть книгу на стол.
		]];

		tower_stage3_archive_book_4_goblins = not tower_stage3_archive_book_4_goblins;

		if tower_stage3_archive_book_4_goblins then
			return [[
				Ты осторожно берёшь книгу в руки, проводишь рукой по обложке в чёрной коже.
				На титульной странице выписано красивым курсивом название книги -- Монструм,
				без указания автора. Ты листаешь первые страницы, пока не останавливаешься на
				новом разделе.
				^
				Братья, знаю, что я подставляю себя на осмеяние, но стыд не может отменить моего
				долга перед человечеством. Угрозу, которая неоправданно замалчивается в нашем обществе,
				от которой пренибрежительно отмахивается Совет Башен, нависла над нами, словно тучи
				перед грозой.
				^
				Ни для кого не секрет, что человеческая Линара погрязла во множество культов. Среди
				людей царит небывалый разлад в религии и политике.
				Большинство из них ереси религии Благих, которые движет
				стремление к власти и могуществу, граничащие с обыкновенным безумием.
				Таких глупцов губят их собственные амбиции, хотя они и успевают натворить дел.
				Но есть культы болне опасные, которые поражают даже наше прогрессивное общество.
				Некромантия запретная ветвь магии еще
				у эльфов с древних времен манит к себе последователей тайным знанием:
				^
				Спящие секты демонопоклонников, чьи иньересы практически неизвестны, манипулируют прочими ересями,
				извращают религию благих. про режим, его новую религию и эльфийское влияние:
				^
				Храмовники Ордена и возможно инквизиторы знают и борятся с ними;
				^
			]] .. stop_reading;
		end;

		return [[
			Ты осторожно открываешь книгу на странице с загнутым уголком и ещё раз
			погружаешься в пучину текста.
			^
			Думается мне, нет на свете человека, который бы не признал гоблинов самыми
			мерзкими и злобными тварями на земле. И всё же сегодня к ним относятся с
			пренебрежением, как к неизбежному злу, как крысам на свалке. Давно прошли те
			времена, когда гоблинские племена без страха нападали на сёла и города, убивая
			всех без разбору и пожирая трупы. Теперь гроза людских поселений -- орочьи банды.
			Что ни говори, именно орки истребили большинство монстров и страхолюдин, став,
			практически единолично терроризировать земли Приграничья и Полисов. Орки
			загнали гоблинов глубоко в леса и пещеры, превратив их из реальной угрозы в
			страшилки для детей.
			^
			Но тысячи лет назад ситуация была совершенно иной. Первые люди на Линаре ступили
			на земли, принадлежащие гоблинам. И земли эти простирались от южного побережъя
			до Внутреннего моря. Нынешние легенды гласят, что люди Тантикула, заключив союз
			с эльфами, разбили гоблинские армии и изгнали их в холодные южные тундры.
			Реальные же исторические свидетельства, рисуют совершенно другую картину.
			Вот как описывает события тех лет малоизвестный летописец Сиверс Ваарст:
			^
			"Уже к вечеру разведчики принесли ужасные вести: полчища гоблинов заполнили долину Кеалах.
			Всюду простиралась единая чёрная масса уродливых тел, тысячи огней факелов и костров.
			Было там множество гоблинских племён, жуткие волки и вепри, огромные пауки,
			черные колдуны и громадные тролли. Были твари и вовсе неведомые. Ночью гоблины подошли
			к Тантикулу и штурмовали город с ходу. Звёзды скрылись за тучами нетопырей, и кроме их
			писка не было слышно более ничего. Надежды не оставалось никакой, горы трупов едва
			не сравнялись по высоте со стенами. Готовились трубить отступление, хотели уходить в горы,
			вглубь Скалистого полуострова к самому озеру Саарат, а может и дальше.
			Но к утру полчища рассеялись, словно их и не было. Не оставили даже трупов, все сожрали.
			Гоблины ушли на север. А неделей позже к городу прибыли послы из так называемого Леса,
			получившие позднее название эльфы..."
			^
			Из данного текста становится очевидным, что люди в те времена не были гоблинам
			реальными соперниками. Тантикул был в осаде, и не продержался бы и суток, а земли
			вокруг него наверняка были разорены. Иными словами человечество на Линаре спас
			случай. Эльфы прибыли с далёкого севера на войну с гоблинами, не рассчитывая
			обрести здесь союзника. Людям повезло продержаться до их прихода.
			^
			Тот же Сиверс Ваарст пишет, что осадившая Тантикул армия, была лишь
			передовым отрядом. А таких армий было ещё множество. Полчища гоблинов,
			отмечает летописец, были воистину несметными. И все они были разбиты лишь благодаря
			разрушительной магии эльфов. Тогда зачем же эльфам нужно было заключать союз с людьми,
			готовыми в любой момент начать прятаться в горах? Ваарст снова любезно предоставляет
			ответ. По договору с Лесом, люди должны были окончательно искоренить гоблинов
			из зачищенных эльфами земель. Армии Тантикула осаждали руины древних городов, в которых
			гнездились твари. Отряды зачистки спускались в глубокие пещеры и шахты. Иными словами
			эльфы оставили людям всю грязную работу. А взамен жаловали Тантикулу
			все земли к югу и западу от Внутреннего моря.
			^
			Традицию карательных походов на гоблинские территории переняли многие людские правители
			и государства. Тантикул бессчётное число раз объявлял гоблинам войну на истребление.
			И в конце концов тварей удалось отбросить далеко на юг.
			^
			В тоже время поведение Леса даёт основания подозревать, что подобные вторжения
			гоблинов случались и раньше. Эльфы готовились к войне заранее.
			Они встретили передовые армии едва те миновали Скалистый полуостров.
			Подтверждением этой теории служит и тот очевидный факт, что
			гоблины чужды нашему миру. Эти существа больше годятся для жизни под землёй,
			нежели под солнцем. Учитывая плодовитось гоблинского народца, можно сделать вывод,
			что, как только тварям становится тестно в подземельях,
			они начинают своё вторжение на поверхность. Если вторжение удаётся остановить,
			гоблины рассеиваются по лесам, пещерам и руинам, начинают пытаться приспособиться
			к жизни над землёй и <b>вырождаться</b>. Возможно эта фраза прозвучит смешно, но гоблины
			действительно способны деградировать ещё больше. Ваарст, например, описывает гоблинов
			своего времени как уродливых существ с чёрной кожей, длинными жилистыми
			конечностями, сутулящихся и передвигающихся на полусогнутых. Ежели гоблин выпрямится
			в полный рост, пишет Сиверс, то может сравняться с рослым человеком. Среди
			современных гоблинов бурого или тёмно зелёного окраса, что прячутся по лесам и болотам,
			редко можно встретить особь доходящую ростом до груди человека среднего роста.
			Тварей из описания Ваарста в наше время называют глубинными гоблинами.
			Встретить их можно разве, что в глубоких подземельях, затерянных руинах и
			заброшенных шахтах. Только они, кстати, могут обладать упоминаемыми Сиверсом
			мутациями, а так же свободно передвигаться по отвестным стенам и даже потолкам
			подземелий. Следует отметить так же, что тысячи лет назад гоблинам было известно
			кузнечное дело, они ковали оружие, доспехи и даже конструировали осадные машины
			(к счастью Тантикул не испытал на себе их действия). Было у гоблинов и подобие
			культуры, с которым не сравниться их современный примитивный племенной строй.
			Данные факты позволяют заключить, что определённое вырождение действительно
			имеет место быть. Скорость подобной деградации легко объясняет аномальная
			плодовитость. Способ размножения гоблинов до сих пор остаётся загадкой. Людская
			молва приписывает им гермафродитизм, размножение через почкование, помёт и
			переедание. Серьёзные исследователи строят ещё менее правдоподобные теории.
			Необычайная плодовитость обуславливает также необыкновенную приспосабливаемость,
			благодаря которой гоблины до сих пор не вымерли, несмотря на свое вырождение.
			^
			Итак, как было отмечено выше, чрезмерная плодовитось гоблинов в недрах земли
			приводит к вторжению на поверхность. Но сами гоблины обуславливают собственную
			агрессию иными причинами. Нужно отметить, что время от времени к такому объяснению
			прибегают все цивилизованные народы.
			^
			Каприен Усто -- исследователь из тех времён, когда проблема икоренения гоблинов
			сильно тревожила Тантикул. Ему удалось написать десяток трудов об обычиях и
			верованиях нескольких примитивных народов. В своей работе о гоблинах он пытается
			разобраться с религией этого народца. К своему удивлению он не обнаруживает ни духов,
			ни овеществления стихий. Пантеон гоблинов состоит лишь из одного божества, часто
			упоминаемого любым представителем этой расы, но лишённого каких-либо описаний.
			Это загадочное и диктуюющее свою волю существо не имеющее имени, зовётся гоблинами
			просто богом. Ещё более удивителен тот факт, что вожди и шаманы, которые у примитивных
			народов часто оказываются проводниками божественной воли у гоблинов всего лишь
			хорошие воины и колдуны соответсвенно. Каприен пишет, что согласно верованиям, бог
			видит глазами каждого гоблина, и более того, способен общаться с племенем через
			любого его представителя. Усто называет это явление толкунством. Толкуны это прямые
			проводники божественной воли, аватары бога. Ни один гоблин не может ослушаться толкуна.
			Каприен приводит можество свидетельств очевидцев, подтверждающих его исследования.
			В них описываются гоблины, которые говорят и делают, то что обычно гоблины говорить
			и делать неспособны. Например, говорить на человеческом языке, к которому у них
			попросту не приспособлены голосовые связки.
			Каприен продолжает идею Ваарста о гоблинских вторжениях на поверхность, но их причину
			видит не только в перенаселении. Начинать войну на поверхности во враждебной для
			жизни среде среде гоблинам велит их бог, цели которого неведомы его слугам...
			^
		]] .. stop_reading;
	end;
}

-- Неразборчивые письмена
tower_stage3_archive_small_letters = obj {
	nam = 'Свиток с неразборчивыми письменами';
	dsc = [[
		Помимо твоих книг на столе лежит {свиток с пятнами},
		перо и пузырёк с чернилами.
	]];
	act = [[
		Ты внимательно осматриваешь свиток. Надписи на нём
		написаны невообразимо мелким шрифтом, так что текст невозможно
		разобрать. После продолжительного и безрезультатного изучения
		документа ты заключаешь, что это какие-то инструкции, состоящие
		из нескольких абзацев текста и кратких перечней. Единственное, что
		тебе удаётся хоть как-то прочитать, это первую многообещающую надпись:
		^
		<b>Излагаю необходимые разъяснения касательно структуры нашей башни.</b>
		^
		Дальнейший текст не выглядит завершённым: снизу страницы красуются
		огромные чернильные кляксы, несколько строк вычеркнуты.
	]];
	used = function(self, what)
		if what == tower_spyglass then
			event 'got tower book location'
			tower_stage3_archive_small_letters:disable()
			return [[
				Ты осторожно подносишь подзорную трубу к глазу.
				^
				Написано, что в потайной комнате есть некая книга, описывающая магические особенности башни.
				^
				Test
				^
				В архиве в потайной комнате в Башне в книге о её создании ГГ узнаёт, что это башня Мага Магоса.
				Он начинает подозревать, что именно маг-крыса был её создателем. Какие цели преследует он?
			]]
		end
	end;
}

-- Книга с загадками (статуя, книга, библиотека?)
-- Три загадки должны быть на знания истории
-- Страж перезагружается, если пройти этажи по кругу.
-- Загадки сменяют друг друга по кругу,
-- до тех пор пока игрок не отгадает одну из них
tower_stage3_archive_guard = obj {
	nam = '';
	dsc = [[
		Неподалёку от стола на кафедре, больше похожей на алтарь,
		покоится {большая книга} в окружении полукруга свечей.
	]];
	act = function()
		-- Проверяем взяли ли мы квест на кинжал
		if _tower_stage2_stock_dagger_quest then
			walk 'tower_stage3_archive_guard_dlg';
		else
			return [[
					Ты осматриваешь книгу. Внушительных размеров в кожанном переплёте
					она оказывается заперта на странного вида замок.
					Рядом стоит большая чернильница с пером.
					Ты пытаешься открыть книгу, но ничего не выходит.
			]];
		end;
	end;
}

-- Функция для выключения ответов на загадки
turn_off_puzzle = function(puzzle_number)
	-- Выставляем признак, что мы уже попытались пройти загадки в этом прохождении цикла башни
	_tower_stage2_new_loop_puzzle = false;

	-- Выключаем ответы на загадки
	if puzzle_number == 1 then
		tower_stage3_archive_guard_dlg:poff('puzzle_1_answer_1');
		tower_stage3_archive_guard_dlg:poff('puzzle_1_answer_2');
		tower_stage3_archive_guard_dlg:poff('puzzle_1_answer_3');
		-- Включаем следующую загадку
		_tower_stage2_current_puzzle_number = 2;
	end;
	if puzzle_number == 2 then
		tower_stage3_archive_guard_dlg:poff('puzzle_2_answer_1');
		tower_stage3_archive_guard_dlg:poff('puzzle_2_answer_2');
		tower_stage3_archive_guard_dlg:poff('puzzle_2_answer_3');
		-- Включаем следующую загадку
		_tower_stage2_current_puzzle_number = 3;
	end;
	if puzzle_number == 3 then
		tower_stage3_archive_guard_dlg:poff('puzzle_3_answer_1');
		tower_stage3_archive_guard_dlg:poff('puzzle_3_answer_2');
		tower_stage3_archive_guard_dlg:poff('puzzle_3_answer_3');
		tower_stage3_archive_guard_dlg:poff('puzzle_3_answer_4');
		-- Включаем следующую загадку
		_tower_stage2_current_puzzle_number = 1;
	end;
end

-- Функция разагадки
complete_puzzle = function()
	-- Выключаем загадывание
	_tower_stage2_new_loop_puzzle = false;
	-- Выключаем все ответы
	tower_stage3_archive_guard_dlg:poff('puzzle_1_answer_1');
	tower_stage3_archive_guard_dlg:poff('puzzle_1_answer_2');
	tower_stage3_archive_guard_dlg:poff('puzzle_1_answer_3');
	tower_stage3_archive_guard_dlg:poff('puzzle_2_answer_1');
	tower_stage3_archive_guard_dlg:poff('puzzle_2_answer_2');
	tower_stage3_archive_guard_dlg:poff('puzzle_2_answer_3');
	tower_stage3_archive_guard_dlg:poff('puzzle_3_answer_1');
	tower_stage3_archive_guard_dlg:poff('puzzle_3_answer_2');
	tower_stage3_archive_guard_dlg:poff('puzzle_3_answer_3');
	tower_stage3_archive_guard_dlg:poff('puzzle_3_answer_4');
	-- Разрываем цикл смены загадок
	_tower_stage2_current_puzzle_number = 0;
	-- Отмечаем квест на кинжал как пройденный
	_tower_stage2_stock_dagger_quest = false;

	-- Получаем нужную вещь
	-- take
end

-- Диалог со стражем архива
tower_stage3_archive_guard_dlg = dlg {
	nam = 'Ветхая книга';
	hideinv = true;
	entered = function()
		-- Проверяем не разгадывали ли мы загадок в это прохождение башни
		if _tower_stage2_new_loop_puzzle then
			-- Осматриваем книгу
			book_guard_description = [[
				Перед тобой лежит внушительных размеров книга в кожанном переплёте.
				Книга открыта примерно на середине, но её страницы пусты. Рядом стоит
				объёмная чернильница с пером.
			]];

			-- Пишем название вещи, которая нам нужна
			book_guard_wish = [[
				Ты мокаешь перо в чернила и осторожно выводишь в начале страницы:
				^
				? Свиток Ваалама.
				^
				Похоже кладовщик сам не знал, чего ждать от этой книги.
				Потому что через мгновение чернила впитываются в бумагу и на месте твоей надписи
				появляется новая:
			]];

			-- Загадка 1
			-- Включаем ответы на первую загадку, если сейчас её очередь и мы первый раз пытаемся отгадать загадку в текущем цикле прохождения башни
			if _tower_stage2_current_puzzle_number == 1 and _tower_stage2_new_loop_puzzle then
				tower_stage3_archive_guard_dlg:pon('puzzle_1_answer_1');
				tower_stage3_archive_guard_dlg:pon('puzzle_1_answer_2');
				tower_stage3_archive_guard_dlg:pon('puzzle_1_answer_3');
				-- Выводим текст первой загадки
				return book_guard_description .. book_guard_wish ..[[
					^
					Первая загадка про магический субстрат...
				]];
			end;

			-- Загадка 2
			-- Включаем ответы на вторую загадку
			if _tower_stage2_current_puzzle_number == 2 and _tower_stage2_new_loop_puzzle then
				tower_stage3_archive_guard_dlg:pon('puzzle_2_answer_1');
				tower_stage3_archive_guard_dlg:pon('puzzle_2_answer_2');
				tower_stage3_archive_guard_dlg:pon('puzzle_2_answer_3');
				-- Выводим текст второй загадки
				return book_guard_description .. book_guard_wish .. [[
					^
					Вторая загадка про обычаи урук-хай...
				]];
			end;

			-- Загадка 3
			-- Включаем ответы на третью загадку
			if _tower_stage2_current_puzzle_number == 3 and _tower_stage2_new_loop_puzzle then
				tower_stage3_archive_guard_dlg:pon('puzzle_3_answer_1');
				tower_stage3_archive_guard_dlg:pon('puzzle_3_answer_2');
				tower_stage3_archive_guard_dlg:pon('puzzle_3_answer_3');
				tower_stage3_archive_guard_dlg:pon('puzzle_3_answer_4');
				-- Выводим текст третьей загадки
				return book_guard_description .. book_guard_wish .. [[
					^
					Род человеческий начинает свою историю многие тысячилетия тому назад
					на континенте известным своим эльфийским названием как Миритал. Ныне
					этот континент покинут, люди отплыли от его берегов, спасаясь от Катастрофы.
					На протяжении тысяч лет человечество расселялось по миру, разделяясь на множество
					наций, и сталкиваясь с прочими его обитателями. Столкновение с эльфами
					закончилось союзом и появлением объединённого государства. Но время
					не пощадило ни древние страны, ни древние союзы. Исчезли первые нации
					людей на Линаре. Объединённое государство людей и эльфов распалось.
					^
					На сегодняшний день существуют следующие государства людей...
				]];
			end;
		else
			-- Попытка разгадать загадку потрачена
			return [[
				Книга закрыта. Ты пытаешься её открыть, но ничего не выходит.
			]];
		end;
	end;
	phr = {
		-- Ответы на первую загадку
		-- Ответ 1.1
		{
			tag = 'puzzle_1_answer_1';
			false;
			'1.1';
			[[
				Ты берёшь перо и пишешь свой ответ.
				-- Не верно!
			]];
			function()
				turn_off_puzzle(1);
			end;
		};
		-- Ответ 1.2
		{
			tag = 'puzzle_1_answer_2';
			false;
			'1.2';
			[[
				Ты берёшь перо и пишешь свой ответ.
				-- Не верно!
			]];
			function()
				turn_off_puzzle(1);
			end;
		};
		-- Ответ 1.3
		{
			tag = 'puzzle_1_answer_3';
			false;
			'1.3';
			[[
				Ты берёшь перо и пишешь свой ответ.
				-- Верно!
			]];
			function()
				complete_puzzle();
				back();
			end;
		};

		-- Ответы на вторую загадку
		-- Ответ 2.1
		{
			tag = 'puzzle_2_answer_1';
			false;
			'2.1';
			[[
				Ты берёшь перо и пишешь свой ответ.
				-- Не верно!
			]];
			function()
				turn_off_puzzle(2);
			end;
		};
		-- Ответ 2.2
		{
			tag = 'puzzle_2_answer_2';
			false;
			'2.2';
			[[
				Ты берёшь перо и пишешь свой ответ.
				-- Верно!
			]];
			function()
				complete_puzzle();
				back();
			end;
		};
		-- Ответ 2.3
		{
			tag = 'puzzle_2_answer_3';
			false;
			'2.3';
			[[
				Ты берёшь перо и пишешь свой ответ.
				-- Не верно!
			]];
			function()
				turn_off_puzzle(2);
			end;
		};

		-- Ответы на третью загадку
		-- Ответ 3.1
		{
			tag = 'puzzle_3_answer_1';
			false;
			'Режим Ремана, Полисы, Приграничье, Вольные города, Магос, Чародейство Кэлдерис, Империя Карающая.';
			[[
				Ты берёшь перо и пишешь свой ответ:
				^
				Режим Ремана, Полисы, Приграничье, Вольные города, Магос, Чародейство Кэлдерис, Империя Карающая.
				-- Не верно!
			]];
			function()
				turn_off_puzzle(3);
			end;
		};
		-- Ответ 3.2
		{
			tag = 'puzzle_3_answer_2';
			false;
			'Режим Ремана, Имерия Карающая, Приграничье, Вольные города, Магос, Полисы, Харгфхейм.';
			[[
				Ты берёшь перо и пишешь свой ответ.
				-- Не верно!
			]];
			function()
				turn_off_puzzle(3);
			end;
		};
		-- Ответ 3.3
		{
			tag = 'puzzle_3_answer_3';
			false;
			'Имперские колонии, Магос, Режим Ремана, Вольные города, Приграничье, Империя Карающая.';
			[[
				Ты берёшь перо и пишешь свой ответ.
				-- Верно!
			]];
			function()
				complete_puzzle();
				back();
			end;
		};
		-- Ответ 3.4
		{
			tag = 'puzzle_3_answer_4';
			false;
			'Режим Ремана, Имперские Колонии, Приграничье, Вольные города, Магос, Тантикул, Полисы.';
			[[
				Ты берёшь перо и пишешь свой ответ.
				-- Не верно!
			]];
			function()
				turn_off_puzzle(3);
			end;
		};

		-- Уходим
		{
			tag = 'away';
			always = true;
			'Нужно подумать.';
			[[
				Ты оставляешь книгу в пококе и отходишь.
			]];
			function()
				back();
			end;
		};
	};
}
