-- События
-- Узнаеём где спрятана книга о башне
on_event('got tower book location', function()
	tower_book:enable()
end)

-- Локация
tower_stage3_secret_room = room {
	nam = 'Потайная комната';
	dsc = [[
		Ещё один стеллаж с какими-то записями.
	]];
	obj = {
		'tower_book';
	};
	way = {
		'tower_stage3_archive';
	};
}

-- Объекты локации
-- Книга о башне
tower_book = obj {
	nam = 'Книга о башне';
	dsc = [[
		Где-то тут лежит {книга о башне}.
	]];
	tak = function()
		event 'learned stairway symbols'
		return [[
			Тут в числе прочего написано, что за странные символы были
			рядом с лестницей на четвёртом этаже. А также рассказано,
			как пользоваться этим лифтом.
		]]
	end;
}
tower_book:disable() -- Прячем книгу о башне
