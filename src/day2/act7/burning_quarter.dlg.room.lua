-- Диалог с проповедником
burning_quarter_priest_dlg = dlg {
	nam = 'Проповедник';
	hideinv = true;
	phr = {
		-- О чём ты?
		{
			tag = 'what_do_you_mean';
			true;
			'О чём ты?';
			[[
				-- О твоей нелепой попытке походить на героя, конечно же, -- проповедник
				пожирает тебя глазами, -- я знал, что ты объявишься. И ты появился, аккурат
				в преддверии кульминации. Аки камушек, порождающий оползень.
				^
				Ты наблюдаешь как его сгорбленные плечи конвульсивно подёргиваются в такт речи.
				^
				-- Я следил за твоей судьбой, как только тебя доставили в город,
				-- признаётся проповедник, -- появление колдуна, могло бы сильно исказить
				её ход, но даже оно было использовано как должно.
				Маг помог тебе выбраться из тюрьмы и услужливо направил в нужном направлении.
				Ты удивишься, но капитан обрёк бы тебя на схожую участь:
				стать ещё одним его агентом в подполье, -- странная улыбка вернулась на худое лицо,
				-- он уже приготовил те бумаги, с которыми ты потом носился весь день.
				Планировал вручить тебе их вместе с важной миссией в обмен на свободу.
				Но ты его немного опередил и выкрал документы сам.
				^
				Ты внемлешь проповеднику в немом оцепенении.
				^
				-- Капитан хотел, чтобы ты попал в башню, прихватив с собой кое-кого. И так оно
				и вышло, потому что, очевидно, это было нужно не только ему. Все дороги в
				этом городе ведут в башню. Она -- катушка, на которую легко накручиваются
				смертные судьбы. И всё же, несмотря на предсказуемый исход, было интересно
				наблюдать за твоими блужданиями во тьме. Ты даже добрался до старика-отшельника,
				давно уже переставшего различать реальность, воспоминания и пьяный бред.
				И вот он, бежавший когда-то из башни, отправляет в неё тебя. Не иначе, как
				искупить собственные грехи. Что ж, краем уха я слышал как ты согласился на эту
				авантютру и могу оценить широту твоего жеста.
				Дезертир под личиной солдата вознамерился спасти целый город, который и не
				подозревает о его существовании. Какая самоотверженность! -- прововедник
				прищёлкнул пальцами, -- конечно, я опускаю некоторые детали: вроде угроз
				твоих сообщников, и ожидания тобой награды за сей поступок. Но сам душевный
				порыв! Никто решил стать <b>кем-то</b>! Весьма похвально.
				^
				Внутри тебя начинает вить кольца холодное склизкое чувство, походящее на страх.
				И даже нарастающий жар не может избавить тебя от дрожи.
				^
				-- Но увы, и в этом деле, как и во многих других, всё могло бы обойтись без тебя.
				Даже если бы ты не надоумил главаря этой шайки отправиться в башню к старику
				советнику, то сучка-грязнокровка сама бы его туда потащила.
				Их отношения давно напрашивались на развязку, -- проповедник усмехнулся,
				-- к тому же советник мешал им обоим.
				^
				-- Мешал? -- опешил ты, -- они хотели просить его о помощи.
				^
				-- О нет, ты не понимаешь, кем был этот советник, и чем было это подполье,
				-- человек в рясе покачал головой, -- Конрой был птицей высокого полёта.
				Во время войны лишь благодаря его опыту военачальника городу удалось
				отбиться от нападения орков. И хотя после оккупации Режима он перестал играть
				значимую роль в совете, в народе о нём не забывали.
				Этот старик не смог поладить с новым наместником,
				но нашёл общий язык с проклятым богоизбранным.
				И поэтому тот до сих пор ревносто следил за брошенной башней.
				Ходили даже слухи, что советник готовит заговор против наместника.
				Вот почему, он был опасной фигурой для подполья. Если бы Конрой пришёл
				к власти, необходимость в этом сборище отребья отпала бы сама собой.
				Представь, что советник объединяет людей и спасает город. Твой приятель
				просто остался бы не у дел.
				^
				Проповедник изучающе смотрит на тебя.
				^
				-- Ты был прекрасным козлом отпущения. Непойми кто, который ничего не знает
				о делишках местной банды. Хотя конечно у меня не было уверенности, что
				твой дружок решился бы сразу убивать советника. Он мог бы заручиться его
				поддержкой, чтобы организовать оборону. Если бы, конечно, смог бы спасти его
				от этой бешенной суки. Очень много "если". Но рисковать я не стал.
			]];
			function()
				burning_quarter_priest_dlg:pon('about_underground');
			end;
		};
		-- О подполье
		{
			tag = 'about_underground';
			false;
			'Так это ты убил лидера подполья?';
			[[
				Худощавую фигуру сотрясает приступ смеха.
				^
				-- Лидера подполья? Да никакого подполья никогда и не было.
				Злые языки говорят правду: есть только шайка воров и головорезов.
				А твой "лидер", лишь жалкий чернодревец.
				^
				Видя непонимание на твоём лице, проповедник снова улыбается.
				^
				-- Он появился в городе после войны. Его мечтой было сколотить здесь
				подконтрольную шайку из воров, контрабандистов, мордоворотов
				и головорезов. Само собой он не чурался связей и с орками.
				Действовал довольно нагло, прижал многих здешних отморозков.
				Но одной персоны всё же опасался. Этой грязнокровки.
				Она обосновалась здесь за несколько лет до него.
				Кормилась наёмными убийствами и охотой за головами.
				Работала всегда одна, но накопила в криминальных кругах немалый вес.
				Я думаю, он подозревал кто она и кому служит.
				Поэтому и решил держать ее поближе к себе. Держи друзей близко, а врагов ещё ближе.
				Уже после в подполье начало вливаться всякое отребье типа меня.
				И их охотно принимали, памятуя о нетерпимости Режима к людям второго сорта,
				которые не годятся стать честными гражданами.
				^
				На мгновение тебе показалось, что тщедушное тело в чёрной рясе увеличилось
				в размерах. Но наваждение быстро исчезло.
				^
				-- Идея подполья в качестве ширмы была выбрана не просто так.
				Это привлекло на его сторону немало купцов противников порядков Режима.
				Симпатизировала подполью и городская стража. Скоро его люди были по всему городу.
				^
				-- Ты назвал его чернодревцем, -- перебиваешь ты.
				^
				-- В Режиме они хорошо известны. Чёрное древо -- течение, зародившееся
				в Тантикуле ещё во время правления Ремана Первого. Сторонники прежней религии
				и порядков. Противники религии Блага, легализации магии и власти богоизбранных.
				Им удалось обманом посадить на трон Андераса Седьмого, в надежде что тот пложит
				Режиму конец. Но богоизбранные оказались сильней, и Чёрное древо стало вне закона.
				Теперь чернодревцы тешат надежду поднять восстание против режимников в Приграничье
				и Полисах. И наш "лидер" сопротивления здесь был именно за этим.
				Его конечной целью было договориться с синдикатами: наладить поставку оружия
				из Вольных городов в обмен на рынок сбыта субстрата на континенте.
				Дела шли неплохо, но местный капитан и выскочка маг спутали все карты.
			]];
			function()
				burning_quarter_priest_dlg:pon('about_halfblood');
			end;
		};
		-- О Полукровке
		{
			tag = 'about_halfblood';
			false;
			'Ты сказал, что Полукровка служилала кому-то вне подполья.';
			[[
				-- Ты уже должен был догадаться по чьей указке она действовала.
				Что может быть общего у капитана Режима с убийцей полуэльфийкой
				помимо постельных утех? Они оба работают на одного нанимателя.
				^
				-- Полуэльфийкой? -- удивляешься ты, -- разве это не сказки?
				^
				-- Только для простолюдинов, которые эти сказки и сочиняют,
				-- проповедник нехорошо ухмыльнулся,
				-- Ты думаешь своё прозвище она получила за красивые глаза?
				Хотя по правде говоря, именно за них. Ведь это глаза эльфа.
				А кровь её загрязнена магией Леса. Теперь-то ты понимаешь,
				почему наш дорогой "лидер сопротивления" и грязнокровка
				постоянно спорили? Чернодревцы ненавидят эльфов. Ведь они
				уверены, что весь Режим это эльфийская проделка.
				^
				-- И на какого нанимателя они работают?
				^
				-- В твоём распоряжении было столько документов, мог бы изучить
				их более внимательно, -- ты чувтвуешь в голосе проповедника
				подлинный упрёк, словно он и впрямь недоволен тобой,
				-- могу сказать лишь, что покровитель человека и полуэльфийки
				происходит из бессмертных обитателей земли, что парит в небесах.
				^
				Бледный длинный палец указывает наверх в клубящуюся черноту дыма.
				Ты замечаешь как на пальце призывно поблескивает драгоценное кольцо.
				Тебя кольнуло смутное чувство потери, но ты не можешь вспомнить, что же ты потерял.
			]];
			function()
				burning_quarter_priest_dlg:pon('about_your_fate');
			end;
		};
		-- О герое
		{
			tag = 'about_your_fate';
			false;
			'А на кого работаешь ты?';
			[[
				-- Работаю? Я служу, -- измождённое лицо проповедника сменило самодовольное
				выражение на раболепное, -- служу, как и ты.
				^
				-- Как и я? -- его заявление тебя смутило.
				^
				-- А ты думал, ты один такой? -- усмехается проповедник, расправив неожиданно
				широкие плечи, -- Она никогда не ограничит себя одним фаворитом.
				^
				-- О ком ты говоришь? -- все мысли разом вылетели из твоей головы.
				^
				-- А ты глупей, чем я думал, -- он разачарованно качает головой.
				Костлявые пальцы с силой сгибаются и разгибаются, и золотое кольцо
				слепит тебя кровавым бликом.
				^
				Ты не отводишь глаз от худой фигуры в рясе.
				Тебе кажется, что раньше она не возвышалась над тобой так как сейчас.
				С беспокойством ты осматриваешь округлившиеся плечи и большие ладони.
				Складки ткани разгладились на широкой груди проповедника.
				Он грозно взирает на тебя сверху вниз.
				^
				-- Нет, ошибки быть не может, это ты. Ты слуга многоликой,
				-- его голос без труда заглушает пылающую бурю вокруг вас,
				-- и ты уже не раз встречал Её. Хотя и не понял кто Она.
				^
				-- Она? -- с беспокойством переспрашиваешь ты.
				^
				-- Та, что отныне смотрит на мир твоими глазами и постигает его твоим сознанием.
				Неужели ты не почувствовал, как тебя дёргали за ниточки всё это время?
				Вели к людям, с которыми ты бы никогда не связался. Пробудили в тебе интерес
				к тому, чем бы ты никогда заинтересовался. Ты вообще задумывался
				откуда в людях берётся интерес к чему либо? В тебе этот интерес к окружающему миру
				пробудила Она. Чтобы познавать этот мир через тебя.
				Хотя, конечно, это весьма куцое познание. Что могут дать глаза, уши, тело или
				разум человека? Лишь искривлённое отражение истины.
				^
				-- Спятивший еретик, -- шепчешь ты заплетающимся языком, отступая назад.
				Но фигура в чёрных одеждах не отдаляется, напротив она продолжает увеличиваться
				в размерах.
				^
				-- Еретик? -- проповедник заходится громоподобным смехом, -- я послушник последнего
				в этом мире культа истины. И один из немногих смертных, кто сохранил рассудок.
				В то время как сумасшедшие еретики это большая часть человечества.
				Жалкие людишки, которые отчаянно цепляются за своих Святых, Благих, Благо, магию
				и чёрт знает за что ещё. Они верят в песенки о загробной жизни, что напевают
				своему стаду грешники-жрецы и старики-колдуны.
				Но только никакого лучшего мира ни по эту, ни по ту сторону нет.
				Есть только тьма и огонь. И через них проложена узкая тропинка к истине.
				Те кто осмелятся пройти по этой тропинке, придут в конце концов к Ней.
				Или к Нему.
				^
				-- К Нему? -- твои губы стали влажными от холодного пота, проступившего на лице.
				^
				-- Такой простой выбор Он или Она. Холодная ночь или бушующее пламя,
				-- проповедник с безумной улыбкой разводит руки в стороны, собираясь
				объять весь город, -- Вот же они! Прямо сейчас Они борятся за наш смертный мир.
				Просто выбери сторону. Но люди даже этого не могут.
			]];
			function()
				burning_quarter_priest_dlg:pon('priest_wish');
			end;
		};
		-- О желании проповедника
		{
			tag = 'priest_wish';
			false;
			'Что тебе от меня нужно?';
			[[
				-- Как жаль, что ты спросил об этом.
				^
				Резкий порыв ветра взметнул одеяния проповедника. Окружённый развевающимия
				лоскутами чёрной ткани, он и вовсе стал безразмерным, сливающимся с ночью.
				Лишь белая маска лица и длинные кисти рук отражают всполохи пожара.
				^
				-- Невыразимо приятно стоять здесь, и просто наблюдать, как Они пожирают этот город.
				Но ты прав: Она не будет ждать долго. Все должно быть отмерено.
				^
				Его ладонь исчезает в трепещущей материи рясы, и тут же появляется в другом
				месте, извлекая на свет длинную тусклую полосу металла.
				Кинжал мерцает сёрым, словно игнорируя господство красного и оранжевого вокруг.
				^
				-- Мне нужно, чтобы ты исчез, -- раздаётся шёпот у тебя в голове.
			]];
			function()
				walk 'burning_quarter_fight';
			end;
		};
	}
}

