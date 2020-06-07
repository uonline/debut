-- Состояния
-- 1. Герой приходит в себя и осматривается
-- 2. Обратный отсчёт действий до казни (первая концовка)
-- 3. Обратный отсчёт действий до спасения (вторая концовка)

-- Переменные локации
_scaffold_position = 1;         -- текущее состояние локации
_scaffold_the_end_counter = 3;  -- количество действий до концовки

-- Функции локации
-- Функция подъёма на эшфот
go_to_scaffold = function()
	scaffold_propagandist_and_singer:disable();
	scaffold_propagandist:enable();
	scaffold_singer:enable();
	scaffold_priest:enable();
end;

-- Функция для обратного отсчёта до одной из концовок на эшафоте
-- Вызывается при взаимодействиях с разными объектами локации, и генерирует разные события,
-- зависящие от счётчика наступления концовки
scaffold_action = function(act_text)
	local signer_execution_text = [[
		-- Люди...
		^
		Речь менестреля резко обрывается, когда воздух разрезает
		металлический блеск. Какое-то время менестрель ещё смотрит на
		метательный нож, торчащий из его глазницы, но затем падает
		замертво.
		^
		Толпа приходит в движение. Стройна фигура в плаще и капюшоне
		отделяется от неё и устремляется в ближайший проулок.
		Несколько стражей через бросаются в погоню, пробиваясь через
		людей.
	]];

	act_text = act_text .. "^";

	-- Если герой попал на эшафот по первой концовке, то включаем обратный отсчёт первой концовки
	if _scaffold_position == 2 then
		_scaffold_the_end_counter = _scaffold_the_end_counter - 1;

		-- Описание произошедшего действия
		-- Казнь менестреля
		if _scaffold_the_end_counter == 2 then
			event "signer execution"
			return act_text .. signer_execution_text;
		end;

		-- Казнь глашатая
		if _scaffold_the_end_counter == 1 then
			event "propagandist execution"
			return act_text .. [[1]];
		end;

		-- Казнь главного героя
		if _scaffold_the_end_counter <= 0 then
			walk 'the_end_in_scaffold';
			return act_text .. [[0]];
		end;
	end;

	-- Если герой попал на эшафот по второй концовке, то включаем обратный отсчёт для второй концовки
	if _scaffold_position == 3 then
		_scaffold_the_end_counter = _scaffold_the_end_counter - 1;

		-- Описание произошедшего действия
		-- Казнь менестреля
		if _scaffold_the_end_counter == 3 then
			event "signer execution"
			return act_text .. signer_execution_text;
		end;

		-- Казнь глашатая
		if _scaffold_the_end_counter == 2 then
			event "propagandist execution"
			return act_text .. [[2]];
		end;

		-- Казнь тюремщика
		if _scaffold_the_end_counter == 1 then
			event "prison guard execution"
			return act_text .. [[1]];
		end;

		-- Казнь главного героя
		if _scaffold_the_end_counter <= 0 then
			walk 'the_end_in_scaffold';
			return act_text .. [[0]];
		end;
	end;

	return act_text;
end

