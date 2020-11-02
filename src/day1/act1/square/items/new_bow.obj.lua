new_bow = obj {
	nam = 'Лук';
	inv = [[
		Кажется, кузнец ничего и не чинил, а просто подсунул тебе другой лук.
	]];
}

on_event('got new bow', function()
	take 'new_bow'
end)
