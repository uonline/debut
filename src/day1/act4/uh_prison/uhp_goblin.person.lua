uhp_goblin = obj {
	nam = 'Сперкл';
	dsc = [[
		Рядом с тобой сидят {гоблин Сперкл},
	]];
	act = function()
		walk 'uhp_goblin_dlg'
	end;
}

uhp_goblin_dlg = dlg {
	nam = 'Сперкл';
	hideinv = true;
	entered = [[
		-- Ихь бин пщершыщь тыкам, кемосабе.
	]];
	phr = {
		{
			true;
			'Что это означает?';
			[[
				-- Не тот брат.
			]];
		};
		{
			true;
			'Как правильно готовить правосудие по-техасски?';
			[[
				-- Взять немножечко укропа.
			]];
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
