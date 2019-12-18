-- События
on_event('freedom for black bird', function()
	-- Освобаждаем чёрную птицу
	objs('tower_stage4_sentry'):add('sentry_black_bird');
end)

-- Локация
tower_stage4_sentry = room {
	nam = 'Караульная';
	dsc = [[
		Отсюда весь город как на ладони. Вы видите как стаи испуганных птиц взлетают
		из леса за стенами города и чувствуете смутную угрозу. Похоже сюда давно никто
		не заходил, или напротив, отсюда убегали в спешке: на крохотном столике черствеет
		ломоть хлеба, гниёт надкусанное яблоко.
	]];
	obj = {
		'tower_spyglass_paper';
		--'tower_key';
		'tower_spear';
		'tower_broken_spyglass';
	};
	way = {
		vroom('Назад', 'tower_stage4');
	};
}

-- Объекты локации
tower_spyglass_paper = obj {
	nam = 'Прошение на подзорную трубу';
	dsc = [[
		Под хлебом {какая-то бумага}.
	]];
	tak = function()
		event 'got spyglass paper'
		return [[
			Под бумагой обнаружился ключ.
		]]
	end;
}

tower_key = obj {
	nam = 'Ключ';
	dsc = [[
		Под бумагой лежит {ключ}.
	]];
	tak = [[
		???
	]];
}

tower_spear = obj {
	nam = 'Копьё';
	dsc = [[
		Рядом стоит {копьё}.
	]];
	tak = [[
		Длинное, тяжёлое. Правда тупое.
	]];
}

tower_broken_spyglass = obj {
	nam = 'Разбитая подзорная труба';
	dsc = [[
		На полу валяется {разбитая подзорная труба}.
	]];
	act = [[
		Похоже, её уронили со стола.
	]];
}

-- Чёрная птица
-- Появляется, если игрок расколдует и разобъёт скелет на втором этаже башни
sentry_black_bird = obj {
	nam = 'Странная птица';
	dsc = [[
		{Странная птица}...
	]];
	act = function()
		walk 'sentry_black_bird_dlg';
	end;
}
