-- Уорри
warren = obj {
	nam = 'Уорри Ростовщик';
	dsc = [[
		{Уорри} сидит на крыльце своего дома и, ссутулившись, раскуривает трубку.
		Ты уверен, даже боги не знают, чем именно он её забивает. Ты решился
		попробовать одно из зелий Уорри лишь однажды -- и после этого понял, почему он
		так мало спит.
	]];
	act = function()
		walk 'warren_dlg'
	end
}

-- Диалог с Уорри
warren_dlg = dlg {
	nam = 'Уорри Ростовщик';
	hideinv = true;
	entered = [[
		-- Пришёл вернуть долг? -- с порога бросает тебе Уорри, усмехаясь. Густой дым и лучи
		солнца, бьющие тебе в глаза, мешают разглядеть его лицо.
		^
		-- ...
	]];
	phr = {
		-- Потребовать у Уорри молот
		{
			tag = 'where_is_hammer';
			false;
			'Я насчёт кузнеца. Ты отобрал у него молот?';
			[[
				-- Я насчёт кузнеца. Ты отобрал у него молот?
				^
				-- Отобрал? -- Уорри смачно сплюнул. -- Вчера он захотел
				отыграться и не нашёл ничего умнее, чем поставить на кон свой молот.
				Видимо, он таким образом решил завести себе подмастерье.
				Иногда мне кажется, что одна из подков упала ему на голову...
				^
				-- Можешь вернуть его молот ненадолго? Он мне кое-что должен.
				^
				-- Какое совпадение! Он мне тоже. Как и ты, кстати. Так где мои деньги?
			]];
			function()
			end;
		};
		-- О трупе
		{
			tag = 'why_so_dead';
			false;
			'А тебя не смущает, что во дворе твоего дома сидит труп?';
			[[
				-- А тебя не смущает развешивать дома такие интересные плакаты? Хочешь, погашу твой долг с их помощью?
			]];
			function()
			end;
		};
		-- Об изгнании
		{
			tag = 'about_';
			false;
			'Мне нужно кое-что сказать тебе.';
			[[
				* {-} Уорри обрадуется новости, что его хотели изгнать из деревни;
			]];
			function()
			end;
		};
		-- Подкупаем Уорри золотом
		{
			tag = 'return_gold';
			false;
			'Эй, Уорри, слушай, может всё таки договоримся? Допустим, я...';
			[[
				Old_text^
				Ты не успеваешь закончить. Уорри жестом прерывает тебя. Он молча вытягивает руку, и
				скрюченный палец указывает на заросшую лужайку у крыльца. В густой тени дома
				тебе удаётся разглядеть молот. Пожимая плечами, ты подбираешь инструмент.
			]];
			function()
				event 'got the hammer';
				take 'smith_hammer';
			end;
		};
		-- О проблемах с водой
		{
			tag = 'some_water_problem';
			false;
			'Вода';
			[[
				-- Не слышал
				* {-} Добавить реплики для других персонажей про ручей, гоблинов вредителей и поиск воды. Отсылка к Fallout:
				* Намек на поиск пещеры в чаще;
			]];
			function()
			end;
		};
		-- Уходим
		{
			always = true;
			'Я пойду.';
			'-- Надеюсь, за моими деньгами.';
			function()
				back()
			end;
		};
	};
}

-- Находим труп во дворе
on_event('found the body', function()
	warren_dlg:pon('why_so_dead')
end)

-- Поговорили со старейшиной
on_event('warren knows elder', function()
	warren_dlg:pon('elder_hates_you')
end)
