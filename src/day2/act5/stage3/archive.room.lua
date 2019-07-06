tower_stage3_archive_to_secret_room = vroom('Потайная комната', 'tower_stage3_secret_room');
tower_stage3_archive_to_secret_room:disable()

tower_stage3_archive = room {
	nam = 'Архив';
	dsc = [[
		Тут хранится множество записей об истории города и об истории Башни наместника.
	]];
	obj = {
		'tower_stage3_archive_small_letters';
	};
	way = {
		vroom('Назад', 'tower_stage3');
		tower_stage3_archive_to_secret_room;
	};
}

tower_stage3_archive_small_letters = obj {
	nam = 'Неразборчивые письмена';
	dsc = [[
		В некоторых местах ты {не можешь разобрать, что написано}.
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

