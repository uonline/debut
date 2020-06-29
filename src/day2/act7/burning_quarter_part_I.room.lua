-- Чтобы освободить проход к переулку и преградить улицу для Кевразы, герой должен столкнуть повозку
-- в горящее здание, которое обрушившись перекроет улицу.
-- Для этого нужно выполнить в определённой последовательности 4 действия, иначе Кевраза убивает героя
-- броском копья.
--
-- Герой также умирает, если попытается убежать в Переулок, при отодвинутой повозке.
--
-- Правильная последовательность действий: достать из-под телеги трупы, снести лоток, закинуть бочки в телегу, разбить цепь телеги.
--
-- После того как герой выполнили эти действия из переулка выходит проповедник. Начинается диалог и драка с ним.
-- Затем Кевраза убивает проповедника броском копья, спасая героя от смерти. Герой поднимает мистическое нечто,
-- которое наделяет его силой проповедника.
--
-- Сначала нужно будет убегать от Кевразы в переулок, а там расчистить люк канализации.

-- Переменные локации
local burning_quarter_counter = 4;

-- Функции локации
-- Функция для обратного отсчёта до завершения игры в горящем квартале
-- Вызывается при взаимодействиях с разными объектами локации, и генерирует разные события,
-- зависящие от счётчика наступления завершения игры
burning_quarter_action = function(act_text)
	act_text = act_text .. "^";

	-- Переводим счётчик
	burning_quarter_counter = burning_quarter_counter - 1;

	-- Герой слышит приближение отряда Кевразы
	if burning_quarter_counter == 3 then
		act_text = act_text .. [[
			3...
		]];
	end;

	-- Герой слышит приближение орков
	if burning_quarter_counter == 2 then
		act_text = act_text .. [[
			2...
		]];
	end;

	-- Отряд Кевразы побеждает орков
	if burning_quarter_counter == 1 then
		act_text = act_text .. [[
			1...
		]];
	end;

	-- Время вышло, отряд Кевразы попадает в квартал
	if burning_quarter_counter <= 0 then
		walk 'killed_in_burning_quarter';
		return act_text .. [[
			Кевраза бросает копьё...
		]];
	end;

	return act_text;
end;

-- Переходы локации
-- Попытка героя пробраться в Переулок
burning_quarter_to_lane_fail_room = room {
	nam = 'Переулок';
	enter = function()
		-- Проверять есть ли в телеге бочки
		if not burning_quarter_loaded_cart:disabled() then
			return [[Повозка забита бочками, не пролезть.]], false;
		end;

		-- Проверяем не укатилась ли телега
		if burning_quarter_cart:disabled() then
			-- Пытаемся пробраться в переулок
			local fail_text = '';

			-- 2 Залп стрел, может убить героя, если нет телеги
			if burning_quarter_counter == 3 then
				fail_text = [[
					Залп стрел убивает героя.
				]];
			end;

			-- 1 Орки убивают героя, если телега скатилась негружённой
			if burning_quarter_counter == 2 then
				fail_text = [[
					Орки убивают героя.
				]];
			end;

			walk 'killed_in_burning_quarter';

			return [[
				Путь открыт, и ты пытаешься сбежать в переулок
				^
			]] .. fail_text;
		end;

		-- Пытаемся пролезть в переулок и теряем время
		local text_escape_trying = [[
			Ты забираешься на телегу и пытаешься пролезть в переулок, но балка мешает.
			Находишь труп раненного.
		]];

		if burning_quarter_counter == 1 then
			-- Разрешаем переход на сцену gameover
			return burning_quarter_action(text_escape_trying), true;
		end;

		return burning_quarter_action(text_escape_trying), false;
	end;
}

