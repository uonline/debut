portrait = obj {
	nam = 'Портрет дочери лорда';
	inv = [[
		Ты внимательно разглядываешь портрет и чувствуешь, как начинает
		шевелиться совесть.
	]];
}

on_event('photographed the princess', function()
	inv():add('portrait');
end);
