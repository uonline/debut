tower_stage2 = room {
	nam = 'Башня';
	dsc = function()
		ret = [[
			После продолжительного винтового пролёта ты оказываешься
			на следующем этаже башни]]
		if tower_stage2_thieves_leader:disabled() then
			return ret .. '.' --когда пропал главарь, убираем заодно и текст про полукровку
		else
			return ret .. '... и тут вы обнаруживаете, что Полукровка исчезла.'
		end
	end;
	obj = {
		'tower_stage2_thieves_leader';
	};
	way = {
		'tower_stage2_stock';
		vroom('Лестница', 'tower_stage3');
	};
}

tower_stage2_thieves_leader = obj {
	nam = 'Главарь воров';
	dsc = [[
		{Главарь воров} выглядит крайне удивлённым.
	]];
	act = [[
		-- Куда, чёрт возьми, она подевалась?
	]];
}

on_event('thieves leader disappeared', function()
	tower_stage2_thieves_leader:disable()
end)