-- Локация
burning_quarter = room {
	nam = 'Горящий квартал';
	dsc = [[
		Ты стоишь посреди просторного мощённого квартала, расположившегося на
		склоне холма. Банда урук-хай прошлась по нему железным кулаком,
		вкатав городскую стражу в плавящуюся мостовую. Здания вокруг охвачены
		огнём факелов и стрел разорителей. Треск горящего дерева заглушает
		отдалённые крики и шум уличных боёв.
	]];
	obj = {
		'burning_quarter_place';
		'burning_quarter_cart';
		'burning_quarter_loaded_cart';
		'burning_quarter_broken_cart';
		'burning_quarter_cart_chain';
		'burning_quarter_rolled_barrels';
		'burning_quarter_corpses';
		'burning_quarter_corpses_shifted';
		'burning_quarter_salers_counter';
	};
	way = {
		'burning_quarter_to_lane_fail_room';
	};
	enter = function()
		-- Debug
		take 'soldier_sword';

		-- Если нет меча, то ящер убивает героя
		if not have 'soldier_sword' then
			walk 'halfed_by_panglolin'
			return;
		end;

		-- Если меч есть, то меняем его на молот
		drop 'soldier_sword';
		take 'burning_quarter_hammer';

		return [[
			Ты двигаешься в сторону спасительного переулка, стараясь держаться от полуящера
			подальше и не привлекать его внимания. Первое время тебе это удаётся,
			но в какой-то момент рептилия в очередной раз принюхивается, после чего шипы у неё
			на загривке встают дыбом. Тварь окидывает тебя злобным взглядом и, видимо,
			придя к какому-то умозаключению, бросает полуобглоданный труп и устремляется в
			темнеющий зев переулка. Выругавшись, ты кидаешься следом.
			^
			Оказавшись в узком коридоре между зданий, ты переходишь на шаг.
			Твоя рука стискивает эфес, а глаза вглядываются в темноту.
			Где-то впереди слышится приглушённое рычание полуящера.
			^
			-- Покажись, гадина, -- шепчешь ты.
			^
			Тебе в ответ открывается одна из дверей в ближайшем доме.
			На пороге высится чёрная громада орка в ореоле приглушённого света.
			Из-за его спины доносятся едва различимые стоны.
			Взмахнув массивным молотом, урук сливается с тьмой переулка.
			Ты слышишь звук ломаемых костей и животный визг.
			^
			В следующее мгновение орк возвращается на свет. Его оголённый торс покрыт
			брызгами крови.
			^
			Ты выставляешь перед собой меч, но удар молота сметает его куда-то в сторону.
			Раздаётся колокольный звон металла о камень. Каким-то чудом твоё запястье
			остаётся в суставе, а кисть ещё сжимает то, что осталось от меча.
			^
			Получив ногой в грудь ты летишь на землю. Тёнь урук нависает над тобой, и
			огромный молот занесён для сокрушительного удара.
			^
			Резкий крик и рычание вырывают тебя из лап смерти. Мощные челюсти смыкаются на
			шее орка. Сцепившись с полуящером, он пропадает в темноте.
			Оправившись, ты встаёшь и медленно идёшь на хрипы агонии.
			^
			Наткнувшись на пирушего ящера, ты хладнокровно всаживаешь в него обломок меча.
			Осколок клинка кромсает чешую, до тех пор пока тварь не прекращает трепыхаться.
			^
			Переведя дыхание, ты ищешь орка. Но когда глаза наконец-то привыкают к темноте,
			вместо него ты находишь человеческтй труп у себя под ногами.
			Мускулистое тело покрыто сетью татуировок. Кажется, ты уже видел такие сегодня.
			Грозный молот, валяющийся рядом, похож на работу кузнеца урук-хай.
			И всё же ты удивляешься, тому что смог спутать человека с орком.
			^
			Отбросив обломок меча, ты поднимаешь молот. Громоздкий и неудобный, он всё же
			может послужить тебе оружием.
			^
			Не обращя внимания на усиливающиеся стоны, ты поворачиваешься к открытой двери
			спиной и уходишь прочь. Скоро в конце этого тоннеля без свода появляется
			кровавый просвет. Шагая, тебе вспоминается, как примерно в таком же переулке началось
			твоё путешествие в лагерь подполья.
			За сегодняшний день ты слышал достаточно намёков, что город можно покинуть
			не только через ворота. Инстинктивно ты начинаешь смотреть под ноги,
			ожидая увидеть решётку или люк, ведущие в канализацию, а оттуда на свободу.
			^
			К твоему сожалению переулок отказывает тебе в возможности сбежать в прохладную
			темноту подземелий. Впереди разверзается пылающий ад.
		]];
	end;
}

