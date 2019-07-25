-- Переменные локации
_guild_camp_horny = false
_guild_camp_hadsex = false
_guild_camp_want_axe = false
_guild_camp_got_axe = false
_guild_camp_fueled = false
_guild_camp_cooked = false
_guild_camp_nameless_greeting = false
_guild_camp_priest_greeting = false
_guild_camp_smuggler_greeting = false
_guild_camp_lord_greeting = false
_guild_camp_halfblood_greeting = false

-- События
_guild_camp_giveaway = false
on_event('old man needs his drink', function()
	_guild_camp_giveaway = true
end)

-- Локация
guild_camp = room {
	nam = 'Лагерь подполья';
	dsc = [[
		Ты выходишь в просторный зал. Помещение заполняет несколько рядов колонн,
		на которых закреплена пара факелов. Между колонн высятся горы ящиков и сундуков
		разных размеров.
		В потолке местами проделаны небольшие отверстия, через
		которые поступает дневной свет и воздух. Несмотря на это, здесь
		всё равно чувствуется затхлость и неприятный запах. Но собравшихся в зале
		людей это не смущает.
	]];
	obj = {
		'guild_camp_fire';
		'guild_camp_wood';

		'guild_camp_nameless';
		'guild_camp_axe';
		'guild_camp_priest';
		'guild_camp_smuggler';
		'guild_camp_lord';

		'guild_camp_knight';
		'guild_camp_slut';
		'guild_camp_mage';
		'guild_camp_halfblood';

		'todo'
	};
	way = {
		'sewer';
		'tunnel';
	};
}

-- Объекты
-- Костёр
guild_camp_fire = obj {
	nam = 'Костёр';
	dsc = [[
	]];
	dsc = function()
		-- Ты разжёг костёр
		if _guild_camp_fueled == true then
			return [[
			Большая часть подполья пребывает неподалёку от {костра}, что
			горит в центре зала.
			]];
		end;
		return [[
			Большая часть подполья пребывает неподалёку от {костра}, что
			тлеет в центре зала.
		]];
	end;
	act = function()
		-- Ты разжёг костёр
		if _guild_camp_fueled then
			return [[
				Ты любуешься своей работой. Костёр бодро пожирает древесину.
				Ты находишь, что перестарался: довольно густой столб дыма
				устремляется к ближайшему отверстию в потолке. Оглядев
				окружающих, ты убеждаешься, что всем всё равно, и успокаиваешься.
			]];
		end;

		return [[
			Ты осматриваешь небольшое кострище. Вокруг него
			валяются свежие остатки еды.
		]]
	end;
}

-- Дрова
guild_camp_wood = obj {
	nam = 'Дрова';
	dsc = [[
		В стороне от него свалена {куча дров}, 
	]];
	act = [[
		Ты осматриваешь дрова. Стопка полен доходит тебе до плеча.
	]];
	used = function(self, what)
		if what == guild_camp_axe then
			if not _guild_camp_fueled then
				_guild_camp_fueled = true
				disable 'guild_camp_wood'
				return [[
					Размявшись, ты берёшься за дело. К твоему удивлению топор прекрасно
					справляется с твоей задачей. Увлёкшись, ты разрубаешь полена одно за другим.
					Периодически ты подбрасываешь дрова в огонь, и он отвечает тебе довольными
					всполохами. На лбу у тебя проступает испарина, и ты решаешь остановиться.
					Стопка дров немного уменьшилась.
				]]
			end
		end
	end;
}

