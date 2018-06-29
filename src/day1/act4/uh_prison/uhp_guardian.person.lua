uhp_guardian = obj {
	nam = 'Охранник';
	dsc = [[
		^
		Вокруг клеток вышагивает здоровенный {урук-охранник}. Время от
		времени он со скучающим видом заглядывает в какую-нибудь из них.
	]];
	act = function()
		walk 'uhp_guardian_dlg'
	end;
}

uhp_guardian_dlg = dlg {
	nam = 'Охранник';
	hideinv = true;
	entered = [[
		-- Чего таращишься, задохлик? -- урук ловит твой взгляд и подходит к клетке.
		Урук выглядит неповоротливой горой мышц, забрало шлема опущено,
		закрывая половину лица. В узких прорезях тлеют угольки-глаза.
		Тяжёлое дыхание грозит сбить тебя с ног.
		^
		Ты рад, что между вами решётка.
	]];
	phr = {
		{
			tag = 'i_want_food';
			true;
			'Эй, а пленникам положено есть?';
			[[
				-- Почему бы тебе не полакомиться собственными кишками? -- с улыбкой отвечает
				охранник, хищно обнажая клыки.
			]];
			function()
				walk 'orcslaughter';
			end;
		};
		{
			tag = 'wassup_man';
			true;
			'Такой свирепый воин, а обхаживает кучку задохликов. Охота поди потешить себя хорошей дракой?';
			[[
				-- Ха! Неужто косточка, зовёт урук на бой?! -- усмехается охранник.
				^
				-- Открой клетку и узнаешь.
				^
				-- Узнаю, как быстро задохлики бегают по лесам? -- с хитрецой в голосе
				отзывается орк, но тут же поправляется, -- хотя знаешь, немного размяться
				этим ленивым толстозадам не помешает. Не всё же им по шатрам сидеть, да
				мечи надраивать. Кха!
				^
				Охранник заходится приглушённым смехом.
				^
				-- Урук-хай выпустит тебя, попастись в поле, овечка.
				Ему будет интересно посмотреть, сколько ты протянешь, -- необычайно
				вкрадчивым голосом вещает орк, --
				но для начала покажи себя воином. Воином достоиным
				этой маленькой и короткой свободы.
				^
				Урук нагибается и заглядывает тебе в лицо, обдавая смрадным дыханием.
				Ты морщишься, но от решётки не отходишь. Вы смотрите друг на друга,
				пока ты не заходишься в приступе кашля.
				^
				Скаля зубы, урук выпрямляется.
				^
				-- Побейка для начала, того задохлика-здоровяка, --
				палец-дубина тычет в кузнеца, -- чтобы я убедился, что
				твой "побег" хотя бы будет интересным.
			]];
			function()
				event 'orc wants blood';
			end;
		};
		{
			tag = 'ok_go';
			false;
			'Ну как, я достойный воин?';
			[[
				Урук презрительно фыркает.
				^
				-- Обезьяна -- не воин. Ни крови, ни борьбы, -- ты слышишь как позади,
				стонет кузнец. Похоже, пришёл в себя, -- но урук сдержит своё слово.
				^
				Откуда-то из карманов на массивном поясе урук извлекает ключ. Пара поворотов
				и клетка открывается.
				^
				-- Вот твоя свобода, овечка. Развлеки урук-хай как следует, -- охранник
				прячет ключ обратно, -- ну и своих дружков, а то они совсем приуныли.
				^
				Орк заходится смехом.
			]];
			function()
				event 'may leave prison';
			end;
		};
		{
			tag = 'gunpowder_treason_and_plot';
			false;
			'Эй, а кто тут у вас главный?';
			[[
				-- Для тебя главный я, задохлик.
				^
				-- А для урук-хай?
				^
				-- Узнаешь у них сам, -- урук выхватил
				из-за пояса огромный нож и просунул клинок между прутьев,
				-- когда я принесу им твой язык.
				^
				-- Спокойно-спокойно. Я всего лишь хотел сказать, что по-началу
				принял тебя за главаря, потому и спросил.
				^
				-- Я только показал тебе нож. А ты уже ходишь по его лезвию, косточка,
				-- оскалился урук.
				^
				-- Я бы с радостью прошёлся. Где-нибудь за пределами этой клетки, --
				ты отвечаешь на оскал улыбкой, -- Перерезал бы пару орочьих глоток.
				^
				Охранник расхохотался. Ты гадаешь откуда в тебе столько смелости.
				^
				-- А ты занятный, задохлик, -- отдышавшись прорычал орк, --
				если так хочется на свободу -- достаточно перерезать всего-то
				одну орочью глотку.
				^
				Ты вопросительно смотришь на него.
				^
				-- Мою, -- с усмешкой бросает орк, но добавляет, -- или глотку главаря.
				^
				-- Урук-хай наскучил их вождь?
				^
				-- Не забивай свою головку, косточка. Ты меня повеселил. Я хочу продолжения.
				^
				Откуда-то из карманов на массивном поясе урук извлекает ключ. Пара поворотов
				и клетка открывается.				
				^
				-- Иди пройдись за пределами клетками, как ты мечтал.
				^
				Ты смотришь на других пленников.
				^
				-- Врядли, твои дружки разделяют это желание.
				^
				Орк заходится смехом.
			]];
			function()
				event 'may leave prison';
			end;
		};
		{
			always = true;
			'[отвернуться от решётки]';
			'Урук уходит.';
			function()
				back()
			end;
		};
	};
}

on_event('knows about plot', function()
	uhp_guardian_dlg:pon('gunpowder_treason_and_plot');
end)

on_event('blood was spilled', function()
	uhp_guardian_dlg:pon('ok_go');
end)

on_event('may leave prison', function()
	uhp_guardian_dlg:poff('i_want_food');
	uhp_guardian_dlg:poff('wassup_man');
	uhp_guardian_dlg:poff('ok_go');
	uhp_guardian_dlg:poff('gunpowder_treason_and_plot');
end)
