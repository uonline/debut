-- Переменные локации
_collector_drunk = false
_collector_took_lord_sign = false

-- Локация
collector = room {
	nam = 'Укрытие старика';
	dsc = [[
		После непродолжительного похода через мрак тесного тоннеля,
		ты пробираешься в обширную пещеру. Свет проникает сюда через несколько
		щелей в высоком своде, но его настолько мало, что ты с трудом ориентируешься
		в пространстве.
	]];
	obj = {
		'collector_man';
	};
	way = {
		'sewer';
	};
}

-- Объекты
-- Бывший советник
collector_man = obj {
	nam = 'Старик';
	dsc = [[
		Где-то впереди ты видишь сгусток мрака. Судя по холоду, которым
		веет с той стороны, это ещё один тоннель, куда большего
		размера. Рядом с ним ты различаешь какое-то {копошение}.
	]];
	act = function()
		-- Если советник получил знак расположения лорда, то делаем доступным диалог с ним
		-- if _collector_took_lord_sign then
		if true then
			walk 'collector_man_dlg';
			return;
		end;

		-- Если советник выпил
		if _collector_took_lord_sign then
			return [[
				Ты прислушиваешься. Из темноты доносятся приглушённые
				завывания, похожие на пьяные песни. Ты решаешь, что больше
				от старика ничего не добиться.
			]];
		end;

		-- Текст с началом передачи советнику одного из предметов
		local collectors_drink = [[
			Ты решаешь не испытывать судьбу и сразу изложить свои
			намерения.
			^
			-- Эй старик, -- шепчешь ты в темноте, -- меня просили
			кое-что тебе передать!
			^
			Не услышав ответа, ты продолжаешь:
		]];

		-- Текст с описанием чтения советником бумаг капитана
		local collector_read = [[
			^
			-- Так что тебе нужно от меня? -- спрашивает старик.
			^
			-- У меня с собой есть кое-какие важные документы, -- объясняешь ты,
			-- мне нужно, чтобы вы взглянули на них.
			^
			-- Что за вздор? -- снова заводится он, -- какие ещё документы?
			^
			-- Вам лучше посмотреть их самим. Только благодаря ним я здесь.
			^
			-- Твоё счастье, что я был слаб зрением в молодости, -- ворчит
			старик, -- и старость чудесным образом вернуло ему остроту. Давай
			их сюда.
			^
			Ты извлекаешь из-под нагрудника документы и передаёшь старику.
			^
			-- Стой здесь, -- получаешь ты строгое указание.
			^
			Когда шарканье и шлепки затихают где-то во мраке, одна из стен
			пещеры озаряется пятном дрожащего света. Только теперь ты понимаешь,
			насколько велика эта пещера.
			^
			В темноте тебе кажется, что время практически не движется. Проведя весь
			день на ногах, ты решаешь присесть на землю. Но вскоре понимаешь, что это
			плохая затея: пол пещеры слишком холодный.
			^
			Пока ты бесцельно бродишь взад-вперёд, свет гаснет.
			^
			-- Я же велел тебе, стоять здесь, -- раздаётся брюзжание старика.
			^
			Ты торопливо идёшь на голос и чуть не врезаешься в скрюченную тень.
			^
			-- Вот, держи свои бумажки, -- ты аккуратно принимаешь документы и
			прячешь их в уже привычное место.
			^
			-- Это тоже возьми, -- старик суёт тебе в ладонь связку ключей.
			^
			-- Это мне зачем? -- спрашиваешь ты.
			^
			-- Передашь это тому, кто послал тебя ко мне, -- отвечает он, --
			если верить всему, что написано, то у вас мало времени.
			^
			-- Вы думаете, не все бумаги настоящие?
			^
			-- Чушь! Печати, почерки, всё настоящее. Я не об этом! Думаю,
			заговор лордов не единственная беда. Эти письма с непонятными символами
			указывают, что кто-то использует знать в своих целях. И тогда
			получается, что времени у вас нет вообще.
			^
			-- Так что мне делать? -- недоумённо спрашиваешь ты.
			^
			-- Можете попробовать показать эти бумаги советнику Конрою. У него
			ещё осталось немного благоразумия и власти.
			^
			-- И где его искать?
			^
			-- Где-то в башне наместника, -- скрипуче усмехается старик, --
			Cтарый осёл, продолжает работать там, когда сбежали уже все кто
			мог. У меня остались ключи от некоторых дверей, в том числе от
			его комнаты. Я передал их тебе. Удачи.
			^
			С этими словами старик разворачивается и шаркает прочь.
		]];

		-- Если есть знак расположения лорда
		if have 'lord_sign' then
			_collector_took_lord_sign = true;
			event 'ready to rock the boat';
			inv():del 'lord_sign';
			take 'tower_keys';
			return collectors_drink .. [[
				^
				-- Тот парень со светлыми волосами в роскошном наряде хотел,
				что бы я отдал тебе одну вещь. Сейчас я подойду ближе, и передам
				её.
				^
				-- Не нужно, -- доносится откуда-то неподалёку, -- я сам возьму.
				^
				Ты слышишь шлепки по воде, сменяющиеся шарканьем по камню. Наконец,
				перед тобой появляется сгорбленный силуэт.
				^
				-- Что там у тебя? -- старческое прерывистое дыхание сменяется
				ворчанием.
				^
				Ты протягиваешь вперёд ладонь с брошью. Пальцы старика, словно
				лапы паука, начинают осторожными прикосновениями изучать твою руку.
				В конце концов они нащупывает брошь и утаскивают её в темноту.
				Ты выдыхаешь с облегчением.
				^
				-- Он всё-таки расстался с ней, -- слышишь ты скрипучий голос. Для
				тебя остаётся загадкой, что это значит.
				^
				Какое-то время вы оба молчите.
			]] .. collector_read;
		end;

		-- Если есть бутылка вина
		if have 'rocky_island' then
			_collector_drunk = true;
			event 'ready to rock the boat';
			inv():del 'rocky_island';
			take 'tower_keys';
			return collectors_drink .. [[
				^
				-- Помнишь того усатого пройдоху? Он обещал тебе бутылку отменного
				вина. Вот оно, у меня. Сейчас я подойду ближе и отдам её тебе.
				^
				-- Не нужно, -- доносится откуда-то неподалёку, -- я сам возьму.
				^
				Ты слышишь шлепки по воде, сменяющиеся шарканьем по камню. Наконец,
				перед тобой появляется сгорбленный силуэт.
				^
				-- Что там у тебя? -- старческое прерывистое дыхание сменяется
				ворчанием.
				^
				Ты протягиваешь ему бутылку, и он выхватывает её у тебя из рук.
				Старик с невиданной ловкостью выдёргивает пробку и делает
				глубокий глоток.
				^
				-- Действительно Скалистый берег, -- говорит старик, вытирая рот.
				^
				-- Значит, не такой уж усач и пройдоха, -- заключаешь ты.
				^
				-- Что тебе от меня нужно? -- бутылка становится легче ещё на один
				глоток.
				^
				-- У меня с собой есть кое-какие важные документы, -- объясняешь ты,
				-- мне нужно, чтобы вы взглянули на них.
				^
				-- Они наверное чертовски важные, да? -- спрашивает старик, откашливаясь, --
				Знаешь, я знаю зачем он тебя послал.
				^
				Старик роется за пазухой.
				^
				-- Вот, держи, -- тебе в руку суют связку ключей, -- он уже давно хотел
				их заполучить. Пускай порадуется.
				^
				-- А документы? -- удивлённо спрашиваешь ты.
				^
				-- К чёрту! -- он ещё раз прикладывается к бутылке, -- прошу меня простить.
				^
				С этими словами сгорбленный силуэт разворачивается к тебе спиной и удаляется
				прочь.
			]];
		end;

		-- Советник не будет с тобой разговаривать, пока ты не принесёшь ему бутылку или знак лорда
		event 'old man needs his drink';
		return [[
			Ты делаешь нерешительный шаг вперёд и тут же замираешь на месте.
			Жуткий крик эхом отражается от стен, заставляя тебя поморщиться.
			^
			-- Кто тут?! Я велел, этому урук никого не впускать!
			^
			-- Он передал этот пост мне. У меня к тебе дело, старик.
			^
			-- Дело?! -- крик звучит ещё громче, -- У тебя ко мне дело?!
			Проваливай к чертям!
			^
			Ты чувствуешь как тебе в плечо врезается камень. Ещё один падает рядом.
			^
			-- Хорошо-хорошо -- ухожу, -- говоришь ты, пятясь. Ты слышишь как камни ещё
			некоторое время падают вокруг тебя.
		]];
	end;
}

