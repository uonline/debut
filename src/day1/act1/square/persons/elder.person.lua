-- Старейшина
elder = obj {
	nam = 'Старейшина';
	dsc = [[
		Рядом бродит {старейшина}, совершая что-то среднее между зарядкой и молитвой.
	]];
	act = function()
		walk 'elder_dlg'
	end;
}

-- Диалог со старейшиной
elder_dlg = dlg {
	nam = 'Старейшина';
	hideinv = true;
	entered = function()
		text = [[
			-- Прекрасное утро, мой мальчик! -- с улыбкой говорит старейшина.
			В первую вашу встречу ты принял его за спятившего старика и сильно
			удивился, когда узнал, с каким почтением к нему относится вся деревня.
		]];

		if not _d1a1_water_problem_quest then
			return text .. [[
				^
				-- Жаль что, его омрачает...
			]];
		end;
	end;
	phr = {
		-- Квест на проверку источника воды
		{
			tag = 'water_problem';
			true;
			'Что за проблема с водой?';
			[[
				-- Что за беда? -- спрашиваешь ты.
				Старейшина пожалуется,
				что ручей рядом с деревней начинает пересыхать и попросит героя сходить в лес вверх по ручью и разобраться в чём дело:
				Добавить реплики для других персонажей про ручей, гоблинов вредителей и поиск воды. Отсылка к Fallout:
				{?} Намек на поиск пещеры в чаще;
			]];
			function()
				-- Мы узнали о проблеме с водой
				event 'water problem';
				-- Активируем квест по проверке родника
				_d1a1_water_problem_quest = true;
				-- Берём флягу
				take 'flask';
			end;
		};
		-- О Уорри (открывается после того, как ты поговорил с Уорри в первый раз)
		{
			tag = 'who_is_warren';
			false;
			'Как давно вы знаете Уорри?';
			[[
				-- Хм, дай подумать... -- Старейшина морщится, как будто
				вспоминает что-то неприятное, -- Ты знаешь, кажется, он поселился
				у нас незадолго до тебя. О да, да, всё верно. Помню, мы охотно приняли его.
				Он был похож на тебя когда пришёл. Тоже искал спокойной пристани, убежища.
				Тоже бежал от своего прошлого. Тоже был весьма многообещающим человеком.
				Да, знаешь, на Уоррена возлагали определённые надежды.
				Какое-то время... Но он не оправдал их, к сожалению.
				-- Старик медленно покачал головой. -- Пожалуй, не стоит вспоминать
				эту историю. После Уоррена к нам присоединился ты. Мы все весьма рады этому.
				И прошу, не не беспокойся о судьбе Уоррена больше, -- заканчивает
				старейшина, одаривая тебя широкой улыбкой.
			]];
			function()
				event 'warren knows elder';
			end;
		};
		-- О трупе за домом Уорри
		{
			tag = 'why_so_dead';
			false;
			'Я нашёл труп рядом с домом Уорри. Хозяин дома был скуп на объяснения.';
			[[
				Лицо старейшины омрачается.
				^
				-- Что ж, печально это слышать. Но тебе не стоит
				беспокоиться, твоя судьба в стороне от этого.
				^
				Старейшина молчит несколько секунд.

			]];
			function()
				-- Включаем диалог с Уорри по поводу его изгнания
				event 'news about exile';
			end;
		};
		-- О реакции Уорри на новость об изгнании
		{
			tag = 'warren_reaction';
			false;
			'Он не расстроился';
			[[
				-- ...
				^
				-- Что же...
				^
				-- Знаешь что, возьми это и скажи мне: что ты видишь?
				^
				Старик протягивает тебе какой-то предмет. Взглянув на него,
				ты видишь собственное лицо. Он дал тебе зеркало, этот старый
				спятивший пень.
				^
				Не дождавшись ответа, старейшина закончил.
				^
				-- Не стоит искать мертвецов вокруг, в настоящем. Возможно, тебя
				тревожат мёртвые из прошлого. Насколько много ты смог позабыть,
				пока гостил здесь?
			]];
			function()
				take 'mirror';
			end;
		};
		-- Диалог, если берём охотничье снаряжение
		{
			tag = 'some_hunt_subject';
			false;
			'охота...';
			[[
				-- Ммм...
			]];
			function()
			end;
		};
		-- Диалог, если берём еду
		{
			tag = 'some_food_subject';
			false;
			'Ммм...';
			[[
				-- Ммм...
				* В одном из диалогов сравнить старосту со статным безумным магом;
			]];
			function()
			end;
		};
		-- Диалог, если берём журнал
		{
			tag = 'some_journal_subject';
			false;
			'Журнал...';
			[[
				-- Журнал...
			]];
			function()
			end;
		};
		-- Уходим
		{
			always = true;
			'Я пойду.';
			'-- Боги помнят о тебе. Помни и ты о них!';
			function()
				back()
			end;
		};
	};
}

-- События
-- Поговорили с Уорри
on_event('warren conflict', function()
	_warren_conflict = true;
	elder_dlg:pon('who_is_warren');
end)

-- Нашли труп у Уорри во дворе
on_event('found the body', function()
	elder_dlg:pon('why_so_dead');
end)

-- Поговорили с Уорри об изгнании
on_event('exile reaction', function()
	elder_dlg:pon('warren_reaction');
end)
