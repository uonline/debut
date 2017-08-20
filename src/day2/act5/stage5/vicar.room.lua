_tower_stage5_thieves_leader_searched = false

tower_stage5_vicar_room = room {
	nam = 'Комната наместника';
	dsc = [[]];
	obj = {
		'thieves_leader_body';
	};
	way = {
		vroom('Назад', 'tower_stage5');
	};
}

thieves_leader_body = obj {
	nam = 'Тело главаря воров';
	dsc = [[
		На кровати лежит {тело главаря воров}.
	]];
	act = function()
		if not _tower_stage5_thieves_leader_searched then
			take 'tower_strange_notes'
			take 'tower_adviser_room_key'
			_tower_stage5_thieves_leader_searched = true
			return [[
				Рука сжимала странные записки и ключ от комнаты советника.
			]]
		end;
	end;
}

tower_strange_notes = obj {
	nam = 'Странные записки'
}

tower_adviser_room_key = obj {
	nam = 'Ключ от комнаты советника'
}

