orc_mainguard = obj {
	nam = 'Урук-хай';
	dsc = [[
		Его охраняет {урук с ятаганом}.
	]];
	act = function()
		if _uhs_position == 5 then  -- TODO: replace with event
			walk 'orc_mainguard_dlg'
		else
			return [[
				Ты внимательно рассматриваешь урук-хая. Кажется, он вообще
				не шевелится. Рука замерла на эфесе ятага. 
				Ты представляешь как кровь пульсирует по раздутым венам.
			]]
		end
	end;
	used = function(self, what)
		-- if player had stone, we assumed it's legal
		if what == emma_stone then
			walk 'orcinized'
		end
	end;
}

orc_mainguard_dlg = dlg {
	nam = 'Урук-хай';
	hideinv = true;
	entered = [[
		-- Три урук-хая -- неплохо для задохлика, -- говорит орк, оценивая тебя
		взглядом, -- но убийство -- не бой.
		^
		-- У каждого свои таланты.
		^
		-- ...
	]];
	phr = {
		{
			true;
			'Братан, гоу заканчивать.';
			[[
				-- Ну гоу.
				^
				Урук-хай заходит в шатёр, ты тенью следуешь за ним.
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
