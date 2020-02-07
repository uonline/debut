-- Переходы
tower_stage3_archive_to_secret_room = vroom('Потайная комната', 'tower_stage3_secret_room');
tower_stage3_archive_to_secret_room:disable()

-- Переменные локации
tower_stage3_archive_first_enter = true; -- признак первого посещения архива

-- Локация
tower_stage3_archive = room {
	nam = 'Архив';
	dsc = function()
		archive_description = [[
				Ты оказываешься в затхлом помещении заставленным стелажами с книгами. Здесь
				неожиданно темно, что несколько отрезвляет тебя. С десяток чадащих свечей
				в канделябрах служат ориентирами в этом книжном лабиринте. Темнота лишает
				помещение размеров: верхние полки стелажей исчезают во мраке, ты не видишь
				ни потолка, ни стен.
		]];

		if tower_stage3_archive_first_enter then
			tower_stage3_archive_first_enter = false;
			return archive_description .. [[
				^
				Затаив дыхание, ты напрягаешь слух, но различаешь лишь шипение разогретого
				воска. Тебе остаётся гадать, кто следит за свечами и всеми этими книгами.
			]];
		end;

		return archive_description;
	end;
	obj = {
		'tower_stage3_archive_table';
		'tower_stage3_archive_book_1';
		'tower_stage3_archive_book_2';
		'tower_stage3_archive_book_3';
		'tower_stage3_archive_book_4';
		'tower_stage3_archive_small_letters';
		'tower_stage3_archive_guard';
	};
	way = {
		vroom('Назад', 'tower_stage3');
		tower_stage3_archive_to_secret_room;
	};
}

-- Объекты локации
-- Стол
tower_stage3_archive_table = obj {
	nam = '';
	dsc = function()
		if tower_stage3_archive_first_enter then
			return	[[
				Ты прогуливаешься между стелажами, изучая их содержимое. Некоторым книгам удаётся
				заинтересовать тебя, и ты по наитию достаёшь их с полок и складываешь на
				одинокий стол у входа.
			]];
		end;

		return [[
			Прямо у входа одиноко стоит стол с собранными тобой книгами.
		]];
	end;
}

-- Книга 1
tower_stage3_archive_book_1 = obj {
	nam = '';
	dsc = [[
		{Первая книга} подкупила тебя своими размерами и ярко алым переплётом.
	]];
	act = [[
		География:
		^
		Перед тобой искусно выполненная карта известного мира:
		континент Линары -- круг с дыркой по середине. Три горных хребта: один по западной
		стороне тянется с севера на юг и кончается в краю разломов. Второй на северо востоке
		за эльфийскими лесами. Третий на скалистом полуострове.
		К западу от Линары раскинулись ещё два материка: Дарсу на востоке и Катор на севере.
		К востоку от Линары -- Имперский архипелаг. А прямо за ними -- Миритал бывшая родина
		людей: легендарный материк когда-то подгузившийся под воду, ныне вновь поднявшийся со дна.
	]];
}

-- Книга 2
tower_stage3_archive_book_2 = obj {
	nam = '';
	dsc = [[
		{Следующую} ты выбрал из-за потёртости её обложки и желтизны страниц.
	]];
	act = [[
		Краткая история древнего государства людей, легенды о чёрных птицах
		^
		Вкладыш с некоторыми пометками: описание чёрной птицы, которую находит игрок.
	]];
}

-- Книга 3
tower_stage3_archive_book_3 = obj {
	nam = '';
	dsc = [[
		В {третьей книге} тебя привлекло изображение на обложке -- вышитый пейзаж города.
	]];
	act = [[
		Тут хранится множество записей об истории города и об истории Башни наместника.
	]];
}

-- Книга 4
tower_stage3_archive_book_4 = obj {
	nam = '';
	dsc = [[
		Ты не мог не взять {последнюю четвёрную книгу} в простой чёрной
		обложке, которая притягивала к себе мрачными тайнами.
	]];
	act = [[
		Монструм. О сектах и культах...
	]];
}

-- Неразборчивые письмена
tower_stage3_archive_small_letters = obj {
	nam = 'Свиток с неразборчивыми письменами';
	dsc = [[
		Помимо твоих книг на столе лежит {свиток с пятнами},
		перо и пузырёк с чернилами.
	]];
	act = [[
		Ты внимательно осматриваешь свиток. Надписи на нём
		написаны невообразимо мелким шрифтом, так что текст невозможно
		разобрать. После продолжительного и безрезультатного изучения
		документа ты заключаешь, что это какие-то инструкции, состоящие
		из нескольких абзацев текста и кратких перечней. Единственное, что
		тебе удаётся хоть как-то прочитать, это первую многообещающую надпись:
		^
		<b>Излагаю необходимые разъяснения касательно структуры нашей башни.</b>.
		^
		Дальнейший текст не выглядит завершённым: снизу страницы красуются
		огромные чернильные кляксы, несколько строк вычеркнуты.
	]];
	used = function(self, what)
		if what == tower_spyglass then
			event 'got tower book location'
			tower_stage3_archive_small_letters:disable()
			return [[
				Ты осторожно подносишь подзорную трубу к глазу.
				^
				Написано, что в потайной комнате есть некая книга, описывающая магические особенности башни.
				^
				Test
				^
				В архиве в потайной комнате в Башне в книге о её создании ГГ узнаёт, что это башня Мага Магоса.
				Он начинает подозревать, что именно маг-крыса был её создателем. Какие цели преследует он?
			]]
		end
	end;
}

