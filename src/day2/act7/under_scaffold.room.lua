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
		'axe_in_guardsman';
		'soldier_and_thug';
		'half_reptile';
	};
	way = {
		under_scaffold_to_dark_lane;
	};
}

dead_marauder = obj {
	nam = 'Огромный мародёр';
	dsc = [[
		{Огромный мародёр} застыл без движения, прислонившись к опоре эшафота.
	]];
	act = function()
		dead_marauder:disable()
		return [[
			Ты осторожно касаешься мародёра. Он падает на бок.
		]]
	end;
}

orc_slave = obj {
	nam = 'Орк-раб';
	dsc = [[
		В тени настила валяется {орк-раб}.
	]];
	act = function()
		walk 'slain_by_slave'
	end;
}

axe_in_guardsman = obj {
	nam = 'Секира';
	dsc = [[
		Рядом с вами лежит вниз лицом бездыханный стражник с огромной {секирой в спине.}
	]];
	act = function()
		self:disable();
		under_scaffold_to_dark_lane:enable();
		return [[
			Ты подползаешь к стражнику и разрезаешь о секиру верёвку,
			связывающую руки. Потом таким же образом освобождаешь и ноги.
		]];
	end;
}

soldier_and_thug = obj {
	nam = 'Солдат Режима и головорез';
	dsc = [[
		Неподалёку от него сцепились {солдат Режима и головорез}.
	]];
	act = function()
		soldier_and_thug:disable();
		take 'soldier_sword';
		return [[
			Солдат проткнул орка мечом, но тот накрыл его своей тушей.
			Оба больше не подают признаков жизни.
			^
			А меч пригодится.
		]];
	end;
}

soldier_sword = obj {
	nam = 'Меч солдата Режима';
	inv = [[
		TODODODODODODODO TODO TODO
		^
		Ты внимательно осматриваешь меч. Это двуручный меч, какие носят
		все солдаты Режима Ремана. Он остро заточен, но сталь не очень
		качественная. Рукоять сделана в виде львиной головы.
	]];
}

half_reptile = obj {
	nam = 'Полуящер';
	dsc = [[
		Вдалеке у Тёмного проулка, забыв о сражении, лакомится мертвечиной {полуящер.}
	]];
	act = [[
		Ты внимательно смотришь полуящера. Грубая зелёная кожа, шипы на спине,
		острые длинные когти, шакальи зубы.
	]];
}
