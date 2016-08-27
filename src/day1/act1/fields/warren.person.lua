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
				blacksmith_dlg:pon('all_done')
				take 'smith_hammer'
			end;
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
