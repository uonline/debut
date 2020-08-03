-- События
on_event('totems solved', function()
	wet_cave_to_afterparty:enable();
	objs('wet_cave_pit_room'):del('totem1');
	objs('wet_cave_pit_room'):del('totem2');
	objs('wet_cave_pit_room'):del('totem3');
	objs('wet_cave_pit_room'):del('totem4');
	totems:enable();
end)

-- Переменные
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

-- Функции
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
				протяжным высоким гулом. Из дальнего конца пещеры доносится скрежет камня.
				Твоё воображение рисует, как часть стены на месте завала отъезжает в сторону,
				открывая проход наружу. И похоже произошло именно это: в пещере становится
				заметно светлее.
				^
				Воодушевлённый, ты уже собираешься выбраться из ямы, но вновь раздавшийся голос
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

-- Локация
wet_cave_pit_room = room {
	nam = 'Сырая пещера';
	dsc = [[
		Темнота в яме накрывает тебя тяжёлым покрывалом.
		Ты не видишь ни что у тебя под ногами, ни что перед тобой.
		Где-то сверху просматриваются чёрные края ямы, выделяющиеся
		на сером фоне свода пещеры. Каждый твой шаг сопровождается
		омерзительным хрустом.
	]];
	obj = {
		'totem1';
		'totem2';
		'totem3';
		'totem4';
		'totems';
		'wet_cave_pit_exit';
	};
	entered = function()
		return [[
			Ты подходишь к краю ямы, чтобы лучше рассмотреть что за столбы там внизу.
			Они выглядят довольно странно, выкрашенные краской светящейся в темноте.
			Ведомый непонятным самому себе любопытством,
			ты начинаешь осторожно спускаться по пологому склону ямы.
			Внезапно у тебя под ногой раздаётся пронзительный хруст, и ты падаешь.
			В спину тут же впивается десяток иголок. Ты понимаешь, что упал на ковёр
			из костей, которые со стуком съезжают на дно ямы, увлекая тебя за собой.
			^
			Закончив спуск, ты встаёшь и озираешься вокруг.
		]];
	end;
}

-- Объекты
totem1 = obj {
	nam = 'Тотем Судьбы';
	dsc = [[
		^
		Перед тобой мерцают четыре деревянных тотема. {Первый тотем}
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

-- Тотемы
totems = obj {
	nam = 'Тотемы';
	dsc = [[
		^
		Перед тобой четыре тени {тотемов} едва различимые во мраке.
	]];
	act = [[
		Напрягая зрение ты рассматриваешь тотемы, но больше не можешь найти в них отличий.
		Краска и линии рисунков исчезли, обнажив чёрную гладкую древесину.
	]];
}
totems:disable()

-- Выбраться из ямы
wet_cave_pit_exit = obj {
	nam = 'Пещера';
	dsc = [[
		^
		Позади {склон ямы} усыпанный костями.
	]];
	act = function()
		walk 'wet_cave';
		return [[
			Кряхтя, ты медленно выбираешься из ямы, опасаясь наступить на острые костяные осколки.
		]];
	end;
}