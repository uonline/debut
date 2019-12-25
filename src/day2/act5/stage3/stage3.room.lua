-- Локация
tower_stage3 = room {
	nam = 'Башня';
	dsc = function()
		if not tower_stage2_thieves_leader:disabled() then
			event 'thieves leader disappeared';
			return [[
				Вы снова поднимаетесь выше. Точнее, ты один, потому что теперь исчез и главарь воров.
				Вы поднимаетесь по лестнице. Главарь подполья преодолевает несколкьо ступенек за раз
				и исчезает за поворотом лестницы. Ты поднимаешься на следующий этаж и не обнаруживаешь
				его.
			]];
		end;

		return [[
			Ты снова поднимаешься выше и оказываешься на следующем этаже.
		]];
	end;
	obj = {
		'tower_stage3_armor';
		'tower_stage3_windows';
		'tower_stage3_floor_paper';
		'tower_stage3_floor_map';
		'tower_stage3_tabels';
		'tower_stage3_chairs';
		'tower_stage3_bookshekves';
		'tower_stage3_picture';
	};
	way = {
		vroom('Архив', 'tower_stage3_archive');
		vroom('Лестница', 'tower_stage4');
	};
}

-- Объекты локации
-- Доспехи
tower_stage3_armor = obj {
	nam = '';
	dsc = [[
		Этот этаж похож на покои для советов.
		{Вооружённые истуканы доспехов}
	]];
	act = [[
		Воспоминания о крестоносцах
	]];
	used = function(self, what)
		if what == tower_spear then
			-- Тыкаем копьём в доспехи и они разваливаются
		end;
	end;
}

-- Окна
tower_stage3_windows = obj {
	nam = '';
	dsc = [[
		Просторные {окна} скрытые за синими полупрозрачными шторами.
	]];
	act = [[
		Благодаря им пространстро становется заполненым каким-то магическим светом.
	]];
	used = function(self, what)
		if what == tower_spear then
		end;
	end;
}

-- Бумаги на полу
tower_stage3_floor_paper = obj {
	nam = '';
	dsc = [[
		Пол покрывают {бумаги}.
	]];
	act = [[
	]];
	used = function(self, what)
		if what == tower_spear then
		end;
	end;
}

-- Карта
tower_stage3_floor_map = obj {
	nam = '';
	dsc = [[
		Под ними можно разглядеть {карту Приграничья} прямо в центре залы.
	]];
	act = [[
	]];
	used = function(self, what)
		if what == tower_spear then
		end;
	end;
}

-- Столики
tower_stage3_tabels = obj {
	nam = '';
	dsc = [[
		Вокруг неё расставлено несколько {столов}.
		Рядом с каждым стоит несклько подсвечников Множество подсвечников.
	]];
	act = [[
		Пятна от чернил. Стопки книг, свитки
	]];
	used = function(self, what)
		if what == tower_spear then
		end;
	end;
}

-- Стулья
tower_stage3_chairs = obj {
	nam = '';
	dsc = [[
		{Стулья}
	]];
	act = [[
		Ты представляешь как благородные лорды и советники, восседают на этих стульях, обсуждая проблемы города
	]];
	used = function(self, what)
		if what == tower_spear then
		end;
	end;
}

-- Полки с книгами у стен
tower_stage3_bookshekves = obj {
	nam = '';
	dsc = [[
		{Полки с книгами}.
	]];
	act = [[
		Режим очень много внимания уделяет знанию. Школы для богоизбранных. Учителя
	]];
	used = function(self, what)
		if what == tower_spear then
		end;
	end;
}

-- Картина
tower_stage3_picture = obj {
	nam = 'Наклонённая картина';
	dsc = [[
		Высоко на стене висит {наклонённая картина}. Она единственная привлекла твоё внимание.
		...
	]];
	act = [[
		Горизонт завален. Тебе захотелось его поправить.
	]];
	used = function(self, what)
		if what == tower_spear then
			tower_stage3_archive_to_secret_room:enable()
			tower_stage3_picture:disable()
			return [[
				Картина наклонилась в другую сторону. За стеной послышался какой-то скрежет.
			]]
		end
	end;
}
