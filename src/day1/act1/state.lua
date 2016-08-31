-- Day 1, act 1

-- Quest state

diary_add('take gear', [[
	Собираюсь на охоту. Нужно взять снаряжение.
]])
on_event('gear taken', function()
	diary_del 'take gear'
end)

diary_add('take food', [[
	Еду тоже надо захватить.
]])
on_event('food taken', function()
	diary_del 'take food'
end)

on_event('gear taken', function()
	diary_add('need new bow', [[
		Мой лук уже никуда не годится. Нужно попросить кузнеца сделать новый.
	]])
end)
on_event('got new bow', function()
	diary_del 'need new bow'
end)

on_event('warren conflict', function()
	diary_add('warren conflict', [[
		Уоррен отобрал у кузнеца молот за долги. Надо урегулировать.
	]])
end)
on_event('got the hammer', function()
	diary_del 'warren conflict'
end)

on_event('warren knows elder', function()
	diary_add('warren knows elder', [[
		Уоррен -- дальний родственник старосты. Возможно, этим его можно
		запугать и лишить воли.
	]])
end)
on_event('got the hammer', function()
	diary_del 'warren knows elder'
end)

on_event('got new bow', function()
	diary_add('time to hunt', [[
		Всё готово! Пора на охоту.
	]])
end)
