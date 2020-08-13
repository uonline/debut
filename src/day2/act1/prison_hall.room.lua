-- TODO
-- * Описание стражника:
--    * Тексты взаимодействия с предметами, пока стражник не вырублен:
--       * Можно только осматривать;
--    * Тексты взаимодействия с предметами с телом стражника в инвентаре;

-- Переменные
-- События
-- Прячем тело стражника в камеру
on_event('guard body is hidden', function()
	prison_hall_guard_body:disable();
	prison_cell_guard_body:enable();
end)

-- Переходы
-- В камеру
prison_hall_to_your_cell_room = vroom('Твоя камера', 'your_cell');
on_event('close your cell', function()
	prison_hall_to_your_cell_room:disable();
end)

-- В комнату стражи
prison_hall_to_prison_guards_room = room {
	nam = 'Комната стражи';
	enter = function()
		if not prison_hall_to_your_cell_room:disabled() then
			return [[
				Ты подходишь к двери, но останавливаешься на пороге.
				Тебе кажется плохой идеей оставлять тело стражника посреди
				коридора.
			]], false;
		end;

		walk 'prison_guards_room';
	end;
}
prison_hall_to_prison_guards_room:disable();

-- В коридор штаба
prison_hall_to_barracks_hall = vroom('Коридор штаба', 'barracks_hall');
prison_hall_to_barracks_hall:disable();
on_event('got his stuff back', function()
	prison_hall_to_barracks_hall:enable();
end)

-- Локация
prison_hall = room {
	nam = 'Тюремный коридор';
	dsc = [[
		Ты стоишь посреди коридора, скупо освещаемого факелами.
		С одной стороны тянется ряд деревянных бочек.
		С другой стороны -- длинный ряд камер -- сейчас все они пусты.
	]];
	obj = {
		'prison_hall_guard';
		'prison_hall_guard_body';
		'prison_hall_fire_first';
		'prison_hall_table';
		'prison_hall_cup';
		'prison_hall_posters';
		'prison_hall_fire_second';
		'prison_hall_barrels';
		'prison_hall_iron_door';
		'prison_hall_fire_third';
	};
	way = {
		prison_hall_to_your_cell_room;
		prison_hall_to_prison_guards_room;
		prison_hall_to_barracks_hall;
	};
}

-- Объекты
-- Стражник
prison_hall_guard = obj {
	nam = 'Стражник';
	dsc = function()
		return [[
			В десяти шагах от тебя, привалившись головой к стене, усердно кашляет
			в кулак {стражник}.
		]];
	end;
	act = [[
		Ты внимательно и с некоторым сочувствием рассматриваешь стражника.
		Его жизнь, должно быть, действительно очень скучна, если он решил сам
		попробовать подышать магическим субстратом.
	]];
	used = function(self, what)
		if what == prison_hall_cup then
			prison_hall_guard:disable();
			prison_hall_guard_body:enable();
			inv():del 'prison_hall_cup';
			return [[
				Не придумав ничего лучше, ты подходишь к стражнику и с размаху
				бьёшь его по голове кружкой. Кашель прекращается,
				тюремщик мешком падает на пол.
				^
				Ты оттаскиваешь тело в свою камеру и возвращаешься в коридор.
			]];
		end;
	end;
}

-- Тело стражника
prison_hall_guard_body = obj {
	nam = 'Тело стражника';
	dsc = [[
		У твоих ног лежит {тело стражника}.
	]];
	tak = [[
		Ты берёшь тело стражника под мышки.
	]];
	inv = [[
		Тяжёлый.
	]];
}
prison_hall_guard_body:disable()

-- Первый факел
prison_hall_fire_first = obj {
	nam = 'Факел';
	dsc = [[
		Свет висящего рядом {факела} очерчивает под ногами у тюремщика
		пустой мешочек из-под субстрата.
	]];
	act = [[
		Ты дёргаешь факел, и он послушно поднимается вверх вместе с кольцом
		крепления. Дверь одной из камер со скрипом открывается.
		^
		Факел медленно опускается. Дверь камеры встаёт на место.
	]];
}

-- Стол
prison_hall_table = obj {
	nam = 'Стол';
	dsc = [[
		Рядом с тобой стоит {стол}.
	]];
	act = [[
		Помимо кружки на столе покоятся какие-то объедки, огарки свечей и жиденькая
		колода засаленных карт.
	]];
}

-- Кружка
prison_hall_cup = obj {
	nam = 'Медная кружка';
	dsc = [[
		На нём, словно колонна, высится {тяжёлая медная кружка}.
	]];
	tak = [[
		Ты берёшь кружку в руку.
	]];
	inv = [[
		Ты взвешиваешь кружку. Тяжёлая.
	]];
}

-- Доска с плакатами
prison_hall_posters = obj {
	nam = 'Доска с плакатами';
	dsc = [[
		Над столом висят {доска с плакатами}
	]];
	act = [[
		Ты осматриваешь наклеенные поверх друг друга листы с портретами
		всяческих преступников. Среди них находится одно знакомое лицо. Посмотрев
		как следует, ты узнаёшь на плакате себя. Под портретом рядом с
		гербом Режима написано: "Дезертир. Разыскивается живым."
	]];
}

-- Второй факел
prison_hall_fire_second = obj {
	nam = 'Факел';
	dsc = [[
		и {чадящий факел}.
	]];
	act = [[
		Ты дёргаешь факел, и он послушно поднимается вверх вместе с кольцом
		крепления. Где-то в стене раздаётся приглушённый гул.
		^
		Факел опускается на место.
	]];
}

-- Бочки
prison_hall_barrels = obj {
	nam = "Бочки";
	dsc = [[
		Дальше по коридору -- ряд {бочек} прямиком до каменной лестницы, ведущей
		наверх.
	]];
	act = [[
		Ты осматриваешь бочки. Похоже, в этой тюрьме изобрели
		свой собственный вид пыток -- расставить бочки с вином
		перед камерами заключённых.
	]];
}

-- Дверь
prison_hall_iron_door = obj {
	nam = 'Дверь';
	dsc = [[
		С ней соседствует внушительная {железная дверь}.
	]];
	act = function()
		if prison_hall_guard:disabled() then
			prison_hall_to_prison_guards_room:enable();
			prison_hall_iron_door:disable();
			return [[
				Ты подбираешься к двери и пробуешь открыть. Дверь не возражает.
				За ней что-то похожее на бытовку стражи.
			]];
		end;

		return [[
			Не решаясь приблизиться, ты разглядываешь дверь издалека. Выглядит грозно.
		]];
	end;
}

-- Третий факел
prison_hall_fire_third = obj {
	nam = 'Факел';
	dsc = [[
		По металлу двери скользят красные блики от света висящего справа от неё {факела}.
	]];
	act = [[
		Ты дёргаешь факел, и он послушно поднимается вверх вместе с кольцом
		крепления. Из-за двери доносится какой-то шум.
		^
		Факел плавно опускается на место.
	]];
}
