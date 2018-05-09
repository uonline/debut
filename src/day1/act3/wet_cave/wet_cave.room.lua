wet_cave_to_afterparty = vroom('Выход из пещеры', 'afterparty');
wet_cave_to_afterparty:disable();

on_event('totems solved', function()
	wet_cave_to_afterparty:enable()
end)

_totem_seq = {};
_totem_done = false;

local totem_hint = [[
	У основания тотема ты разобрал надпись:
	^
	"Сначала не было ничего. Потом было всё. То, чему суждено было плавать,
	плавало, и так было долго. Потом небеса разгневались, и огонь сжёг
	всех, кто остался. Тот, кто плавал, ступил на землю, чтобы заселить её
	вновь. Он смотрел в лицо грозе, но не ведал более ни страха, ни сомнений.
	Так появился первый из нас, чьего лица уже никто не вспомнит."
	^
	Ты осторожно прикасаешься к тотему. Тотем никак не реагирует.
]];

totem_touch = function(i)
	if _totem_done then
		return [[
			Ты прикладываешь амулет к тотему. Тотем тихо урчит в ответ.
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
				длинным высоким гулом. В дальнем конце пещеры часть стены
				отъезжает в сторону, открывая потайную дверь.
			]];
		else
			_totem_seq = {};
			return [[
				Ты прикладываешь амулет к тотему. Все четыре тотема отзываются
				коротким низким грохотом. Похоже, ты что-то сделал не так.
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
		Ты стоишь посреди пещеры. Ты не предполагал, что это возможно, но тут
		ещё темнее, чем в чаще. Вокруг летают какие-то привидения. Мимо тебя
		с воем проносится призрак коммунизма. На стене нарисованы лошади
		и собаки, поедающие клевер. Глубокий смысл этой картины заставляет
		тебя задуматься и растеряться.
	]];
	obj = {
		'goblin_junk';
		'goblin_bodies';
		'the_thing';

		'totem1';
		'totem2';
		'totem3';
		'totem4';
	};
	way = {
		wet_cave_to_afterparty;
	};
}

goblin_junk = obj {
	nam = 'Награбленное';
	dsc = [[
		Слева от тебя лежит {огромная куча всякого барахла} -- треснувшие
		щиты, шлемы, сломанные ножи, лук без тетивы, несколько крупных жёлтых
		камней, изорванное красно-белое знамя, увесистая дубовая дверь,
		колчан без стрел...
	]];
	act = [[
		Ты скептически рассматриваешь кучу. Вряд ли здесь найдётся что-то
		полезное.
	]];
}

goblin_bodies = obj {
	nam = 'Трупы';
	dsc = [[
		Справа лежит не такая большая, но тоже впечатляющая куча
		{человеческих скелетов}.
	]];
	act = [[
		Бр-р-р.
	]];
}

totem1 = obj {
	nam = 'Тотем воздуха';
	dsc = [[
		^
		В центре комнаты стоят четыре деревянных тотема. {Первый тотем}
		выкрашен синей краской, на нём очень грубой кистью нарисована
		птица, пролетающая мимо чёрного облака.
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
	nam = 'Тотем огня';
	dsc = [[
		{Второй тотем} красного цвета. На нём нельзя разобрать ничего
		конкретного, но он весь покрыт замысловатым узором из линий.
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
	nam = 'Тотем земли';
	dsc = [[
		{Третий тотем} покрыт зелёной краской, на нём изображены деревья
		и скалы.
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
	nam = 'Тотем воды';
	dsc = [[
		Наконец, {четвёртый тотем} покрыт синей краской, как и первый,
		но, в отличие от него, на нём изображена зубастая рыбина и ещё
		какое-то существо, похожее на медузу.
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
