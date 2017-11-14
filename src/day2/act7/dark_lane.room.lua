dark_lane = room {
	nam = 'Тёмный переулок';
	dsc = [[
		Темно и ничего не видно.
	]];
	enter = function()
		if not have 'coldier_sword' then
			walk 'halfed_by_panglolin'
		end;
	end;
}

halfed_by_panglolin = room {
	nam = 'Game over';
	dsc = [[
		Полуящер тебя заметил и укусил. Пополам.
	]];
}
