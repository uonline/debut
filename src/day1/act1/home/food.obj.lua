food = obj {
	nam = 'Еда';
	dsc = [[
		На столе тебя ждёт {еда}.
	]];
	tak = function()
		event 'food taken'
		return [[
			Ты делаешь изрядный глоток воды из фляги и слышишь гул живота
			в ответ. Кажется, он намекает, что ты откладывал охоту
			слишком долго. На пустой желудок проще бегать, думаешь ты
			и примирительно похлопываешь по животу. Но тот не унимается.
			^
			Пожевав полоску вяленого мяса, ты складываешь еду в рюкзак.
		]]
	end;
	inv = [[
		Ты мысленно подсчитываешь свои скромные запасы на сегодняшний день:
		пара полосок вяленого мяса, фляга воды да несколько яблок.
	]];
}

on_event('food taken', function()
	_hunt_food = true;
	if not have 'hunting_gear' and not have 'journal' and not _leaved_items then
		-- Включаем диалог у старейшины
		elder_dlg:pon('some_food_subject');
	end;
end)
