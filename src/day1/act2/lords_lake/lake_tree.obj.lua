lake_tree = obj {
	nam = 'Дерево у озера';
	dsc = [[
		Рядом с тобой стоит {дерево}.
	]];
	act = [[
		Ты внимательно разглядываешь дерево. Это дуб -- старый, крепкий
		и довольно высокий.
	]];
	used = function(self, what)
		if what == mirror then
			event 'installed the mirror'
		end
	end;
}
