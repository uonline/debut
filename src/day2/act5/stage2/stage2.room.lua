tower_stage2 = room {
	nam = 'Второй этаж';
	dsc = function()
		ret = [[
			Комната с лестницей.
			После продолжительного винтового пролёта вы оказываетесь
			на втором этаже башни]]
		if tower_stage2_thieves_leader:disabled() then
			return ret .. '.' --когда пропал главарь, убираем заодно и текст про полукровку
		else
			return ret .. ' и обнаруживаете, что Полукровка исчезла.'
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
		{Главарь воров} размышляет. О пропавшей Полукровке, не иначе.
	]];
	act = [[
		-- Куда, чёрт возьми, она задевалась?
	]];
}

on_event('thieves leader disappeared', function()
	tower_stage2_thieves_leader:disable()
end)