-- Объекты локации
-- Описание места
burning_quarter_place = obj {
	nam = 'Горящий квартал';
	dsc = function()
		return [[
			Два из шести проходов среди зданий уже завалены скособоченными остовами домов.
			Языки огня весело пляшут на их руинах. Внизу {квартала} другая пара проходов
			хорошо освещается красными отсветами. Там то и дело мелкают длинные тени,
			и слышатся брань и приказы.
			^
			Напротив переулка, что у тебя за спиной, чернеет второй, также не тронутый ещё огнём.
		]];
	end;
	act = function()
		return [[
			Ты окидываешь горящий квартал взглядом.
			Ещё с утра этот город был залит солнечным светом. Теперь же он тонет в зареве пожара.
			Почему-то, тебе кажется, что именно этот вид города выглядит наиболее естественным.
			Сегодняший день расстаял вместе с улицами и копошащимися на них жителями,
			всеми силами присосавшимися к своей нелепой благополучной жизни.
			Жар пожара, словно расплавил эти восковые иллюзии, обнажив истинное лицо города
			-- страдание в бурлении хаоса случайностей.
			^
			Ты с силой трясёшь головой, удивляясь, где она подхватила подобные мысли.
		]];
	end;
}

-- Повозка
burning_quarter_cart = obj {
	nam = 'Повозка';
	dsc = [[
		Вход в него преградила {большеколёсная повозка} с высокими бортами.
	]];
	act = function()
		local text_begin = [[
			Ты внимательно изучаешь повозку. Прямо за ней тебя манит очередной переулок,
			где может отыскаться желаемый путь из погибающего города. Вытянув голову
			тебе удаётся увидеть, что переулок не так уж безопасен, как ты думал.
			Кажется, одно из зданий уже порядком обветшало, опасно исказив прямоугольник
			прохода.
		]];

		local text_end = [[
			За ними свалена груда каменной кладки и чёрт
			знает чего ещё, из-за чего ты отказываешься от идеи попытаться проползти под повозкой.
		]];

		local text = text_begin;

		if burning_quarter_rolled_barrels:disabled() then
			-- Бочки убраны
			if burning_quarter_corpses:disabled() then
				-- Трупы ещё свалены у повозки
				text = text .. [[
					Заглянув под повозку, ты обнаруживаешь несколько мертвецов.
				]] .. text_end;
			else
				-- Трупы убраны
				text = text .. [[
					Заглянув под повозку, ты обнаруживаешь ещё несколько мертвецов, помимо тех,
					что привалились спинами к колёсам.
				]] .. text_end;
			end;
		else
			-- Бочки свалены у повозки
			text = text .. 'Заглянуть под повозку тебе мешают разбросанные бочки.';
		end;

		return text;
	end;
}

-- Загруженная повозка
burning_quarter_loaded_cart = obj {
	nam = 'Загруженная повозка';
	dsc = function()
		return [[
			Вход в него преградила {большеколёсная повозка} с высокими бортами
			груженная бочками.
		]];
	end;
	act = function()
		return burning_quarter_cart.act();
	end;
}
burning_quarter_loaded_cart:disable()

-- Сломанная повозка
burning_quarter_broken_cart = obj {
	nam = 'Сломанная повозка';
	dsc = function()
		return [[
			Сломанная повозка.
		]];
	end;
	act = function()
		return [[
			...
		]];
	end;
}
burning_quarter_broken_cart:disable()

