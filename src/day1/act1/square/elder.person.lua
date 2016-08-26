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
			always = true;
			'Я пойду.';
			'-- До встречи!';
			function()
				back()
			end;
		};
	};
}
