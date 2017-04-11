lords_lands_to_thicket = vroom('Чаща', 'thicket');
lords_lands_to_thicket:disable();

_lords_lands_wolves_arrival = 3;

bad_stuff = function()
	_lords_lands_wolves_arrival = _lords_lands_wolves_arrival - 1;
	if _lords_lands_wolves_arrival <= 0 then
		walk 'wolfest'
	end
end

lords_lands = room {
	nam = 'Лордские угодья';
	dsc = [[
		Ты стоишь посреди леса посреди угодий лорда посреди континента
		посреди мира. Вдалеке видны экзистенциальные вопросы и деревья.
		^
		Пора на охоту, как сказал бы Рексар.
	]];
	way = {
		lords_lands_to_thicket;
	};
	obj = {
		'lords_lands_bad1';
		'lords_lands_bad2';
		'lords_lands_bad3';
		'lords_lands_good';
		'lords_lands_bad4';
	};
}

lords_lands_good = obj {
	nam = 'Овраг';
	dsc = [[
		Вдалеке виднеется {овраг}.
	]];
	act = function()
		lords_lands_to_thicket:enable();
		return [[
			Ты спускаешься в овраг и находишь там следы оленя. Они ведут
			дальше в чащу.
		]];
	end
}

lords_lands_bad1 = obj {
	nam = 'Куст';
	dsc = [[
		Рядом с тобой растёт {куст ежевики}.
	]];
	act = function()
		bad_stuff();
		return [[
			Ты заглядываешь под куст и находишь там много ягод, но никаких
			следов оленя.
		]];
	end
}

lords_lands_bad2 = obj {
	nam = 'Дупло';
	dsc = [[
		Примерно в трёх шагах от тебя стоит {дерево с дуплом}.
	]];
	act = function()
		bad_stuff();
		return [[
			Ты заглядываешь в дупло и находишь там немного орехов и еловых
			веток, но оленя там нет.
		]];
	end
}

lords_lands_bad3 = obj {
	nam = 'Грибы';
	dsc = [[
		Под деревом растут {грибы}.
	]];
	act = function()
		bad_stuff();
		return [[
			Ты внимательно осматриваешь грибы со всех сторон, но
			не находишь никаких следов оленя.
		]];
	end
}

lords_lands_bad4 = obj {
	nam = 'Сухие листья';
	dsc = [[
		Прямо у тебя под ногами лежит {кучка сухих листьев}.
	]];
	act = function()
		bad_stuff();
		return [[
			Ты внимательно исследуешь листья, но не находишь там
			никаких следов оленя.
		]];
	end
}