-- Локация
scaffold = room {
	nam = function()
		local text = {
			[1] = 'Площадь Режима';
			[2] = 'Эшафот';
		};

		return text[_scaffold_position];
	end;
	dsc = function()
		local text = {
			[1] = [[
				Ты обнаруживаешь себя в окружении городской стражи. Руки
				занемели от тугих верёвок на запястьях.
				Среди стражников ты находишь других приговорённых.
				У них понурые лица со следами недваних побоев.
				Некоторые тебе знакомы.
				^
				Поверх голов тебе удаётся рассмотреть контуры уже виденных тобой сегодня
				зданий и горделиво возвышающееся каменное древо. Ты узнаёшь площадь Режима.
				^
				За спинами стражников тебя ожидает свежесколоченный эшафот.
				Рядом стоит здоровенная телега, в которой уже навалено с десяток окровавленных тел.
				Повозчик телеги в чёрном балахоне с капюшоном здорово смахивает на смерть.
			]];
			[2] = [[
				Ты стоишь на слегка пружинящих досках эшафота. Глаза жжёт пылающее зарево заката.
				Сверху видно всю площадь Режима, наполненную алым светом.
				Сам воздух словно пропитался кровью. Жгучие порывы ветра вздымают к небу столбы
				душной пыли. Наверху стремительно темнеет. Восток обложен тучами. Единым фронтом
				чернота движется вслед солнцу. На ещё светлой полосе неба видно как от туч отделяется
				сомн силуэтов: стаи птиц кружат над городом.
				Множество воронов уже устроилось на крышах домов. Пока они хранят терпеливое молчание,
				но их желание поживиться чувствуется как нечто осязаемое. Холодным и влажным зверем
				оно трётся тебе о спину, оставляя на ней тяжёлые капли пота.
			]];
			[3] = [[
				Test
				Чёрная птица появляется здесь при второй концовке.
			]]
		};

		return text[_scaffold_position];
	end;
	obj = {
		'scaffold_guards';
		'scaffold_crown';
		'scaffold_propagandist_and_singer';
		'scaffold_singer';
		'scaffold_propagandist';
		'scaffold_prison_guard';
		'scaffold_priest';
		'scaffold_godchosen';
	};
	entered = function()
		-- Clear inventory, add whitelisted items
		inv():zap();

		return [[
			Ты приходишь в себя, лёжа лицом в дорожной пыли. Пара сильных рук
			поднимает тебя и ставит на ноги. Но ноги предательски подкашиваются,
			и ты падаешь на четвереньки. Тогда по твом рёбрам пару раз тычат
			сапогом. Крехтя, ты встаёшь и протираешь глаза от пыли,
			чтобы осмотреться.
		]];
	end;
}

-- Объёкты локации
-- Стражники
scaffold_guards = obj {
	nam = 'Стражники';
	dsc = function()
		local text = {
			[1] = [[
				{Стражники} стоят плечом к плечу и хмуро озираются по сторонам,
				бросая косые взгляды то на зевак, то на заключённых.
			]];
			[2] = [[
				{Стражники} стоят плечом к плечу, окружив эшафот.
			]];
		};

		return text[_scaffold_position];
	end;
	act = function()
		local text = {
			[1] = [[
				Ты присматриваешься к стражникам. Некоторые нервно поглаживают эфесы мечей.
				Другие переглядываются между собой, словно договариваясь о чём-то.
				Похоже, стражники предпочли бы оказаться в другом месте.
			]];
			[2] = [[
				Ты ещё раз пробегаешь взглядом по шеренге стражников, лелея в душе
				непонятную надежду. Время от времени кто-то из них нет нет и оборачивается.
				Бледность и глубокие тени под глазами делают его лицо похожим
				на обтянутый кожей оскал черепа мертвеца.
				Неожиданно для самого себя ты представляешь,
				как эта маленькая армия мертвецов извлекает мечи из ножен
				и с глухим стоном принимается рубить, собравшихся
				на площади. Покрутив головой ты отгоняешь наваждение прочь.
			]];
		};

		return scaffold_action(text[_scaffold_position]);
	end;
}

-- Толпа
scaffold_crown = obj {
	nam = 'Толпа';
	dsc = function()
		local text = {
			[1] = [[
				Из-за плотного кольца стражи тебе сложно оценить размер собравшейся
				на площади {толпы}. Но судя по гулу, эшафот окружила половина города.
			]];
			[2] = [[
				За их спинами плещется беспокойное {море горожан}.
			]];
		};

		return text[_scaffold_position];
	end;
	act = function()
		local text = {
			[1] = [[
				Ты прислушиваешься к гомону толпы. Среди общего шума можно
				различить отдельные гневные выкрики, но чаще слышатся
				удивлённые возгласы мужчин, вздохи и причитания женщин.
				^
				Горожане встревожены.
			]];
			[2] = [[
				Ты окидываешь взглядом собравшихся людей, вглядываясь в их лица.
				Находятся среди них выражающие сочувствие. Таких куда больше, чем осуждающих.
				Многие с опаской переглядываются и качают головами.
				Кто-то перешёптывается.
				И все же над толпой парит волнующее ожидание чего-то.
				Ты догадываешься чего, и поэтому не ждешь от горожан помощи.
				Объявив себя невиновным, ты лишь попытаешься оправдаться.
				А твоему предупреждению никто не поверит.
				Да и дадут ли они тебе что-то сказать?
			]];
		};

		return scaffold_action(text[_scaffold_position]);
	end;
}

