food = obj {
	nam = 'Еда';
	dsc = [[
		На столе лежит {еда}.
	]];
	tak = function()
		event 'food_taken'
		return [[
			Ты завернул еду в обёрточную бумагу и положил в рюкзак.
		]]
	end;
	inv = [[
		Ты внимательно разглядываешь свой обед: немножечко укропа, кошачья попа,
		лягушачьи лапки, парик старой бабки.
	]];
}

on_event('food_taken', function()
	_hunt_food = true
end)
