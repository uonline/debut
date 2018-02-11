private_lands_to_lords_lands = vroom('Лордские угодья', 'lords_lands');
private_lands_to_lords_lands:disable();

private_lands_to_lords_lake = vroom('Озеро', 'lords_lake');
private_lands_to_lords_lake:disable();

private_lands = room {
	nam = 'У хижины лесника';
	dsc = [[
		Ты стоишь около хижины лесника. Лорд -- богатый человек, и хижина его
		слуги служит прекрасным тому напоминанием: она украшена скульптурой,
		небольшими колоннами и покрыта свежей краской.
	]];
	way = {
		'forest_edge';
		private_lands_to_lords_lands;
		private_lands_to_lords_lake;
	};
	obj = {
		'forester';
	};
}

on_event('pleased the forester', function()
	private_lands_to_lords_lands:enable();
end);

on_event('promised tits', function()
	private_lands_to_lords_lake:enable();
end);