-- Лжеурук из Харгфхейма
guild_camp_nameless = obj {
	nam = 'Урук из Харгфхейма';
	dsc = function()
		-- Ты разжёг костёр
		if _guild_camp_fueled then
			return [[
				На его пламя как завороженный смотрит татуированный {урук}.
			]];
		end;

		-- До костра
		return [[
			к которой прислонился массивный {урук}, разрисованный причудливыми татуировками.
		]];
	end;
	act = function()
		-- Переменные с текстом
		-- Текст приветствия
		local greeting = [[
			Ты присматриваешься к орку. Он выглядит весьма странно для урук.
			Длинные жёсткие волосы стального цвета заплетены в две толстенные косы,
			покоящиеся на широкой груди. Ты никогда не видел орка с волосами
			такого цвета. Узор татуировок выглядит не менее причудливо. Ты заключаешь, что
			это не просто орочьи каракули, а рисунки, в которых просматривается
			определённый сюжет. На таком расстоянии тебе не удаётся разглядеть их
			как следует.
			^
			Твой интерес не остаётся незамеченным, и урук отвечает тебе не менее
			внимательным взглядом.
		]];

		-- Текст получения топора
		local taking_axe = [[
			^
			Ты обескураженно уставился на орка.
			^
			-- Останешься безоружным? -- спрашиваешь ты, принимая топор.
			^
			-- Эти руки уже оружие, -- ты лицезреешь два огромных кулака перед
			своим лицом.
			^
			-- Только ваше племя может назвать такой топор оружием, --
			усмехается урук, -- там, откуда я пришёл,
			водятся чудовища, которых этим можно разве что пощекотать.
			^
			-- У этого места есть название? -- спрашиваешь ты больше из уважения к
			жесту орка, чем из интереса.
			^
			-- Есть. Харгфхейм, -- отвечает орк, -- город, где урук и ваше племя живут вместе.
			^
			-- Никогда о таком не слышал, -- ты удивляешься этому орку всё больше и больше.
			^
			-- Конечно. Город стоит у самого южного побережья, намного дальше,
			чем кончается южная граница Режима. Если бог ветров позволяет,
			то моряки отправляются в Тантикул для торговли. Это случается раз в несколько
			лет.
			^
			-- А если не позволяет? Вы идёте по суше?
			^
			Урук снова усмехнулся.
			^
			-- Такое путешествие под силу только отряду урук. Каравану не хватит скорости.
			В наших землях нужно двигаться быстро, неважно где: в тундре, тайге или горах.
			Иначе замерзнешь или будешь съеден.
			^
			-- И ты говоришь, что там живут люди?
			^
			-- Ваше племя поселилось там ещё до того, как предки урук пришли с запада.
			^
			-- Верится с трудом.
			^
			Орк пожимает плечами.
			^
			-- Пойду, приноровлюсь к этой штуке, -- ты потрясаешь топором, собираясь уйти.
			^
			-- Только не поранься.
			^
			Ты отходишь от орка, но ещё какое-то время чувствуешь на себе его взгляд.
		]];

		-- Приветствие
		if not _guild_camp_nameless_greeting then
			_guild_camp_nameless_greeting = true;
			-- Здороваемcя и получаем топор
			if _guild_camp_want_axe and not _guild_camp_got_axe then
				take 'guild_camp_axe'
				_guild_camp_got_axe = true
				return greeting .. [[
					^
					-- Тебе не хватает меча режимник, -- замечает он.
					^
					-- Я не солдат, -- отвечаешь ты, -- это маскировка шпиона.
					^
					-- Без меча она выглядит неполной. Слишком жалкий вид. Тошнит,
					-- он протягивает тебе свой топор, -- Возьми, как раз наточил.
				]] .. taking_axe;
			end;

			-- Обычное приветствие
			return greeting .. [[
				^
				-- Тебе не хватает меча, режимник, -- замечает он.
				^
				-- Я не солдат, -- отвечаешь ты, -- это маскировка шпиона.
				^
				-- Ваше племя очень изобретательно.
				^
				Ты опешил от сказанного.
				^
				-- Неожиданно слышать такое от орка. Ты сам выглядишь нездешним,
				-- твой взгляд падает на длинные косы.
				^
				-- Так и есть. Мы прибыли с далёкого юга, оттуда, где море вгрызается глубоко
				 в скалы, а ветра повелевают в тундрах.
				^
				-- Ты сказал -- вы?
				^
				-- Я и мои собратья. Такое путешествие в одиночку опасно даже для орка.
				^
				-- А где же твои собратья сейчас? -- тебе удивительно слышать от
				орка слово "опасность".
				^
				-- В этой земле наши пути разошлись.
				^
				-- Зачем вы тогда затеяли этот поход?
				^
				-- Мы странствующие воители урук, -- просто ответил орк.
				^
				-- Кажется, я слышал о таких. Вы бродите по миру в поисках сражений
				и достойных противников.
				^
				-- Теперь каждый из нас идёт своей дорогой. Я направляюь на запад, в
				край Разломов. Слухи о тамошних чудовищах можно услышать по всему миру.
				^
				-- Почему вы не остались у себя на родине, если там настолько опасно?
				^
				-- Там достаточно других охотников, -- морда орка изобразила подобие
				улыбки, а точильный камень начинает высекать искры из топора с удвоенной силой.
				Ты понимаешь, что разговор окончен.
			]];
		end;

		-- Просим топор
		if _guild_camp_want_axe and not _guild_camp_got_axe then
			take 'guild_camp_axe'
			_guild_camp_got_axe = true
			return [[
				Ты смотришь на орка, прокручивая в голове варианты, как лучше начать
				разговор. Урук ловит твой взгляд и подзывает к себе жестом.
				^
				-- Тебе всё-таки не хватает меча. Без него вид совсем жалкий. Тошнит,
				-- он протягивает тебе свой топор, -- Возьми, как раз наточил.
			]] .. taking_axe;
		end;

		-- Ты разжёг костёр
		if _guild_camp_fueled then
			return [[
				Ты присматриваешься к орку. Он полностью поглощён своим занятием: сидя на полу
				со скрещенными ногами наблюдает за танцем огня в костре. Ты чувствуешь что-то
				знакомое в этих позе и горделивой осанке.
			]];
		end;

		-- До костра
		return [[
				Ты присматриваешься к орку. Ты находишь его необычным по меркам орка, но
				в тоже время чем-то тебе знакомым.
				^
				Ты качаешь головой, гоня мысли прочь. Знакомых орков себе лучше не заводить.
			]];
	end;
}

-- Топор
guild_camp_axe = obj {
	nam = 'Топор';
	dsc = [[
		Орк занят тем, что водит точильным камнем по лезвию топора.
	]];
	inv = [[
		Ты взвешиваешь топор в руке. В лапищах его хозяина он казался тебе игрушечным.
		Ты знаешь, что урук используют такие топоры как метательные,
		но врядли ты сможешь орудовать им одной рукой.
	]];
}

