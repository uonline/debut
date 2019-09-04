-- Переменные локации
_tunnel_letsrock = false
_tunnel_halfblood_greeting=false

-- События
on_event('ready to rock the boat', function()
	_tunnel_letsrock = true;
	-- Добавляем обстановку, главаря воров и полукровку
	objs('tunnel'):add('tunnel_table');
	objs('tunnel'):add('tunnel_leader');
	objs('tunnel'):add('tunnel_map');
	objs('tunnel'):add('tunnel_halfblood');
	objs('tunnel'):del('tunnel_darkness');
	objs('tunnel'):add('tunnel_darkness');
end)

-- Локация
tunnel = room {
	nam = 'Тоннель';
	dsc = function()
		-- Проверяем выполнили ли мы поручение главаря подполья
		if _tunnel_letsrock then
			return [[
				Пройдя по тоннелю некоторое время, ты различаешь впереди тусклое
				пятно света. Ускорив шаг ты обнаруживаешь, что тоннель кончается
				тупиком. Пятном света оказывается небольшая свеча, пламени которой
				едва хватает, чтобы выхватить из темноты каменную кладку стен.
			]];
		else
			return [[
				Пройдя по тоннелю некоторое время, ты оказываешься
				в полной темноте и в нерешительности останавливаешься.
				Оглянувшись, ты уже с трудом различаешь вдали точку
				костра в лагере подполья.
			]];
		end;
	end;
	obj = {
		'tunnel_darkness'
	};
	way = {
		'guild_camp';
	};
	entered = function()
		-- Test
		event 'ready to rock the boat';
	end;
}

-- Объекты
-- Темнота
tunnel_darkness = obj {
	nam = 'Темнота';
	dsc = function()
		-- Проверяем выполнили ли мы поручение главаря подполья
		if _tunnel_letsrock then
			return [[
				^
				Вокруг вас притаилась {темнота}, хищно сгущаясь от каждого подрагивания огонька
				свечи.
			]];
		else
			return [[
				В {темноте} ты без труда ощупываешь руками обе стены тоннеля.
				Два человека разойдутся здесь с трудом.
			]];
		end;
	end;
	act = function()
		-- Проверяем выполнили ли мы поручение главаря подполья
		if _tunnel_letsrock then
			return [[
				Ты всматриваешься в темноту. Кажется, что она вот-вот наброситься на вас,
				словно стая волков -- на добычу.
			]];
		else
			return [[
				Глядя в непроглядный мрак, ты чувствуешь как твоё сознание начинает
				наполняться чернотой. Голова, руки, ноги, всё твоё тело становятся
				тяжёлыми и отказываются подчиняться. Через мгновение ты понимаешь,
				что никаких рук и ног у тебя вовсе нет. Тьма растворила тебя в себе,
				и теперь ты не более чем тень, висишь в этом тоннеле и ждёшь,
				чтобы твой покой нарушил кто-то из плоти и крови.
				^
				Внезапно в тебя закрадывается странная мысль. Ты вспоминаешь колодец
				в своей деревне, это бездонное жерло. Возможно, вчера утром ты по
				неосторожности слишком сильно перевесился через край, не удержался и
				рухнул вниз? И вот теперь ты лежишь на дне колодца с переломанными
				костями, и агонизирующий разум порождает эти невероятные события последних
				дней.
				^
				А может быть колодец сам затянул тебя во тьму. Как в тех байках о тёмных
				духах, что ты слышал в армии. Дух появляется в колодце,
				если люди перестают ухаживать за ним. Глина на дне превращается в голодную
				слизь, что заманивает к себе слабых волей. Ведомые потусторонней силой
				люди исчезают в колодце. Дух переваривает их, разрастаясь, чтобы со временем
				вырваться на свободу и поглотить всё вокруг.
				^
				Может вчера с твоей деревней произошло именно это? Рок настиг её -- банда
				орков отклонилась от своего курса. А причина всему мстительный дух из
				заброшенного колодца.
				^
				Колодец это всегда риск. Ты не знаешь, что у него внутри: вода-жизнь или
				тьма-смерть.
				^
				С этими мыслями ты обнаруживаешь себя, привалившимся к стене тоннеля.
			]];
		end;
	end;
}

