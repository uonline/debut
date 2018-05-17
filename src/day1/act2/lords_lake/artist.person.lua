artist = obj {
	nam = 'Художник';
	dsc = [[
		По колено в воде перед мольбертом стоит {художник}, экспрессивного вида
		мужчина в широкополой шляпе с кучей невнятных перьев на бритой голове.
		Перед ним на странного вида плоту дрейфует обнажённая девушка
		с необычными ярко-жёлтыми волосами. Со стороны может
		показаться, что она сидит на водной глади.
	]];
	act = function()
		walk 'artist_dlg'
	end;
}

artist_dlg = dlg {
	nam = 'Художник';
	hideinv = true;
	entered = [[
		-- О, а вот и мой очередной почитатель! Но Благие тебя побери, как ты прошёл
		мимо стражи?!
	]];
	phr = {
		{
			true;
			'У меня к тебе деловое предложение';
			[[
				-- Сейчас я как раз сильно занят одним из таких предложений. В другой раз.
				^
				Ты молча показываешь художнику свиток. На секунду он...
				...
				^
				-- Неужели это действительно, то о чём я думаю?
				^
				-- Если ты думаешь, что это свиток заклятья... то ты прав.
				^
				-- Быть того не может... Представляешь, сколько он стоит? И что с тобой сделают,
				прихвостни Церкви, если узнают об этом?
				^
				-- Я готов разделить этот риск с тобой, взамен на этот портрет.
				^
				Художник смотрит на тебя с изумлением.
				^
				-- Но он же не окончен?!
				^
				-- Мне видится, что самое главное на нём есть.
				^
				...оглядывается через плечо на стражников.
				^
				-- Чтоже это воистину деловое предложение, заслуживающее мое внимания. С ним я смогу
				рискнуть написать картину для куда более претенциозного заказчика, чем лорда глухой
				провинции...
				^
				-- Но надеюсь, ты понимаешь, что я не могу отдать тебе именно этот портрет. Хотя кажется
				я понял твои желания. Один момент, -- он поспешно собирает что-то из внушительного вида сундука в конверт...
				-- Вот, возьми, это все мои эскизы по этой работе. Мы с моей натурщицей,
				довольно долго выбирали подходящую позу для финального варианта. К тому же там есть пара неудачных картин.
				Думаю тебя это устроит?
				^
				-- О, деловое предложение превзошло все ожидания!
				^
				-- Тогда расстанемся на этом.
			]];
			function()
				event 'photographed the princess'
			end;
		};
		{
			always = true;
			'Я пойду.';
			'-- Ага.';
			function()
				back()
			end;
		};
	};
}
