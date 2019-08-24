_guard_just_died = false

prison_hall_to_prison_guards_room = vroom('Комната стражи', 'prison_guards_room');
prison_hall_to_prison_guards_room:disable();

prison_hall_to_barracks_hall = vroom('Коридор штаба', 'barracks_hall');
prison_hall_to_barracks_hall:disable();
on_event('got his stuff back', function()
	prison_hall_to_barracks_hall:enable();
end)

prison_hall = room {
	nam = 'Тюремный коридор';
	dsc = [[
		Ты стоишь посреди коридора, скупо освещаемого факелами.
		С одной стороны тянется ряд деревянных бочек.
		С другой стороны -- длинный ряд камер -- сейчас все они пусты.
	]];
	obj = {
		'prison_hall_guard';
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
		'your_cell';
		prison_hall_to_prison_guards_room;
		prison_hall_to_barracks_hall;
	};
}

prison_hall_guard = obj {
	nam = 'Стражник';
	dsc = function()
		if _guard_just_died then
			return [[
				У твоих ног лежит тело стражника.
			]]
		end
		return [[
			В десяти шагах от тебя, привалившись головой к стене, усердно кашляет
			в кулак {стражник}.
		]]
	end;
	act = [[
		Ты внимательно и с некоторым сочувствием рассматриваешь стражника.
		Его жизнь, должно быть, действительно очень скучна, если он решил сам
		попробовать подышать магическим субстратом.
	]];
	used = function(self, what)
		if what == prison_hall_cup then
			_guard_just_died = true
			prison_hall_to_prison_guards_room:enable()
			inv():del 'prison_hall_cup'
			return [[
				Не придумав ничего лучше, ты подходишь к стражнику и с размаху
				бьёшь его по голове кружкой. Кашель прекращается,
				тюремщик мешком падает на пол.
				^
				Ты оттаскиваешь тело в свою камеру и возвращаешься в коридор.
			]]
		end;
	end;
}
on_event('guard body is hidden', function()
	prison_hall_guard:disable()
end)

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

prison_hall_barrels = obj {
	nam = "Бочки";
	dsc = [[
		Дальше по коридору -- ряд {бочек} прямиком до
	]];
	act = [[
		Ты осматриваешь бочки. Похоже, в этой тюрьме изобрели
		свой собственный вид пыток -- расставить бочки с вином
		перед камерами заключённых.
	]];
}

prison_hall_iron_door = obj {
	nam = 'Дверь';
	dsc = [[
		 внушительной {железной двери}.
	]];
	act = [[
		Ты разглядываешь дверь. Выглядит грозно.
	]];
}

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
