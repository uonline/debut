tower_stage3 = room {
	nam = 'Башня';
	-- Test
	dsc = [[
		Вы снова поднимаетесь выше. Точнее, ты один, потому что теперь исчез и главарь воров.
	]];
	obj = {
		'tower_picture';
	};
	way = {
		vroom('Архив', 'tower_stage3_archive');
		vroom('Лестница', 'tower_stage4');
	};
	enter = function()
		event 'thieves leader disappeared'
	end;
}

tower_picture = obj {
	nam = 'Наклонённая картина';
	dsc = [[
		Высоко на стене висит {наклонённая картина}.
	]];
	act = [[
		Горизонт завален
	]];
	used = function(self, what)
		if what == tower_spear then
			tower_stage3_archive_to_secret_room:enable()
			tower_picture:disable()
			return [[
				Картина наклонилась в другую сторону. За стеной послышался какой-то скрежет.
			]]
		end
	end;
}
