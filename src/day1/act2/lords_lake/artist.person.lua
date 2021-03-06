artist = obj {
	nam = 'Художник';
	-- "мужчина в широкополой шляпе с кучей невнятных перьев на бритой голове." (мужчина, на бритой голове которого красуется широкополая шляпа с кучей невнятных перьев)
	dsc = [[
		По колено в воде перед мольбертом стоит {художник}: экспрессивного вида
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
		-- О, а вот и мой очередной почитатель! Но, Благие тебя побери, как ты прошёл
		мимо стражи?!
	]];
	phr = {
		{
			true;
			'У меня к тебе деловое предложение';
			[[
				-- Сейчас я как раз сильно занят одним из таких предложений. В другой раз.
				^
				Ты молча показываешь художнику свиток. Поначалу он лишь хмурит брови, но
				вскоре его охватывает изумление.
				^
				-- Неужели это действительно то, о чём я думаю?
				^
				-- Если ты думаешь, что этот свиток позволит тебе меньше марать краской
				холст, то ты прав.
				^
				-- Быть того не может... Представляешь, сколько он стоит и что сделают
				прихвостни Церкви, если найдут у тебя такое?
				^
				-- Я готов разделить этот риск с тобой взамен на этот портрет.
				^
				Художник смотрит на тебя с изумлением:
				^
				-- Но он же не окончен!
				^
				-- Я вижу, что самое главное на нём есть.
				^
				-- Воистину деловое предложение, заслуживающее моего внимания. С ним я смогу
				рискнуть написать картину для куда более требовательного заказчика, чем лорд
				глухой провинции...
				^
				Художник с опаской озирается на стражников.
				^
				-- Но, надеюсь, ты понимаешь, что я не могу отдать тебе именно этот портрет. Хотя, кажется,
				я понял твои желания. Один момент... -- Он поспешно достаёт что-то из внушительного вида
				сундука и собирает в свёрток. -- Вот, возьми все мои эскизы по этой работе. Мы с моей натурщицей
				довольно долго выбирали подходящую позу для картины. К тому же
				там есть первый неудачный вариант. Думаю, тебя это устроит.
				^
				-- Вы превзошли мои ожидания, мэтр!
				^
				-- Тогда расстанемся на этом.
				^
				Ещё раз окинув взглядом картину, ты решаешь, что эскизы прибережёшь
				для себя, на будущее. С лесником вы договаривались только на портрет. Ему хватит.
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