-- Проповедник
guild_camp_priest = obj {
	nam = 'Проповедник';
	dsc = [[
		На стопке книг неподалёку сидит печального вида {человек}, и что-то
		бормочет себе под нос со сложенными перед собой ладонями.
	]];
	act = function()
		-- Приветствие
		if _guild_camp_priest_greeting == false then
			_guild_camp_priest_greeting = true;
			return [[
				Ты подходишь к человеку, и убеждаешься, что он занят молитвой. Впрочем
				он прерывает её, чтобы поприветствовать тебя.
				^
				-- Ещё одна заблудшая душа, -- ты сразу вспоминаешь глашатая на площади
				Режима. Человек тем временем изучает древо на твоём нагруднике, --
				ещё один слуга этой лжерелигии.
				^
				-- По твоему лучше верить в Благих, чем в Благо? -- спрашиваешь ты,
				пытаясь скрыть усмешку. Но человек отрицательно качает головой.
				^
				-- Благо или Благие. Орочьи боги или эльфийские. Какая разница?
				Все эти религии за пределами нашего мира. Мы же питаем их
				своей верой.
				^
				-- Посмотри на них, -- он обводит рукой людей в зале, --
				-- что они могут сделать со своими жизнями? Разве
				в их руках выбор как влачить своё существование? Нет, они не знают
				другой доли, кроме своей смертной участи, возни в грязи и грехе.
				Другое дело эти книги, -- он привстал и извлёк одну
				книгу из стопки. Ты узнал в ней писание Святых, --
				прочитай их и ты скажешь: вот где настоящая жизнь!
				Эти подвиги героев древности. Какую храбрость они проявляли,
				какие опасности встречали! А их награды, их страсти и чувства будоражащие
				сознание?! Когда я читаю эти книги, я чувствую на себе их взгляд.
				Они смотрят на меня. Эти бессмертные существа, живущие настоящей жизню.
				Они ждут от меня продолжения своих историй.
				Ждут, когда их покорный раб вообразит для них новые подвиги и свершения.
				Они меняют наряды, лица и образы от читателя к читателю.
				Даже властителям целых империй не снились такие капризы.
				^
				Он переводит дыхание после своей проповеди.
				^
				-- Настоящая жизнь, открывается нам лишь из книг. В них обитают
				реальные люди, не здесь среди тьмы, отбросов и вони, -- заключает
				проповедник, -- покуда существует хотя бы одна книга, они продолжают
				жить.
				^
				Человек возвращается к своей тихой молитве. Из его проповеди ты так
				и не понял, что же нужно делать: спасать книги или сжигать.
			]];
		end;

		return [[
			Ты решаешь, что одной проповеди в день вполне достаточно.
		]];
	end;
}

-- Контрабандист
guild_camp_smuggler = obj {
	nam = 'Контрабандист';
	dsc = [[
		Пользуясь светом одного из факелов, {бандитского вида тип} поглощён изучением карты.
		Он поглаживает густые усы и бранится.
	]];
	act = function()
		-- Приветствие. Ищем старика
		if not _guild_camp_smuggler_greeting then
			_guild_camp_smuggler_greeting = true;

			-- Текст приветствия
			local greeting = [[
				Ты подходишь ближе к усачу, чтобы завязать разговор. Но едва увидев тебя, тип
				комкает карту и хватается за кинжал на поясе.
				^
				-- Режимник, черти его дери! -- шипит он, словно испуганный кот.
				^
				-- Спокойно, это же просто нагрудник, -- ты демонстрируешь свои пустые ладони,
				-- думаешь, громила на входе пропустил бы настоящего режимника?
				^
				-- Проклятье, и правда. Застал ты меня в расплох, -- он прячет кинжал на место,
				и поглаживает усы, -- я уж и забыл, что у него есть люди в штабе города.
			]];

			-- Текст расспросов про старика
			local question = [[
				^
				-- Всё верно. Слушай, он как раз попросил меня найти старика-горбуна,
				-- ты решаешь воспользоваться словами усача, -- сказал искать его где-то здесь.
				^
				-- Чёрт. Тут я тебе не помошник, -- тип разводит руками, -- я сам тут бываю набегами.
				Ну, знаешь, привёз товар, туда-сюда, толкнул, отбыл за новым.
				Честно говоря, я бы и сам повидал старика. Он такие байки травит!
				^
				-- Так, -- ты торопливо киваешь в ответ.
				^
				-- Последний раз мы договорились, что я раздобуду ему доброго вина из Режима.
				Что я и сделал, -- он подмигнул тебе по-приятельски, -- Да только некогда мне
				сейчас искать его, лясы точить. Мне тут предложили одно дельце, -- он кивает
				в сторону человека с книгой, -- совсем времени нет.
				^
				Усач встряхнул карту, чтобы расправить помятую бумагу.
				^
				-- А обычно старик, где был? -- ты решил не сдаваться так легко.
				^
				-- Обычно он где-нибудь здесь и бродил. В этом зале, в уголке потемней. За колоннами
				где-нибудь, -- тип снова уставился в карту, -- слушай, ты как найдёшь его, дай знать.
				Передашь ему бутылку от меня.
				^
				Ты оставляешь усача в покое.
			]];

			-- Приветствие и если уже нашли старика, то берём бутылку
			if _guild_camp_giveaway then
				_guild_camp_giveaway = false
				take 'rocky_island'
				return greeting .. [[
					^
					-- Всё верно. Он послал меня сюда искать одного старика. Найти-то я его нашёл.
					Да только какой-то он не разговорчивый.
					^
					-- Да ладно! -- тип поглаживает свои густые усы, -- ему просто нужно промочить горло!
					Истори потекут из него, как вино в него.
					^
					Он извлекает из запазухи бутылку с тёмным содержимым.
					^
					-- Вот. Обещал ему раздобыть. Только у меня сейчас кое-какие срочные дела
					по торговле, -- усач бросает на тебя пронзительный взгляд, -- передай ему.
					Только в целости и сохранности, а то следующую бутылку я выменяю на тебя.
					^
					Поблагодарив усача с натянутой улыбкой, ты уходишь.
				]];
			end;

			-- Приветствие и поиск старика
			return greeting .. question;
		end;

		-- Заходим за бутылкой
		if _guild_camp_giveaway then
			_guild_camp_giveaway = false
			take 'rocky_island'
			return [[
				Ты подходишь к усачу. Тот косится на тебя, не отрываясь от карты.
				^
				-- Я нашёл старика, устроился в тоннеле по соседству. Похоже, он не очень
				любит людей.
				^
				-- Возможно это прибавит ему любви к ближнему, -- тип извлекает из запазухи бутылку
				и протягивает в твою сторону, -- передай ему это и мой привет, заодно.
				^
				Ты берёшься за бутылку, но усач не разжимает руки. Ты вопросительно смотришь
				на него.
				^
				-- Только не вздумай вылакать сам или толкнуть кому нибудь, -- усач взглядом
				указывает тебе на кинжал на поясе, -- а то опять ненароком спутаю тебя с режимником.
				^
				Он отпускает бутылку и ты поспешно уходишь.
			]];
		end;

		return [[
			Ты подходишь к усачу. Тот косится на тебя, не отрываясь от карты.
			^
			-- Слушай, а чем торгуешь-то? -- спрашиваешь ты.
			^
			-- Ты точно не режимник? -- ворчит усач в ответ,
			-- вопросы задаёшь прямо как они. Торгую чем придётся. Не бедствую.
			^
			-- Ну извини, просто поинтересовался, -- осторожно говоришь ты,
			-- Я вообще здесь первый раз, вот и спрашиваю всякое. А тут ещё и
			такая разношёрстная компания, -- ты обводишь зал рукой, -- не хуже чем на рынке.
			^
			-- Это да. Кого тут только не собралось. И всех объединяет недовольство Режимом.
			^
			-- Многим горожанам, тоже надоели все эти солдаты на улицах. Странно, что они
			сами ещё не пондяли восстание.
			^
			-- Восстание, скажешь тоже, -- усач недовольно дёрнул за ус, -- я кое-чего
			смыслю в народе, много с кем общаюсь. Там наверху, -- он тычет пальцем в потолок,
			и ты догадываешься, что он имеет ввиду жителей города, -- если кто и задумывается
			над тем, как они живут, то никто не смеет и слова сказать. Да и говорить-то некому.
			Режимников, возможно, и сравнивают с бандитами, да только когда, бандиты наседают,
			бегут жаловаться к законникам, а когда законники сами бандиты к кому бежать?
			^
			Ты пожимаешь плечами.
			^
			-- Да в том-то и дело, что бежать-то не надо, -- он сплёвывает под ноги, --
			Да только, духу ни у кого не хватает. Город так у будет спину гнуть,
			да ждать спасителей. Нас, например.
			^
			Усач окидывает тебя взглядом и ты согласно киваешь.
			^
			-- Хотя, конечно, люди нам помогают. Взять того же старика Крисана...
			^
			Услышав знакомое имя ты вздрагиваешь.
			^
			-- Знаешь, у тебя же дело, а я тебя заболтал. Пойду.
			^
			Усач возвращается к изучению карты.
		]];
	end;
}

