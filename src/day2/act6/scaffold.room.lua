scaffold = room {
	nam = 'Эшафот';
	dsc = [[
		Итак, тебя поймали и приговорили к смерти. Это всегда хорошее начало дня.
		К счастью, на город нападает толпа урок, и в суматохе тебе удаётся
		вытащить голову из петли.
	]];
	obj = {};
	way = {
		'under_scaffold'
	};
	entered = function()
		-- Clear inventory, add whitelisted items
		inv():zap();
	end;
}

on_event('caught in action', function()
	walk 'scaffold'
end)
