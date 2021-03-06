barracks_to_barracks_hq = vroom('Комната капитана', 'barracks_hq')
barracks_to_barracks_hq:disable()

barracks = room {
	nam = 'Бараки';
	dsc = [[
		Ты осторожно входишь в просторное помещение казарм, стараясь не попадать
		под свет факелов. Узкие окна закрыты ставнями, но в щелях уже брезжит свет.
		В зале стоит запах немытых тел и кислого пива. Совсем скоро должны дать побудку,
		но тебе кажется, что ничто не заглушит громоподобный храп в несколько глоток.
	]];
	obj = {
		'barracks_rat_dialog';
		'barracks_soldiers';
		'barracks_stash';
		'barracks_oak_door';
	};
	way = {
		'barracks_hall';
		barracks_to_barracks_hq;
	};
}

barracks_rat_dialog = obj {
	nam = 'Диалог с крысой о казармах';
	dsc = [[
		Солдатские кровати сбиваются в нестройные ряды с узкими проходами,
		заполняя собой весь {зал}. Тебе начинает казаться,
		что мебель вот-вот ударится в марш в такт этому храпу.
	]];
	act = [[
		-- Глядя на всё это, -- раздаётся шёпот мага у тебя в голове, -- забываешь,
		что армия Режима за двести лет своего существования смогла
		прославиться как самая дисциплинированная в на континенте.
		^
		-- В Магосе не слышали про Доказательство Кровью? -- шепчешь ты в ответ.
		-- Любой, кто прослужит солдатом Режима, может стать его гражданином.
		Большая часть из этих горе-вояк -- местные, которые мечтают бряцать
		оружием на людях и жрать даром.
		^
		-- Из разговоров тюремщиков я понял, что капитану плевать на проблемы
		с дисциплиной, -- продолжает вещать маг, --
		он всё время в разъездах, но все авторитетные солдаты -- его
		доверенные люди. В городе их уже сравнивают с бандитами.
		^
		-- Режимники -- те ещё бандиты, -- усмехаешься ты про себя, но в свою
		очередь вспоминаешь свою бытность солдатом. В гарнизоне твоего родного
		города всегда царил строгий порядок.
	]];
}

barracks_soldiers = obj {
	nam = 'Спящие солдаты';
	dsc = [[
		Половина постелей пуста, в остальных как попало валяются {солдаты}.
		Некоторые даже не потрудились стянуть сапоги
	]];
	act = [[
		Ты осматриваешь солдат, подолгу задерживая взгляд на каждом,
		и приходишь к выводу, что некоторые участвуют в попойках регулярно.
		^
		Ты вспоминаешь, когда тебе самому удавалось хорошенько приложиться к
		бутылке за время службы. Такое бывало лишь после серьёзных побед Режима
		в войне.
	]];
}

barracks_stash = obj {
	nam = 'Тумбочки';
	dsc = [[
		и спят, закинув ноги на низенькие {тумбочки}.
	]];
	act = function()
		if have('guard_letter') then
			return [[
				Ты не решаешься приблизиться к другим тумбочкам.
			]]
		end
		take 'guard_letter'
		return [[
			Ты делаешь пару шагов к ближайшей тумбочке, памятуя о старом армейском правиле
			-- салаги спят у входа, подальше от камина.
			Порывшись в тумбочке, ты извлекаешь оттуда письмо за авторством некоего Реджинальда.
			Пробежав свежую бумагу глазами, ты ликуешь -- догадки оказались верны,
			совсем недавно на службу Режиму поступил новый рекрут.
			^
			К счастью, твоя возня ничуть не помешала сну этого рекрута.
			Он продолжил счастливо лепетать сквозь сон и храп что-то про пироги с яблоками.
		]]
	end;
}

barracks_oak_door = obj {
	nam = 'Дверь';
	dsc = [[
		Прямо напротив входа едва тлеет большой камин. Справа от него
		{массивная дубовая дверь} скрывает соседнее помещение, видимо,
		особой важности.
	]];
	act = [[
		Ты скептически осматриваешь дверь. Без нужного ключа даже и
		пытаться не стоит к ней подходить.
	]];
	used = function(self, what)
		if what == rat then
			barracks_to_barracks_hq:enable()
			return [[
				Ты подкрадываешься к двери и извлекаешь крысу на свет.
				В ответ она оплетает хвостом твоё запястье.
				^
				-- Какие вещи хочешь приобрести на этот раз? -- глазки-бусинки хитро
				поблескивают под светом факелов.
				^
				-- Исключительно важные для нашего общего дела.
				^
				-- Слушай, за последние дни я успел изучить тюремный коридор вдоль и поперёк, --
				ты никак не реагируешь. -- И я вспомнил, что видел тебя на одном из
				плакатов розыска. Ты дезертир Режима. В бегах уже несколько лет.
				^
				-- Это так важно сейчас?
				^
				-- Просто хочу быть в курсе, с кем имею дело.
				^
				-- И это говорит крыса. Открывай уже замок.
				^
				Недовольно пискнув, крыса пронзает тебя взглядом лиловых глаз. Замок со звучным
				щелчком открывается, и ты едва успеваешь подхватить его, чтобы он не
				грохнулся на пол. С грызуном в одной руке и замком в другой ты замираешь перед
				приоткрывшейся дверью.
			]]
		end
	end;
}