-- Диалоги
-- Диалог с бывшим советником
collector_man_dlg = dlg {
	nam = 'Старик-горбун';
	hideinv = true;
	entered = [[
		Терзаемый сомнениями ты всё-таки шагаешь навстречу мраку.
		Осторожно перейдя через небольшой ручей, ты взбираешься на
		возвышенность.
		^
		-- Похоже, ты как и я веришь, что время неподвластно человеку,
		-- встречает тебя скрипучий голос старика, -- раз решаешь
		распорядиться им подобным образом.
		^
		Внезапная вспышка ослепляет тебя. Привыкнув к свету,
		ты обнаруживаешь перед собой старика, сидящего на небольшом сундуке
		рядом с факелом. За его спиной -- кострище, палатка и пара ящиков
		с различной снедью. Но всё твоё внимание скоро сосредотачивается
		на дальней стене пещеры -- цельной скале, в которой чернеет большой проход.
		Проход обрамлён причудливой резьбой, запечатлевшей запутанный орнамент.
		Тебе почему-то вспоминается пещера, в которую ты попал вчера.
		^
		Старик выжидающе смотрит на тебя.
	]];

	-- Ветки диалога
	phr = {
		-- О катакомбах
		{
			tag = 'about_this_place';
			true;
			'Что это за место?';
			[[
				-- Пещера, в которой располагается вход в древние катакомбы, -- спокойно
				объясняет старик.
				^
				-- Катакомбы? -- с тревогой в голосе спрашиваешь ты, -- я только сегодня узнал,
				что под городом есть канализация.
				^
				-- Весь этот проклятый континент изрыт вдоль и поперёк, -- замечает он,
				-- тут нечему удивляться.
				^
				-- Эти катакомбы, -- спрашиваешь ты, -- кто их построил?
				^
				-- Этого никто не знает, -- голос старика становится приглушённым,
				-- почти каждый город Приграничья строили на каких-то руинах. Одним Благим
				известно кому они принадлежали. До появления человека Линара была густозаселёна.
				^
				-- Я думал, большую часть территорий раньше занимали эльфы.
				^
				-- Возможно. По крайней мере, они пытались убедить в этом наших предков.
				Карты Линары были составлены по описаниям эльфов. Люди никогда не исследовали
				континент полностью.
				^
				-- Если эльфы рассказали им всё что знали, у них не было в этом необходимости,
				-- находишь объяснение ты.
				^
				-- Это уж слишком, -- старик издаёт что-то похожее на смешок, --
				перворождённые просто предупреждали нас, чтобы мы остерегались некоторых
				земель, например севера континента, где сами обитали. Люди записали большую
				часть этих эльфийских "наказов". Все они в основном касались Тантикула --
				первого поселения людей на Линаре.
				^
				-- Я слышал, что Тантикул до сих пор единственный крупный город на
				Скалистом полуострове. Это как-то связано?
				^
				-- Эльфы запретили нашим предкам осваивать Скалистый полуостров полностью.
				В молодости мне удалось побывать в Режиме. Этот запрет соблюдается как
				неписаный закон. Режим осваивает дикие земли юга, и пытается расширяться
				в Приграничье, но Скалистый полуостров -- значительная территория -- так
				и остаётся практически нетронутым. Насколько мне известно, ещё в древности
				там возвели несколько мощных крепостей. Считается, что жители Тантикула
				укроются там, если город захватят. Но в самой стране, вокруг этих фортов
				ходят самые разные истории.
				^
				-- И они как-то связаны с предостережениями эльфов?
				^
				-- Мне неизвестно, как они объясняли свои запреты. Не думаю, что они хотели
				поделиться с нами всеми своими знаниями. Да и правдивость их слов
				тоже можно поставить под сомнение. В конце концов сами эльфы могут не знать
				о Линаре всего.
				^
				-- О чём тогда эти истории? Какие-то нелепые небылицы?
				^
				-- Когда я там был, слышал много рассказов про такие же катакомбы, --
				старик кивнул в сторону чёрного провала, -- вокруг них и плодятся
				разные слухи. В основном это истории о древнем государстве, жители которого
				стали призраками.
				^
				-- И все верят в эти россказни? -- ты больше удивляешься, чем пугаешься, --
				неужели ни один правитель Тантикула не попытался нарушить этот запрет?
				^
				Старик с усталостью смотрит на тебя. Всё то раздражение, с которым он тебя
				встретил куда-то испарилось.
				^
				-- Уверен, что кто-то пытался, ведь в истории Тантикула немало вырванных
				страниц. Увы, слишком быстро люди забывают, от каких ужасов они бежали
				со своей родины. Мы забываем, что в мире существует нечто против которого
				человечество не выступит на равных.
				^
				-- Что это значит? -- в смятении спрашиваешь ты.
				^
				Несмотря на давящую
				обстановку: голодный зев пещеры и её свод, теряющийся во тьме, ты
				чувствуешь странную притягательность этого места. Тебе начинает
				казаться, что время здесь замерло в ожидании чего-то. Вот-вот
				пляшущие от света факела тени оторвутся от своих хозяев и уползут
				во мрак обрамлённый пугающим орнаментом. И с собой они прихватят вас
				с этим сгорбленным отшельником.
				^
				-- Обратись к писаниям Благих, -- отвечает старик просто.
			]];
			function()
				collector_man_dlg:pon('about_conflict');
			end;
		};

		-- Мрачная история Приграничья
		{
			tag = 'about_conflict';
			false;
			'Мне говорили, что раньше вы входили в городской совет.';
			[[
				-- Тебе не соврали. Когда-то это действительно было так,
				-- с неохотой отвечает старик.
				^
				-- И как бывший советник оказался здесь? -- ты решаешь пристальней
				рассмотреть старика. Никакого горба ты у него не обнаруживаешь.
				Просто сутулые плечи и неразгибающаяся поясница.
				^
				-- Видимо, ты действительно хочешь знать эту историю,
				раз задаёшь такие вопросы, -- мрачно произносит он, опустив взгляд, --
				я начал задумываться о том, чтобы покинуть свой пост советника, когда
				начались все эти события. Я говорю, про те события, что привели
				к Корадорскому конфликту.
				^
				Ты почувствовал как у тебя на лбу выступил холодный пот. В армии про
				Корадор ходило много слухов. Но ты всегда старался не
				обращать на них внимания. Некоторые твои сослуживцы были того же мнения.
				Другие, казалось, готовы были выдумывать всё новые и новые байки. Загадочные
				события в этом городе были главной темой для пересудов во время войны.
				Теперь же люди больше вспоминают саму войну, а Корадорский конфликт
				так и остался чем-то туманным и необъяснимым.
				^
				-- Всё началось с этих убийств. -- продолжил старик, -- вернее, сначала, люди
				просто пропадали. В городах и деревнях. Причём поиски не давали результата.
				Потом стали появляться тела, -- бывший советник мрачнел всё больше.
				^
				Ты наблюдаешь как, он чудесным образом преображается, словно скинув с себя
				тяготы нескольких лет. Отшельник расправил плечи и разогнул спину, и теперь
				ты готов был согласиться, что видишь перед собой городского советника.
				^
				-- Обстановка в которой находили эти растерзанные тела, указывала на
				ритуальные убийства. Обычно совет и лорд принимали решение скрывать подобное,
				чтобы не будоражить людей. Но городов, в которых произошли убийства было
				слишком много. Слухи распространялись как пожар. Начались волнения.
				^
				-- Все пострадавшие города были соседями Корадора, -- догадываешься ты.
				^
				-- В самом Корадоре дела обстояли ещё хуже, -- покачал головой советник.
				^
				-- Эти ритуальные убийства связали с какой-то религиозной сектой Корадора?
				^
				Старик опустил взгляд погружаясь ещё глубже в воспоминания.
				^
				-- Вот уже не одну сотню лет Приграничье -- главный источник всяческих религиозных
				течений. С тех пор как Островная Империя ослабила свою хватку на Линаре, борьба с
				ересями полностью легла на плечи местных государств. В нашей стране не хватает
				политической воли, чтобы излечиться от этой болезни. Приграничье пожирают культы
				и секты. Большая их часть -- еретические ответвления религии Благих: радикалы,
				которые радеют за возвращение Империи. Их лидеры: неудачливые политики, мечтающие
				построить своё маленькое государство, или дельцы, которые просто используют наивный
				люд для обогащения. В Корадоре в результате политических интриг к власти пришла одна
				из таких сект. Её щупальца опутали нескольких влиятельных торговцев и церковников,
				а затем добрались и до городского совета. Скоро глашатаи этого течения начали
				появляться в других городах. Секта расширяла влияние.
				^
				-- А потом начались исчезновения и убийства.
				^
				-- Народ начал обвинять во всём корадорскую секту. Лидеры соседних городов быстро
				поняли куда дует ветер. Чтобы предотвратить кровопролитие было решено организовать
				расследование и суд. Я был одним из тех, кто должен был разобраться,
				что происходит в Корадоре. Это было непростое дело. Не все секты, создаются чтобы
				дурить народ и вытягивать из него деньги. Существуют, действительно, тёмные культы,
				способные на отвратительные, богомерзкие дела. Не было сомнений, что убийства
				были совершены именно таким культом. Но я не верил, что корадорская секта была
				связана с ним напрямую.
				^
				Старик взял паузу, чтобы откашляться. Ты замечаешь, что свет факела, будто стал
				тускнеть, а пещера погрузилась ещё больше во мрак.
				^
				-- Слухи о произошедшем дошли до Режима, а там весьма серьёзно относятся к
				подобному. В Корадор был направлен богоизбранный Джэйрана, который должен был
				разобраться в местных культах и сектах. Я слышал, что он прибыл в город, но
				увидеть самого богоизбранного мне не довелось. В то время расследование зашло
				в тупик. Это позволило жадности взять верх над благоразумием.
				Два мелких лорда собрали войско и осадили Корадор. Они подогревали
				народное недовольство, и в конце-концов ворвались в город. Начался хаос.
				Всех кого подозревали в связи с сектой отправляли на костёр. Но через несколько
				дней этих лордов нашли мёртвыми. Над ними совершили такое же ритуальное
				убийство. Тела обнаружили под утро, прямо на городской площади, где сжигали
				людей. Город охватил ужас. Мы уже не могли что-либо сделать. К тому же начали
				поступать вести о первых нападениях орочьих банд. Ситуацию в Корадоре перестал
				контролировать кто-либо: несколько городских советников показательно сожгли
				на костре за содействие сектантам. Но убийства это не остановило. Мне пришлось
				покинуть город. Наступало время подготовки к войне. Соседи решили поделить
				корадорские земли. Их прервало нашествие урук-хай.
				^
				-- После чего вмешался Режим, -- добавляешь ты, охваченный воспоминаниями о
				своей службе.
				^
				-- Вмешался, надеясь получить часть земель Приграничья. Хотя, думаю, в Режиме
				тоже боялись вторжения орков такого масштаба. Сейчас все приписывают победу в войне
				режимникам. Реман Второй ввёл в страну армию и разбил урук-хай. Так теперь говорят.
				Но на деле, война закончилась там же, где и началась, и без участия Режима.
				Изначальной целью орков по какой-то неведомой нам, людям, причине, был Корадор.
				И они, несмотря на армию режимников, достигли своей цели. Основные силы урук-хай
				штурмовали город. Свидетелей этой битвы не осталось. К концу войны
				уже никому не было дела до истерзанного Корадора. Когда объединённые силы Режима
				и Приграничья подошли к городу, чтобы дать оркам решающую битву, они не нашли
				ни города, ни его захватчиков. Всё было разрушено до основания.
				Лишь пепел и дым. Одним Благим известно, что за сражение привело к полному
				уничтожению города. Выживших не было.
				^
				Бывший советник замолчал, погрузившись в собственные мысли.
				^
				-- Когда Режим рассеял остатки орочьих банд, была объявлена победа, -- старик
				очнулся от своего забытья, -- для нас так и осталось загадкой, что стало
				причиной для столь необычного поведения урук-хай. Объединение банд орков
				в целую армию явление весьма редкое. И каждый раз его причины остаются
				до конца неясными. Но куда больше пугает мысль о том, что за ужасная сила
				появилась в Корадоре, если огромная армия свирепых урук, оказалась уничтожена
				без следа вместе с городом.
			]];
			function()
				collector_man_dlg:pon('about_cults');
			end;
		};

		-- О культах
		{
			tag = 'about_cults';
			false;
			'Вы ещё думаете о том расследовании?';
			[[
				Бывший советник посмотрел на тебя. Ты видишь на его лице странное
				выражение -- смесь горечи и ....
				^
				-- Да, к своему ужасу. Последние годы я думаю об этом деле постоянно.
				Кажется, я лишился покоя до конца своих дней. Что было бы
				если бы нам удалось найти виновных. С какой правдой мы бы столкнулись?
				Возможно, то как всё сложилось -- лучший из вариантов... Но теперь я
				лишён покоя, кажется, до конца своих дней.
				^
				^^ Кто-то определённо достиг своих целей, и я был тому свидетелем;
				^
				^^
				-- Нашим лордам не хватает мудрости.
				^^ -- Мудрости? -- бывший советник рассмеялся. От этого хриплого задыхающегося
				смеха тебе стало не по себе, -- Мудрыми правителей делают историки.
				На деле же государи либо живут в мире
				собственных иллюзий, либо кончают безумием. Ни тот, ни другой путь не ведёт
				государство к лучшей доле;
				^
				^ -- Режим кичится своими богоизбранными, но неизвестно ещё насколько они
				преданы ему. Слухи об исчезновении некоторых богоизбранных, не так уж редки.
				Один из таких случаев был во время Корадорского конфликта, когда исчез
				богоизбранный Джэйрана. Его силу выявили, когда он был уже в преклонных
				годах учёным мужем, богословом. Его знания были велики, и будучи
				богоизбранных он решил их приумножить. Он отправился в Приграничье
				и стал изучать здешние религиозные течения. Причина такого обильного
				появления культов весьма волновала Режим. Похоже это знание сыграло
				с ним злую шутку. Он исчез после Конфликта, но были свидетельства,
				что он ещё жив, кажется его видели в окрестных поселениях;

				^^ -- После Конфликта многие культы и секты рассеялись по окрестностям.
				Говорят, можно встретить целые поселения-культистов. Кто знает, может
				в одном из них скрывается сейчас и Джэйрана;
				^^ Ты с дрожью вспоминаешь старосту свой деревни и его безумный взгляд;
				^^1.1. Вездесущие Инквизиторы и Извечная Война;
					^^ Охота на богоизбранных-предателей;
			]];
		};

		-- Уходим
		{
			always = true;
			'Мне нужно идти.';
			function()
				back();
				collector_man_dlg:pon('about_this_place');
				return [[
					-- .
				]];
			end;
		};
	};
}
