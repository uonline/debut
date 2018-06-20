uhp_blacksmith = obj {
	nam = 'Кузнец';
	dsc = [[
		Оставшуюся половину клетки занимает мрачный {кузнец}. Вид у него поникший.
	]];
	act = function()
		walk 'uhp_blacksmith_dlg'
	end;
}

uhp_blacksmith_dlg = dlg {
	nam = 'Кузнец';
	hideinv = true;
	entered = [[
		Кузнец хмуро смотрит на тебя. Он выглядит изрядно помятым.
		Под глазом красуется чёрный синяк. Волосы всклокочены.
		Похоже, прежде чем попасть в клетку, кузнец развлекал
		орков кулачными боями.
	]];
	phr = {
		{
			tag = 'wassup';
			true;
			'Уже придумал план побега?';
			[[
				-- Очень смешно.
				-- Серьёзно. Я немного знаю этих парней.
				Крутые воины ищут драки с ещё более крутыми
				воинами. Им бы просто преубивать друг друга,
				но даже у орков есть кое-какие амбиции.
				^
				Кузнец кривит рот толи от боли, толи от
				твоих речей.
				^
				-- Каждый из них лелет мечту, возглавить собственную
				банду. А кого-то к тому же может просто не устраивать
				нынешний главарь. Слышал, что-то подобное пока сидел здесь?
				^
				Кузнец озирается по сторонам. Ты понимаешь, что по голове
				ему настучали хорошо. В конце концов кузнец подзывает тебя
				поближе.
				^
			    -- Я знаю, -- хриплым голосом начинает он, --
			    что большая часть банды сейчас в другом месте. Здесь что-то
			    вроде передового отряда. Но главарь тоже с здесь.
			    Не знаю зачем им наша деревня, но я слышал, что
			    не всем это нравится.
			    ^
			    -- Если главарь оставил банду, значит самых опасных он
			    взял с собой, чтобы держать рядом. А те в свою очередь мечтают
			    вернуться с его головой.
			    ^
			    -- Что нам-то от этого.
			    ^
			    -- ...
			    ^
			    -- Посмотри на нашего сторожа. Наверняка метит на место главаря.
			    ^
   				-- Пока ты ковал мечи, я ими махал...
   				Хватило, чтобы больше не встревать
   				в такие авантюры;
			]];
			function()
				event 'knows about plot';
			end;
		};
		{
			tag = 'prepare_your_anus';
			false;
			'[начать драку]';
			[[
				...Это должна быть жетокая история?
			]];
			function()
				_beaten_blacksmith = true
				event 'blood was spilled'
			end;
		};
		{
			always = true;
			'Крепись, как-нибудь выпутаемся.';
			'Кузнец не отвечает.';
			function()
				back()
			end;
		};
	};
}

on_event('orc wants blood', function()
	uhp_blacksmith_dlg:pon('prepare_your_anus');
end)

on_event('blood was spilled', function()
	uhp_blacksmith_dlg:poff('wassup');
end)
