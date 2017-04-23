food = obj {
	nam = 'Еда';
	dsc = [[
		На столе тебя ждёт {еда}.
	]];
	tak = function()
		event 'food taken'
		return [[
			Ты завернул еду в обёрточную бумагу и положил в рюкзак.
		]]
	end;
	inv = [[
		Ты внимательно разглядываешь свой обед: немножечко укропа, кошачья попа,
		лягушачьи лапки, парик старой бабки.
	]];
}

on_event('food taken', function()
	_hunt_food = true
end)
