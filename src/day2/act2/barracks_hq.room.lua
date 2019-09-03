barracks_hq = room {
	nam = 'Комната капитана';
	dsc = [[
		Ты в комнате капитана штаба Режима. Здесь довольно тесно, и полумрак лишь
		усиливает это ощущение. Тусклый утренний свет проникает в комнату через
		крохотное окно под потолком и выхватывает из остатков ночной тьмы самые
		разные предметы. На стенах бледно отсвечивают черепа одичалых орков.
		В своей монструозности они превосходят тот, что висел у тебя в хибаре.
		По соседству с черепами развешаны несколько вычурных подсвечников. Прямо посреди
		комнаты стоит заваленный стол, за ним -- кровать с горой какого-то тряпья.
		Пол захламлён под стать столу: мешки, сумки, сундуки и деревянные ящики --
		шагу нельзя ступить, чтобы обо что-нибудь не споткнуться.
		^
		Вся эта обстановка кажется тебе знакомой. Ты представляешь себе капитана,
		входящего в комнату, расшвыривающего пинками мешки. Вот он зажигает свечи,
		и что-то внутри тебя вздрагивает. Ты хочешь избавиться от игры воображения, но
		тщетно. Лицо капитана всплывает в памяти, и если раньше оно казалось тебе
		смутно знакомым, то теперь ты знаешь, кто он.
	]];
	obj = {
		'barracks_hq_candle';
		'barracks_hq_box';
		'barracks_hq_envelops';
		'barracks_hq_docs';
		'barracks_hq_goblet';
	};
	way = {
		'barracks';
	};
}

barracks_hq_candle = obj {
	nam = 'Свеча';
	dsc = [[
		Стол полностью заставлен различными предметами.
		По центру тлеет {огарок свечи}, вокруг которого словно
		в застывшем во времени танце замерли прочие вещи.
	]];
	act = [[
		Ты ощупываешь свечу. Чуть тёплая. Горела совсем недавно. Он был здесь.
		^
		Ты вспоминаешь, как часто просыпался среди ночи в лагере и видел его,
		сидящего у походного костра. Он любил смотреть на огонь и думать. Он много
		думал для рядового солдата родом из захудалой деревушки.
	]]
}

barracks_hq_box = obj {
	nam = 'Шкатулка';
	dsc = [[
		Декорацией этого танца служит {массивная шкатулка}, поблескивающая
		черепашьим панцирем чёрной крышки. Крышка засеяна семенами мелких
		драгоценных камней.
	]];
	act = [[
		Ты пытаешься открыть шкатулку, но тщетно. В голову приходит идея извлечь из
		крышки пару камней, но ты решаешь не тратить время на подобный вандализм.
		^
		Ему бы такое в голову не пришло. В армии Режима мародёрство строго запрещено,
		но он и не проявлял склонности к подобному. Напротив, дорогие вещи
		были для него ценностью сами по себе, а не в качестве потенциальной
		выгоды в виде монет. Деньги он тоже любил по-своему. Золото было для него
		орудием достижения цели. Ты помнишь, как несколько раз он заключал сделки
		с другими солдатами и даже с командирами. Хотя договориться о чём-то он мог
		и без денег. Было в нём определённое обаяние. Возможно, за счёт этого он и
		дослужился до капитана штаба целого города?
	]]
}

barracks_hq_envelops = obj {
	nam = 'Конверты';
	dsc = [[
		Вокруг шкатулки разбросано с десяток {конвертов} разных мастей и размеров,
		большая часть из которых распечатана.
	]];
	act = [[
		Ты перебираешь конверты. На некоторых начертаны какие-то неизвестные тебе символы.
		Надписи больше похожи на коды, а не слова какого-то языка.
		^
		На других ты узнаешь его почерк, которым выведены имена адресатов -- видимо,
		каких-то командующих из Режима. На посту капитана нужно часто отчитываться.
		^
		В прошлом он тоже много писал. Он говорил, что это были письма семье, но ты в
		этом сомневался. Уже тогда ты видел в нём человека, идущего только вперёд без
		оглядки. Он легко перешагивал через прошлое, умел сжигать мосты и освобождаться
		от тяготивших его связей.
	]]
}