-- Цепь, держащая повозку
burning_quarter_cart_chain = obj {
	nam = 'Цепь повозки';
	dsc = [[
		Внушительная {цепь} удерживает повозку от стремительного спуска со
		склона к самому большому из проходов.
	]];
	act = function()
		local text = [[
			Ты придирчиво рассматриваешь цепь, крепящуюся замком к железному
			колу вбитому в землю. Крепкая на вид, на деле она оказывается некудышной.
			Половина звеньев давно проржавела.
		]];

		if burning_quarter_corpses:disabled() then
			return text .. [[
				Натянутая цепь выглядит хрупкой.
			]];
		end;

		return text .. [[
			Сейчас она провисает, потому что колёса повозки упираются в трупы.
		]];
	end;
	used = function(self, what)
		-- Разбиваем цепь повозки
		if what == burning_quarter_hammer then
			burning_quarter_cart_chain:disable();

			-- Проверяем наличие трупов под колёсами телеги
			if burning_quarter_corpses:disabled() then
				-- Проверяем снесли ли мы палатку
				if burning_quarter_salers_counter:disabled() then
					-- Проверка наличия бочек в телеге
					if not burning_quarter_loaded_cart:disabled() then
						-- Убираем загруженную телегу
						burning_quarter_loaded_cart:disable();
						walk 'burning_quarter_fight';
						return [[
							Ты закидываешь молот на плечо и выдохнув
							обрушиваешь его на крепление цепи к повозке.
						]];
					else
						-- Телега без бочек скатывается и ломается
						burning_quarter_broken_cart:enable();

						return burning_quarter_action([[
							Телега скатывается вниз и ломается.
						]]);
					end;
				else
					-- Телега сносит палатку и ломается
					-- Убираем загруженную и обычную повозки, если они есть
					burning_quarter_cart:disable();
					burning_quarter_loaded_cart:disable();

						return burning_quarter_action([[
							Телега сносит палатку, скатывается вниз и ломается.
						]]);
				end;
			else
				-- У телеги под колёсами лежат трупы
				return burning_quarter_action([[
					Колёса телеги упираются в трупы.
				]]);
			end;

			return burning_quarter_action([[
				Телега скатывается вниз и врезается с треском в здание и
				разваливается.
			]]);
		end;
	end;
}

-- Бочки
burning_quarter_rolled_barrels = obj {
	nam = 'Бочки';
	dsc = [[
		По близости раскатилось с десяток объёмных {бочек}.
	]];
	act = function()
		local text = [[
			Ты пинаешь одну из бочек. Та послушно откатывается прочь.
			Похоже в них ничего нет.
			^
		]];

		-- Проверяем есть ли телега и, что это не первое действие на сцене
		if not burning_quarter_cart:disabled() and burning_quarter_counter < 4 then
			-- Если есть, то грузим в неё бочки
			burning_quarter_rolled_barrels:disable();
			burning_quarter_cart:disable();
			burning_quarter_loaded_cart:enable();

			return burning_quarter_action(text .. [[
				Ты пробуешь поднять одну: тяжело, но ты справляешься.
				Приподняв на подрагивающих руках пузатую бочку над головой, ты закидывешь
				её в повозку. Дослушав возмущённый грохот и скрип, ты принимаешься
				за остальные. На четвёртой бочке силы изменяют тебе, и она, отскочив
				от борта, падает обратно. Выругавшись, ты бросаешь её снова.
				^
				Когда в повозке вырастает гора из бочек, ты берёшься разминать ноющую спину.
			]]);
		end;

		-- Разбрасываем бочки
		burning_quarter_rolled_barrels:disable();
		return burning_quarter_action(text .. [[
			Ты торопливо разбрасываешь бочки, расчищая пространство вокруг повозки.
			Они с грохотом скатываются вниз по склону. Заглянув под повозку, ты
			понимаешь, что просто пролезть под ней не получится.
			Как ты и думал, там валяются трупы, а за ними ещё и куча битого камня.
		]]);
	end;
	used = function(self, what)
		-- Разбиваем цепь повозки
		if what == burning_quarter_hammer then
			burning_quarter_rolled_barrels:disable();

			return burning_quarter_action([[
				Cо злости ns разносишь бочки молотом.
			]]);
		end;
	end;
}

