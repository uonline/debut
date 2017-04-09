forester = obj {
	nam = 'Лесник лордских угодий';
	dsc = [[
		{Лесник} смотрит на тебя как-то недовольно, свирепо
		и в то же время грустно и с недоумением.
	]];
	act = function()
		walk 'forester_dlg'
	end;
}

forester_dlg = dlg {
	nam = 'Лесник лордских угодий';
	hideinv = true;
	entered = [[
		-- ВННИ, ТЫ ПРНСС? -- задумчиво произносит лесник.
	]];
	phr = {
		{
			tag = 'look_what_i_have';
			false;
			'ЙА ПРНСС.';
			'-- ЗБС.';
			function()
				inv():del('journal');
				event 'pleased the forester'
			end;
		};
		{
			tag = 'no_journals_today';
			true;
			'Брат, я всё отдам, это филармония виновата.';
			'-- Поторопись, Карл, время не ждёт никого.';
			function()
				event 'promised tits'
			end;
		};
		{
			tag = 'here_they_are';
			false;
			'Я заснял! Я заснял!';
			'-- Молодец, дай обниму.';
			function()
				inv():del('portrait');
				event 'pleased the forester'
			end;
		};
		{
			always = true;
			'Я пойду.';
			'-- Ну-ну.';
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
