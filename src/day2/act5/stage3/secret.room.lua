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

tower_book = obj {
	nam = 'Книга о башне';
	dsc = [[
		Где-то тут лежит {книга о башне}.
	]];
	tak = function()
		event 'learned stairway symbols'
		return [[
			Тут в числе прочего напсиано, что за странные символы были
			рядом с лестницей на четвёртом этаже. А также рассказано,
			как пользоваться этим лифтом.
		]]
	end;
}
tower_book:disable()

on_event('got tower book location', function()
	tower_book:enable()
end)

