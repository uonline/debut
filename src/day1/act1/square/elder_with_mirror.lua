elder_with_mirror = dlg {
	nam = 'Старейшина';
	hideinv = true;
	entered = [[
		-- Доброе утро! -- с улыбкой говорит староста.
	]];
	phr = {
		{
			'Братан, выручай, срочно зеркало нужно.';
			'-- Какие вопросы, держи.';
			function()
				take 'mirror'
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
