warren = obj {
	nam = 'Уорри Ростовщик';
	dsc = [[
		На крыльце своего дома сидит, ссутулившись, {Уорри Ростовщик}.
	]];
	act = function()
		walk 'warren_dlg'
	end
}

warren_dlg = dlg {
	nam = 'Уорри Ростовщик';
	hideinv = true;
	entered = [[
		-- Пошёл к чёрту, -- с порога говорит тебе Уорри. -- Нам
		не о чем говорить.
	]];
	phr = {
		{
			tag = 'elder_hates_you';
			false;
			'Я всё знаю, староста -- твой дед.';
			'-- О боже, изыди, я всё отдам.';
			function()
				event 'got the hammer'
				take 'smith_hammer'
			end;
		};
		{
			tag = 'why_so_dead';
			false;
			'Почему у тебя под окнами труп валяется?';
			'-- Ничё не знаю, это всё пчёлы-убийцы, в суде ты ничего не докажешь.';
		};
		{
			always = true;
			'Я пойду.';
			'-- Отличная идея.';
			function()
				back()
			end;
		};
	};
}

on_event('found the body', function()
	warren_dlg:pon('why_so_dead')
end)

on_event('warren knows elder', function()
	warren_dlg:pon('elder_hates_you')
end)
