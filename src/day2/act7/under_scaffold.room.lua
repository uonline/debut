under_scaffold_to_dark_lane = vroom('Тёмный проулок', 'burning_quarter');
under_scaffold_to_dark_lane:disable();

under_scaffold = room {
	nam = 'Под эшафотом';
	dsc = [[
		Вы мешком падаете с эшафота на пропитанную кровью землю. Вокруг полно трупов.
	]];
	obj = {
		'dead_marauder';
		'orc_slave';
		'ax_in_guardsman';
		'coldier_and_thug';
		'half_panglolin';
	};
	way = {
		under_scaffold_to_dark_lane;
	};
}

dead_marauder = obj {
	nam = 'Огромный мародёр';
	dsc = [[
		{Огромный мародёр} застыл без движения прислонившись к опоре эшафота.
	]];
	act = function()
		dead_marauder:disable()
		return 'Вы касаетесь его, а он падает на бок.'
	end;
}

orc_slave = obj {
	nam = 'Орк раб';
	dsc = [[
		В тени настила валяется {орк раб}.
	]];
	act = function()
		walk 'slain_by_slave'
	end;
}

ax_in_guardsman = obj {
	nam = 'Секира';
	dsc = [[
		Рядом с вами лежит вниз лицом бездыханный стражник с {огромной секирой} в спине.
	]];
	act = function()
		self:disable();
		under_scaffold_to_dark_lane:enable();
		return [[
			Ты подполз к стражнику и разрезал о секиру верёвку,
			связывающую руки. Потом освободил и ноги.
		]];
	end;
}

coldier_and_thug = obj {
	nam = 'Солдат Режима и головорез';
	dsc = [[
		Неподалёку от него сцепились {солдат Режима и головорез}.
	]];
	act = function()
		coldier_and_thug:disable();
		take 'coldier_sword';
		return [[
			Солдат проткнул орка мечом, но тот накрыл его своей тушей.
			Оба больше не подают признков жизни. А меч пригодится.
		]];
	end;
}

coldier_sword = obj {
	nam = 'Меч солдата Режима';
}

half_panglolin = obj {
	nam = 'Полуящер';
	dsc = [[
		Вдалеке, у Тёмного проулка, забыв о сражении, лакомится мертвечиной {полуящер}.
	]];
}

slain_by_slave = room {
	nam = 'Game over';
	dsc = [[
		Орк оказалсчя живым. А ты теперь -- мёртвым.
	]];
}