-- Книга с загадками (статуя, книга, библиотека?)
-- Три загадки должны быть на знания истории
-- Страж перезагружается, если пройти этажи по кругу.
-- Загадки сменяют друг друга по кругу,
-- до тех пор пока игрок не отгадает одну из них
tower_stage3_archive_guard = obj {
	nam = '';
	dsc = [[
		Неподалёку от стола на кафедре, больше похожей на алтарь,
		покоится {большая книга} в окружении полукруга свечей.
	]];
	act = function()
		-- Проверяем взяли ли мы квест на кинжал
		walk 'tower_stage3_archive_guard_dlg';
	end;
}

-- Функция для выключения ответов на загадки
turn_off_puzzle = function(puzzle_number)
	-- Выставляем признак, что мы уже попытались пройти загадки в этом прохождении цикла башни
	_tower_stage2_new_loop_puzzle = false;

	-- Выключаем ответы на загадки
	if puzzle_number == 1 then
		tower_stage3_archive_guard_dlg:poff('puzzle_1_answer_1');
		tower_stage3_archive_guard_dlg:poff('puzzle_1_answer_2');
		tower_stage3_archive_guard_dlg:poff('puzzle_1_answer_3');
		-- Включаем следующую загадку
		_tower_stage2_current_puzzle_number = 2;
	end;
	if puzzle_number == 2 then
		tower_stage3_archive_guard_dlg:poff('puzzle_2_answer_1');
		tower_stage3_archive_guard_dlg:poff('puzzle_2_answer_2');
		tower_stage3_archive_guard_dlg:poff('puzzle_2_answer_3');
		-- Включаем следующую загадку
		_tower_stage2_current_puzzle_number = 3;
	end;
	if puzzle_number == 3 then
		tower_stage3_archive_guard_dlg:poff('puzzle_3_answer_1');
		tower_stage3_archive_guard_dlg:poff('puzzle_3_answer_2');
		tower_stage3_archive_guard_dlg:poff('puzzle_3_answer_3');
		tower_stage3_archive_guard_dlg:poff('puzzle_3_answer_4');
		-- Включаем следующую загадку
		_tower_stage2_current_puzzle_number = 1;
	end;
end

-- Функция разагадки
complete_puzzle = function()
	-- Выключаем загадывание
	_tower_stage2_new_loop_puzzle = false;
	-- Выключаем все ответы
	tower_stage3_archive_guard_dlg:poff('puzzle_1_answer_1');
	tower_stage3_archive_guard_dlg:poff('puzzle_1_answer_2');
	tower_stage3_archive_guard_dlg:poff('puzzle_1_answer_3');
	tower_stage3_archive_guard_dlg:poff('puzzle_2_answer_1');
	tower_stage3_archive_guard_dlg:poff('puzzle_2_answer_2');
	tower_stage3_archive_guard_dlg:poff('puzzle_2_answer_3');
	tower_stage3_archive_guard_dlg:poff('puzzle_3_answer_1');
	tower_stage3_archive_guard_dlg:poff('puzzle_3_answer_2');
	tower_stage3_archive_guard_dlg:poff('puzzle_3_answer_3');
	tower_stage3_archive_guard_dlg:poff('puzzle_3_answer_4');
	-- Разрываем цикл смены загадок
	_tower_stage2_current_puzzle_number = 0;

	-- Получаем нужную вещь
	-- take
end

