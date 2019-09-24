-- События
on_event('thieves leader disappeared', function()
	tower_stage2_thieves_leader:disable();
end)

-- Локация
tower_stage2 = room {
	nam = 'Башня';
	dsc = function()
		ret = [[
			После продолжительного винтового пролёта ты оказываешься
			на следующем этаже башни
		]];

		if tower_stage2_thieves_leader:disabled() then
			return ret .. '.'; --когда пропал главарь, убираем заодно и текст про полукровку
		else
			return ret .. '... и тут вы обнаруживаете, что Полукровка исчезла.';
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

-- Объекты локации
-- Главарь подполья
tower_stage2_thieves_leader = obj {
	nam = 'Главарь воров';
	dsc = [[
		{Главарь воров} выглядит крайне удивлённым.
	]];
	act = [[
		-- Куда, чёрт возьми, она подевалась?
		^
		Ещё один намёк в диалоге, что главарь принадлежит Чёрному Древу. Его мысли на счёт религии Блага? Сравнение с Благими? И подозрение в "нечеловечности".
		-- Единый бог? Разве люди могли придумать такое?
	]];
}
