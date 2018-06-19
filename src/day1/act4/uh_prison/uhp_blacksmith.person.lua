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
		Под глазом красуется здоровенный синяк. Волосы всклокочены.
	]];
	phr = {
		{
			tag = 'wassup';
			true;
			'Уже придумал план побега?';
			[[
				-- Очень смешно.
				-- Я серьёзно. Я немного знаю этих парней.
				Кто-то хочет кого-то убить. Кто-то
				метит на место другого. Некоторые даже считают
				себя более крутым Начальником. Слышал,
				что-то подобное пока сидел здесь?
				^
				Кузнец морщится и озирается по сторонам.
				^
			    -- Я знаю что большая часть банды сейчас
			    в другом месте. Но их главарь здесь. Ждёт
			    здесь кого-то. Типа встречи.
			    -- Встречи? И это нравится не всем?
			    -- ...
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
				Это должна быть жетокая история?
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
