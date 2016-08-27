blacksmith = obj {
	nam = 'Кузнец';
	dsc = [[
		Около тебя стоит {кузнец}. Он выглядит усталым.
	]];
	act = function()
		walk 'blacksmith_dlg'
	end;
}

blacksmith_dlg = dlg {
	nam = 'Кузнец';
	hideinv = true;
	entered = [[
		-- Доброе утро, -- хмуро приветствует тебя кузнец.
	]];
	phr = {
		{
			tag = 'new_bow';
			false;
			'Мне нужен новый лук!';
			[[
				-- Лук сделать -- дело несложное. Только есть одна проблема.
				Уоррен, скотина, отобрал у меня молот за долги.
			]];
			function()
				event 'warren_conflict'
			end;
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

on_event('gear_taken', function()
	blacksmith_dlg:pon('new_bow')
end)

on_event('warren_conflict', function()
	_warren_conflict = true
	elder_dlg:pon('who_is_warren')
end)
