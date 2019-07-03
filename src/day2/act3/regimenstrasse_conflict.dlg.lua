_wrangler_take = [[
       Ты пронзительным взгялом скользишь по лицам в толпе. Многие из них
       прячут враждебность, другие смотрят выжидательно.
       ^
       -- Смотри ка, утро, а он трезвый, -- слышишь ты шёпот откуда-то
       из-за спин, -- не похоже на солдата Режима.
       ^
       Ты чувствуешь, что время уходит. В толпу закрадывается нетерпеливое
       ожидание.
       ^
]];

regimenstrasse_conflict = dlg {
	nam = 'Глашатай и менестрель';
	hideinv = true;
	entered = [[
		Ты протискиваешься к крикунам сквозь толпу. Вблизи спорящие выглядят не менее
		грозно, под стать своим речам. Несколько грузный менестрель с жиденькой
		тёмной бородкой и бойкий поджарый глашатай, не уступающий барду ростом.
		^
		-- Проваливай уже отсюда, попрошайка! Оставь свои байки про конец света
		кому потупей и дай уже людям насладиться музыкой!
		^
		-- Глас Благих не заглушить дудением халтурщика! Задумайся о
		своей несчастной судьбе глупец и обрати свою душу к Святым! Люди
		жаждут спасения, они ищут искупления. А что ты, бесовской погонщик?
		Ты хочешь увести эти грешные души по пути празности и разврата?!
		^
		-- Довольно твоим причитаний о душах! Я вынесу твои кости в этом мешке,
		что ты называешь робой, если не уберёшься отсюда сам!
		^
		Из толпы раздаётся одобрительный свист. Ты понимаешь, что пора вмешаться,
		и набираешь в грудь побольше воздуха.
	]];
	phr = {
		{
			true;
			'Эй ты, пугало в мешке из-под картошки, что вы тут устроили?!';
			[[
				-- Слава Благим, служитель Режима! -- глашатай сцепляет
				руки в молитвенном жесте, -- уж он то укажет кому из нас
				остаться здесь, чтобы направлять эти души.
				^
				-- Ах ты, проклятый лицедей, -- напирает бард, но ты прерываешь его
				жестом.
			]];
			function()
				regimenstrasse_conflict:pon('i will decide');
			end;
		};
		{
			-- tag = 'phr2';
			true;
			'Так, бородач с дудкой, что тут выступление с утра пораньше?!';
			[[
				-- О, неужели нас почтил своим вниманием блюститель закона?
				^
				Менестрель расплылся в подобии улыбки. Крики из толпы несколько
				поутихли.
				^
				-- Я всего лишь намеревался выступить перед публикой, как обычно.
				Но тут появился этот голодранец, -- он кивнул на бритоголового, --
				и заявил, что это его место.
				^
				Глашатай с глазами на выкате собрался разрадиться очередной тирадой,
				но ты опередил его и решительно занял место между спорщиками.
			]];
			function()
				regimenstrasse_conflict:pon('i will decide');
			end;
		};
		{
			tag = 'i will decide';
			false;
			'Всё ясно. Пора заканчивать этот балаган.';
			[[
				Толпа замирает в ожидании. Ты замечаешь, как менестрель и глашатай
				тайком переглядываются друг с другом. Ты ловишь на их лицах
				тень волнения.
			]];
			function()
				regimenstrasse_conflict:pon('fuck propagandist');
				regimenstrasse_conflict:pon('fuck singer');
			end;
		};
		{
			tag = 'fuck propagandist';
			false;
			'[вытолкать глашатая]';
			_wrangler_take .. [[
				Ты хватаешь бритоголового под локоть.
				Глаза его становятся ещё круглей, а тело напрягается как струна.
				^
				-- Пойдём, с тобой хочет побеседовать капитан! -- с улыбкой на лице
				заявляешь ты. Попрошайка как-то разом обмякает и становится податливым.
				Менестрель рядом с вами не произносит ни слова.
				^
				Окидывая расступающихся людей суровыми взглядом,
				ты решительно тащишь глашатя через толпу. Опомнившись тот пытается было
				начать свою проповедь про продажность стражей Режима, но ты с силой
				сдавливаешь ему запястье. Через доспех ты чувствуешь, как кто-то из толпы
				отвешивает тебе пару тычков в спину, но не обращаешь на это внимания.
				Крики и свист сменяются, приглушённым ропотом. Ты шагаешь быстро,
				но стараешься не показывать спешки.
				^
				Отторгнув инородное тело, толпа рассеивается сама собой. Кое-кто ещё
				провожает вас взглядом, но недолго.
				^
				Скрывшись в тени здания штаба Режима, ты отводишь глашатая в сторону
				от главного входа, в небольшой проулок. Выглядит попрошайка неважно.
				^
				-- Я скажу всё, всё, -- запричитал бритоголовый, -- только не отводи меня
				к нему.
				^
				Ты показательно молчишь.
				^
				-- Вам нужен торговец. Он знает, где они собираются.
				^
				-- Какой торговец?
				^
				-- Не знаю, этого я не знаю, я об этом только слышал. Они лишь изредка просили
				меня что-нибудь разнюхать в городе или на дорогах. Но никогда не брали с собой.
				Говорили, что такое доверие нужно заслужить. Но я сам разведал, что этот торговец
				-- ключ к месту, где они собираются...
				^
				Ты понимаешь, что он лжёт, но не решаешься блефовать дальше. В конце концов у тебя
				нет даже меча, а в штаб тебе дорога заказана. Ты решаешь, что раз уж вы разыгрываете
				сцену допроса, тебе стоит так же придерживаться своей роли.
				^
				-- Что за торговец?! -- с нажимом повторяешь ты, легонько приложив глашатая об стену.
				^
				-- Не знаю! Он умело маскируется под разными личинами. Сегодя
				продаёт мясо, завтра ткани.
				^
				-- А где он торгует?
				^
				-- Где угодно: на торговой площади, главной улице...
				^
				-- Что и здесь тоже? -- ты киваешь в сторону монумента.
				^
				-- Нет, здесь врядли, слишком много солдат, -- глашатай косится на герб Режима
				на твоём нагруднике, -- больше я ничего не знаю. Ничего.
				^
				Изображая недовольное выражение лица, ты отпускаешь робу и наблюдаешь, как
				лысина торопливо исчезает в глубине переулка.
			]];
			function()
				event 'regimenstrasse belongs to singer'
				back()
			end;
		};
		{
			tag = 'fuck singer';
			false;
			'[вытолкать менестреля]';
			_wrangler_take .. [[
				Ты делаешь жест в сторону менестреля.
				^
				-- Пойдём. Капитан ждёт тебя на беседу.
				^
				К твоему удивлению бард покорно слезает с постамента.
				^
				...
				^
				-- Я выхожу из игры?
				^
				-- Что?
				^
				-- Разграбленный караван и Режим...
			]];
			function()
				event 'regimenstrasse belongs to propagandist'
				back()
			end;
		};
		{
			always = true;
			'Некогда мне с вами возиться.';
			'Ты отступаешь обратно в толпу, и гам возобнавляется с новой силой.';
			function()
				back()
			end;
		};
	};
}
