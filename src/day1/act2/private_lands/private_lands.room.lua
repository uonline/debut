private_lands_to_lords_lands = vroom('Лордские угодья', 'lords_lands');
private_lands_to_lords_lands:disable();

private_lands_to_lords_lake = vroom('Озеро', 'lords_lake');
private_lands_to_lords_lake:disable();

private_lands = room {
	nam = 'У хижины лесника';
	dsc = [[
		На Линаре шикарные плюхи размером с большую печать, на Лаше охерительно
		нюхать, на Миритале лучше торчать, а на Каторе -- пить, на Каторе пить,
		на Каторе-торе пить.
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
