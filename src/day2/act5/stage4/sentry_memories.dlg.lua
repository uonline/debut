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
				^
				История Кевразы;
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
				-- Ещё один намёк в диалоге, что главарь принадлежит Чёрному Древу.
				Его мысли на счёт религии Блага? Сравнение с Благими? И подозрение в "нечеловечности".
				-- Единый бог? Разве люди могли придумать такое?
				^
				-- Свобода как ограниченный ресурс, запас которого может иссякнуть при
				распределении. Свобода как валюта. Продажа своего времени в рабство.
				Фатализм и течение. Всем нужны чьм-то чудие руки или мозги;
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
				^
				* Разговоры о страданиях народа приграничья между магом и первым наместником;
				^
				* Все эти страхллюдины, ящеры, драконы пришли сюда из другого мира.
				Их всех следует истребить. -- Вряд ли ты сможешь отличить существ
				из этого мира от пришельцев, слишком много времени прошло, они успели стать частью этого мира.
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
				^Test
				Кевраза и Капитан:
				-- Разве это армия? Здесь и не пахнет дисциплиной.
				Мне следовало бы ими заняться.
				^
				-- Вы же знаете, совет пока что не видит в этом необходимости.
				Вы же богоизбранный. Ваше место там, наверху. К тому же это же местные
				рекруты. Не нужно требовать от них слишком многого. По себе знаю.
				Им нужно испытание. Кровью. Да. Пролить кровь за отечество и Режим.
				Тогда-то они и научатся ценить дисцтплину.
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
				* Созидать можно по разному, но вот разрушение и его результаты, всегда похожи. Это ли не общий знаменатель? Созидать разрушение; Отправная точка и точка невозврата. Балансируем между историей и забвением. Без забвения невозможно новое:
      * Возможно слишком долго Тантикул считался родиной и незыблимым ориентиром человечества. Может будущее всех людей здесь в Приграничье. А возможно здесь наше прошлое, которое мы так усердно хотели забыть;
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
