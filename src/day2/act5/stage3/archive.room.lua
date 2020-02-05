-- Переходы
tower_stage3_archive_to_secret_room = vroom('Потайная комната', 'tower_stage3_secret_room');
tower_stage3_archive_to_secret_room:disable()

-- Локация
tower_stage3_archive = room {
	nam = 'Архив';
	dsc = [[
		Ты оказываешься в затхлом помещении заставленным стелажами с книгами. Здесь
		неожиданно темно. Свет даёт нексолько чадащих свечей в канделябрах. Тебе остаётся лишь
		гадать, кто занимается их сменой. Ты проходишь между стеллажами изучая книги. Некоторые
		обращают на себя твоё внимание, и ты по наитию достаёшь их с полок и кладёшь на
		одинокий стол.
	]];
	obj = {
		'tower_stage3_archive_table';
		'tower_stage3_archive_book_1';
		'tower_stage3_archive_book_2';
		'tower_stage3_archive_small_letters';
		'tower_stage3_archive_book_3';
		'tower_stage3_archive_book_4';
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
	dsc = [[
		{Стол}.
	]];
	act = [[
		Некоторые книги привлекают твоё внимание
	]];
}

-- Книга 1
tower_stage3_archive_book_1 = obj {
	nam = '';
	dsc = [[
		{Книга 1}.
	]];
	act = [[
	]];
}

-- Книга 2
tower_stage3_archive_book_2 = obj {
	nam = '';
	dsc = [[
		{Книга 2}.
	]];
	act = [[
		Не забыть добавить объект с описанием чёрной птицы
		Краткая история древнего государства людей, легенды о чёрных птицах
	]];
}

-- Неразборчивые письмена
tower_stage3_archive_small_letters = obj {
	nam = 'Неразборчивые письмена';
	dsc = [[
		На столе лежит свиток с пятнами чернил...
		Ты {не можешь разобрать, что написано}.
	]];
	used = function(self, what)
		if what == tower_spyglass then
			event 'got tower book location'
			tower_stage3_archive_small_letters:disable()
			return [[
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

-- Книга 3
tower_stage3_archive_book_3 = obj {
	nam = '';
	dsc = [[
		{Книга 3}.
	]];
	act = [[
		Тут хранится множество записей об истории города и об истории Башни наместника.
	]];
}

-- Книга 4
tower_stage3_archive_book_4 = obj {
	nam = '';
	dsc = [[
		{Книга 4}.
	]];
	act = [[
	]];
}

-- Страж с загадками (статуя, книга, библиотека?)
-- Три загадки должны быть на знания истории
-- Страж перезагружается, если пройти этажи по кругу. Загадки сменяют друг друга по кругу, до тех пор пока игрок не отгадает одну из них
tower_stage3_archive_guard = obj {
	nam = '';
	dsc = [[
		{Большая книга} на алтаре.
	]];
	act = function()
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
end

-- Диалог со стражем архива
tower_stage3_archive_guard_dlg = dlg {
	nam = 'Ветхая книга';
	hideinv = true;
	entered = function()
		-- Осматриваем книгу
		book_guard_definition = [[
			Напоминает алтарь на котором лежит внушительная книга. Ты листаешь книгу и неожиданно обнаруживаешь на ней проступающие на чистой бумаге надписи
			Перед тобой лежит огромная пыльная книга.
			^
		]];

		-- Проверяем не разгадывали ли мы загадок в это прохождение башни
		if _tower_stage2_new_loop_puzzle then
			-- Загадка 1
			-- Включаем ответы на первую загадку, если сейчас её очередь и мы первый раз пытаемся отгадать загадку в текущем цикле прохождения башни
			if _tower_stage2_current_puzzle_number == 1 and _tower_stage2_new_loop_puzzle then
				tower_stage3_archive_guard_dlg:pon('puzzle_1_answer_1');
				tower_stage3_archive_guard_dlg:pon('puzzle_1_answer_2');
				tower_stage3_archive_guard_dlg:pon('puzzle_1_answer_3');
				-- Выводим текст первой загадки
				return book_guard_definition .. [[
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
				return book_guard_definition .. [[
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
				return book_guard_definition .. [[
					Третья загадка...
				]];
			end;
		end;

		-- Загадки разгаданы, выводим описание книги
		return book_guard_definition;
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
