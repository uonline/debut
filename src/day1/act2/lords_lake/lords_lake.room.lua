lords_lake = room {
	nam = 'Озеро';
	dsc = [[
		Ты стоишь у зеркальной глади озера и размышляешь о вечном. Например,
		почему котировки оленьих шкур на фондовой бирже подвержены сильным
		флуктуациям в вечернее время.
	]];
	obj = {
		'lake_tree';
		'guards';
	};
	way = {
		'private_lands';
	};
}

on_event('installed the mirror', function()
	objs('lords_lake'):del('lake_tree');
	objs('lords_lake'):add('lake_tree_mirror');
end);

on_event('passed the guards', function()
	objs('lords_lake'):add('artist');
end);
