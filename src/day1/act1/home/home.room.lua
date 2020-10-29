-- Локации
-- Вступление
intro = room {
	nam = "Пробуждение";
	dsc = [[
		Вот уже несколько лет каждое утро ты задаёшься вопросом, что ты делаешь
		в этой глуши. Сегодняшнее утро не стало исключением.
		Ты проснулся рано, едва небо на востоке начало светлеть, а вместе с
		ним и потолок твоего ветхого жилища. После войны ты заселил
		эту заброшенную хижину с разрешения деревенского старосты.
		Ты особо не распространялся о своём прошлом, а тот,
		в свою очередь, не задавал лишних вопросов.
		^
		Минувшая война прокатилась по землям Приграничья волной запустения.
		Люди стремились в крупные города с их иллюзией безопасности. Поселения,
		избежавшие гибели в пламени факелов, сейчас ждала не менее печальная
		судьба.
		^
		Твоя деревенька не исключение. Жизнь в ней постепенно угасает, и она
		рада притоку свежей крови, пусть и сомнительного качества. Можно
		сказать, что тебе здесь были даже рады, по крайней мере своё место
		ты нашёл.
		^
		Так что пока это жильё в глуши тебя вполне устраивает....
	]];
	obj = {
		'wake_up';
	};
	entered = function()
		return [[
			"Что вершит судьбу человека в этом мире? Некое незримое существо или закон,
			подобный длани господней парящей над миром? По крайней мере, истина
			-- то, что человек не властен даже над собственной волей."
			^
			^
			Кэнтаро Миура.
		]];
	end;
	exit= function()
		return [[
			Ты встаёшь, но слишком резко, и в глазах у тебя темнеет.
			Покачиваясь, комната растворяется во мраке,
			и тебе приходится опереться рукой о стену.
			^
			Пытаясь соориентироваться в пространстве,
			ты вспоминаешь, что сегодня хотел отправиться на охоту.
			Вчера вечером ты должен был всё подготовить.
			^
			Придя в себя, ты осматриваешься так, будто ты здесь впервые.
		]];
	end;
}

-- Объекты
-- Пробуждение
wake_up = obj {
	nam = "Пробуждиться";
	dsc = [[
		Лениво двигая мысли в своей голове, ты чувствуешь,
		что собирался что-то сделать сегодня.
		В конце концов ты решаешь {встать} и что-нибудь поесть.
	]];
	act = function()
		walk 'home';
	end;
}

-- Хижина
home = room {
	nam = 'Твоя хижина';
	dsc = function()
		if not home_first_enter then
			return [[
				Ты в своей хижине. Обычно это место твоей ночёвки,
				днём ты шатаешься по деревне и окрестностям.
				Только поэтому скудная домашняя обстановка не успела тебе опостылеть.
			]];
		end;
	end;
	obj = {
		'hunting_gear';
		'food';
		'journal';
		'trophies';
		'diary';
		'posters';
	};
	way = {
		'square';
	};
}
