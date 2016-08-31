elder = obj {
	nam = 'Старейшина';
	dsc = [[
		Около колодца стоит {старейшина}.
	]];
	act = function()
		walk 'elder_dlg'
	end;
}

elder_dlg = dlg {
	nam = 'Старейшина';
	hideinv = true;
	entered = [[
		-- Доброе утро! -- с улыбкой говорит староста.
	]];
	phr = {
		{
			tag = 'why_so_dead';
			false;
			'А почему у Уорри под окнами труп лежит?';
			[[
				-- А, тебе нравится пиво "Охота крепкое"? Держи зеркало,
				братан.
			]];
			function()
				take 'mirror'
			end;
		};
		{
			tag = 'who_is_warren';
			false;
			'А кто такой Уорри?';
			'-- А, да внук мой, халтурит на полях иногда.';
			function()
				event 'warren knows elder'
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

on_event('warren conflict', function()
	_warren_conflict = true
	elder_dlg:pon('who_is_warren')
end)

on_event('found the body', function()
	elder_dlg:pon('why_so_dead')
end)
