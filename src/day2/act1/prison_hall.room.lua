_guard_just_died = false

prison_hall_to_prison_guards_room = vroom('Комната стражи', 'prison_guards_room');
prison_hall_to_prison_guards_room:disable();

prison_hall_to_barracks_hall = vroom('Коридор оружейной', 'barracks_hall');
prison_hall_to_barracks_hall:disable();
on_event('got his stuff back', function()
	prison_hall_to_barracks_hall:enable();
end)

prison_hall = room {
	nam = 'Тюремный коридор';
	dsc = [[
		Ты стоишь посреди коридора. Здесь вообще куча всего плюс пара факелов (их можно дёргать
		и послушать разные звуки).
		По бокам тянется длинный ряд камер -- сейчас они все пусты.
	]];
	obj = {
		'prison_hall_guard';
		'prison_hall_table';
		'prison_hall_cup';
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
			в кулак {стражник}. Под ногами у него валяется пустой мешочек.
		]]
	end;
	act = [[
		Ты внимательно и с некоторым сочувствием рассматриваешь стражника.
		Его жизнь, должно быть, действительно очень скучна, если он додумался
		сам попробовать подышать магическим субстратом.
	]];
	used = function(self, what)
		if what == prison_hall_cup then
			_guard_just_died = true
			prison_hall_to_prison_guards_room:enable()
			inv():del 'prison_hall_cup'
			return [[
				Ещё раз прокрутив в голове все планы, в тысячный раз пересчитав
				все комбинации и найдя наконец оптимальную комбинацию факторов,
				ты решаешь привести свой гениальный план в действие. Итак,
				ты подкрадываешься к стражнику и хуяришь его кружкой по темени.
				^
				Теперь надо куда-то оттащить тело. Может, вон за ту железную
				дверь?
			]]
		end
	end;
}
on_event('guard body is hidden', function()
	prison_hall_guard:disable()
end)

prison_hall_table = obj {
	nam = 'Стол';
	dsc = [[
		Рядом с тобой стоит стол.
	]];
}

prison_hall_cup = obj {
	nam = 'Медная кружка';
	dsc = [[
		На нём стоит {тяжёлая медная кружка}.
	]];
	tak = [[
		Ты берёшь кружку в руки и начинаешь строить в уме коварные
		многоходовки.
	]];
	inv = [[
		Ты взвешиваешь кружку в руке. Килограмм! Нет, два!
	]];
}
