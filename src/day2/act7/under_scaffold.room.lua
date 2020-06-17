-- Переходы локации
under_scaffold_to_dark_lane = vroom('Тёмный проулок', 'burning_quarter');
under_scaffold_to_dark_lane:disable();

-- Локация
under_scaffold = room {
	nam = 'Под эшафотом';
	dsc = [[
		Оклемавшись, ты обнаруживаешь, что воцарились сумерки. Если бы
		не зарево пожара, было бы сложно что-то разглядеть в сгущающейся
		темноте.
		^
		Жизнь, которую ты уже посчитал законченной, вливается в тебя
		с новой силой. Особенно остро чувствуется теперь, пропитавший
		воздух запах смерти. Вся площадь усеяна трупами так, что от них
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
	entered = function()
		-- Clear inventory, add whitelisted items
		inv():zap();

		return [[
			Ты мешком падаешь вниз на залитую кровью землю и чувствуешь, как
			голова ударяется обо что-то твёрдое, так что искры сыпятся из глаз.
			Ты теряешь счёт времени, в попытках отойти от падения и удара.
		]];
	end;
}

-- Объекты локации
-- Мародёр
dead_marauder = obj {
	nam = 'Огромный мародёр';
	dsc = [[
		Совсем рядом с тобой застыл без движения {огромный урук} в тяжёлой броне.
		Его туша привалилась спиной к опоре эшафота, и скрывает от тебя половину площади.
	]];
	act = function()
		dead_marauder:disable()
		under_scaffold_to_dark_lane:enable();
		return [[
			Ты с опаской осматриваешь эту гору мускулов, железа и шкур.
			...
			Ты осторожно касаешься громадного орка. Он падает на бок.
			...
			Тебе открывается вид на проулок...
		]]
	end;
}

-- Орк-раб
orc_slave = obj {
	nam = 'Орк-раб';
	dsc = [[
		Под помостом валяется {орк-раб}.
		^
		Виднеется лысый череп орка-раба.
	]];
	act = function()
		walk 'slain_by_slave'
	end;
}

-- Стражник с секирой в спине
axe_in_guardsman = obj {
	nam = 'Секира';
	dsc = [[
		У его ног лежит лицом вниз бездыханный стражник с торчащей из спины {секирой}.
	]];
	act = function()
		axe_in_guardsman:disable();
		return [[
			Ты подползаешь к стражнику и разрезаешь о секиру верёвку,
			связывающую руки. Потом таким же образом освобождаешь и ноги.
			... пробила грудную клетку.
		]];
	end;
}

-- Солдат и головорез
soldier_and_thug = obj {
	nam = 'Солдат Режима и головорез';
	dsc = [[
		Неподалёку сцепились {солдат Режима и головорез.}
	]];
	act = function()
		-- Проверка на развязанные руки
		if axe_in_guardsman:disabled() then
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

		return [[
			Хочешь взять меч, но не получается...
		]];
	end;
}

-- Меч солдата Режима
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

-- Полуящер
half_reptile = obj {
	nam = 'Полуящер';
	dsc = [[
		Вдалеке у Тёмного проулка, забыв о сражении, лакомится мертвечиной {полуящер.}
	]];
	act = [[
		Ты внимательно смотришь на полуящера. Грубая зелёная кожа, шипы на спине,
		острые длинные когти, шакальи зубы.
		...
		Про рабов банд урук-хай.
	]];
}