-- Глашатай и менестрель
scaffold_propagandist_and_singer = obj {
	nam = 'Глашатай Благих и менестрель';
	dsc = [[
		Через шум до тебя доносятся обрывки перешёптываний двух приговорённых.
		Ты узнаёшь {менестреля и глашатая Благих}.
	]];
	act = function()
		-- Выключаем обратный отсчёт действий на эшафоте
		-- Переходим на второе состояние эщафота
		event 'go to scaffold';

		return [[
			Озираясь на стражников, ты подходишь к своим утренним приятелям.
			^
			-- Гляди-ка какая метаморфоза, -- менестрель тычет в тебя толстым пальцем,
			-- на рассвете солдат Режима, на закате приговорённый к плахе.
			^
			-- А вы всё продолжаете выступать, как я посмотрю, -- отзываешься ты, кивая
			на эшафот, -- скоро на сцену, зрители ждут?
			^
			-- Тебя они ждут не меньше, дезертир, -- в ответ на твой вопросительный взгляд,
			бард являет тебе наглую улыбку в рамке жиденькой бороды, -- да-да, не нужно удивляться,
			разнюхивать -- наша работа. Нам стало интересно, кто так ловко провёл нас утром.
			И мы разузнали, что за фрукт сбежал из штаба Режима, едва туда угодив.
			^
			-- Теперь-то все фрукты лежат в одной корзине, -- ты киваешь в сторону эшафота,
			наблюдая как мрачнеет бородатая физиономия менестреля.
			^
			-- Проклятый капитан всё таки устроил облаву на подполье, -- со злостью в голосе
			пробасил бард, -- не меньше сотни человек угодили в застенки. Половину привезли сюда.
			^
			Он покосился на телегу с трупами.
			^
			-- Всё-таки? Так вы знали, что облава случится? -- удивляешься ты.
			^
			-- Рано или поздно это должно было случиться, -- вступает в разговор
			бритоголовый глашатай. Он уже не выпучивает глаза как на проповеди утром
			и кажется более разумным человеком, -- Режим не допускает восстаний.
			Но капитан разыграл эту карту в свою пользу.
			^
			-- Что это значит? -- спрашиваешь ты, хотя ответ тебе уже известен.
			^
			-- Вся эта казнь лишь для отвлечения внимания. Посмотри вокруг, ты
			не найдёшь ни одного солдата Режима. Потому что сейчас почти все они слоняются по
			городу в поисках сообщников подполья. А в это время режимники преданные капитану
			вырезают городскую стражу у ворот, чтобы впустить сюда орочью банду.
			^
			-- Они хотят впустить орков в город? -- переспрашиваешь ты как заколдованный.
			В голове у тебя всплывают письма капитана лордам Приграничья.
			В них говорилось только о подкупе банды для осады.
			^
			-- Орки устроят в городе мясорубку, -- потрясённо говоришь ты, -- зачем это капитану?
			^
			-- Это известно только ему одному, -- хмуро отвечает глашатай Благих, -- когда он
			буквально развалил гарнизон Режима в городе, мы подумали, что он на нашей стороне.
			Но потом, он начал стравливать горожан, тех, кто поддерживает режимников и тех,
			кто Режим недолюбливает. Распускал разные гнусные слухи. А когда капитан
			стал вербовать членов подполья, стало совершенно ясно, что он ведёт свою игру.
			^
			Ты долго переводишь взгляд с менестреля на глашатая Благих. Внезапно тебя
			осеняет догадка.
			^
			-- Так он и вас завербовал?
			^
			Менестрель скривил рот, а глашатай нахмурился ещё больше.
			^
			-- Капитан давно знал о подполье. Он был в курсе агентов среди режимников.
			Раскрыл связных. Он мог прихлопнуть подполье в любой момент.
			Но предпочёл использовать его...
			^
			-- Капитан сделал нам предолжение, от которого нельзя отказаться,
			-- яростно шепчет бард, -- он посвятил нас в свои планы.
			Рассказал, что этому городу суждено сгореть, и никто не сможет этому
			помешать ни подполье, ни Режим. Он обещал нам спасение, если мы согласимся
			работать на него.
			^
			-- Выходит, вы предали не только подполье. Вы предали свой город.
			Вы знали, что его ждёт, но ничего не сделали, чтобы это предотвратить.
			^
			-- Ты хочешь воззвать к моей совести?! -- бородач подавляет булькающий смех,
			-- да этот городишко лицедеев заслужил быть сожённым. Они целовали режимникам ноги,
			когда те прогнали орков. Но едва Режим начал наводить свои порядки,
			они начали изображать недовольных. Думаешь, они поддержали подполье?
			Бандиты и проходимцы, вот что говорили про нас. Им и сейчас плевать на нас.
			Люди собрались здесь, чтобы посмотреть на казнь убийцы советника Конроя.
			^
			Раздаётся очередной свист меча палача. У тебя внутри всё холодеет.
			^
			С эшафота гремя доспехами, спускается тот самый лысый вояка. На громоздком наплечнике
			покоится окровавленный двуручник.
			^
			-- Богоизбранный? -- обращается к латнику один из стражников. Взгляд вояки пробегает
			по заключённым, чтобы остановиться на тебе.
			^
			-- Давайте теперь этих, -- названный богоизбранный кивает в твою сторону.
			^
			Стражники хватают менестреля, бритоголового и тебя под руки и выводят на эшафот.
			Вслед за тобой толкают ещё двоих заключённых.
		]];
	end;
}

