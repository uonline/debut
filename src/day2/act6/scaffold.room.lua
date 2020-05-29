-- Состояния
-- 1. Герой приходит в себя и осматривается
-- 2. Обратный отсчёт действий до казни (первая концовка)
-- 3. Обратный отсчёт действий до спасения (вторая концовка)

-- Переменные локации
_scaffold_position = 1;

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
				По глазам тебе бъет алеющий закат. Сам воздух словно пропитался кровью.
				...
				Ты стоищь на свежих досках эшафота.
			]];
		};

		return text[_scaffold_position];
	end;
	obj = {
		'scaffold_guards';
		'scaffold_crown';
		'scaffold_propagandist_and_singer';
		'scaffold_propagandist';
		'scaffold_singer';
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
	dsc = [[
		{Стражники} стоят плечом к плечу и хмуро озираются по сторонам,
		бросая косые взгляды то на зевак, то на заключённых.
	]];
	act = function()
		local text = {
			[1] = [[
				Ты присматриваешься к стражникам. Некоторые нервно поглаживают эфесы мечей.
				Другие переглядываются между собой, словно договариваясь о чём-то.
				Похоже, стражники предпочли бы оказаться в другом месте.
			]];
			[2] = [[
				...
			]];
		};

		return text[_scaffold_position];
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
				{Толпа}. Море. Про реакцию толпы на преступников.
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
				Ты окидываешь взглядом море людей...
			]];
		};

		return text[_scaffold_position];
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
			-- Он посвятил нас в свои планы, вот что он сделал, -- бард взорвался
			змениным шёпотом, -- он рассказал, что этому городу суждено сгореть,
			и никто не сможет этому помешать, ни подполье, ни Режим. Лишь согласившись
			работать на него, мы могли бы уцелеть.
			^
			-- Вы предали...
			^
			-- Может быть это лушчая судьба для этих лицедеев?
			^
			Вас выводят на эшафот...
		]];
	end;
}

-- Менестрель
scaffold_singer = obj {
	nam = 'Менестрель';
	dsc = [[
		{Менестрель}.
	]];
	act = function()
	end;
}
-- TODO: последнее слово менестреля
scaffold_singer:disable();

-- Глашатай Благих
scaffold_propagandist = obj {
	nam = 'Глашатай Благих';
	dsc = [[
		{Глашатай}.
	]];
	act = [[
	]];
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
				{Тюремщик}.
			]];
		};

		return text[_scaffold_position];
	end;
	act = function()
		return [[
			-- А его-то за что?
			^
			-- Он употреблял субстрат на службе и упустил важного заключённого.
		]];
	end;
}

-- Проповедник
scaffold_priest = obj {
	nam = 'Проповедник';
	dsc = [[
		{Проповедник}
	]];
	act = function()
		local text = {
			[1] = '';
			[2] = [[
				^TODO
				* Настоящие боги этого мира это идеи. Эти сушества симбионты немыслимы без людей,
				но и люди не способны жить без них. Идеи способны бесконечно перерождаться, сквозь века.
				Их мессии-проводники: люди искусства, философы, ученые. Люди их плоть и кровь,
				они сражаются между собой за носителей;
				* Проповедник на эшафоте смотрит на тебя со странным торжеством на лице.
			]];
		};

		return text[_scaffold_position];
	end;
};
scaffold_priest:disable();

-- Кевраза
scaffold_godchosen = obj {
	nam = 'Богоизбранный Кевраза';
	dsc = function()
		local text = {
			[1] = [[
				Одного из них всё время пробивает дрожь, едва с эшафота гремит очередной приговор.
				Его сменяет скрежет и вой стали.
			]];
			[2] = [[
				{Богоизбранный} рядом с ним стоит важный городской глашатай.
			]];
		};

		return text[_scaffold_position];
	end;
	act = function()
		if _scaffold_position == 2 then
			event 'the end in scaffold';
		end;
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
	scaffold_propagandist_and_singer:disable();
	scaffold_propagandist:enable();
	scaffold_singer:enable();
end)

-- Поднимаемся на эшафот для второй концовки

-- Концовка на эшафоте
on_event('the end in scaffold', function()
	walk 'the_end_in_scaffold';
end)
