elder = obj {
	nam = 'Старейшина';
	dsc = [[
		Рядом бродит {старейшина}, совершая что-то среднее между зарядкой и молитвой.
	]];
	act = function()
		walk 'elder_dlg'
	end;
}

elder_dlg = dlg {
	nam = 'Старейшина';
	hideinv = true;
	entered = [[
		-- Прекрасное утро, мой мальчик! -- с улыбкой говорит старейшина.
		В первую вашу встречу ты принял его за спятившего старика и сильно
		удивился, когда узнал с каким почтением к нему относится вся деревня.
	]];
	phr = {
		{
			tag = 'why_so_dead';
			false;
			'Я нашёл труп рядом с домом Уорри. Хозяин дома был скуп на объяснения.';
			[[
				Лицо старейшины омрачается.
				^
				-- Что ж, печально это слышать. Но тебе не стоит
				беспокоиться: твоя судьба в стороне от этого, --
				Старейшина молчит несколько секунд. --
				Знаешь что, возьми это и скажи мне: что ты видишь?
				^
				Старик протягивает тебе какой-то предмет. Взглянув на него,
				ты видишь собственное лицо. Он дал тебе зеркало, этот старый
				спятивший пень.
				^
				Не дождавшись ответа, старейшина закончил.
				^
				-- Не стоит искать мертвецов вокруг, в настоящем. Возможно, тебя
				тревожат мертвые из прошлого. Насколько много ты смог позабыть,
				пока гостил здесь?
			]];
			function()
				take 'mirror'
			end;
		};
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
				event 'warren knows elder'
			end;
		};
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

on_event('warren conflict', function()
	_warren_conflict = true
	elder_dlg:pon('who_is_warren')
end)

on_event('found the body', function()
	elder_dlg:pon('why_so_dead')
end)