-- Менестрель
scaffold_singer = obj {
	nam = 'Менестрель';
	dsc = [[
		{Менестрель} словно лихой рыбак, закидывает в это море, то улыбки, то поклоны,
		то неприличные жесты. По толпе прокатываются волны перешёптываний: "Этот-то что,
		там делает?".
	]];
	act = function()
		local text = [[
			Ты обращаешь на себя внимание менестреля, чтобы быстро прошептать:
			^
			-- У нас еще есть шанс. Если вот-вот появятся орки,
			нам всего лишь нужно как-то потянуть время -- ты киваешь на толпу,
			-- давай, развлеки их как ты умеешь. Спой им песню на прощание!
			^
			Бородач в ответ подмигивает тебе с улыбкой обречённого.
		]];

		return scaffold_action(text);
	end;
}
scaffold_singer:disable();

-- Глашатай Благих
scaffold_propagandist = obj {
	nam = 'Глашатай Благих';
	dsc = [[
		Угрюмый {глашатай Благих} тихо шепчет молитву, сцепив пальцы.
	]];
	act = function()
		local text = [[
			Ты обращаешь на себя внимание бритоголового, чтобы прошептать ему на ухо:
			^
			-- У нас еще есть шанс. Если вот-вот появятся орки,
			нам всего лишь нужно как-то потянуть время -- ты киваешь на толпу,
			-- давай, подурачь их как ты умеешь. Отпусти грехи или наоброт прокляни.
			^
			Глашатай Благих смотрит на тебя как на умалишённого.
			^
			-- Я предпочитаю определённость, -- спокойно говорит он,
			-- умереть здесь и сейчас от удара меча несравненно лучше,
			чем попасть в хаос мясорубки. Ты хочешь броситься в пекло и гадать,
			когда какой-нибудь орк переломает тебе все кости,
			выдернет руки с корнем или сожжёт заживо? Я не хочу.
			^
			-- Тогда к чему твои молитвы, как не для спасения?
			-- ты чувствуешь как внутри зашевелилась непонятная злоба.
			-- ^
			-- Люди молятся во спасение души, что куда важней чем
			мирской исход, -- чувственно поправляет тебя бритоголовый,
			и глаза его округляются как утром.
			^
			-- Поздновато ты задумался о душе, -- язвительно замечаешь ты,
			чтобы поймать себя на мысли, что о своей ты сам никогда
			не задумывался.
		]];

		return scaffold_action(text);
	end;
}
scaffold_propagandist:disable();

--- Стражник из тюрьмы штаба Режима
scaffold_prison_guard = obj {
	nam = 'Тюремщик';
	dsc = function()
		local text = {
			[1] = [[
				За ними стоит ещё пара твоих знакомцев, но ты никак не можешь вспомнить,
				где ты их видел.
			]];
			[2] = [[
				Позади тебя трясётся ссутулившийся {человек}, в котором ты с трудом распознаёшь
				своего бывшего тюремщика из застенков в штабе Режима.
			]];
			[3] = [[
				Следующим в очереди на плаху оказывается ссутулившийся {человек},
				в котором ты с трудом распознаёшь своего тюремщика из застенков
				в штабе Режима.
			]];
		};

		return text[_scaffold_position];
	end;
	act = function()
		local text = [[
			Ты с удивлением смотришь на бывшего солдата Режима.
			^
			-- А его-то за что? -- вопрошаешь ты неизвестно кого.
		]];

		if not scaffold_propagandist:disabled() then
			text = text .. [[
				^
				Неожиданно...
				^
				-- Он употреблял субстрат на службе и упустил важного заключённого
		]];
		end;

		return scaffold_action(text);
	end;
}

