hunting_gear = obj {
	nam = 'Охотничье снаряжение';
	dsc = [[
		На стене висит твоё {охотничье снаряжение}.
	]];
	tak = function()
		event 'gear_taken'
		return [[
			Ты снял снаряжение со стены и положил в рюкзак.
			^
			Ты замечаешь, что твой лук уже никуда не годится. Надо попросить
			кузнеца сделать новый.
		]]
	end;
	inv = [[
		Ты внимательно разглядываешь своё снаряжение: арбалет, две бутылки пива
		и красное дилдо.
	]];
}

on_event('gear_taken', function()
	_hunt_gear = true
	_need_new_bow = true
end)

diary_entry(function()
	if not _hunt_gear then
		return [[
			Собираюсь на охоту. Нужно взять снаряжение.
		]]
	end
end)

diary_entry(function()
	if not _hunt_food then
		return [[
			Еду тоже надо захватить.
		]]
	end
end)

diary_entry(function()
	if _need_new_bow then
		return [[
			Мой лук уже никуда не годится. Нужно попросить кузнеца сделать новый.
		]]
	end
end)

diary_entry(function()
	if _warren_conflict then
		return [[
			Уоррен отобрал у кузнеца лук за долги. Надо урегулировать.
		]]
	end
end)
