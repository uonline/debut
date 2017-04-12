uhp_blacksmith = obj {
	nam = 'Кузнец';
	dsc = [[
		и {кузнец}.
	]];
	act = function()
		walk 'uhp_blacksmith_dlg'
	end;
}

uhp_blacksmith_dlg = dlg {
	nam = 'Кузнец';
	hideinv = true;
	entered = [[
		-- Обстоятельства немножечко не это, но я рад встрече.
	]];
	phr = {
		{
			true;
			'Чо тут ваще?';
			[[
				-- Заговор, Карл! Все на ушах.
			]];
			function()
				event 'knows about plot';
			end;
		};
		{
			true;
			'Что делать, Шеф?';
			[[
				-- Догонять!
			]];
		};
		{
			always = true;
			'Я пойду.';
			'-- До встречи!';
			function()
				back()
			end;
		};
	};
}