-- Стол
tunnel_table = obj {
	nam = 'Стол';
	dsc = [[
		Ты стоишь перед {столом}, заваленным свитками.
	]];
	act = [[
		Ты осматриваешь стол. Его черное дерево украшено затейливой резьбой:
		углы стола заканчиваются оскалившимися львиными мордами. Свитки
		на столе выглядят относительно свежими, ты не можешь разобрать,
		что на них написано.
	]];
}

-- Главарь подполья
tunnel_leader = obj {
	nam = 'Главарь';
	dsc = [[
		За ним сидит мужчина с чёрной щетиной, в котором ты узнаёшь
		{главаря подполья}.
	]];
	act = function()
		event 'tower penetration';
		return [[
			Ты делаешь шаг к столу и главарь подполья поднимает голову:
			^
			-- Ты сделал, то что я просил? -- спрашивает он.
			^
			Тебе кажется, что его щетина становится ещё черней.
			^
			Анализируем ответ бывшего советника (рассказал ли он герою о советнике и башне, или только дал ключи).
			^
			Если он даёт только ключи, то диалог про Хаос с Полукровкой.
			^
			Ещё один намёк в диалоге, что главарь принадлежит Чёрному Древу. Его мысли на счёт религии Блага? Сравнение с Благими? И подозрение в "нечеловечности".
			-- Так уж ли много на свете правдивых историй. Память и ограниченность человеческого восприятия;
			-- Насколько ты охвачен течением, и что за сила тобой движет? Не использует ли тебя какая-либо
			-- сила? Сумеешь ли ты отвести Рок?
			^
			Ветка диалога с Полукровкой, в которой нужно отметить её серьёзный тон, если герой разговаривал с ней в лагере.
			^
			Главарь встаёт и нажимает, что-то на боковой стене. Стена у него за спиной отодвигается.
		]];
	end;
}

-- Карта
tunnel_map = obj {
	nam = 'Карта';
	dsc = [[
		Пользуясь светом свечи, он задумчиво изучает
		один из {свитков}.
	]];
	act = [[
		Ты всматриваешься в свиток, над которым склонился главарь подполья,
		и понимаешь, что это карта городских окрестностей.
	]];
}

-- Полукровка
tunnel_halfblood = obj {
	nam = 'Полукровка';
	dsc = function()
		-- Если общались с полукровкой в лагере
		if _guild_camp_halfblood_greeting then
			return [[
				Уже знакомая тебе {девушка} с лиловыми глазами облокотилась на другой край стола.
			]];
		else
			return [[
				Напротив него на стол облокотилась {девушка} в коротком жилете и штанах из
				грубой кожи.
			]];
		end;
	end;
	act = function()
		-- Разговариваем с полукровкой в тоннеле (и она становится недоступна для действия в лагеря подполья)
		_tunnel_halfblood_greeting = true;

		-- Анализируем видели или не видели её до этого
		if _guild_camp_halfblood_greeting then
			return [[
				-- Рада, что ты здесь, -- она приветливо улыбается.
				^
				-- Как ты здесь оказалась? -- недоумеваешь ты, -- я точно
				помню, что зашёл в тоннель один.
				^
				-- О чём это ты? -- девушка удивлённо подняла брови, -- я была
				здесь, помогала нашему общему другу строить планы обороны города.
				^
				Ты ловишь себя на мысли, что она снова издевается над тобой.
				Раздражённый, ты решаешь закончить этот разговор.
			]];
		else
			-- Ты не разговаривал с Полукровкой в лагере
			return [[
				Ты пытаешься заговорить с девушкой, но она останавливает тебя
				взглядом, от которого у тебя бегут мурашки по коже. Её странные
				глаза, кажется, светятся в темноте.
			]];
		end;
	end;
}
