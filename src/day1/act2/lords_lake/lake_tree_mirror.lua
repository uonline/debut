lake_tree_mirror = obj {
	nam = 'Дерево у озера';
	dsc = [[
		Рядом с тобой стоит дерево. Высоко в его ветвях установлено зеркало.
		В зеркале видно {отражение принцессы}.
	]];
	act = [[
		И тебе очень нравится то, что ты видишь.
	]];
	used = function(self, what)
		if what == photo_scroll then
			event 'photographed the princess';
			return [[
				Собравшись и придав лицу максимально серьёзное выражение,
				ты зачитываешь свиток. Паф! На землю падает холст, на котором
				запечатлена дочь лорда во всей её бесстыжей красе.
			]];
		end
	end;
}
