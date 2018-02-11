forester = obj {
	nam = 'Лесник лордских угодий';
	dsc = [[
		К тебе быстрым шагом подходит {лесник}.
	]];
	act = function()
		walk 'forester_dlg'
	end;
}

forester_dlg = dlg {
	nam = 'Лесник лордских угодий';
	hideinv = true;
	entered = [[
		-- Ну как, принёс? -- задумчиво произносит лесник.
	]];
	phr = {
		{
			tag = 'look_what_i_have';
			false;
			'Соскучился по полуголым девицам? Ну ничего, у меня всё есть.';
			'-- Отлично. Ну тогда всё в силе.';
			function()
				inv():del('journal');
				event 'pleased the forester'
			end;
		};
		{
			tag = 'no_journals_today';
			true;
			'...Вообще нет, сегодня не принёс.';
			[[
				-- Разрази тебя гром! Ты ведь знаешь, чем я рискую, позволяя
				тебе тут шастать?
				^
				-- Ну прости, прости, как-то так вышло. Давай решим вопрос
				как-нибудь по-другому?
				^
				Лесник задумывается.
				^
				-- Ну... ладно, на самом деле у меня как раз есть для тебя одно
				дело. Видишь ту толпу охранников у озера? Где-то за их спинами
				прямо сейчас художник рисует с лорда портрет дочери лорда --
				совершенно раздетой, представь себе! По такому случаю я даже
				раздобыл свиток фотозаклятья, но даже представить себе не могу,
				как к ней теперь подобраться. Запечатлишь её -- и мы в расчёте.
			]];
			function()
				event 'promised tits'
			end;
		};
		{
			tag = 'here_they_are';
			false;
			'Получилось! Получилось!';
			[[
				-- Давай скорее!
				^
				Лесник вырывает у тебя из рук портрет и убегает в неизвестном
				направлении.
			]];
			function()
				inv():del('portrait');
				event 'pleased the forester'
			end;
		};
		{
			always = true;
			'Я пойду.';
			'-- Ага.';
			function()
				back()
			end;
		};
	};
}

on_event('got journal', function()
	forester_dlg:pon('look_what_i_have');
end);

on_event('promised tits', function()
	forester_dlg:poff('look_what_i_have');
end);

on_event('pleased the forester', function()
	forester_dlg:poff('look_what_i_have');
	forester_dlg:poff('no_journals_today');
	forester_dlg:poff('look_what_i_have');
end);

on_event('photographed the princess', function()
	forester_dlg:pon('here_they_are');
end);
