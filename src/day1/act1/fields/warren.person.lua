-- Переменные
_hammer_problem = false;

-- Функции
-- Функция проверки, стоит ли герою выкупать молот у Уорри за золото
function _is_hammer_for_money ()
	-- Проверяем, что квест на молот взят
	return (have 'gold') and _warren_conflict and _hammer_problem and (not have 'smith_hammer') and (not have 'new_bow');
end;

-- Даём Уорри арбалет
function _give_crossbow_to_warren()
	warren:disable();
	warren_with_crossbow:enable();
end;

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
		walk 'warren_dlg';
	end;
}

-- Уорри с арбалетом
warren_with_crossbow = obj {
	nam = 'Уорри Ростовщик';
	dsc = [[
		{Уорри} сидит на крыльце своего дома и, ссутулившись, раскуривает трубку.
		На коленях у него, покоится заряженный арбалет.
	]];
	act = [[
		Ты не решаешься больше заговорить с Уорри.
		^
		...
	]];
}
warren_with_crossbow:disable()

-- Диалог с Уорри
warren_dlg = dlg {
	nam = 'Уорри Ростовщик';
	hideinv = true;
	entered = function()
		if _is_hammer_for_money() then
			warren_dlg:pon('return_gold');
		end;

		return [[
			-- Пришёл вернуть долг? -- с порога бросает тебе Уорри, усмехаясь. Густой дым и лучи
			солнца, бьющие тебе в глаза, мешают разглядеть его лицо.
			^
			-- ...
		]];
	end;
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
				-- Уорри упорствует
				event 'hammer problem';
				_hammer_problem = true;

				-- Проверяем, нет ли у героя золота
				if _is_hammer_for_money() then
					warren_dlg:pon('return_gold');
				end;
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
			tag = 'about_exile';
			false;
			'Мне нужно кое-что сказать тебе.';
			[[
				-- Мне нужно кое-что сказать тебе... -- ....
				^
				* {-} Уорри обрадуется новости, что его хотели изгнать из деревни;
			]];
			function()
				event 'exile reaction';
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
				drop 'gold';
			end;
		};
		-- О записке
		{
			tag = 'about_note';
			false;
			'Я тут кое-что нашёл.';
			[[
				-- Чепуха какая-то. Это даже не мой почерк. Где ты её взял?
				^
				Уорри рвёт и выкидывает записку
			]];
			function()
				-- Уорри рвёт и выкидывает записку
				inv():del('warren_note');
			end;
		};
		-- О проблемах с водой
		{
			tag = 'water_problem';
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

-- События
-- Получили квест на молот
on_event('warren conflict', function()
	warren_dlg:pon('where_is_hammer');
end)

-- Находим труп во дворе
on_event('found the body', function()
	warren_dlg:pon('why_so_dead');
end)

-- Поговорили со старейшиной об изгнании
on_event('news about exile', function()
	warren_dlg:pon('about_exile');
end)

-- Отправлямся бить Уорри
on_event('go to warren racket', function()
	-- Уорри больше с нами не разговаривает
	_give_crossbow_to_warren();
end)

-- Ты узнал о записе
on_event('take about note', function()
	warren_dlg:pon('about_note');
end)

-- Мы узнали о проблеме с водой
on_event('water problem', function()
	warren_dlg:pon('water_problem');
end)
