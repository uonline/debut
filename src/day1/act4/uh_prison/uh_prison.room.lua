uh_prison_to_uh_square = vroom('Площадь лагеря', 'uh_square');
uh_prison_to_uh_square:disable();

on_event('may leave prison', function()
	uh_prison_to_uh_square:enable();
end)

uh_prison = room {
	nam = 'Загон рабов';
	dsc = [[
		Тебя бросают в загон... Загон поделен на несколько темниц...
		Окружён частоколом из колючих ветвей. Сверху проложены мостки
		по которым бродит урук...
	]];
	obj = {
		'uhp_guardian';
		'uhp_goblin';
		'uhp_warren';
		'uhp_blacksmith';
	};
	way = {
		uh_prison_to_uh_square;
	};
	entered = function()
		-- Clear inventory, add whitelisted items
		inv():zap();
	end;
}

uhp_warren = obj {
	nam = 'Уорри';
	dsc = [[
		{Уорри Ростовщик}
	]];
	act = [[
		Уорри никак не реагирует на твои слова. Кажется, он всё ещё в шоке.
	]];
}