-- Проповедник
scaffold_priest = obj {
	nam = 'Проповедник';
	dsc = function()
		local text = {
			[1] = '';
			[2] = [[
				Его поддерживает за локоть худощавая личность так же тебе известная.
				Это {проповедник}, которого ты видел в лагере подполья, сидящим
				на куче книг.
			]];
			[3] = [[
				Позади тебя странно улыбается худощавая {личность}. Ты вспоминаешь, что
				видел этого типа в подполье, молящимся на куче книг.
			]];
		};

		return text[_scaffold_position];
	end;
	act = function()
		local text = '';

		if _scaffold_position == 2 then
			text = [[
				Ты раздумываешь, стоит ли заговаривать с этим двинутым проповедником.
				Тогда он обращается к тебе сам.
				^
				-- Эту заблудшую душу я уже встречал раньше. Я вижу ты отвернулся от лже-Блага?
				-- он кивает на твою грудь, которую когда-то закрывал нагрудник солдата Режима,
				-- возможно теперь ты готов услышать об истинной религии?
				^
				-- Не думаю, что сейчас время для проповедей, -- ты с опаской косишься на
				богоизбранного и стражников.
				^
				-- О, любое время хорошо для почитания божественного, -- слышишь ты наставление,
				-- а перед смертью самое время принять истинную веру.
				^
				-- Это точно плохая идея, -- возражаешь ты.
				^
				-- Об этом я и хочу тебе рассказать, -- улыбается человек, -- об идеях -- настоящих богах
				смертного мира. Об этих симбионтах сознания, невозможных без своих носителей -- людей и
				им подобных. Но и люди не мыслимы без них.
				^
				Его улыбка становится ещё шире, обнажая два ряда ровных зубов.
				^
				-- Вижу ты не понимаешь, к чему я всё это тебе рассказываю, но терпение.
				Сейчас ты всё поймешь. Идеи способны бесконечно перерождаться, сквозь века и эпохи
				они живут сменяя носителей и распыляя почитателей, как грибы -- споры.
				Их мессии-проводники: люди искусства, философы, ученые, политики.
				Их почитатели это народы и нации. Люди их плоть и кровь, идеи сражаются между
				собой за них. Многие идеи тщетны и не имеют будущего, так же как и многие люди
				его недостойны. Одна идея может оказывается настолько сильной, что победит все
				прочие, став <b>навязчивой</b>. Но горе, если она тоже окажется тщетной!
				^
				Он многозначительно смотрит на тебя.
				^
				-- Да, теперь я говорю о тебе и твоей одержимости спасением.
				Ты так упивался этой идеей, но куда она тебя привела? На эшафот!
				Чтож, эта идея оказалась тщетной для тебя.
				^
				Человек заканчивает свою проповедь со странным торжеством на лице,
				оставляя тебя наедине со своей навязчивой идеей.
			]];
		end;

		if _scaffold_position == 3 then
			text = [[
				-- Я вижу ты отвернулся от Блага? -- кивает он на твою грудь, -- Поведать тебе о настоящей религии?
				-- Насколько ты охвачен течением, и что за сила тобой движет? Не использует ли тебя какая-либо
				сила? Сумеешь ли ты отвести Рок? Скоро узнаем.
			]];
		end;

		return scaffold_action(text);
	end;
};
scaffold_priest:disable();