-- Лорд
guild_camp_lord = obj {
	nam = 'Лорд-изгнанник';
	dsc = [[
		Его абсолютная противоположенность -- {статный блондин} в дорогом наряде
		сидит на камне и чистит до блеска свои сапоги.
	]];
	act = function()
		-- Приветствие. Ищем старика
		if not _guild_camp_lord_greeting then
			_guild_camp_lord_greeting = true;

			-- Текст приветствия
			local greeting = [[
				Ты осматриваешь блондина издалека. Его дорогое платье из красного
				шёлка, осанка, точёные черты лица выдают в нём человека голубых кровей.
				Что порядком тебя смущает, если не брать во внимание, что он сам натирает свои
				сапоги. Заметив твой взгляд, блондин бросает тряпку и жестом поздывает тебя.
				^
				-- Похоже, дела у нас идут неплохо, если люди из штаба получили такое доверие,
				-- он в шутку стучит тебе по нагруднику костяшками пальцев, -- просто прекрасно.
				^
				-- Я не совсем оттуда, -- отвечаешь ты смутившись.
				^
				-- Допустим, -- блондин улыбнулся, -- а здесь ты зачем?
			]];

			-- Текст расспросов про старика
			local question = [[
				^
				-- Мне поручили найти одного человека. Старика-горбуна.
				^
				-- Горбатого старика? Ты, наверное, о бывшем советнике, -- тонкие бледные пальцы,
				погладили гладко выбритый подбородок. Ты представил как мастерски, должно быть,
				эти пальцы обращаются с картами, -- помнится мне, что он много ворчал в последнее
				время. Жаловался, что тут для него стало слишком многолюдно. Искал уединения
				и спокойствия.
				^
				Блондин задумался.
				^
				-- Вроде он договорился о чём-то с Урфангом. Но деталей я не знаю.
				^
				-- Урфанг это...
				^
				-- Тот громила на входе, который хотел сожрать твои потроха, -- подсказывают
				тебе.
				^
				-- Да, это он. А как, кстати, зовут того старика?
				^
				-- Некоторые имена лучше опустить. Например, моё. Да и твоё, думается мне, тоже.
				^
				Ты согласно киваешь. Блондин продолжает:
				^
				-- Если честно, мне самому нужно кое-что передать советнику. Но нет желания
				связываться с этим слюнявым урук. Попробуй разузнать у той суетливой барышни,
				-- блондин направил твой взгляд на хлопочущую женщину, --
				о чём старик условился с орком. Она тут за всем следит.
				^
				-- Хорошо, благодарю, -- ты раскланиваешься.
				^
				-- Только будь с ней пообходительней, -- кидает тебе блондин напоследок,
				-- она немного сумасшедшая.
				^
				Ты только пожимаешь плечами и уходишь.
			]];

			-- Приветствие и если уже нашли старика, то берём знак раcположения
			if _guild_camp_giveaway then
				_guild_camp_giveaway = false
				take 'lord_sign'
				return greeting .. [[
					^
					-- Мне поручили найти одного человека. Старика-горбуна для одного
					дела. Да только никаких дел со мной он иметь не хочет.
					^
					-- Значит у тебя дело к бывшему советнику, -- белокурая бровь немного
					приподнимается, -- интересно. Старик пытался спрятаться, но и этого
					ему не удалось. --
					^
					-- Удачно, что ты его нашёл, -- блондин показал тебе ряд ровных белых зубов,
					-- Мне как раз нужно передать ему кое-что.
					^
					Он снимает со своего наряда небольшую брошь и передаёт тебе:
					^
					-- Уверен, это сдвинет твоё дело с мёртвой точки.
					^
					Ты принимаешь украшение.
					^
					-- Надеюсь, на это. Спасибо, за помощь, -- ты раскланиваешься и уходишь.
				]];
			end;

			-- Приветствие и поиск старика
			return greeting .. question;
		end;
		
		-- Даёт знак расположения
		if _guild_camp_giveaway then
			_guild_camp_giveaway = false;
			take 'lord_sign';
			return [[
				Ты подходишь к блондину поближе, чтобы завязать разговор.
				^
				-- Мне удалось найти советника. Только он не желает со
				мной разговаривать.
				^
				-- С незнакомцами он дел иметь не будет, -- блондин достаёт
				что-то из кармана и протягивает тебе, -- вот, передай это ему.
				Я давно хотел, чтобы эта вещь перешла ему.
				Может заодно, он согласиться тебя выслушать.
				^
				Ты принимаешь небольшую брошь, и поблагодарив её владельца,
				уходишь.
			]];
		end;

		-- Разговор
		return [[
			Ты подходишь к блондину поближе, чтобы завязать разговор.
			^
			-- Не ожидал уведь здесь такого человека как ты, -- ты обводишь
			взглядом его наряд.
			^
			В ответ тебя одаривают белоснежной улыбкой.
			^
			-- Уверен, многие здесь, в свою очередь, не ожидали увидеть режимника.
			^
			-- Чем ты здесь занимаешься? -- спрашиваешь ты.
			^
			-- Информирую и советую, в основном, -- отвечает блондин,
			-- у меня есть связи среди знати Приграничья и Режима, что весьма
			полезно, когда собираешься развязать небольшую гражданскую войну.
			На которую, кстати, нужны деньги.
			^
			Это было сказано с таким спокойствием, что тебя взяла дрожь.
			^
			-- По твоему, этим людям нужно именно это? Ещё одна война?
			^
			-- Эти люди сами ещё не понимают, что им нужно. Большая часть подполья --
			бандиты, которым не нужны конкуренты в лице режимников.
			Не нужны конкуренты и местным лордам. И они охотно распускают слухи, что
			скоро Режим объявит эти земли своей провинцией и начнёт насаживать здесь
			свои религию и порядки. Простые люди боятся таких перемен. Многие начинают
			симпатизировать подполью. Бандиты, да. Зато свои.
			^
			-- А как же рекруты? Они же тоже свои? -- ты барабанишь пальцами по нагруднику.
			^
			Блондин усмехается.
			^
			-- Так они и начали этот бандитизм Режима. Власть развязывает руки и связывает
			совесть. А грабитель, который называет себя законом, хуже грабителя обычного.
			^
			-- Выходит, мы готовим очередную войну, -- заключаешь ты.
			^
			-- Такова судьба этой страны. Прогонят Режим, придут орки. Лордам выгодней
			использовать их, чем бороться с ними. Повесят лордов, власть захватят Полисы.
			Прогонят имперцев, обнаружат, что всё прибрали к рукам синдикаты Вольных городов.
			^
			Он смотрит на древо с книгой на твоей груди.
			^
			-- Подбирай себе новый наряд лжережимник, -- слышишь ты, -- если хочешь увидеть
			завтра.
			^
			Ты молча уходишь.
		]];
	end;
}

