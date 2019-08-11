wet_cave_to_afterparty = vroom('Выход из пещеры', 'afterparty');
wet_cave_to_afterparty:disable();

on_event('totems solved', function()
	wet_cave_to_afterparty:enable();
	objs('wet_cave'):del('totem1');
	objs('wet_cave'):del('totem2');
	objs('wet_cave'):del('totem3');
	objs('wet_cave'):del('totem4');
	objs('wet_cave'):add('totems');
end)

_totem_seq = {};
_totem_done = false;

local totem_hint = [[
	Ты прикасаешься к тотему, и тишину пещеры разрезает скрипучий визгливый голос.
	Звук эхом отскакивает от стен, каждый раз ударяя с новой стороны. Тебе остаётся
	лишь с растерянностью и страхом озираться по сторонам и вслушиваться
	в дёрганую интонацию голоса со странным акцентом:
	^
	"Скользкий <b>Червь</b> скользит во тьме,
	^
	поёт песни темноте,
	^
	поживиться он решил
	^
	пищей солнечных светил,
	^
	^
	Но в тиши запретных мест
	^
	точит крюк коварный Перст,
	^
	Он мечтой живёт одной --
	^
	<b>указать</b> судьбе покой,
	^
	^
	Ловкой хваткой у <b>огня</b>
	^
	он возьмёт за хвост Червя,
	^
	чтобы бросить в жернова,
	^
	новой Смуте дар внеся,
	^
	^
	Расползается огонь,
	^
	порождает свет и боль,
	^
	но сгущается в ответ
	^
	покрывало <b>тьмы</b> и бед,
	^
	^
	Кто сумеет сквозь века
	^
	разгадать судьбу Червя..."
	^
	^
	Ты некоторое время не можешь прийти в себя, хотя голос уже умолк.
	Из этой бессмыслицы ты не понял ровном счётом ничего, но каждое слово
	намертво впечаталось тебе в память.
]];

totem_touch = function(i)
	if _totem_done then
		return [[
			Ты прикладываешь амулет к тотему. В ответ раздаётся пугающий шёпот.
			Лучше уйти отсюда поскорее.
		]];
	end

	table.insert(_totem_seq, i);
	if table.maxn(_totem_seq) == 4 then
		local valid = true;
		if _totem_seq[1] ~= 4 then valid = false end
		if _totem_seq[2] ~= 2 then valid = false end
		if _totem_seq[3] ~= 3 then valid = false end
		if _totem_seq[4] ~= 1 then valid = false end
		if valid then
			_totem_done = true;
			event('totems solved');
			return [[
				Ты прикладываешь амулет к тотему. Все четыре тотема отзываются
				длинным высоким гулом. В дальнем конце пещеры на месте завала часть стены
				отъезжает в сторону, открывая проход наружу. В пещере становится светлее.

				Воодушевлённый, ты уже направляешься к выходу, но вновь раздавшийся голос
				заставляет тебя замереть:
				^
				"Червь нанизан на крючок,
				^
				впереди лишь омут вод."
			]];
		else
			_totem_seq = {};
			return [[
				Ты прикладываешь амулет к тотему. Откуда-то из тоннеля до тебя доносится
				приглушённый смех. Ты с силой мотаешь головой, и смех пропадает.
				Ты всё ещё в пещере и без возможности выбраться.
			]];
		end
	else
		return [[
			Ты прикладываешь амулет к тотему. Тотем коротко вздрагивает.
		]];
	end
end

