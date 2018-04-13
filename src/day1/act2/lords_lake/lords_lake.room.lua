lords_lake = room {
	nam = 'Озеро';
	dsc = [[
		Местные предпочитают не вспоминать об этом озере. В своё время от Уорри
		тебе удалось узнать, что за пределами деревни люди рассказывают
		о нём множество небылиц. Самая интересная из них о морском народе.
		Вода в озере и правдо необычайно солёная, но для питья пригодна.
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