-- Рыцарь
guild_camp_knight = obj {
	nam = 'Кархэрд Чёрный рыцарь';
	dsc = [[
		{Воин} в чёрных латах отдыхает привалившись спиной к колонне.
		На коленях у него покоится меч в ножнах.
	]];
	act = function()
		-- Договорились о встрече с Сайри
		if _guild_camp_hadsex then
			-- Спрашиваем война действительно ли он рыцарь, и про проклятье Сайри
			-- Упоминаем гадалку?
			-- Рыцарь уходит разбираться с проклятьем
			objs('guild_camp'):del('guild_camp_knight');
			return [[
				Ты подходишь к воину. Он встречает тебя усталым взглядом.
				^
				-- Ей ещё что-то нужно?
				^
				-- Да нет. Я не за этим. Она называла тебя рыцарем, -- ты
				переминаешься с ноги на ногу, -- хотел узнать действительно
				ли это так.
				^
				-- Рассказать тебе о рыцарях? -- воин прищурил один глаз, --
				Да ты садись.
				^
				Ты устраиваешься рядом на полу.
				^
				-- В прежние времена рыцарские ордена правили в Приграничье.
				Тогда рыцари считались кем-то вроде сверхлюдей. Они сражались
				с чудовищами и захватчиками. Что и говорить,
				они наравных выступили против объединённых племён орков.
				Другое государство эта волна дикарей просто смела бы без
				следа. Увы, та война полностью разорила земли Приграничья.
				Ордена пришли в упадок и распались. Несколько раз ордена
				пытались возродить, но тщетно. Сегодня рыцари никому
				не нужны. Люди уповают на Режим, его богоизбранных и их
				чудотворные дела. Больше нет веры в сталь меча, доблесть и честь.
				От рыцарства уцелел лишь титул, которым тебя может наделить
				какой-нибудь толстозадый лорд. Впрочем, можно обойтись и без церемоний.
				Я, например, сам провозгласил себя рыцарем, обойдясь без посвещения.
				^
				-- И не один толстозадый лорд не был против? -- вклиниваешься ты.
				^
				-- Не был, -- усмехается воин, -- в рыцарстве главное поступки,
				которые ты совершаешь, а не титул. Хоть мой титут ненастоящий, но
				имя Кархэрд известно в Приграничье благодаря моим деяниям.
				^
				Ты напрягаешь память. Кажется, ты слышал что-то про грабителя
				караванов с таким именем. Ты решаешь это не упоминать.
				^
				-- И ты сражаешься с чудовищами?
				^
				-- Если считать чудовищами орков, то да -- воин улыбается, --
				хотя мне доводилось встречать вещи и похуже. Я много путешествую по
				стране. Помогаю простым людям в их бедах. Взять, например, этот город.
				Ещё стараюсь собирать всевозможную информацию
				о рыцарях прошлого, о деяниях орденов. В этом здорово помогают бродячие
				старцы -- книжники. Они много знают об истории этой страны. Кое-кто
				ещё надеется, что когда-нибудь удасться восстановить Единый Орден.
				^
				-- А с проклятьем ты когда-нибудь сталкивался? -- спрашиваешь ты сам
				удивляясь вопросу.
				^
				-- Я встречал книжников, которые говорили, что на всём Приграничье
				лежит проклятье. Из-за него в этой стране никогда не будет
				законного властителя. Но я в это не особо верю.
				^
				-- Эта женщина, Сайри, сказала мне, что проклята.
				^
				-- Не слышал об этом, -- он нахмурился. Лицо его снова
				приобрело суровые черты.
				^
				-- Она упоминала ночь в башне, -- продолжаешь ты, --
				похоже, что она уверена, что постарела из-за проклятья.
				^
				-- Ночь в башне, проклятье и этот поцелуй, -- воин неожиданно
				поднимается на ноги под скрежет доспеха.
				^
				-- Её голос всегда казался мне странным. Чертовщина какая-то,
				-- бормочет он едва слышо. Затем объясняется уже громче:
				^
				-- Знаешь, сегодня я уже посмеялся, когда услышал про поцелуй.
				Но когда речь заходит о башне, я уже не удивляюсь любой чуши.
				^
				-- Ты уходишь? -- удивляешься ты.
				^
				-- Лучше всё проверить, -- воин приторочил ножны к поясу и
				по привычке проверил легко ли выходит меч.
				^
				Кивнув на прощание, самопровозглашённый рыцарь покидает тебя.
			]]
		end;

		-- Договариваемся о встрече с Сайри
		if _guild_camp_horny then
			_guild_camp_hadsex = true;
			return [[
				Ты подходишь к воину, и он одаривает тебя суровым взглядом.
				^
				-- Ну давай, скажи мне, что я арестован именем Режима, -- проворчал
				он.
				^
				-- Не скажу. Я тут не за этим и я не режимник.
				^
				-- Очень жаль, я рассчитывал размяться с утра, -- его изнурённое лицо
				говорит тебе, что он не спал всю ночь.
				^
				-- Я ищу старика-горбуна. Не знаешь, где он? -- осторожно
				спрашиваешь ты.
				^
				-- Понятия не имею, -- с неохотой отвечает воин, -- спроси вон у той
				дамы.
				^
				Он кивает на женщину, которая совсем недавно послала тебя к нему.
				Ты осознаёшь безвыходность своего положения, и со вздохом произносишь:
				^
				-- Кстати, насчёт неё. Она хотела, чтобы я кое о чём попросил тебя.
				^
				-- Сайри Душка что-то хочет от меня? -- его суровость как-то сразу
				сходит на нет.
				^
				-- Это её имя?
				^
				-- Прозвище, -- поясняет воин, -- так что ей от меня нужно?
				^
				-- Поцелуй.
				^
				-- Это что шутка какая-то? -- он снова оценивает тебя с серъёзным выражением
				лица, словно решает какая часть тела у тебя лишняя.
				Ты отрицательно качаешь головой. Неожиданно для тебя воин начинает смеяться.
				^
				-- Я слышал, лет десять назад поклонники выстраивались в очередь за её поцелуем,
				-- рассказывает он, вытирая слёзы с уголков глаз, -- да только, она тоже мало
				кому отказывала. Отсюда и её прозвище. Знаешь, я слишком устал, чтобы думать
				сейчас над всяким бредом. Эта Сайри чудит всё больше на склоне лет.
				^
				Он задумался на мгновение.
				^
				-- Передай ей, чтобы приходила сегодня в полночь в тоннель с тупиком.
				К тому времени, я что-нибудь надумаю. Кто знает, может, наш усач сходит
				за меня, и даме достанется что-нибудь ещё, -- он подмигнул тебе,
				-- всё, ищи дальше своего старика.
				^
				Ты благодаришь воина, и уходишь.
			]];
		end;

		-- До квеста
		return [[
			Ты осматриваешь воина на растоянии.
			С некоторых пор у тебя нет желания разговаривать с вооружёнными людьми
			в броне. Доспех воина выглядит слегка помятым,
			а кое-где на нём ты замечаешь подтёки запёкшейся крови. На нагруднике
			красуется обломок меча, намалёваный белой краской.
		]];
	end;
}

