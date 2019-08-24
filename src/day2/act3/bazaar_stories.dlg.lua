-- Диалог с продавцом пряностей
bazaar_stories = dlg {
	nam = 'Продавец пряностей';
	hideinv = true;
	entered = [[
		-- И чего мы так шумим? -- обращаешься ты к торговцу, на столе которого
		расставлено множество баночек самых разных размеров и форм.
		^
		Тот в ответ с досадой разводит руками.
		^
		-- Да ведь не покупают ничего, -- объясняет продавец, -- эти
		купцы из Вольных городов всю торговлю портят. Распугали своим говором
		всех покупателей, а тех немногих, что проходят мимо, сразу хватают и тащат к себе.
		^
		Ты присматриваешься к торговцу. Его туника выглядит так же необычно, как и светлые
		наряды вольных купцов.
	]];
	phr = {
		-- Просишь рассказать откуда продавец
		{
			true;
			tag='first_question';
			'Ты сам-то откуда?';
			[[
				-- Из Салфир, -- отвечает продавец, поглаживая живот.
				^
				Не увидев понимания на твоём лице, он добавляет:
				^
				-- Из полиса Салфиры.
				^
				-- А Имперские колонии, -- киваешь ты.
				^
				-- Да в вашей стране, кажется, ходит именно это название, --
				сухо соглашается продавец.
				^
				-- Всегда удивлялся, что заставляет людей из ваших краёв оторваться от
				своих песочных пляжей, солнца и тёплого моря, и удариться в странствия.
				^
				-- Ты описываешь жизнь на восточном побережье, но в остальной части страны
				всё совсем не так.
			]];
			function()
				bazaar_stories:pon('free_kingdome_question');
				bazaar_stories:pon('trade_way');
			end;
		};
		-- Просишь рассказать про Имперские колонии
		{
			false;
			tag='free_kingdome_question';
			[[Выходит, проповедники Благих нас обманывают. Не так уж и хороша жизнь в ваших благословенных землях?]];
			[[
				-- Я бы сказал, как и везде. Банды орков-головорезов и пираты терроризируют
				нас как и любую другую страну. Но не каждая страна, граничит с
				проклятыми эльфийскими лесами или пустыней мерзких жуков и мутантов.
				Хотя в том же Режиме проблем не меньше: все эти еретические секты,
				жуткие истории про призраков Скалистого полуострова и гоблинские полчища в тундрах,
				-- торговец втянул голову в плечи, словно от озноба.
				^
				Ты скептически поднял бровь, но тот не обратил внимания.
				^
				-- Короче, если ты священнослужитель с большой паствой в крупном полисе,
				и можешь позволить себе особняк у лазурных волн на
				восточном побережье, то у тебя просто райская жизнь.
				А если ты обычный крестьянин в центральной части страны, то изволь гнуть
				спину в полях под палящим солнцем, и надеяться, что охотники вычистили
				все гнёзда хищных ящеров в окрестных лесах, -- тирада окончилась вздохом
				досады, -- Что уж и говорить о простых торговцах, что странствуют по миру,
				наблюдая все его напасти.
			]];
			function()
				bazaar_stories:pon('termites');
			end;
		};
		-- Просишь рассказать про Термитники
		{
			false;
			tag='termites';
			'Ты кажется упоминал каких-то пустынных жуков-мутантов?';
			[[
				-- Вернее, жуков и мутантов. Вы южане поди и не слышали про наши
				беды. Главная из них всё-таки Термитники с их жуками.
				^
				Ты неуверенно покачал головой.
				^
				-- О, полисы на западе страны только и заняты патрулированием
				границы с пустыней. Её пески просто кишат этими тварями. Самое отвратительное
				-- они роют тоннели под землёй. Никакие рвы и стены их не остановят, они
				вылезут прямо у тебя перед носом! Ходят слухи, что западным полисам приходится
				обращаться за помощью к богомерзким чернокнижникам с Мистического архипелага,
				чтобы те остужали землю. Иначе эту напасть просто не удержать: твёрдая и
				холодная почва жукам, кажется, не по нраву. Хотя никто не может сказать этого
				наверняка, Термитники никогда не пытались расширять владения за пределы пустыни.
				Такое ощущение, что что-то удерживает их там.
				^
				-- Возможно, они питаются там чем-то, -- решаешься на догадку ты.
				^
				-- Да, некоторые тоже так считают, -- соглашается торговец, -- говорят, в сердце
				пустыни -- Пепельных горах -- обитают чудища пострашнее. С ними-то жуки и
				воюют, а заодно и поедают.
				^
				-- Это и есть те мутанты? Жуки поедают их?
				^
				-- Никто не знает. Мутантов можно встретить начиная с северных областей Режима
				Ремана.	И чем ближе к Стене и крепости Диовен у границы с эльфийскими лесами,
				тем больше этих монстров. Так что нельзя сказать, что они водятся только в пустыне.
				Хотя по правде, раз в десятилетие какому-нибудь западному
				полису приходится отбивать нападения множества этих выродков. И, кажется, они
				действительно наступают со стороны песков.
				^
				-- Во всё это сложно поверить, -- отвечаешь ты.
				^
				-- Самое страшное -- жуки всё глубже вгрызаются в земные недра. Кто знает
				какие силы они потревожат в тёмных глубинах? Но ты, продолжай бояться орков,
				-- торговец хлопает тебя по плечу, -- они ближе.
			]];
		};
		-- Просишь рассказать про Торговый путь
		{
			false;
			tag='trade_way';
			'Почему ты отправился торговать именно в Приграничье?';
			[[
				-- Лучше спроси, почему я отправился торговать в этот
				захудалый городок, -- с усмешкой заметил продавец,
				-- через Приграничье проходит Торговый путь. Караваны выходят из Полисов
				и направляются в Тантикул, затем, отправляются в земли Приграничья. Отсюда
				два пути: либо по суше обратно на северо-восток в Полисы, либо на кораблях
				на Мистический архипелаг в Вольные города. Особо рискованные, впрочем могут
				выбирать и третий путь -- в земли орков. Правда, там привыкли платить не
				золотом, а железом и кровью.
				^
				-- Так значит, вы идёте через Тантикул? Это вроде бы как большой крюк,
				чтобы попасть из Колоний в Приграничье?
				^
				-- Зато это безопасный крюк. В отличие от здешних правителей, Режим ревностно стережёт
				торговые тракты, -- торговец внезапно запинается и подозрительно косится
				в твою сторону, -- весьма странно, что его солдат, задаёт мне подобный вопрос.
				^
				-- Я рекрут из местных, -- спокойно отвечаешь ты.
				^
				-- А, тогда понятно. Доказательство кровью, слышал об этом.
				Режим пробовал провернуть подобный трюк в Полисах. Но, насколько мне известно,
				желающих не нашлось. Их новая еретическая религия никого не привлекает среди
				истинных почитателей Благих, -- с некоторой гордостью в голосе вещает торговец,
				-- а половина моих соотечественников вообще уверена,
				что богоизбранные это те же колдуны и богохульники, которых надо сжигать
				на кострах.
				^
				-- Кажется, ваши инквизиторы пытались это проделать, но богоизбранные их истребили,
				-- с усмешкой отвечаешь ты.
				^
				-- Только у себя в стране, хотя я и в этом не был бы уверен. Настоящие инквизиторы
				не выдают себя просто так, -- продавец внезапно стал серьёзным,
				-- к тому же к мой стране они имеют мало отношения.
				Инквизиторы прибывают из-за моря, из Империи Карающей.
				^
				-- И вы удивляетесь, почему ваши полисы называют колонией.
				^
				-- В древности это действительно было так, но теперь все мы слишком погрязли в грехе,
				чтобы наша судьба интересовала Святых с островов.
			]];
		};
		-- Уходишь
		{
			always = true;
			'Я пойду.';
			'Приходи ещё.';
			function()
				bazaar_stories:pon('first_question');
				back()
			end;
		};
	};
}