barracks_hq_docs = obj {
	nam = 'Бумаги капитана';
	dsc = [[
		Под ними ковром опавших листьев покоится слой {исписанных бумаг}
		с вкраплениями нескольких перьев для письма и пустой чернильницы.
	]];
	inv = [[
		Напрягая зрение в полумраке, ты пытаешься изучить документы. Благо буквы
		всё ещё светятся.
		^
		Разбираясь в этом ворохе писем, приказов и записок, ты замечаешь, что строчки
		убористого почерка проскакивают перед глазами намного быстрей, чем обычно.
		Иногда тебе попадаются какие-то шифры, но светящиеся символы послушно
		перетекают в осмысленные слова.
		^
		Все эти бумаги адресованы самым разным людям, да и автором далеко не всегда
		выступает капитан. Куда больше это походит на перехваченную переписку между
		несколькими представителями знати Режима и Приграничья. Из прочитанного ты делаешь
		вывод, что группа лордов собирается развязать небольшую войну, чтобы вытеснить
		режимников из региона и заново поделить часть земель Приграничья.
		^
		Тебе вспоминается вчерашняя карта в шатре главаря банды урук-хай.
		И кинжал, воткнутый в город. Письма подтверждают твои догадки. Капитан должен был
		нанять банду урук-хай, которая нападёт на город в ближайшее время и возьмёт его в
		осаду. Затем здешний лорд нанесёт оркам сокрушительное поражение и займёт город,
		подорвав влияние Режима. Схожие планы вынашиваются относительно других городов.
		^
		-- Думаешь, когда я покажу эти бумаги в подполье, они меня не вздёрнут?
		-- шепчешь ты крысе.
		^
		-- Ты шутишь?! Эти бумаги -- доказательство государственной измены нескольких
		знатных лордов Режима. Это же, буквально, пара мешков золота! И поверь,
		никто в подполье не хочет, чтобы город достался здешнему лорду или, того хуже,
		был разграблен орками. Ты принесёшь им настоящее сокровище.
		^
		-- Главное сокровище для меня сейчас -- сохранить свою шею невредимой.
	]];
	tak = function()
		take 'guard_docs';

		return [[
			Ты начинаешь копаться в бумагах. Первым тебе в руки как нельзя кстати попадает
			совсем свежий документ на нового рекрута Режима. Ты тут же прячешь его и уже
			собираешься покинуть комнату, но голос мага заставляет тебя остановиться.
			^
			-- Уже уходишь? Это комната капитана штаба Режима целого города. Капитана, который
			ведёт себя весьма странным образом. Среди его бумаг можно найти что-нибудь
			крайне важное для этого города, а может, даже и для страны.
			^
			Мрачные пещеры, урук-хай, фигуры в плащах и ночи у костра -- вот что кажется
			тебе странным. Но не поведение этого капитана и не происходящее в этом штабе.
			И ты не сомневаешься, что в бумагах на столе скрыто нечто важное.
			Может, даже не для одной, а для нескольких стран. Но от этих знаний у тебя
			не появляется желания ввязываться во всё это.
			^
			-- Я думал, для нас главное -- выбраться отсюда, а не шпионить.
			^
			-- И что ты собираешься делать, когда окажешься в городе? Стража проверяет документы
			всех, кто хочет войти или выйти за ворота. Твой портрет висит не только в тюрьме,
			а наш побег может раскрыться уже сегодня.
			^
			На это тебе сказать нечего.
			^
			-- Ты сможешь сбежать из города, только связавшись с местным подпольем. Уверен,
			им известны тайные ходы из него.
			^
			-- Вот только захотят ли они провести по ним первого встречного?
			^
			-- Сейчас они хотят ослабить хватку Режима. Если принесёшь им полезную информацию, они
			могут помочь тебе.
			^
			-- Если только меня самого не сочтут агентом Режима.
			^
			-- Из дезертиров никудышные агенты. Удел дезертира -- прятаться и убегать,
			пока его страну захватывает соседнее государство. Предел мечтаний дезертира --
			провести остаток жизни в какой-нибудь хижине в лесу, питаясь кореньями
			и ключевой водой, -- ты чувствуешь что-то вроде горечи. Тебе кажется, что
			подобные мысли уже посещали тебя, по крайней мере подступали к кромке сознания.
			Мысли, которых ты долго и успешно избегал в течение нескольких лет.
			^
			-- Скажи мне, в чём же разница между хижиной и камерой?
			^
			-- В хижине из тебя не будут пытаться сделать образцового гражданина Режима, --
			ты отвечаешь так, словно гражданин Режима -- последний грешник на земле.
			^
			-- А кем же ты хотел стать, когда подписывал тот договор? -- с интересом спрашивает
			маг. -- Даже если так и тебе претит такая перспектива, неужели лучше всю жизнь
			скрываться? Пугаться своей тени на плакатах розыска?
			Неужели это лучше, чем стать хотя бы кем-то?
			^
			Ты достаёшь крысу из-за пазухи и заглядываешь в глаза-бусинки, пытаясь понять,
			что смотрит на тебя в ответ -- вызов или издёвка.
			^
			-- Крыса решила грызть меня вместо совести? -- Нет, в этих глазах
			ты ничего не в силах разглядеть. Может, и они ничего не видят,
			пытаясь рассмотреть хоть что-то в тебе?
			^
			-- Я -- твой голос разума, -- возражает маг, -- я хотя бы предлагаю план.
			^
			"Могут ли крысы улыбаться?" -- проскакивает у тебя в голове.
			^
			-- Положи меня на стол, я покопаюсь в этих бумагах.
			^
			Ты покорно отпускаешь крысу. Грызун с довольным видом принимается ползать по столу,
			обнюхивая бумаги и изредка мерзко попискивая. Вокруг начинает клубиться фиолетовый
			туман. Внезапно чернила на некоторых документах вспыхивают ярким светом.
			^
			-- Это то, что тебе нужно, -- голос мага звучит измождённым.
			^
			Ты сворачиваешь листы в трубочку и прячешь за пазуху вместе с крысой.
		]];
	end;
}

barracks_hq_goblet = obj {
	nam = 'Кубок';
	dsc = [[
		На краю стола, в отдалении от основной массы вещей, возвышается {кубок}.
	]];
	act = [[
		Ты берёшь кубок и вертишь его в руках, оценивающе разглядывая. Этот трофейный кубок
		ты помнишь отчётливо. Он пил из него в одну из побед вашего войска.
		^
		Режим штурмовал город, занятый урук-хай. Ваш отряд остался без командиров,
		и он возглавил его. Возражавших не нашлось, и он повёл отряд в атаку.
		Тогда ещё никто не знал, что эта атака закончится мясорубкой против главаря
		банды и его телохранителей.
		^
		Тот бой пережили единицы, но он прославился как герой. С того дня судьба
		развела вас. И теперь вы встретились уже не как два солдата, а как дезертир и
		капитан Режима.
		^
		В прежние времена разница между вами не ощущалась так остро. Если только твои
		воспоминания правдивы. Но ты понимаешь, что это не так. Ты всегда знал, что
		его амбиции затмевают твои. Он был способен достигать своих целей любыми средствами
		и готов был платить за это. Но самое главное -- он находил способ платить из
		чужого кармана.
		^
		В глубокой задумчивости ты возвращаешь кубок на место.
	]]
}
