-- Day 1, act 1

-- Quest state

_hunt_gear = false
diary_entry(function()
	return diary_helper((not _hunt_gear), [[
		Собираюсь на охоту. Нужно взять снаряжение.
	]])
end)

_hunt_food = false
diary_entry(function()
	return diary_helper((not _hunt_food), [[
		Еду тоже надо захватить.
	]])
end)

_need_new_bow = false
diary_entry(function()
	return diary_helper((_need_new_bow), [[
		Мой лук уже никуда не годится. Нужно попросить кузнеца сделать новый.
	]])
end)

_warren_conflict = false
diary_entry(function()
	return diary_helper((_warren_conflict), [[
		Уоррен отобрал у кузнеца лук за долги. Надо урегулировать.
	]])
end)

_warren_knows_elder = false
diary_entry(function()
	return diary_helper((_warren_knows_elder), [[
		Уоррен -- дальний родственник старосты. Возможно, этим его можно
		запугать и лишить воли.
	]])
end)
