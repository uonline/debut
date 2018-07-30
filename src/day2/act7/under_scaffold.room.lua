under_scaffold_to_dark_lane = vroom('Тёмный проулок', 'burning_quarter');
under_scaffold_to_dark_lane:disable();

under_scaffold = room {
	nam = 'Под эшафотом';
	dsc = [[
		Ты мешком падаешь с эшафота на залитую кровью землю.
		Жизнь, которую ты уже почитал законченной, вливается в тебя
		с новой силой, и ты начинаешь особенно остро чувствовать
		пропитавший воздух запах смерти. Трупов вокруг столько, что от них
		начинает рябить в глазах.
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
		Рядом с тобой лежит лицом вниз бездыханный стражник с огромной {секирой в спине.}
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
		Неподалёку сцепились {солдат Режима и головорез.}
	]];
	act = function()
		soldier_and_thug:disable();
		take 'soldier_sword';
		return [[
			Ты рассматриваешь трупы. Солдат проткнул орка мечом,
			но тот накрыл его своей тушей. Оба больше не подают признаков жизни.
			^
			Немного повозившись, ты отодвигаешь тело орка в сторону и забираешь
			из рук солдата меч. Он ему всё равно уже не понадобится.
		]];
	end;
}

soldier_sword = obj {
	nam = 'Меч солдата Режима';
	inv = [[
		Ты оценивающе осматриваешь меч. Он покрыт кровью от острия
		до гарды и отвратительно пахнет. У тебя нет никакого
		желания мараться орочьей кровью сверх меры, и всё же по
		давней привычке ты пытаешься стряхнуть кровь с клинка.
		Кажется, рука ещё помнит, как обращаться с привычным
		мечом Режима.
	]];
}

half_reptile = obj {
	nam = 'Полуящер';
	dsc = [[
		Вдалеке у Тёмного проулка, забыв о сражении, лакомится мертвечиной {полуящер.}
	]];
	act = [[
		Ты внимательно смотришь на полуящера. Грубая зелёная кожа, шипы на спине,
		острые длинные когти, шакальи зубы.
	]];
}
