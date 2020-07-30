wet_cave_to_afterparty = vroom('Выход из пещеры', 'afterparty');
wet_cave_to_afterparty:disable();

wet_cave = room {
	nam = 'Сырая пещера';
	dsc = [[
		Ты стоишь посреди просторной сырой пещеры.
		Сверху между корявых влажных корней деревьев пробивается слабый дневной свет.
		Напрягая зрение, ты кое-как осматриваешься вокруг.
	]];
	obj = {
		'wet_cave_fire';
		'the_goblins_story';
		'goblin_junk';
		'goblin_bodies';
		'the_thing';
		'wet_cave_pictures';
		'the_tonnels';
		'wet_cave_pit';
	};
	way = {
		wet_cave_to_afterparty;
	};
}

-- Костёр
wet_cave_fire = obj {
	nam = 'Костёр';
	dsc = [[
		Пещера выглядит странным образом обжитой. Вот в кругу покрытых копотью камней
		пятно от {костра}. Вокруг беспорядочно раскидан какой-то скарб:
		мешки, выпотрошенные сумки, ржавое оружие, древки стрел и копий.
	]];
	act = function()
		the_goblins_story:enable()
		return [[
			Ты осматриваешь кострище. В горе золы и угля несколько особенно чёрных
			валунов. Присмотревшись получше, ты узнаёшь в них обугленные черепа. Неподалёку
			от костра разложены шкуры каких-то животных -- по крайней мере, ты уверяешь себя
			в том, что это были животные.
		]];
	end;
}

the_goblins_story = obj {
	nam = 'Байка о гоблинах';
	dsc = [[
		^
		На ум тебе приходит очередная {байка} о местных пещерах.
	]];
	act = [[
		Ты роешься в памяти.
		Да-да. Ты определённо кое-что слышал об этих местах ещё до того как
		поселился в деревне. В народе ходят легенды о том, что в далёкой древности --
		до того, как нога человека ступила на эти земли -- Приграничье и всё, что лежит
		к югу от него, принадлежало мерзопакостному народцу гоблинов.
		С тех пор люди много раз пытались истребить его. Но, подобно тараканам,
		гоблины всегда возвращались. Некоторые верят, что племена гоблинов приходят
		из-под земли, что их пещеры ведут в недра тверди. И хотя глашатаи Режима
		Ремана громогласно заявляют, что очистили мрачные южные леса от этой
		нечисти, в Приграничье время от времени находят свежие следы этих созданий.
		Сегодня, видимо, такой след нашёл ты.
	]];
}
the_goblins_story:disable()

goblin_junk = obj {
	nam = 'Награбленное';
	dsc = [[
		^
		Рядом с тобой лежит {огромная куча всякого барахла} -- треснувшие
		щиты, ржавые шлемы, сломанные ножи, лук без тетивы, несколько крупных
		камней, смахивающих на самородки, изорванное красно-белое знамя,
		увесистая дубовая дверь, выщербленная
		и утыканная обломками стрел, пустой колчан...
	]];
	act = [[
		Ты пару раз нехотя пинаешь кучу ногой. Стук воды о металл прекращается.
		Пожалуй, это самое полезное, что можно сделать.
	]];
}

goblin_bodies = obj {
	nam = 'Трупы';
	dsc = [[
		Неподалёку от первой -- {ещё одна куча}, уже не такая большая, но тоже впечатляющая.
		Похоже, это сваленные друг на друга истлевшие скелеты животных.
	]];
	act = [[
		Ты нагибаешься над грудой костей, чтобы рассмотреть её поближе.
		В нос бьёт неприятный запах, и твои опасения насчёт хозяев
		этой пещеры подтверждаются. Кости скелетов выглядят обглоданными,
		в некоторых из них ты опознаёшь человеческие.
	]];
}

-- Рисунки
wet_cave_pictures = obj {
	nam = 'Рисунки';
	dsc = [[
		^
		Стены пещеры (в тех местах, где на них не растёт лишайник)
		покрыты грубыми {рисунками}.
	]];
	act = [[
		Ты рассматриваешь рисунки. Многие из них изображают что-то
		несуразное, но попадаются и такие, где можно увидеть мелких человечков,
		занимающихся охотой, войной или жертвоприношениями.
	]];
}

-- Тоннели
the_tonnels = obj {
	nam = 'Тоннели';
	dsc = [[
		Кое-где виднеются очертания проходов {тоннелей}.
		Но все они завалены крупными булыжниками.
	]];
	act = [[
		Почуяв дуновение ветерка, ты идёшь к одному из завалов
		и пробуешь толкнуть валун побольше. Безнадёжно.
	]];
}

-- Яма
wet_cave_pit = obj {
	nam = 'Яма';
	dsc = [[
		В центре пещеры зияет просторная {яма}, на дне которой виднеется
		четыре небольших столба.
	]];
	act = function()
		walk 'wet_cave_pit_room';
	end;
}
