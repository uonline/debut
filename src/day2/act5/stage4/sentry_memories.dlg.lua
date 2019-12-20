-- Переменные диалога
local _mage_greeting = false

-- Диалог с птицей-говоруном
sentry_black_bird_dlg = dlg {
	nam = 'Чёрная птица';
	hideinv = true;
	entered = function()
		return [[
			Странная птица внимательно смотрит на тебя.
		]];
	end;
	phr = {
		-- Стандартные реплики:
		-- Диалог Кевразы и первого городского наместника
		{
			tag = 'Kevraza_and_first_vicar';
			true;
			'1.';
			[[
				...
			]];
			function()
			end;
		};
		-- Главарь подполья и Полукровка про Религию Благих
		{
			tag = 'Thieves_leader_and_Halfblood_about_relion';
			true;
			'2.';
			[[
				...
			]];
			function()
			end;
		};
		-- Птица цитирует стих из воспоминаний ГГ в пещере
		{
			tag = 'Cave_memories';
			true;
			'3.';
			[[
				...
			]];
			function()
			end;
		};

		-- Расширенные реплики:
		-- Если игрок прослушал все диалоги с крысой: диалог мага-крысы и первого городского наместника
		{
			tag = 'Mage_and_vicar';
			true;
			'4.';
			[[
				...
			]];
			function()
			end;
		};
		-- Если игрок прочитал все воспоминания ГГ о документах капитана: диалог Кевразы и капитана
		{
			tag = 'Kevraza_and_captain';
			true;
			'5.';
			[[
				...
			]];
			function()
			end;
		};
		-- Если игрок не взаимодействовал с Полукровкой в лагере гильдии: диалог главаря подполья и Полукровки
		{
			tag = 'Thieves_leader_and_Halfblood';
			true;
			'6.';
			[[
				...
			]];
			function()
			end;
		};
		-- Если игрок выполнил все предыдущие условия: птица цитирует пятое четверостишье стиха из воспоминаний ГГ в пещере
		{
			tag = 'Secret_cave_memories';
			true;
			'7.';
			[[
				...
			]];
			function()
			end;
		};

		-- Уходишь
		{
			always = true;
			'...';
			'Птица провожает тебя внимательным взглядом.';
			function()
				tower_stage2_thieves_leader_dlg:pon('Kevraza_and_first_vicar');
				back();
			end;
		};
	};
}