wet_cave = room {
	nam = 'Сырая пещера';
	dsc = [[
		Ты очнулся после падения. На секунду тебе кажется, что ты лежишь на
		дне того самого колодца в деревне. Стук крови в висках -- единственное,
		что ты пока слышишь. Ты медленно встаёшь на ноги, попутно проверяя,
		все ли кости целы.
		^
		Тебе в нос бьёт затхлый запах.
		Ты стоишь посреди просторной сырой пещеры и ждёшь, пока глаза привыкнут
		к темноте. Удары пульса в голове сменяются ударами капель воды о
		что-то металлическое. Сверху между корявых влажных корней деревьев
		пробивается слабый дневной свет.
		^
		Напрягая зрение, ты как-то осматриваешься вокруг.
	]];
	obj = {
		'the_goblins_story';
		'goblin_junk';
		'goblin_bodies';
		'the_thing';
		'the_tonnels';

		'totem1';
		'totem2';
		'totem3';
		'totem4';
	};
	way = {
		wet_cave_to_afterparty;
	};
}

the_tonnels = obj {
	nam = 'Тоннели';
	dsc = [[
		^
		Стены пещеры (в тех местах, где на них не растёт лишайник)
		покрыты грубыми рисунками. Многие из них изображают что-то
		несуразное, но попадаются и такие, где можно увидеть мелких человечков,
		занимающихся охотой, войной или жертвоприношениями. В некоторых
		местах стены зияют проходы {тоннелей}. Но все они завалены крупными
		булыжниками.
	]];
	act = [[
		Почуяв дуновение ветерка, ты идёшь к одному из завалов
		и пробуешь толкнуть валун побольше. Безнадёжно.
	]];
}

the_goblins_story = obj {
	nam = 'Байка о гоблинах';
	dsc = [[
		Пещера выглядит странным образом обжитой. Вот в кругу покрытых копотью камней
		пятно от костра. В кострище в горе золы и угля несколько особенно чёрных
		валунов. Присмотревшись получше, ты узнаёшь в них обугленные черепа. Неподалёку
		от костра разложены шкуры каких-то животных -- по крайней мере, ты уверяешь себя
		в том, что это были животные. Всюду беспорядочно раскидан какой-то скарб:
		мешки, выпотрошенные сумки, ржавое оружие, древки стрел и копий.
		^
		На ум тебе приходит очередная {байка} о местных пещерах.
	]];
	act = [[
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

totem1 = obj {
	nam = 'Тотем Судьбы';
	dsc = [[
		^
		В центре пещеры стоят четыре деревянных тотема. {Первый тотем}
		покрыт белой краской. На нём изображено что-то вроде огромного чёрного
		ока или бездонной пропасти.
	]];
	act = function()
		return totem_hint;
	end;
	used = function(self, what)
		if what == the_thing then
			return totem_touch(1);
		end;
	end;
}

totem2 = obj {
	nam = 'Тотем Перста';
	dsc = [[
		{Второй тотем} покрыт зелёной краской, на нём изображена длинная тень,
		похожая на человека в плаще. Вокруг нарисовано множество силуэтов. Их взгляды
		направлены в сторону, которую указывает тень.
	]];
	act = function()
		return totem_hint;
	end;
	used = function(self, what)
		if what == the_thing then
			return totem_touch(2);
		end;
	end;
}

totem3 = obj {
	nam = 'Тотем Смуты';
	dsc = [[
		{Третий тотем} красного цвета. На нём нельзя разобрать ничего
		конкретного, но он весь покрыт замысловатым узором из линий.
	]];
	act = function()
		return totem_hint;
	end;
	used = function(self, what)
		if what == the_thing then
			return totem_touch(3);
		end;
	end;
}

totem4 = obj {
	nam = 'Тотем Червя';
	dsc = [[
		Наконец, {четвёртый тотем} покрыт белой краской, как и первый,
		но, в отличие от него, на нём изображена маленькая фигурка какого-то
		карлика, крадущегося среди деревьев.
	]];
	act = function()
		return totem_hint;
	end;
	used = function(self, what)
		if what == the_thing then
			return totem_touch(4);
		end;
	end;
}

totems = obj {
	nam = 'Тотемы';
	dsc = [[
		^
		В центре пещеры по прежнему стоят четыре деревянных {тотема}.
	]];
	act = [[
		Ты рассматриваешь тотемы, но больше не можешь найти в них отличий.
		Краска и линии рисунков исчезли, оставив чёрную гладкую древесину.
	]];
}