-- Кевраза
scaffold_godchosen = obj {
	nam = 'Богоизбранный Кевраза';
	dsc = function()
		local text = {
			[1] = [[
				Одного из них всё время пробивает дрожь, едва с эшафота гремит очередной приговор,
				сменяющийся скрежетом и воем стали.
			]];
			[2] = [[
				За вами присматривает пара мордоворотов-стражников.
				^
				В центре эшафота рядом с плахой вышагивает {богоизбранный} и буднично протирает
				меч тряпицей. У края эшафота городской глашатай готовится зачитывать очередной
				приговор.
			]];
		};

		return text[_scaffold_position];
	end;
	act = function()
		local text = '';

		if _scaffold_the_end_counter == 4 then
			text = [[
				Ты смотришь на разгуливающего латника, трущего сталь меча ветошью.
				Мимо него стражники проносят к лестнице очередное обезглавленное тело.
				Занятие богоизбранного прерывает ворчание городского глашатая.
				^
				-- Вот ведь черти! И кто это написал? -- негодует тот, изучая
				свиток с приговорами, -- послушайте только! "Должно вершить возмездие
				как над предателем не только земли своей, но и всего человечества."
				И это только концовка! Как вам это нравится?! Почему просто нельзя
				объявить: "обвиняются в госизмене и приговаривается к казне", и вздёрнуть
				из всех разом? Нет же, эшафот соорудили, плаху. Торчим тут уже битый час.
				Скоро стемнеет, да того и гляди, дождь ливанёт.
				^
				-- Так распорядился наместник, -- нехотя отозывается латник.
				^
				-- Странные у него распоряжения, у этого вашего наместника, -- замечает глашатай,
				-- где же это виданно, чтобы богоизбранный головы рубил на плахе?
				^
				-- Таков приказ. Я здесь, чтобы изъявлять его волю
				и вершить правосудие от лица Режима Ремана. Это большая честь.
				^
				-- Оно и понятно, сам-то наместник не пожелал присутсвовать.
				Всё сидит в своей резиденции и носу не кажет. Хотя кого ему теперь бояться?
				^
				-- Довольно этого трёпа! За дело! -- обрубает латник.
			]];
		end;

		if _scaffold_the_end_counter == 3 then
			text = [[
				Ты смотришь на сурового латника с жутким мечом в руках. Таким двуручником
				можно за раз срубить все пять ваших голов. Тебе странно наблюдать богоизбранного
				в качестве палача, да и ему самому эта роль, похоже, не в радость. Он чистит
				клинок с некоторой брезгливостью.
			]];
		end;

		if _scaffold_the_end_counter == 2 then
			text = [[
				Ты смотришь на латника. Его пугающий двуручный меч притягивает твой взгляд
				как магнит. Сегодня утром ты видел точно такой же: в арсенале штаба Режима
				старый солдат счищал с него ржавчину. Заодно он поведал тебе, что меч некогда
				принадлежал отцу теперешнего лорда местных земель. Соврал солдат или нет,
				остаётся загадкой, но то что сейчас именно этот двуручник вершит правосудие
				сомневаться не приходится, потому что на поясе богоизбранного в ножнах
				покоится ещё один клинок.
			]];
		end;

		if _scaffold_the_end_counter == 1 then
			text = [[
				Ты смотришь на латника. Тот ловит твой взгляд, и пару мгновений
				вы изучаете друг на друга. Когда ты увидел его в первый раз в башне,
				то даже не оценил его возраст. Глубокие морщины тогда смешались
				со шрамами, и ты не смог разглядеть в грозном воителе древнего старика.
				Впрочем, это меньшее, что удивляет в богоизбранном. Его старческие
				выцветшие глаза с металлическим блеском будто бы вовсе непохожи
				на глаза человека. Из них на тебя словно смотрит нечто холодное
				и далёкое. Но взор латника приковывает к себе, и чем дольше ты
				смотришь ему в глаза, тем ближе это холодное нечто становится.
				^
				Ты поспешно отводишь взгляд.
			]];
		end;

		return scaffold_action(text);
	end;
};

-- События локации
-- ?
on_event('caught in action', function()
	walk 'scaffold';
end)

-- Поднимаемся на эшафот для первой концовки
on_event('go to scaffold', function()
	_scaffold_position = 2;
	_scaffold_the_end_counter = 3;
	go_to_scaffold();
end)

-- Поднимаемся на эшафот для второй концовки
on_event('go to scaffold for escape', function()
	_scaffold_position = 3;
	_scaffold_the_end_counter = 4;
	go_to_scaffold();
end)

-- Казнь менестреля
on_event('signer execution', function()
	scaffold_singer:disable();
end)

-- Казнь глашатая
on_event('propagandist execution', function()
	scaffold_propagandist:disable();
end)

-- Казнь стража тюрьмы штаба Режима
on_event('prison guard execution', function()
	scaffold_prison_guard:disable();
end)

-- Концовка на эшафоте
on_event('the end in scaffold', function()
	walk 'the_end_in_scaffold';
end)

-- Спасение с эшафота
on_event('the escape from scaffold', function()
	walk 'under_scaffold';
end)
