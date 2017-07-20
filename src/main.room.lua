main = room {
	nam = 'Стартовый экран';
	dsc = [[
		TODO TODO TODO TODO
	]];
	way = {
		vroom('Начать игру', 'home');
		vroom('D1A2', 'forest_edge');
		vroom('D1A3', 'lords_lands');
		vroom('D1A4', 'uh_prison');
		vroom('D1A5', 'uh_maintent');
		vroom('D1A6', 'tract_camp');
		vroom('D2A1', 'your_cell');
		vroom('D2A2 (без крысы)', 'barracks_hall');
		vroom('D2A3', 'regimenstrasse');
	};
}
