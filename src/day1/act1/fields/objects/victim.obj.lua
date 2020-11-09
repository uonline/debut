-- Переменная
_seen_victim = false;

-- Труп во дворе Уорри
victim = obj {
	nam = 'Труп';
	dsc = [[
		^
		Позади дома Уорри высится старый могучий дуб.
		Дерево странным образом привлекает твоё внимание.
		Кажется, за ним {кто-то есть}.
	]];
	act = function()
		if not _seen_victim then
			_seen_victim = true;
			event 'found the body';
			objs('fields'):del('victim');
			hanged_man:enable();
		end;

		return [[
			Old text^
			Ты молча проходишь мимо крыльца и Уорри. Хозяин дома усмехается. Ты подходишь
			к дубу и медленно обходишь его, чтобы через секунду отшатнуться. Прислонившись
			к стволу спиной, у дерева сидит труп с низко опущенной головой. Но тебе и не нужно
			смотреть ему в лицо, чтобы понять -- человек тебе не знаком.
		]];
	end;
}

-- Висящий труп
hanged_man = obj {
	nam = 'Висельник';
	dsc = [[
		^
		Висит {неизвестный}.
	]];
	act = [[
		...
	]];
	used = function(self, what)
		if what == your_dagger then
			take 'rope';
			objs('fields'):del('hanged_man');
			lying_man:enable();
			return [[
				Забравшись на дерево, ты разрезаешь верёвку...
			]];
		end;
	end;
}
hanged_man:disable()

-- Лежащий труп
lying_man = obj {
	nam = 'Тело';
	dsc = [[
		^
		{Тело} под деревом...
	]];
	act = [[
		Неизвестный...
	]];
}
lying_man:disable()
