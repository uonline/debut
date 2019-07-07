berlinstrasse_history = dlg {
	nam = 'Старик';
	hideinv = true;
	entered = [[
		-- Остановись ненадолго путник и послушай старого человека.
		^
		На обветренном лице старика читается опыт многих странствий.
	]];
	phr = {
		{
			always = true;
			'Ты ошибся старик, я страж этого города, а не путешественник.';
			[[
				-- В этих землях все мы -- лишь странники. Ведь Приграничье
				-- это страна свободных людей. Кто бы здесь не правил, и какой
				бы захватчик не вторгался в эти края. Приграничье терпит лишь
				свободных от чьей либо власти.
				^
				Старик задумчиво осмотрел твой нагрудник.
				^
				-- Ты уж не сердись на речи старого безумца, но так было и так будет.
				^
				-- Посмотри на этот город старик, разве не флаги с книгой и древом весят
				на его стенах? Разве не мы -- солдаты Режима Ремана -- патрулируем его улицы и
				предместья? Режим взял Приграничье под своё крыло.
				^
				-- В древние времена в этих землях властвовало множество королевских
				династий. Но ни одна из них не смогла править долго. Короли и королевы,
				принцы и принцессы, все они сменяли друг друга, словно листья опадавшие
				осенью. Нет, эти зесли принадлежат другой силе и только рыцарские Ордена
				смогли бросить этой силе вызов. Но позже и они сгинули.
				^
				-- И куда же они пропали?
				^
				-- С запада пришли орки и начали войну, которая позже станет известна
				как Третья Великая Война. Ты должен был слышать о ней, ведь именно
				после неё эльфы ушли в свои леса, а Тантикул объявил о
				независимости от Островной Империи -- древнего государства человечества.
				Именно после этой войны мир стал таким, каким мы знаем его сейчас.
				^
				Тебя никогда особо не интересовала история древности. Но старик не врал.
				Взрослые рассказывают детям сказки о том, как когда-то
				орки и люди прогнали эльфов -- колдунов и чернокнижников -- в их
				проклятые леса. Но ты никогда в это особо не верил.
				^
				-- Выходит, рыцарские Ордена проиграли войну.
				^
				-- На тот момент они были объединены в одно госудраство -- Единый Орден.
				После войны часть земель Ордена досталась оркам, а часть стала
				современным Приграничьем.
				^
				-- И теперь здесь властвует та самая сила, против которой сражались
				Ордена? -- спросил ты с ухмылкой.
				^
				-- Вижу ты не особо мне веришь, -- спокойно ответил старик, -- впрочем
				некоторые вещи людям лучше не знать.
			]];
		};
		{
			always = true;
			'Не поздно ли проповедовать на улице в твои-то годы старик?';
			[[
				Морщины на лице старика изображают улыбку.
				^
				-- О мой мальчик, мой удел не проповедовать, а наставлять. Я -- книжник.
				^
				-- Бродячий учёный? -- удивлённо спрашиваешь ты, -- вот уже не думал, что
				вы действительно существуете.
				^
				Старик только покачал головой.
				^
				-- Существуем и здравствуем, ведь на наши знания и опыт большой спрос даже
				за пределами Приграничья. Книжники -- наследники традиций рыцарских Орденов.
				Мы помогали советами великим магистрам и участвовали в далёких экспедициях.
				Мы вели летописи этих и других земель, исследовали новых существ и народы.
				Классифицировали и хранили древние артефакты. И даже пытались постичь
				некоторые тайны магии с точки зрения мироустройства,
				-- седая голова качнулась от глубокого вздоха, -- ныне эти времена позади.
				Ордена канули в лету, рыцарей больше нет и народ Приграничья предоставлен
				сам себе. Древние крепости разрушены и разграблены. Мы книжники -- всё,
				что уцелело из тех лет. И всё что нам остаётся -- странствовать по миру,
				продолжая собирать знания, и делиться ими со всеми нуждающимися.
				Мы становимся советниками лордов или учителями в школах городов и сёл.
				^
				-- Ты пришёл в этот город учить?
				^
				-- Нет. Я пришёл, исследовать его. Это один из многих небольших
				городов, пострадавших во время войны. Режим назначает править здесь
				своего наместника и держит большой гарнизон своих солдат.
				Мне интересно взаимодействие двух культур Режима и Приграничья.
				Существует ли оно вообще? Как власть наместника поменяла город?
				^
				-- Ты сказал, что этот город один из многих. Тогда почему именно он? В
				конце концов, половина солдат Режима здесь рекрутирована из местных.
				^
				-- Это верно. Кстати говоря, эффективность Доказательства Кровью, так же
				весьма меня интересует. Но ты прав, этот город, я выбрал неслучайно. Всё дело
				в первом наместнике и его главном деянии, -- скрюченный палец
				старика показывает в сторону. Ты догадываешься куда, и через силу заставляешь
				себя повернуть голову.
				^
				Облака рассеялись и теперь башня предстала перед тобой не такой уж мрачной.
				В лучах солнца она ничуть не выбивается из городского пейзажа.
				Возвышаясь над остальными зданиями, башня гордо несёт на себе стяги Режима.
				^
				-- Воистину, это весьма таинственный артефакт, который исследователи незаслуженно
				обходят стороной, -- продолжает старик, -- за то короткое время,
				что башня сущесвует, ей удалось собрать
				вокруг себя столько слухов и перетолков, что они дошли до других стран. Хотя
				я пришёл в первую очередь уточнить официальную позицию городских властей, в части
				строительства башни и загадочного исчезновения наместника, который приказал её
				построить.
				^
				-- Ты говорил, что после исчезновения рыцарей народ Приграничья предоставлен
				сам себе, -- тебе почему-то захотелось сменить тему разговора, -- что это
				значит?
				^
				-- Сегодня главным бедствием этой страны называют банды орков. В отличие
				от Режима или Имперских колоний, которые не позволяют урук-хай свободно
				разгуливать по своим землям, Приграничье для банд -- тракт соединяющий
				восток и запад Линары. Всё потому, что здешние лорды активно используют
				орков в своих целях. Они сидят в своих замках и скупают у урук-хай
				награбленное. Или же нанимают их, чтобы насолить своему соседу.
				Города же Приграничья -- не Полисы колоний.
				Зачастую они не могут защититься сами, не говоря уже о целенаправленной
				охоте на банды, -- учёный покачал головой, -- впрочем я отвлёкся.
				В древности, до прихода орков, эти земли страдали совсем от другой напасти.
				В простонародье её называли -- нечисть. Именно она указывается в летописях
				как причина исчезновения первых людских королевств в Приграничье.
				Рыцари начали свою историю как истребители нечисти, а мы книжники были теми,
				кто изучал их врага. Сегодня большая часть этих знаний утеряна, но орки,
				нужно отдать им должное, всегда охотно сражаются со всяческими чудовищами.
				Потому-то, сейчас поход в лесную чащу относительно безопасное занятие.
				К сожалению, не всегда нечисть проявляет себя в плотском
				обличие. Например, Корадорский конфликт -- событие с которого началась
				последняя война, исследователи связывают с влиянием нечисти.
				^
				-- Знаешь, старик, давай оставим этот разговор, -- от всех этих историй
				тебе становится не по себе.
				^
				-- Пожалуй, ты прав, мальчик мой. Не стоит омрачать такой прекрасный день
				историями о тёмном прошлом.
			]];
			function()
			end;
		};
		{
			always = true;
			'Я пойду.';
			'Прощай.';
			function()
				back()
			end;
		};
	};
}
