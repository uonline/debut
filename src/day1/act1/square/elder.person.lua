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
		--[[
		{
			'Братан, выручай, срочно зеркало нужно.';
			'-- Какие вопросы, держи.';
			function()
				take 'mirror'
			end;
		};
		--]]
		{
			tag = 'who_is_warren';
			false;
			'А кто такой Уорри?';
			'-- А, да внук мой, халтурит на полях иногда.';
			function()
				_warren_knows_elder = true
				warren_dlg:pon('elder_hates_you')
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
