-- Глобальные переменные
local _bird_secrets_is_getted = false -- Признак раскрытия всех репдик диалога с чёрной птицей. Влияет на финал

-- Переменные диалога

-- Диалог с птицей-говоруном
sentry_black_bird_dlg = dlg {
	nam = 'Чёрная птица';
	hideinv = false;
	entered = function()
		return [[
			Странная птица внимательно смотрит на тебя.
		]];
	end;
	phr = {
		-- Стартовая реплика для проверки доступности и включения остальных реплик
		{
			tag = 'Hello_world';
			true;
			'Hello world!';
			[[
				-- Hello, Yoba!
			]];
			function()
				-- Включаем стандартные реплики
				sentry_black_bird_dlg:pon('Kevraza_and_first_vicar');
				sentry_black_bird_dlg:pon('Thieves_leader_and_Halfblood_about_relion');
				sentry_black_bird_dlg:pon('Cave_memories');

				-- Проверяем условия для включения дополнительных реплик
				if _mage_dialogs then
					sentry_black_bird_dlg:pon('Mage_and_vicar');
				end;

				if _captain_docs_full_memories  then
					sentry_black_bird_dlg:pon('Kevraza_and_captain');
				end;

				if not _guild_camp_halfblood_greeting then
					sentry_black_bird_dlg:pon('Thieves_leader_and_Halfblood');
				end;

				if _mage_dialogs and _captain_docs_full_memories and not _guild_camp_halfblood_greeting then
					_bird_secrets_is_getted = true;
					sentry_black_bird_dlg:pon('Secret_cave_memories');
				end;
			end;
		};

		-- Стандартные реплики:
		-- Диалог Кевразы и первого городского наместника
		{
			tag = 'Kevraza_and_first_vicar';
			false;
			'1.';
			[[
				Квераза и наместник
			]];
			function()
			end;
		};
		-- Главарь подполья и Полукровка про Религию Благих
		{
			tag = 'Thieves_leader_and_Halfblood_about_relion';
			false;
			'2.';
			[[
				-- Ещё один намёк в диалоге, что главарь принадлежит Чёрному Древу. Его мысли на счёт религии Блага? Сравнение с Благими? И подозрение в "нечеловечности".
				-- Единый бог? Разве люди могли придумать такое?
			]];
			function()
			end;
		};
		-- Птица цитирует стих из воспоминаний ГГ в пещере
		{
			tag = 'Cave_memories';
			false;
			'3.';
			[[
				Стихи из пещеры
			]];
			function()
			end;
		};

		-- Расширенные реплики:
		-- Если игрок прослушал все диалоги с крысой: диалог мага-крысы и первого городского наместника
		{
			tag = 'Mage_and_vicar';
			false;
			'4.';
			[[
				Маг и наместник
			]];
			function()
			end;
		};
		-- Если игрок прочитал все воспоминания ГГ о документах капитана: диалог Кевразы и капитана
		{
			tag = 'Kevraza_and_captain';
			false;
			'5.';
			[[
				Кевраза и капитан
			]];
			function()
			end;
		};
		-- Если игрок не взаимодействовал с Полукровкой в лагере гильдии: диалог главаря подполья и Полукровки
		{
			tag = 'Thieves_leader_and_Halfblood';
			false;
			'6.';
			[[
				Главарь и Полукровка
			]];
			function()
			end;
		};
		-- Если игрок выполнил все предыдущие условия: птица цитирует пятое четверостишье стиха из воспоминаний ГГ в пещере
		{
			tag = 'Secret_cave_memories';
			false;
			'7.';
			[[
				Секретный стих
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
				-- Включаем изначальный диалог
				sentry_black_bird_dlg:pon('Hello_world');
				-- Выключаем все диалоги кроме изначального
				sentry_black_bird_dlg:poff('Kevraza_and_first_vicar');
				sentry_black_bird_dlg:poff('Thieves_leader_and_Halfblood_about_relion');
				sentry_black_bird_dlg:poff('Cave_memories');
				sentry_black_bird_dlg:poff('Mage_and_vicar');
				sentry_black_bird_dlg:poff('Kevraza_and_captain');
				sentry_black_bird_dlg:poff('Thieves_leader_and_Halfblood');
				sentry_black_bird_dlg:poff('Secret_cave_memories');
				-- Уходим
				back();
			end;
		};
	};
}
