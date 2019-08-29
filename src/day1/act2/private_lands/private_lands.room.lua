private_lands_to_lords_lands = vroom('Лордские угодья', 'lords_lands');
private_lands_to_lords_lands:disable();

private_lands_to_lords_lake = vroom('Озеро', 'lords_lake');
private_lands_to_lords_lake:disable();

private_lands = room {
	nam = 'У хижины лесника';
	dsc = [[
		Ты стоишь около хижины лесника. Лордская династия всегда отличалась богатством
		и хижина её слуги -- прекрасное тому доказательство: она украшена роскошной
		скульптурой оленя, небольшими колоннами и покрыта свежей краской. Правда,
		олень давно порос мхом и лишился своих ветвистых рогов, некоторые колонны уже
		лежат на земле, постепенно погружаясь в почву, а хижину лесник покрасил
		скорее от скуки, чем из эстетических чувств.
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
