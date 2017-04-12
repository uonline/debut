your_cell_to_prison_hall = vroom('Тюремный коридор', 'prison_hall');
--your_cell_to_prison_hall:disable();

your_cell = room {
	nam = 'Твоя камера';
	dsc = [[
		Ты сидишь в своей тюремной камере. Тут темно и воняет. Выход
		преграждает решётка с замком.
	]];
	obj = {
		'rat';
		'hole';
	};
	way = {
		your_cell_to_prison_hall;
	};
}

rat = obj {
	nam = 'Крыса';
	dsc = [[
		В углу камеры сидит {крыса}. Она что-то грызёт, поглядывая на тебя
		наглыми чёрными глазками.
	]];
}

hole = obj {
	nam = 'Дыра в стене';
	dsc = [[
		В стене виднеется {небольшая дырка}.
	]];
	act = [[
		-- Пщщ, пщщ, первый, первый, я второй, как слышно?
	]];
}