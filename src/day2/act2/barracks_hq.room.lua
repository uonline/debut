barracks_hq = room {
	nam = 'Комната капитана';
	dsc = [[
		Ты в комнате капитана штаба режима. Здесь довольно тесно, и полумрак лишь
		усиливает это ощущение. Тусклый утренний свет проникает в комнату через
		крохотное окно под потолком и выхватывает из остатков ночной тьмы самые
		разные предметы. На стенах бледно отсвечивают черепа одичалых орков.
		В своей монструозности они превосходят, тот что висел у тебя в хибаре.
		По соседству с черепами развешаны несколько вычурных подсвечников. Прямо посреди
		комнаты стоит заваленный стол, за ним -- кровать с горой какого-то тряпья.
		Пол захламлён под стать столу: мешки, сумки, сундуки и деревянные ящики --
		шагу ступить нельзя чтобы обо что-нибудь не споткнуться. Найти что-то
		в этом хаосе кажется тебе невозможным.
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
		Среди всего этого хлама, ты решаешь сосредоточиться на предметах, плотным слоем
		покрывающих стол. Твоё внимание привлекает {огарок свечи}, вокруг которого словно
		в застышем во времени танце замерли прочие вещи.
	]];
	act = [[
		Ты ощупываешь свечу. Чуть тёплая. Горела совсем недавно.
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
		крышки пару камней, но ты решаешь не тратить время на варварство.
	]]
}

barracks_hq_envelops = obj {
	nam = 'Конверты';
	dsc = [[
		Вокруг шкатулки разбросано с десяток {конвертов} разных мастей и размеров,
		большая часть из которых распечатана.
	]];
	act = [[
		Ты перебираешь конверты. На каждом начертаны какие-то неизвестные тебе символы.
		Надписи больше похожи на коды, а не слова какого-то языка.
	]]
}

barracks_hq_docs = obj {
	nam = 'Бумаги капитана';
	dsc = [[
		Под ними ковром опавших листьев покоится слой {исписанных бумаг}
		с вкраплениями нескольких перьев для письма.
	]];
	inv = [[
		Напрягая зрение в полумраке ты пытаешься изучить документы...
		Ты пролистываешь бумаги. "Убить", "закопать", "сгноить", "подкупить",
		"предать", стоп, кого предать? О, смотрите, да они тут заговор затеяли.
		^
		^
		"Содержимое шкатулки поможет тебе, подкупить подкупить кого-надо."
	]];
	tak = function()
		take 'guard_docs';

		return [[
			Ты начинаешь копаться в бумагах. Первым тебе в руки, как нельзя кстати, попадает
			совсем свежий документ на нового рекрута Режима. Ты тут же прячешь его и уже
			собираешься покинуть комнату...
			^
			Диалог с крысой
			^
			-- Расскажи мне о тех годах, пока ты жил в какой-нибудь хижине в лесу. И я
			я расскажу тебе, какую жизнь ты проживёшь.
			^
			<b>Маг предупреждает ГГ, что тому будет не так просто выбраться из города.
			Режим установил в городе, проверку всех кто входит и выходит, а значит его могут опознать.
			Единственный выход -- обратиться за помощью местному подполью -- бандам воров и бандитов,
			единственной опозиции в городе, противостоящей Режиму на равных. К тому же, их могут
			заинтересовать эти документы.</b>
		]];
	end;
}

barracks_hq_goblet = obj {
	nam = 'Кубок';
	dsc = [[
		На столе стоит {кубок}.
	]];
	act = [[
		^
		Ты берёшь кубок и вертишь его в руках оценивающе разгрялдывая. Вещь
		кажется тебе смутно знакомой. Ты представляешь себе капитана, выпивающего
		из этого кубка и что-то внутри тебя вздрагивает. Вернув кубок на место,
		тебе всё же не удаётся избавиться от игры воображения. Лицо само капитана
		всплывает в памяти и если раньше оно казалось тебе знакомым, то сейчас
		...
		^
		<i>ГГ должен вспомнить капитана и годы свой службы в армии Режима.</i>	
	]]
}
