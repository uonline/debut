the_thing = obj {
	nam = 'Амулет';
	dsc = [[
		Среди костей {что-то призывно поблескивает}.
		Ты ловишь себя на мысли, что уже видел нечто подобное совсем недавно...
	]];
	inv = [[
		Ты внимательно осматриваешь драгоценность. Кость из которой выполнен
		миниатюрный карлик, неожиданно красуется металлическими бликами.
		Драгоценный камень у него в руках то и дело пульсирует тусклым сиянием.
		Ты начинаешь подозревать, что эта вещь имеет магическую природу.
	]];
	tak = function()
		return [[
			Ты наклоняешься ближе, чтобы убедиться, что это не морок. Блеск не исчезает --
			напротив, кажется, что он усиливается. У тебя в руке оказывается странная вещица,
			явно драгоценная, похожая на амулет или оберег -- маленькая фигурка карлика,
			искусно изготовленная скорее всего из кости. В руках человечка поблескивает
			неизвестный тебе драгоценный камень. Кажется, что он вот-вот оживёт,
			спрыгнет с ладони и убежит прочь. Видимо во избежание этого вокруг его
			шеи обвит шнурок амулета.
			^
			Какое-то время ты терзаешься сомнениями, после чего драгоценность отправляется за пазуху.
		]];
	end;
}
