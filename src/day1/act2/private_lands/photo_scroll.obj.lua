photo_scroll = obj {
	nam = 'Свиток заклятья';
	inv = [[
		Ты раскрываешь свиток и окидываешь беглым взглядом.
		Пергамент испещерён странными символам, составленными в необычный рисунок
		правильных геометрических форм. Посмотрев чуть дольше, ты
		с удивлением осознаёшь, что можешь прочитать начертанное, хоть смысл
		и остаётся для тебя загадкой. Ты поспешно скручиваешь свиток, когда
		видишь как несколько символов зашевелились. В груди странное жжение.
	]];
}

on_event('promised tits', function()
	inv():add('photo_scroll');
end);

on_event('photographed the princess', function()
	inv():del('photo_scroll');
end);