-- Душка Сайри
guild_camp_slut = obj {
	nam = 'Душка Сайри';
	dsc = [[
		Рядом хлопочет грузная {женщина}, перебирая содержимое всяческих ящиков и
		мешков.
	]];
	act = function()
		-- Всё готово
		if _guild_camp_cooked then
			return [[
				-- Правда, я хорошо готовлю? Меня мама научила.
			]]
		end

		-- Подготавливаемся к готовке
		if have('fatrat') and _guild_camp_fueled then
			_guild_camp_cooked = true;
			inv():del 'fatrat';
			take 'ratkebab';
			return [[
				-- О, класс, давай это всё сюда.
				^
				Барышня забирает у тебя крысу, отрезает ей голову, потрошит
				внутренности и жарит тушу на костре, после чего отдаёт тебе
				с радостной улыбкой.
				^
				Test
				^
				-- Так посмотрим. Подожди, что это? Где крылья? Это что, крысы?!
				Я же сказала, летучих мышей! Ладно, давай сюда. В голодные годы
				войны ели и не такое.
				^
				Test
				Сайри должна заметить раненную ладонь героя. И связать своё проклятье
				с гадалкой.
			]];
		end

		-- Договорились о встрече
		if _guild_camp_hadsex then
			-- Квест на готовку уже получен
			if ( not have('fatrat') or not _guild_camp_fueled ) and _guild_camp_want_axe then
				return [[
					Ты смотришь как женщина достаёт какие-то мешки из
					сундука. Опасаясь новых поручений, ты напрягаешь память:
					наловить мышей и развести костёр.
				]];
			end;
			-- Получаем квест на готовку
			event 'we want meat'
			_guild_camp_want_axe = true
			return [[
				Ты возвращаешься к женщине. Она предстаёт перед тобой с трясущимися руками.
				^
				-- Что он сказал? Согласился? Я слышала, как он смеялся, -- накидывается
				она на тебя, дрожа от волнения.
				^
				-- Он сказал, чтобы сегодня в полночь ты пришла в тоннель с тупиком.
				^
				-- Туда? Хорошо. Прекрасно, -- женщина постепенно успокаивается. Ты видишь, что
				она собирается продолжить заниматься делами, и останавливаешь её.
				^
				-- Подожди. Я ищу одного старика. Он горбун. Знаешь, где можно его найти?
				^
				-- Хм. Он теперь не здесь. Урфанг, орк, стережёт его в канале. Следит, чтобы никто
				не докучал старцу.
				^
				-- Тот орк, -- догадываешься ты, -- кажется, он умирает с голода.
				Можешь приготовить для него что-нибудь?
				^
				-- Для Урфанга? -- пересправшивает она, округлив глаза, -- ох, даже не знаю.
				Этим оркам так сложно угодить. Что я только не готовила. Он от всего нос воротит!
				^
				-- Что, совсем без шансов? Да он такой голодный, что готов был меня сожрать.
				^
				Женщина смеётся, но ты слышишь смех молоденькой девушки.
				^
				-- Тебя-то он сожрал бы с радостью. Уж поверь. А знаешь,
				надоел мне этот кухонный знаток! Сходи-ка и налови мне мышей в канале.
				Посмотрим, что он скажет на такую экзотику! Кто поймёт этих орков?!
				^
				-- Ты уверена, что это хорошая идея? -- с сомнением спрашиваешь ты, --
				он ведь, и правда, может сожрать меня!
				^
				-- Меньше разговоров, больше дела, -- строго произнесла женщина, --
				я так приготовлю, что ты сам захочешь это съесть! Кстати,
				заодно подкинь дровишек в костёр. Мне и правда пора браться за обед.
				Столько голодных ртов вокруг! Как всё будет готово, приходи.
				^
				Терзаемый сомнениями ты отправляешься исполнять поручения.
		]]
		end

		-- В процессе договора о встрече
		if _guild_camp_horny then
			return [[
				Каждый раз, как ты смотришь в сторону женщины, тебя встречает её взгляд
				исполненный надежны.
			]];
		else
			-- Приветствует и даёт квест
			_guild_camp_horny = true
			return [[
				Ты подходишь к женщине и пытаешься обратить на себя внимание, в надежде
				завязать разговор. Та что-то напевает себе под нос и, кажется, вовсе
				тебя не замечает, поглощённая своими делами. В конце-концов ты не
				выдерживаешь и касаешься её плеча.
				^
				-- Ох, -- неожиданно для тебя женщина отзывается голосом молоденькой
				девушки, -- можно ухватиться и пониже.
				^
				Она оборачивается к тебе, и ты ещё раз убеждаешься, что перед тобой
				женщина, чья молодость давно позади. Женщина тем временем изучает взглядом тебя.
				В её глазах постепенно разгораются странное возбуждение.
				Ты уже жалеешь, что подошёл к ней.
				^
				-- Неужели это ты?! -- она хватает тебя за руку, притянув к себе,
				-- Этот отпечаток лишений на лице, этот гул пустого желудка, этот доспех
				с твоим гербом. О да, ты наконец пришёл спасти меня, мой рыцарь!
				^
				-- Рыцарем меня ещё никто не называл, -- нервно отвечаешь ты, отстраняясь,
				-- и это не мой герб, а герб Режима. Неужели, вы ни разу не видели такого?
				^
				Женщина задумчиво смотрит на тебя. Блеск в её глазах гаснет.
				^
				-- Да верно, этот герб был на флаге той башни.
				^
				-- Башни? -- как дурак повторяешь ты.
				^
				-- Да, той башни, -- в её голосе слышится печаль, -- а хотя, знаете,
				может вы, и впрямь мой спаситель, и сможете мне помочь!
				^
				Теперь ты читаешь в её глазах мольбу.
				^
				-- Все здесь считают меня сумасшедшей. Никто не верит, что я проклята.
				^
				-- Проклята? -- переспрашиваешь с опаской ты.
				^
				-- Однажды один человек увлёк меня в ту башню. Меня предупреждали о ней,
				что это скверное место. Но я всё равно пошла. Я плохо помню,
				что там было, но это точно не была романтическая ночь с ухажёром.
				А главное, я вернулась обратно в этом постаревшем теле! Помоги мне!
				^
				-- А я-то чем тебе помогу?
				^
				-- Вернуть мне молодость может только поцелуй рыцаря. Таково условие
				проклятья.
				^
				-- Я никакой не рыцарь, -- решительно отпираешься ты.
				^
				-- Ты нет, но вон тот, -- она указывает на война в латах, --
				Может тебе удасться убедить его. Меня уже никто давно не воспринимает
				всерьёз.
				^
				-- Я попробую, -- только и можешь ответить ты, глядя на её глаза полные
				слёз.
				^
				Ты изображаешь ободряющую улыбку и уходишь.
			]];
		end
	end;
}

