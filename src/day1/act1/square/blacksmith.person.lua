blacksmith = obj {
	nam = 'Кузнец';
	dsc = [[
		{Кузнец} тоже на ногах, подпирает дверь	своего заведения.
		Кажется, он пил	всю ночь, до похмелья ему ещё далеко.
		Тебе предстоит узнать повод.
	]];
	act = function()
		walk 'blacksmith_dlg'
	end;
}

blacksmith_dlg = dlg {
	nam = 'Кузнец';
	hideinv = true;
	entered = [[
		-- Утро доброе -- хмуро приветствует тебя кузнец неожиданно трезвым голосом.
	]];
	phr = {
		{
			tag = 'new_bow';
			false;
			'Мне нужен новый лук!';
			[[
				-- Лук сделать -- дело несложное. Только есть одна проблема.
				Ночью ко мне вломился Уоррен, скотина, отобрал у меня молот за долги.
			]];
			function()
				event 'warren conflict'
			end;
		};
		{
			tag = 'all_done';
			false;
			'Всё готово, сэр.';
			[[
				-- Окей, вот твой лук.
			]];
			function()
				event 'got new bow'
			end
		};
		{
			always = true;
			'Я пойду.';
			'Кузнец погружён в свои мысли и ничего тебе не отвечает.';
			function()
				back()
			end;
		};
	};
}

on_event('gear taken', function()
	blacksmith_dlg:pon('new_bow')
end)

on_event('got the hammer', function()
	blacksmith_dlg:pon('all_done')
end)