-- Трупы
burning_quarter_corpses = obj {
	nam = 'Трупы';
	dsc = [[
		По всему кварталу можно увидеть трупы стражи, режимников и горожан.
		Но больше всего тел около повозки. Здесь окоченело сразу несколько
		утыканных стрелами {бандитов урук-хай}.
	]];
	act = function()
		-- Меняем тела
		burning_quarter_corpses_shifted:enable();
		burning_quarter_corpses:disable();

		-- Проверяем разорвана ли цепь
		if not burning_quarter_cart_chain:disabled() then
			-- Вытаскиваем трупы из-под телеги
			return burning_quarter_action([[
				Ты осматриваешь трупы вокруг телеги.
				Здоровенные наплечники не защитили его от стрелы в шею.
				Ты оттаскиваешь несколько трупов из-под колёс повозка немного
				проезжает.
				Повозка Цепь натягивается.
			]]);
		end;

		-- Цепь разорвана
		return burning_quarter_action([[
			Ты начинаешь в спешке вытаскивать из-под колёс телеги трупы,
			чтобы в конце концов она поехала вниз. Первое же тело становится проблемой.
			Ухватившись за здоровенные наплечники урук-хай, и вдыхая вонь потного тела
			и крови, ты с трудом сдвигаешь его с места. Тужась изо всех сил, ты переворачиваешь
			мертвеца и несколько раз пинаешь. Повозка проезжает нексколько метров юзом, чуть не
			сбив тебя с ног. Со вторым орком получается легче. Что было сил рванув
			его за руку, ты освобождаешь второе переднее колесо повозки. Скрипя, она пытается
			сдвинуться с места, но теперь мешает труп под задними колёсами.
			Ты успеваешь наполовину высвободить ещё одного бандита, перед тем как колесо
			переезжает его. Какое-то время повозка ещё тащит под собой оставшиеся тела,
			но разогнавшись оставляет их в пыли позади.
			^
			Скатившись со склона, она врезается в угол здания прохода, принимает на себя
			душ из пепла и обломков и загорается.
		]]);
	end;
}

-- Разбросанные трупы
burning_quarter_corpses_shifted = obj {
	nam = 'Трупы';
	dsc = [[
		По всему склону раскиданы отодвинутые {тела стражников}.
	]];
	act = [[...]];
}
burning_quarter_corpses_shifted:disable()

-- Палатка торговца
burning_quarter_salers_counter = obj {
	nam = 'Палатка торговца';
	dsc = [[
		^
		Посреди квартала когда-то велась активная торговля: здесь разбросано несколько
		полотнищ шатров и разный скарб. Одной {палатке} всё же удалось уцелеть.
	]];
	act = function()
		return [[
			Ты отвлекаешься, чтобы рассмотреть вызывающую палатку.
			Выглядит она довольно необычно: ткань покрывают волчьи,
			медвежьи и чёрт знает чьи ещё шкуры. Не иначе именно они,
			позволили палатке уцелеть. Немного пострадал чугуный котел
			неподалёку. Перевёрнутый он расстался со своим подозрительным
			содержимым, стекающим теперь по мостовой вниз.
			Тонкая струйка протянулась до большого прохода внизу квартала.
		]];
	end;
	used = function(self,what)
		-- Разносим палатку молотом
		if what == burning_quarter_hammer then
			burning_quarter_salers_counter:disable();

			return burning_quarter_action([[
				Полный решимости, ты подходишь к палатке и...
			]]);
		end;
	end;
}

-- Молот
burning_quarter_hammer = obj {
	nam = 'Молот урук-хай';
	inv = [[
		Ты с отвращением осматриваешь уродливый молот урук-хай.
		Тупой кусок железа вместо навершия и грубая металлическая рукоять.
		Наверняка, когда-то его урук-хозяин с лёгкостью проламывал им черепа
		одной рукой. Но ты с трудом удерживаешь это страшилище в двух.
	]];
}
