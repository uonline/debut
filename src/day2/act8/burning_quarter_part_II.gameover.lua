burning_quarter_part_II_gameover = room {
	nam = 'Игра окончена';
	dsc = [[
		Темнота более не отпускает тебя.
	]];
	enter = function()
		inv():zap()
	end;
}
