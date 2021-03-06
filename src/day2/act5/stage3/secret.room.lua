-- События

-- Узнаём где спрятана книга о башне
on_event('got tower book location', function()
	tower_stage3_secret_room_book_shelves:disable();
	tower_book:enable();
end)

-- Локация
tower_stage3_secret_room = room {
	nam = 'Потайная библиотека';
	dsc = [[
		Ты попадаешь в ещё одно безразмерное помещение. Поразительно,
		но здесь ещё темней, чем в архиве. Одинокий факел закреплён у
		входа. Помимо темноты в помещении царит дикий холод. Ты чувствуешь,
		как по спине пробегает холодок.
	]];
	obj = {
		'tower_stage3_secret_room_book_shelves';
		'tower_book';
	};
	way = {
		'tower_stage3_archive';
	};
}

-- Объекты локации
-- Полки с книгами
tower_stage3_secret_room_book_shelves = obj {
	nam = 'Полки с книгами';
	dsc = [[
		Дрожащий свет факела позволяет тебе рассмотреть очередные {полки с книгами}.
		Здесь их ещё больше, чем в архиве. По крайней мере, так кажется из-за
		темноты.
	]];
	act = [[
		Ты рассматриваешь книги на полках. Здесь покоятся книги самых разных
		размеров и форм, от совсем маленьких карманных, до увесистых
		фолиантов. Неожиданно для тебя некоторые книги выглядят весьма пугающе.
		Ты готов поклясться, что видел как одна книга содрогралась как живая.
		Она была закована в цепи, словно заключённый.
	]];
}

-- Книга о башне
tower_book = obj {
	nam = 'Книга о башне';
	dsc = [[
		Дрожащий свет факела позволяет тебе рассмотреть очередные {полки с книгами}.
		Здесь их ещё больше, чем в архиве. По крайней мере, так кажется из-за
		темноты.
	]];
		--^
		--Где-то здесь, совсем рядом, лежит нужная тебе книга. Нужно только
		--покопаться на {ближайших полках}.
	tak = function()
		tower_stage3_secret_room_book_shelves:enable();
		event 'learned stairway symbols';
		return [[
			Ты находишь третий стеллаж от входа и перебираешь книги на полке
			на уровне глаз. Искомая незаконченная книга и правда быстро отыскивается.
			^
			Ты с нетерпением листаешь книгу в поисках инструкций, о которых ты прочитал
			в свитке архива. Таковые отыскиваются на первых же страницах.
			^
			Похоже, чтобы пробраться на этаж, где расположены покои наместника
			и советников, нужно найти специальные символы около лестницы
			на этаже с караульной. Стоя рядом с этими символами, нужно прочитать
			заклинание. К счастью для тебя, текст заклинания написан в книге.
			Поэтому ты решаешь забрать её с собой.
		]];
	end;
	inv = [[
		Ты открывешь книгу на последних исписанных страницах и начинаешь читать:
		^
		^
		Некоторые свойства башни всё ещё вызывают некоторые вопросы, если не сказать
		больше: они вызывают опасения. Похоже мне придётся потратить значительную
		часть времени, чтобы изучить это место до конца. Иначе работать здесь будет
		просто опасно.
		^
		После всех этих одиозных исчезновений, что были так умело обставлены, я совершенно
		забыл о том, что некоторые люди <b>действительно</b> исчезали в башне. А я не люблю,
		когда что-то или кто-то исчезает неведомо куда прямо у меня под носом.
		^
		Все эти случаи нужно будет расследовать.
	]];
	used = function(self,what)
		-- Смотрим на книгу через подзорную трубу
		if what == tower_spyglass then
			return [[
				Тебе приходит в голову странная мысль -- взглянуть на книгу через
				подзорную трубу. Ранее просмотренный тобой текст не изменился.
				Зато обнаружился текст на страницах, что были чистыми.
				^
				^
				История создания этой Башни определённо войдёт в историю. После того,
				как я обнаружил аномалии в нескольких городах приграничья,
				я набрался смелости использовать эти плохо изученные источники магии.
				^
				Решение по созданию собственной Башни, показалось мне наиболее удачным
				способом использовать аномалии.
				Пускай Магос сколько угодно оспаривает моё право быть полноправным
				волшебником со своего захудалого острова. Здесь в Приграничье я буду
				сам себе и магом башни, и архимагом.
				^
				Конечно, в большинстве случаев власть отказалась сотрудничать в открытую,
				и пришлось прибегать к грубому шарлатанству и манипуляциям. Лишь в одном
				городе наместник Режима оказался разумным человеком, и согласился на мои
				условия. Интересно, где он теперь.
				^
				Я обзавёлся ценными связями как в Вольных городах, так и в Приграничье.
				Заключил несколько выгодных соглашений. Скоро все мои финансовые потери
				от строительства возместятся.
				^
				До создания моей Башни остаётся совсем немного времени.
				Все механизмы уже запущены, остаётся лишь наблюдать, как чужие
				руки сделают меня первым настоящим магом Приграничья.
			]];
		end;
	end;
}
tower_book:disable() -- Прячем книгу о башне
