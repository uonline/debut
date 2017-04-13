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
			tag = 'i_want_food';
			true;
			'Жрать хочу!';
			[[
				-- Почему бы тебе не полакомиться своими собственными кишками?
			]];
			function()
				walk 'orcslaughter';
			end;
		};
		{
			tag = 'wassup_man';
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
			tag = 'ok_go';
			false;
			'Всё готово, шеф.';
			[[
				-- Подпиши вот тут и вали отсюда.
			]];
			function()
				event 'may leave prison';
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

on_event('blood was spilled', function()
	uhp_guardian_dlg:pon('ok_go');
end)

on_event('may leave prison', function()
	uhp_guardian_dlg:poff('i_want_food');
	uhp_guardian_dlg:poff('wassup_man');
	uhp_guardian_dlg:poff('ok_go');
	uhp_guardian_dlg:poff('gunpowder_treason_and_plot');
end)
