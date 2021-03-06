-- Переменные диалога

-- Диалог с птицей-говоруном
sentry_black_bird_dlg = dlg {
	nam = 'Чёрная птица';
	hideinv = false;
	entered = function()
		return [[
			Ты задираешь голову и вы с птицей некоторое время изучаете
			друг на друга. Птица прячет клюв в крыльях посматривая на тебя
			то одним, то другим глазом.
		]];
	end;
	phr = {
		-- Стартовая реплика для проверки доступности и включения остальных реплик
		{
			tag = 'hello_world';
			true;
			'Кажется, я схожу с ума...';
			[[
				Птица расправляет крылья и свешивает голову вниз.
				Из раскрытого клюва отчётливо раздаётся твой голос:
				^
				-- Кажется, я схожу с ума...
				^
				Ты делаешь шаг назад. Птица поворачивает голову на бок,
				и вопросительно смотрит на тебя.
			]];
			function()
				-- Включаем стандартные реплики
				sentry_black_bird_dlg:pon('kevraza_and_first_vicar');
			end;
		};

		-- Стандартные реплики:
		-- Диалог Кевразы и первого городского наместника
		{
			tag = 'kevraza_and_first_vicar';
			false;
			'Это какая-то шутка?';
			[[
				На этот раз птица снова повторяет за тобой.
				^
				-- Это какая-то шутка? -- произносит она уже не твоим голосом.
				^
				-- Я лишь выполняю приказ, наместник -- слышишь ты ещё один незнакомный голос.
				^
				-- Уму не постежимо, -- снова первый голос. В нём можно разлчить раздражение,
				-- давайте на чистоту. Я прекрасно осведомлён кто вы такой, вплоть до
				биографии. Знаменитый богоизбранный Кевраза прислан мне в помощь. Что
				за великая честь, как же.
				^
				Птица замолкает на некоторое время. Но затем вновь говорит первым голосом.
				^
				-- Знайте, я не особо верю в вашу богоизбранность. Ваше прошлое
				-- это прошлое солдата. Вы служили в гражданской обороне и армии Режима.
				А потом стали рядовым наёмником. Вы были солдатом в Землях верховного шамана,
				вы были солдатом в Колониях. Вы остались солдатом и на Мистическом архипелаге.
				В армию Режима вы снова вернулись обычным солдатом. Это недоразумение,
				Корадорский конфликт, сделало вас богоизбранным. Уму не постижимо. Вы солдат,
				старый солдат удачи, которому повезло дожить до такого возраста.
				Что, каждого везучего чёрта теперь причислять к богоизбранным?
				Нет, Кевраза, вы солдат и умрёте вы им же. И служить у меня вы тоже будете
				солдатом. Это ясно?
				^
				-- Так точно, наместник, -- вступает второй голос.
				^
				-- Прекрасно. Вы свободны, -- первый голос звучит удовлетворённо,
				-- Хотя постойте. Расскажите мне кое-что. Тогда в Имперских колониях,
				вы были в отряде, что уничтожал термитник жуков. На что это было похоже?
				^
				-- Как сесть голой жопой на муравейник, -- отвечает второй голос.
				^
				-- Нет, вы слышали? -- ты чувствуешь в первом голосе странную cмесь насмешки
				с восхищением, -- вы просто старый солдафон, Кевраза. Приступайте к службе.
				^
				-- Слушаюсь, наместник.
				^
				Птица замолкает.
			]];
			function()
				sentry_black_bird_dlg:pon('thieves_leader_and_halfblood_about_relion');
			end;
		};
		-- Главарь подполья и Полукровка про Религию Благих
		{
			tag = 'thieves_leader_and_halfblood_about_relion';
			false;
			'О, боги!';
			[[
				-- О, боги! -- повторяет за тобой птица на этот раз подозрительно знакомым голосом.
				^
				-- Когда-то так говорили люди в этой стране, -- продолжает птица. Ты наконец узнаёшь
				голос главаря подполья, -- теперь же они говорят <b>о, боже</b>. И после этого ты
				говоришь мне, что люди не изменились!
				^
				-- Я говорю тебе, что людям всё равно во что верить, в Благих или в Благо, -- возражает
				второй голос, так же знакомый. Это конечно же голос Полукровки, холодный и чарующий,
				-- большинство из них всё равно вкладывают во все эти божества собственный смысл.
				Уверена, если бы люди читали те священные тексты, что они так почитают,
				вряд ли бы они просили своих Благих хранить себя. Слишком велик бы был страх.
				^
				-- Ты хочешь сказать, что между Благом и Благими нет никакой разницы? -- спрашивает
				птица голосом главаря подполья, -- единый бог? Разве люди могли придумать такое?
				Такое мог породит разве что больной эльфийский разум.
				^
				-- Эльфийский Хаос это не божество, если ты об этом. Это источник бытия для эльфов.
				^
				-- О том и речь. В людских религиозных течениях нет никаких предпосылок для единого бога.
				В древности Благим предшествовали Святые. А они в свою очередь были не богами, а людьми.
				Люди почитали людей, почитали общность. Потому что только действуя сообща человечество
				может что-то противопоставить этому миру.
				^
				-- Противопоставить миру? -- ты чувствуешь насмешку в голосе полукровки, --
				что я слышу, человек рассуждает прямо как настоящий орк.
				^
				-- Проклятье, -- вырывается из птицы голос главаря, и она замолкает.
			]];
			function()
				sentry_black_bird_dlg:pon('cave_memories');
			end;
		};
		-- Птица цитирует стих из воспоминаний ГГ в пещере
		{
			tag = 'cave_memories';
			false;
			'Проклятье!';
			[[
				Стоит тебе повторить последнее изречение главаря подполья,
				как птица начинает топорщить перья и бить крыльями по воздуху.
				Клюв птицы разрывает каркающий голос, от которого кровь
				стынет в жилах. Но произнесённое пугает тебя ещё больше:
				^
				^
				Скользкий Червь скользит во тьме,
				^
				поёт песни темноте,
				^
				поживиться он решил,
				^
				пищей солнечных светил,
				^
				^
				Но в тиши запретных мест,
				^
				точит крюк коварный Перст,
				^
				Он мечтой живёт одной --
				^
				указать судьбе покой,
				^
				^
				Ловкой хваткой у огня,
				^
				он возьмёт за хвост Червя,
				^
				чтобы бросить в жернова,
				^
				новой Смуте дар внеся,
				^
				^
				Расползается огонь,
				^
				порождает свет и боль,
				^
				но сгущается в ответ,
				^
				покрывало тьмы и бед,
				^
				^
				Кто сумеет сквозь века
				^
				разгадать судьбу Червя...
				^
				^
				Завершив декламацию жуткого стиха из пещеры, птица успокаивается.
				Но ты ещё долго не можешь унять дрожь по всему телу.
			]];
			function()
				-- Проверяем условия для включения дополнительных реплик
				if _mage_dialogs then
					sentry_black_bird_dlg:pon('mage_and_vicar');
				else
					sentry_black_bird_dlg:pon('stop_talking');
				end;
			end;
		};
		-- Диалог с птицей заканчивается, если не все секреты раскрыты;
		{
			tag = 'stop_talking';
			false;
			'Что за птица! Отличается умом и сообразительностью.';
			[[
				Но птица остаётся равнодушна к твоим похвалам.
				Она лишь водит клювом из стороны в сторону, не сводя с тебя глаз.
				У тебя возникает ощущение, что птица смотрит внутрь тебя сквозь
				солдатский нагрудник и плоть. Она будто бы расколола твою несчастную голову
				своим чёрным клювом и пытается найти там ещё что-то, но там больше ничего нет.
				^
				-- Этого недостаточно. Недостаточно воспоминаний, -- неожиданно шепчешь ты,
				сам не понимая, к кому ты обращаешься к птице или к себе, -- недостаточно знаний.
			]];
			function()
				-- Включаем изначальный диалог
				sentry_black_bird_dlg:pon('hello_world');
				-- Уходим
				back();
			end;
		};

		-- Расширенные реплики:
		-- Если игрок прослушал все диалоги с крысой: диалог мага-крысы и первого городского наместника
		{
			tag = 'mage_and_vicar';
			false;
			'Что же ещё ты можешь мне рассказать?';
			[[
				-- Что вы ещё можете рассказать? -- справшивает птица новым голосом,
				-- раз уж с делами мы покончили.
				^
				-- О чём же вы хотите услышать, наместник? -- переспрашиват птица сама себя. Ты
				сразу узнаёшь своего необычного утреннего знакомца -- мага-крысу.
				^
				-- Что-нибудь о вашей родине, например. Столько слухов ходит о загадочном Магосе,
				не счесть.
				^
				Хотя маг в обличие птицы и обращается к собеседнику как к наместнику, голос этого
				наместника отличен от того, что ты слышал ранее.
				^
				-- Мне как чиновнику весьма, интересно было бы послушать, как у вас там всё устроено,
				-- продолжает птица предельно заинтересованным голосом.
				^
				-- Магос не моя родина, -- поправляет маг, -- я родился в Вольных городах.
				^
				-- И всё же, -- не отстаёт первый голос, -- ты же там бывал, иначе как ты стал
				настолько искуссным магом?
				^
				-- Что конкретно вас интересует, наместник? -- спрашивает птица несколько раздражённо.
				^
				-- Мне очень интересно как у вас борятся против всех этих чудовищ? Как вы их называете?
				Магические мутанты? Правда ли, что маги отлавливают их по всему миру, чтобы найти
				способ истребить? -- вопросы сыпятся из клюва птицы как из рога изобилия.
				^
				-- Правда. В Магосе есть город-тюрьма, куда массово свозят опаснейших чудовищ
				со всего света, -- скучающим голосом вещает птица, -- но я бы не сказал,
				что это делается в целях поиска средства истребления.
				Напротив, магов больше занимает изучение для дальнейшей селекции.
				^
				-- А как же все эти рассказы, о том что Магос терроризируют чуждые природе монстры?
				^
				-- Чуждыми природе? Весь континет наполнен такими монстрами, -- усмехается маг,
				-- например, ящеры, полуящеры, дрэйки и драконы пришли к нам из другого мира. Страхолюды --
				плод сверхъестественной аномалии, химеры и гибриды -- последствия магического катаклизма,
				который затронул значительную часть животного мира Линары. Обыватель уже не сможет
				отличить "родных" существ от пришельцев, ведь они уже давно стали частью мира. Истребляя
				их мы можем нанести ещё больший вред миру и себе.
				^
				-- Я слышал, раньше существовали целые рыцарские ордена, сражавшиеся с чудовищами,
				-- раздаётся довольный собой голос наместника.
				^
				-- В том то и дело, что "раньше", -- поправляет маг, -- очевидно, что они проиграли
				эту войну.
				^
				-- А что насчёт вашей войны? -- переводит тему птица с голосом наместника,
				-- вы покинули Магос, и обретаетесь теперь в нашем захолустье. Я слышал, столь
				искуссные колдуны в Магосе обзаводятся, как это сказать, собственными имениями?
				^
				-- Вам не откажешь в прозорливости, наместник, -- вкрадчиво отвечает
				маг-крыса, -- скажем так, мои свободы в Магосе иссякли.
				^
				-- Что вы имеете ввиду? -- птица наклоняет голову на бок.
				^
				-- Думаю, вы сами прекрасно знаете, что, -- голос мага отдаёт холодом,
				-- Вам ли как чиновнику, как распорядителю человеческим временем, не знать,
				что свобода есть ресурс ограниченный. Причём, я сейчас говорю не о той свободе,
				что обычно признаётся за каждым человеком, а о свободе, которая разделяется между
				членами общества как и остальные блага. Не нужно смотреть на меня такими
				удивлёнными глазами. Свобода это ресурс, запас которого может легко иссякнуть при
				распределении у одних и приумножиться у других.
				Свобода это деньги, на которое люди покупают мнимое благополучие
				и признание в обществе. Вы продаёте свою свободу, когда идёте служить писарем в
				городскую ратушу. Ваши голова и руки отныне принадлежат не вам. У вас есть
				жалование на хлеб насущный, но свобода ваша иссякла, вы не распоряжаетесь своим временем
				отныне. Толи дело, когда вы городской наместник, вы можете покупать время других,
				чтобы другие делали то, что выгодно вам. Тем самым вы приобретаете себе чужую свободу.
				Так вот, Магос в этом плане ничем не отличается от других стран. Свобода там
				торгуется таже как и везде. И к сожалению, я обзавёлся там слишком большими долгами
				по этой валюте. Пришлось в спешном порядке покинуть государство магов.
				^
				-- Вы весьма, весьма интересный собеседник, -- с удивлением в голосе отзывается
				птица-наместник.
			]];
			function()
				if _captain_docs_full_memories  then
					sentry_black_bird_dlg:pon('kevraza_and_captain');
				else
					sentry_black_bird_dlg:pon('stop_talking');
				end;
			end;
		};
		-- Если игрок прочитал все воспоминания ГГ о документах капитана: диалог Кевразы и капитана
		{
			tag = 'kevraza_and_captain';
			false;
			'Это верно, собеседник ты весьма интересный.';
			[[
				Птица, как тебе кажется, довольно хлопает крыльями, раскачиваясь на канделябре.
				Успокоившись, но раскрывает клюв, чтобы продолжить вещать на разные голоса.
				^
				-- Вы весьма интересный собеседник, богоизбранный, но у меня много дел.
				^
				У тебя перед глазами сразу же всплывает лицо капитана Режима.
				^
				-- Я говорю, разве это армия? В штабе и не пахнет дисциплиной, -- скрипуче
				гнёт своё птица, голосом принадлежащим некоему Кевразе,
				-- если у вас, капитан, так много дел, то я сам могу этим заняться.
				^
				-- Вы же знаете, совет пока что не видит в этом необходимости, --
				учтиво замечает капитан, -- к тому же это вам не по статусу. Вы же богоизбранный.
				Ваше место там, наверху, ближе к наместнику. Я думал, что ваша миссия здесь
				в том, чтобы обеспечивать его безопасность. К тому же это же местные
				рекруты. Не нужно требовать от них слишком многого. По себе знаю.
				^
				Ты представляешь как лицо капитана расплывается в улыбке. Птица тем
				временем продолжает его голосом:
				^
				-- Им нужно испытание. Испытанию кровью. Рекруты должны пролить кровь за
				отечество и Режим. Договор, что они заключили так и называется же
				-- Доказательство кровью. Сражение вот лучшее средство для дисциплины.
				Мы с вами оба, хорошо знаем это.
				^
				-- Но они не готовы к сражению.
				^
				-- Некоторые из них никогда не будут готовы, -- капитан отвечает на возражение
				богоизбранного, так словно сказанное вызывает у него удовольствие,
				-- и в этом весь смысл. Сражение покажет, кто из них достоин зваться
				защитником своей родины и стать гражданином Режима.
				Скоро всё выяснится, оставьте беспокойство.
				^
				Птица умолкает. Судя по виденному тобой в штабе Режима,
				Кевраза послушал совет и оставил беспокойство.
			]];
			function()
				if not _guild_camp_halfblood_greeting then
					sentry_black_bird_dlg:pon('thieves_leader_and_halfblood');
				else
					sentry_black_bird_dlg:pon('stop_talking');
				end;
			end;
		};
		-- Если игрок не взаимодействовал с Полукровкой в лагере гильдии: диалог главаря подполья и Полукровки
		{
			tag = 'thieves_leader_and_halfblood';
			false;
			'Ты знаешь, когда произойдёт нападение?';
			[[
				-- Ты знаешь, когда произойдёт нападение? -- птица повторяет твой вопрос
				голосом Полукровки. Отвечает, ей конечно же, главарь подполья:
				^
				-- Думаю, что не скоро. Джеральду не откажешь в связях, но вот людей и оружия
				у него мало. Что неудивительно, учитывая как активно рекрутирует Режим новобранцев,
				и сколько он платит нашим кузнецам.
				^
				-- Ты про тех кузнецов, чья работа потом отправляется на север в Диовен?
				-- замечает птица голосом девушки, -- кто бы мог подумать,
				что режимники всерьёз боятся остроухих.
				^
				-- Дело не в страхе, -- топорщит перья птица, -- режимники люди дела,
				они не бросают слов на ветер. Тем более, если речь идёт о международном
				соглашении. Любые договоры в Режиме строго соблюдаются.
				^
				-- Что я слышу, неужели Режим не так уж и плох?
				^
				-- Дело не в том плох Режим или хорош. У себя в стране режимники могут делать,
				что захотят. Но когда они насаждают свою религию и извращают нашу культуру,
				под предлогом спасения Приграничья, это уже интервенция, а не помощь соседнему
				государству. Режим слепо уничтожает то, что создавалось веками. Они могут
				говорить о прогрессе сколько угодно, но здесь они занимаются разрушением,
				а никаким не созиданием.
				^
				Птица будто бы косится на твой нагрудник с древом. А затем голосом
				главаря подполья продолжает горячо вещать:
				^
				-- Созидать можно по разному, но вот разрушение и его результаты всегда похожи.
				Забвение вот общий знаменатель разрушения. Если не противостоять Режиму,
				Приграничье предадут забвению. Мы превратимся в ещё одну безликую провинцию
				Тантикула. Тантикула, который слишком долго считался незыблимым ориентиром
				человечества. Теперь же он продался колдунам и предал свою историю.
				Возможно будущее всех людей теперь находится здесь в Приграничье.
				Возможно всем свободным людям Линары пришло время вспомнить свои корни
				и указать этим эльфийским прихвостням их место.
				^
				-- Ты и впрямь, заправский орк, -- усмехается птица-Полукровка, едва закончив
				свою горячую речь.
			]];
			function()
				if _mage_dialogs and _captain_docs_full_memories and not _guild_camp_halfblood_greeting then
					sentry_black_bird_dlg:pon('secret_cave_memories');
				else
					sentry_black_bird_dlg:pon('stop_talking');
				end;

			end;
		};
		-- Если игрок выполнил все предыдущие условия: птица цитирует концовку стиха из воспоминаний ГГ в пещере
		{
			tag = 'secret_cave_memories';
			'Нет, всё не то! Что ты ещё можешь мне рассказать?';
			false;
			[[
				Ты готов поклясться, что птица смотрит на тебя с сожалением.
				И тут же из разверзнутого клюва громыхает замогильный голос, от
				которого у тебя встают дыбом волосы:
				^
				^
				Кто сумеет сквозь века,
				^
				разгадать судьбу Червя?
				^
				^
				В немом стоне ты закрываешь уши руками и падаешь на колени.
				Но голос неумолимо звучит у тебя в голове:
				^
				^
				Чёрный Червь ползёт во тьме,
				^
				поклоняясь пустоте,
				^
				такова судьба Червя,
				^
				вновь рождаться из огня,
				^
				^
				Чтобы ночью править бал,
				^
				Червь был создан очень мал,
				^
				Но в глуши запретных мест,
				^
				Червь поднимет Бога перст.
				^
				^
				И проснувшись под горой,
				^
				Бог разрушит смертный строй,
				^
				погрузит он мир во мрак,
				^
				прославляя смерти шаг.
				^
				^
				Потеряв счёт времени, ты ещё некоторое время проводишь сидя на
				полу в тщетных попытках забыть жуткий голос и сказанное им.
			]];
			function()
				-- Включаем вторую концовку
				event "black bird gift";
				-- Включаем изначальный диалог
				sentry_black_bird_dlg:pon('hello_world');
				-- Уходим
				back();
			end;
		};
	};
}
