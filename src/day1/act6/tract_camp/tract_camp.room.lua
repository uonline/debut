tract_camp_to_dream = vroom('Лечь спать', 'dream');
tract_camp_to_dream:disable();

on_event('talked to black guy', function()
	tract_camp_to_dream:enable()
end)

tract_camp = room {
	nam = 'Стоянка повозки у тракта';
	dsc = [[
		-- Эй, просыпайся! -- чья-то рука грубо толкает тебя в бок. -- Если
		не хочешь остаться без жратвы, конечно.
		^
		Сознание медленно возвращается к тебе. Ты обнаруживаешь себя сидящим на земле
		с испариной холодного пота на лбу.
		В спину упирается колесо повозки. Над тобой на фоне чёрного неба возвышается
		здоровенный бородатый детина в панцире и с миской в руках.
		^
		-- Я опять пленник? -- спрашиваешь, ты. Бородач нехотя усмехается.
		^
		-- Пока ещё нет. Доберёмся до города, а там как решит капитан, --
		он кивает в сторону костра. Там сидит тот самый человек, что совсем недавно
		разговаривал с главарём банды урук-хай.
		^
		Удовлетворив своё любопытство, ты решаешь удовлетворить и голод. Жадно выхватив
		миску из рук здоровяка, ты обнаруживаешь на ней жареную оленину -- напоминание
		о твой неудачной охоте.
		^
		Заметив твоё
		замешательство, бородач было попытался вернуть миску, но ты вовремя опомнился.
		Под заунывные трели желудка ты набрасываешься
		на еду, не забывая поглядывать по сторонам. Уже темно, и только
		пламя костра освещает лица твоих новоиспечённых спутников.
	]];
	obj = {
		'tract_guard_1';
		'tract_guard_2';
		'tract_captain';
		'tract_mystery';
	};
	way = {
		tract_camp_to_dream;
	};
	entered = function()
		inv():zap();
		take 'a6_the_thing'
	end;
}

tract_guard_1 = obj {
	nam = 'Стражник';
	dsc = [[
		{Бородач} подпирает повозку. Его явно клонит в сон: он всё время зевает.
		Он тут явно в качестве стражника.
	]];
	act = [[
		-- Будешь задавать ещё вопросы, -- ловит твой взгляд здоровяк, --
		сделаю пленником досрочно.
	]];
}

tract_guard_2 = obj {
	nam = 'Стражник';
	dsc = [[
		Чуть дальше стоит {ещё один стражник}. Этот сразу показался тебе
		каким-то странным.
		Как бы ты не старался, тебе никак не удавалось увидеть его лицо --
		почему-то он всё время то поворачивался спиной, то скрывался за спинами
		других. Сейчас он стоит перед тобой спиной к костру,
		так что лица опять не разобрать.
	]];
	act = [[
		-- Удивительное это время -- ночь.
		-- говорит он тебе тихим, вкрадчивым голосом, --
		В темноте сложно понять, где кончается явь, а где начинается сон. --
		^
		Ты не отвечаешь: рот занят.
	]];
}

tract_captain = obj {
	nam = 'Капитан';
	dsc = [[
		По другую сторону от костра {капитан} сидит на ящике
		и подбрасывает в воздух игральные кости.
	]];
	act = [[
		При свете костра капитан уже не кажется тебе таким молодым, каким показался
		в первый раз. Алые всполохи избегают морщины у глаз и рта, оставляя
		на их месте чёрные тени. На висках блестит седина.
		Капитан выглядит задумчивым, но с его лица не сходит лёгкая усмешка.
	]];
}

tract_mystery = obj {
	nam = 'Фигура в плаще';
	dsc = [[
		{Фигура в плаще} что-то тихо объясняет ему, иногда вскидывая ладонь
		своей тонкой руки с длинными пальцами, на одном из которых
		красуется крупный синий перстень.
	]];
	act = function()
		event 'talked to black guy'
		return [[
			Ты начинаешь изучать своего загадочного спутника, гадая кому
			может принадлежать такая привлекательная рука, да к тому же так богато 
			украшенная. Фигура охотно поворачивается к тебе,
			но что-то разглядеть в чёрном провале капюшона невозможно.
			^
			-- Сегодня тебе выпал трудный день, -- неожиданно мелодичныЙ голос
			незнакомца заставляет тебя вздрогнуть, -- но и дальше будет не легче.
			Тебе стоит отправиться в царство снов сейчас, если не хочешь
			отправиться в царство смерти завтра. --
			^
			"Поспать -- неплохая мысль," -- думаешь ты.
		]];
	end;
}
