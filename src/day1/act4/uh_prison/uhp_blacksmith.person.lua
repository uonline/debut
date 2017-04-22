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
			tag = 'wassup';
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
			tag = 'prepare_your_anus';
			false;
			'[молча избить]';
			[[
				Работа была непростой, но ты старался как мог.
			]];
			function()
				_beaten_blacksmith = true
				event 'blood was spilled'
			end;
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

on_event('orc wants blood', function()
	uhp_blacksmith_dlg:pon('prepare_your_anus');
end)

on_event('blood was spilled', function()
	uhp_blacksmith_dlg:poff('wassup');
end)
