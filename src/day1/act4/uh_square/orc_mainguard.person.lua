orc_mainguard = obj {
	nam = 'Урук-хай';
	dsc = [[
		Его охраняет {урук в боевой броне}.
	]];
	act = function()
		if _uhs_position == 5 then
			walk 'orc_mainguard_dlg'
		else
			return [[
				Ты внимательно рассматриваешь урук-хая. Кажется, он вообще
				не шевелится. Лишь кровь пульсирует по венам,
				хоть этого и нельзя разглядеть.
			]]
		end
	end;
}

orc_mainguard_dlg = dlg {
	nam = 'Урук-хай';
	hideinv = true;
	entered = [[
		-- Итак, ты убил их всех, -- медленно говорит орк.
	]];
	phr = {
		{
			true;
			'Братан, гоу заканчивать.';
			[[
				-- Ну гоу.
			]];
			function()
				walk 'uh_maintent'
			end;
		};
		-- {
		-- 	always = true;
		-- 	'Я пойду.';
		-- 	'-- До встречи!';
		-- 	function()
		-- 		back()
		-- 	end;
		-- };
	};
}