-- Диалог со стражем архива
tower_stage3_archive_guard_dlg = dlg {
	nam = 'Ветхая книга';
	hideinv = true;
	entered = function()
		-- Проверяем не разгадывали ли мы загадок в это прохождение башни
		if _tower_stage2_new_loop_puzzle then
			-- Осматриваем книгу
			book_guard_description = [[
				Перед тобой лежит внушительных размеров книга в кожанном переплёте.
				Книга открыта примерно на середине, но её страницы пусты. Рядом стоит
				большая чернильница с пером.
			]];

			-- Пишем название вещи, которая нам нужна
			book_guard_wish = [[
				Ты мокаешь перо в чернила и осторожно выводишь в начале страницы:
				^
				? Свиток Ваалама.
				^
				Через мгновение чернила впитываются в бумагу и на месте твоей надписи
				появляется новая:
			]];

			-- Загадка 1
			-- Включаем ответы на первую загадку, если сейчас её очередь и мы первый раз пытаемся отгадать загадку в текущем цикле прохождения башни
			if _tower_stage2_current_puzzle_number == 1 and _tower_stage2_new_loop_puzzle then
				tower_stage3_archive_guard_dlg:pon('puzzle_1_answer_1');
				tower_stage3_archive_guard_dlg:pon('puzzle_1_answer_2');
				tower_stage3_archive_guard_dlg:pon('puzzle_1_answer_3');
				-- Выводим текст первой загадки
				return book_guard_description .. book_guard_wish ..[[
					^
					Первая загадка...
				]];
			end;

			-- Загадка 2
			-- Включаем ответы на вторую загадку
			if _tower_stage2_current_puzzle_number == 2 and _tower_stage2_new_loop_puzzle then
				tower_stage3_archive_guard_dlg:pon('puzzle_2_answer_1');
				tower_stage3_archive_guard_dlg:pon('puzzle_2_answer_2');
				tower_stage3_archive_guard_dlg:pon('puzzle_2_answer_3');
				-- Выводим текст второй загадки
				return book_guard_description .. book_guard_wish .. [[
					^
					Вторая загадка...
				]];
			end;

			-- Загадка 3
			-- Включаем ответы на третью загадку
			if _tower_stage2_current_puzzle_number == 3 and _tower_stage2_new_loop_puzzle then
				tower_stage3_archive_guard_dlg:pon('puzzle_3_answer_1');
				tower_stage3_archive_guard_dlg:pon('puzzle_3_answer_2');
				tower_stage3_archive_guard_dlg:pon('puzzle_3_answer_3');
				tower_stage3_archive_guard_dlg:pon('puzzle_3_answer_4');
				-- Выводим текст третьей загадки
				return book_guard_description .. book_guard_wish .. [[
					^
					Третья загадка...
				]];
			end;
		else

			-- Загадки разгаданы, выводим описание книги
			return [[
				Книга закрыта, ты пытаешься её открыть, но ничего не выходит.
			]];
		end;
	end;
	phr = {
		-- Ответы на первую загадку
		-- Ответ 1.1
		{
			tag = 'puzzle_1_answer_1';
			false;
			'1.1';
			[[
				Ты берёшь перо и пишешь свой ответ.
				-- Не верно!
			]];
			function()
				turn_off_puzzle(1);
			end;
		};
		-- Ответ 1.2
		{
			tag = 'puzzle_1_answer_2';
			false;
			'1.2';
			[[
				Ты берёшь перо и пишешь свой ответ.
				-- Не верно!
			]];
			function()
				turn_off_puzzle(1);
			end;
		};
		-- Ответ 1.3
		{
			tag = 'puzzle_1_answer_3';
			false;
			'1.3';
			[[
				Ты берёшь перо и пишешь свой ответ.
				-- Верно!
			]];
			function()
				complete_puzzle();
			end;
		};

		-- Ответы на вторую загадку
		-- Ответ 2.1
		{
			tag = 'puzzle_2_answer_1';
			false;
			'2.1';
			[[
				Ты берёшь перо и пишешь свой ответ.
				-- Не верно!
			]];
			function()
				turn_off_puzzle(2);
			end;
		};
		-- Ответ 2.2
		{
			tag = 'puzzle_2_answer_2';
			false;
			'2.2';
			[[
				Ты берёшь перо и пишешь свой ответ.
				-- Верно!
			]];
			function()
				complete_puzzle();
			end;
		};
		-- Ответ 2.3
		{
			tag = 'puzzle_2_answer_3';
			false;
			'2.3';
			[[
				Ты берёшь перо и пишешь свой ответ.
				-- Не верно!
			]];
			function()
				turn_off_puzzle(2);
			end;
		};

		-- Ответы на третью загадку
		-- Ответ 3.1
		{
			tag = 'puzzle_3_answer_1';
			false;
			'3.1';
			[[
				Ты берёшь перо и пишешь свой ответ.
				-- Не верно!
			]];
			function()
				turn_off_puzzle(3);
			end;
		};
		-- Ответ 3.2
		{
			tag = 'puzzle_3_answer_2';
			false;
			'3.2';
			[[
				Ты берёшь перо и пишешь свой ответ.
				-- Не верно!
			]];
			function()
				turn_off_puzzle(3);
			end;
		};
		-- Ответ 3.3
		{
			tag = 'puzzle_3_answer_3';
			false;
			'3.3';
			[[
				Ты берёшь перо и пишешь свой ответ.
				-- Верно!
			]];
			function()
				complete_puzzle();
			end;
		};
		-- Ответ 3.4
		{
			tag = 'puzzle_3_answer_4';
			false;
			'3.4';
			[[
				Ты берёшь перо и пишешь свой ответ.
				-- Не верно!
			]];
			function()
				turn_off_puzzle(3);
			end;
		};

		-- Уходим
		{
			tag = 'away';
			always = true;
			'Закрыть книгу.';
			[[
				Ты закрываешь книгу и отходишь.
			]];
			function()
				back();
			end;
		};
	};
}
