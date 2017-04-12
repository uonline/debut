uhp_guardian = obj {
	nam = 'Охранник';
	dsc = [[
		За забором стоит {урук-охранник}.
	]];
	act = function()
		walk 'uhp_guardian_dlg'
	end;
}

uhp_guardian_dlg = dlg {
	nam = 'Охранник';
	hideinv = true;
	entered = [[
		-- Чо таращишься?
	]];
	phr = {
		{
			true;
			'Жрать хочу!';
			[[
				-- Почему бы тебе не полакомиться своими собственными кишками?
			]];
			function()
				-- TODO: death
			end;
		};
		{
			true;
			'Как дела?';
			[[
				-- Так они это вон там, а я тут это вот тут.
				^
				-- Так братан, давай я за тебя постою вот тут, а ты будешь
				со всеми вон там.
				^
				-- Хитрец! Побей кузнеца и мы договорились.
			]];
			function()
				event 'orc wants blood';
			end;
		};
		{
			tag = 'gunpowder_treason_and_plot';
			false;
			'Тут, говорят, у вас заговор-наговор, планируется выговор.';
			[[
				-- Секунда информациёне, вали отсюда кухуёне.
			]];
			function()
				event 'may leave prison';
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

on_event('knows about plot', function()
	uhp_guardian_dlg:pon('gunpowder_treason_and_plot');
end)
