bazaar_stories = dlg {
	nam = 'Продавец пряностей';
	hideinv = true;
	entered = [[
		-- Чего так шумишь?
		^
		-- Ничего не покупают...
	]];
	phr = {
		-- Просишь рассказать откуда продавец
		{
			true;
			tag='first_question';
			'Откуда ты?';
			[[
				Из Салфир -- полиса в Имперских колоний.
			]];
			function()
				bazaar_stories:pon('free_kingdome_question');
				bazaar_stories:pon('trade_way');
			end;
		};
		-- Просишь рассказать про Имперские колонии
		{
			false;
			tag='free_kingdome_question';
			'Расскажи про Имперские колонии.';
			[[
				Имперские колонии.
			]];
			function()
				bazaar_stories:pon('termites');
			end;
		};
		-- Просишь рассказать про Термитники
		{
			false;
			tag='termites';
			'Расскажи про Термитники.';
			[[
				Про Термитники.
			]];
		};
		-- Просишь рассказать про Торговый путь
		{
			false;
			tag='trade_way';
			'Расскажи про Торговый путь.';
			[[
				Про торговый путь и географию Линары.
			]];
		};
		-- Уходишь
		{
			always = true;
			'Я пойду.';
			'Приходи ещё.';
			function()
				bazaar_stories:pon('first_question');
				back()
			end;
		};
	};
}
