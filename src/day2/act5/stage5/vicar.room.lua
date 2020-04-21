-- Переменные локации
_tower_stage5_thieves_leader_searched = false

-- Локация
tower_stage5_vicar_room = room {
	nam = 'Комната наместника';
	dsc = [[
		Через приоткрытую дверь ты попадаешь в богато
		обставленную комнату.
	]];
	obj = {
		'thieves_leader_body';
	};
	way = {
		vroom('Назад', 'tower_stage5');
	};
}

-- Объекты локации
-- Тело главаря подполья
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
				Рука сжимала небольшую книжицу в кожанной обложке.
				В карманах ты обнаруживаешь ключ от комнаты советника и смятую записку.
			]]
		end;
	end;
}

-- Записки главаря подполья
tower_strange_notes = obj {
	nam = 'Странные записки';
	inv = [[
		Записка от мага с предупреждением о предателе.
	]];
}

-- Ключ от комнаты советника
tower_adviser_room_key = obj {
	nam = 'Ключ от комнаты советника';
}

-- Дневник советника
-- Я успел убедиться, что маги сами могут не понимать, что они говорят и знать что делают;
