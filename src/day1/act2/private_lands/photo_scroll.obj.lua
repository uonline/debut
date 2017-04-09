photo_scroll = obj {
	nam = 'Свиток фотозаклятья';
	inv = [[
		Прочитай этот свиток -- и меньше чем через секунду ты получишь картину,
		на которой будет изображено всё, что ты видел в этот момент. И где
		лесник его только достал?
	]];
}

on_event('promised tits', function()
	inv():add('photo_scroll');
end);

on_event('photographed the princess', function()
	inv():del('photo_scroll');
end);
