guards = obj {
	nam = 'Стража';
	dsc = [[
		Как и говорил лесник, у озера расположилась внушительная группа
		{стражников}. Многие из них откровенно скучают, задумчиво прогуливаясь вдоль
		берега или в напряжённом молчании управжняясь игре в кости.
		И всё же заметить художника или его жертву за всеми этими людьми невозможно.
	]];
	act = function()
		walk 'guards_dlg'
	end;
}

guards_dlg = dlg {
	nam = 'Стражник';
	hideinv = true;
	entered = [[
		-- Ты что здесь забыл?!
	]];
	phr = {
		{
			true;
			'Это мастер забыл свои краски. А я их принёс. Я его подмастерье".';
			[[
				-- Кто-кто ты? Лорд запретил всякому сброду шляться у озера. Проваливай.
				^
				-- Но он не сможет закончить портрет без красок!
				^
				Стражники непривычно задумываются.
				^
				-- Ладно, проходи.
			]];
			function()
				event 'passed the guards'
			end;
		};
		{
			always = true;
			'Я пойду.';
			'-- Исчезни уже.';
			function()
				back()
			end;
		};
	};
}
