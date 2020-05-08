-- Локация
scaffold = room {
	nam = 'Эшафот';
	dsc = [[
		Итак, тебя поймали и приговорили к смерти. Это всегда хорошее начало дня.
		^
		TODO
		Ты осознаешь, что капитан выполнил уговор с лордами не совсем точно.
		Он заплатил оркам, чтобы они <b>захватили</b> город, а не брали в осаду.
		Для этого он саботировал силы Режима в городе и протащил сюда главаря
		банды орков и открыл ворота перед бандой. Капитан самолично
		предал этот город огню. По всему выходило, что ты способствовал этому.
	]];
	obj = {
		'scaffold_crown';
		'scaffold_guards';
		'scaffold_propagandist_and_singer';
		'scaffold_propagandist';
		'scaffold_singer';
		'scaffold_priest';
		'scaffold_godchosen';
	};
	entered = function()
		-- Clear inventory, add whitelisted items
		inv():zap();
	end;
}

-- Объёкты локации
-- Толпа
scaffold_crown = obj {
	nam = 'Толпа';
	dsc = [[
		{Толпа}.
	]];
	act = function()
	end;
}

-- Стражники
scaffold_guards = obj {
	nam = 'Стражники';
	dsc = [[
		{Городская стража}.
	]];
	act = function()
	end;
}

-- Глашатай и менестрель
scaffold_propagandist_and_singer = obj {
	nam = 'Глашатай Благих и менестрель';
	dsc = '';
	act = function()
		-- Выключаем обратный отсчёт действий на эшафоте

		
		return [[
			-- И вы здесь...
			^
			-- А как же, ему нужно действо, нужно отвлечь внимание.
			^
			-- О чём ты?
			^
			-- О капитане конечно. У подполья есть свои люди в гарнизоне. Но и у капитана тоже.
			Он развалил войска Режима, но всех способных солдат привлёк на свою сторону. Он переиграл
			подполье. Он всё знает. Сейчас его люди открывают ворота оркам, а мы здесь отвлекаем
			внимание. Когда банда будет в городе, будет уже поздно. К тому же мы слишком много знаем.
		]];
	end;
}

-- Менестрель
scaffold_singer = obj {
	nam = 'Менестрель';
	dsc = [[
		{Менестрель}.
	]];
	act = function()
	end;
}
scaffold_singer:disable();

-- Глашатай Благих
scaffold_propagandist = obj {
	nam = 'Глашатай Благих';
	dsc = [[
		{Глашатай}.
	]];
	act = [[
	]];
}
scaffold_propagandist:disable();

-- Проповедник
scaffold_priest = obj {
	nam = 'Проповедник';
	dsc = [[
		{Проповедник}
	]];
	act = function()
		return [[
			^TODO
			* Настоящие боги этого мира это идеи. Эти сушества симбионты немыслимы без людей,
			но и люди не способны жить без них. Идеи способны бесконечно перерождаться, сквозь века.
			Их мессии-проводники: люди искусства, философы, ученые. Люди их плоть и кровь,
			они сражаются между собой за носителей;
			* Проповедник на эшафоте;
		]];
	end;
};
scaffold_priest:disable();

-- Кевраза
scaffold_godchosen = obj {
	nam = 'Богоизбранный Кевраза';
	dsc = [[
		{Богоизбранный} рядом с ним стоит важный городской глашатай.
	]];
	act = function()
		event 'the end in scaffold';
	end;
};

-- События локации
on_event('caught in action', function()
	walk 'scaffold';
end)

-- Концовка на эшафоте
on_event('the end in scaffold', function()
	walk 'the_end_in_scaffold';
end)