-- Маг, бывшая крыса
guild_camp_mage = obj {
	nam = 'Беглый маг';
	dsc = [[
		Под светом другого факела немолодой {мужчина} листает увесистый трактат
		-- и ты мог бы поклясться, что он вполголоса разговаривает
		с чёртовой книгой.
	]];
	act = function()
		walk 'guild_camp_stories';
	end;
}

-- Полукровка
guild_camp_halfblood = obj {
	nam = 'Полукровка';
	dsc = [[
		В полумраке между колонн ты замечаешь тоннель уводящий во тьму и
		смутные движения какой-то {тени}.
	]];
	act = function()
		-- Приветствие. Ищем старика-горбуна
		if not _guild_camp_halfblood_greeting then
			_guild_camp_halfblood_greeting = true
			-- Текст приветствия
			local greeting = [[
				Ты присматриваешься к тени, что движется в самом тёмном углу залы.
				Периодически оттуда доносится гулкий стук.
				Ты подходишь ближе и различаешь во мраке фигуру стройной девушки
				в коротком жилете и штанах из грубой кожи. Она метает ножи куда-то
				в темноту. Ты приближаешься к девушке и с трудом различаешь соломенное чучело
				привязанное к одной из колон в далеке. Несколько ножей торчит из головы и паха
				чучела. Для тебя остаётся загадкой как она что-то видит в такой темноте.
				В её движениях ты отмечаешь какую-то странную нечеловеческую грацию.
				^
				Девушка поворачивается к тебе. На бледном лице тебя встречают два больших
				глаза странного лилового оттенка. Ты отчётливо видишь их в темноте, будто
				они светятся.
				^
				-- Со всеми здешними умалишёнными познакомился? Очередь дошла до меня? -- слышишь ты
				вместо приветствия.
				^
				-- А ты отчаянный, заявиться сюда в таком наряде, -- она осматривает тебя с головы
				до ног, -- странно, что Урфанг тобой не отобедал.
				^
				-- Я так себе на вкус, -- отшучиваешься ты.
			]];

			-- Вопрос про старика, если ещё не поговорили с Сайри
			local question = [[
				^
				-- Я, кстати, ищу старика-горбуна. Слышала о таком?
				^
				-- Старика? Он поди уже сдох где-нибудь. Попробуй поискать по запаху, --
				усмехается девушка.
			]];

			-- Завершаем приветствие
			local greeting_end = [[
				^
				-- Кстати, -- оживляется она, -- я умею делать кое-какие фокусы. Хочешь покажу?
				^
				В тебя закрадывается некоторое подозрение.
				^
				-- Для фокуса понадобится твоё участие. Раздобудь что-нибудь, типа яблока.
				Прислонись спиной вон к той колонне, рядом с моей мишенью, и поставить яблоко на голову.
				Дальше я всё сделаю сама. Фокус такой, что дух захватывает!
				^
				-- Знаешь, мне больше по душе наблюдать со стороны, чем участвовать, --
				любезно отказываешься ты, собираясь уходить.
				^
				-- О, ясно. Мне все так говорят.
				^
				Тебе кажется, что её усмешка прозвучала как-то двусмысленно.
			]];

			-- Приветсвие и вопрос
			if not _guild_camp_horny then
				return greeting .. question .. greeting_end;
			end;

			-- Просто приветствие
			return greeting .. greeting_end;
		end;

		return [[
			Ты снова отправляешься во мрак между колонн. Девушка запускает очередной
			нож куда-то в темноту и встречает тебя лукавой улыбкой.
			^
			-- Опять ты? И впрямь отчаянный. Ну ладно постой тут.
			Любуйся сколько хочешь. За это я денег не беру.
			^
			Она крутит бёдрами, дразня тебя.
			Ты ловишь себя на мысли, что слишком долго разглядываешь её
			стройное, подтянутое тело. Тебя гложет странное чувство. В своей деревушке
			ты видел хорошеньких девушек только во сне или на потёртых страницах.
			Но глядя на эти привлекательные бёдра, открытые белые плечи, плохо
			скрывающую грудь жилетку, ты не чувствуешь желания.
			Напротив, в этой фигурке есть что-то отталкивающее.
			^
			Но несмотря на это тебе хочется сыграть в эту игру.
			^
			-- А за что берёшь? -- заинтересованно спрашиваешь ты, будто твои
			карманы набиты золотом.
			^
			-- За то, чтобы пришить кого-нибудь, -- со смехом отвечает она, проведя
			пальцем по клинку ножа, -- есть кто на примете?
			^
			-- Пока нет, -- выдавливаешь ты смущённо.
			^
			-- Ну тогда иди, приметь кого нибудь.
			^
			Ты уходишь, провожаемый звонким девичьим смехом.
		]];
	end;
}

-- TODO
todo = obj {
	nam = 'TODO';
	dsc = [[
		{...}
	]];
	act = [[
		^ (Оттенить город, показать обратную сторону его жизни. Тёмную, настоящую?
		Приют сумасшедших?)
	]];
}
