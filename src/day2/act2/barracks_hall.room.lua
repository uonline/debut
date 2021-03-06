barracks_hall = room {
	nam = 'Коридор штаба';
	dsc = [[
		Ты стоишь посреди просторного коридора, освещённого пламенем
		многочисленных факелов. Прямо перед тобой на стене висит
		знамя Режима Ремана. Ты делаешь неутешительный
		вывод, что тебя доставили прямиком в городской штаб Режима --
		место с кучей солдат, богоизбранных магов и парой твоих портретов
		с подписью "розыск".
		^
		К счастью, сейчас ещё раннее утро; солдаты и богоизбранные спят, портреты
		мирно пылятся на стенах.
	]];
	obj = {
		'barracks_hall_flag';
		'barracks_hall_doors';
	};

	way = {
		'barracks_armory';
		'barracks';
		'barracks_dance_floor';
	};
}

barracks_hall_flag = obj {
	nam = 'Флаг Режима';
	dsc = [[
		Блики факелов покорно лижут тёмно-зелёную материю {флага}, на которой вышит
		символ Режима -- серебристое око с древом вместо зрачка.
	]];
	act = [[
		Ты рассматриваешь изображение на знамени. Корни древа берут начало
		из раскрытой книги. С самого начала твоей службы в рядах армии Режима
		это древо напоминало тебе песочные часы. Тебе нравилось думать, что
		они отсчитывают время до конца твоей солдатской жизни. Ты представлял,
		как каждый всколох ткани от ветра сцеживает невидимые песчинки на дно
		часов.
	]];
};

barracks_hall_doors = obj {
	nam = 'Двери';
	dsc = [[
		Прямо под флагом красуется дверь с репликой щита и меча.
		Помимо неё здесь ещё {несколько дверей}.
	]];
	act = [[
		Ты рассматриваешь двери по очереди. Та со щитом и мечом наверняка
		ведёт в арсенал. Реплика в виде ряда шлемов обозначает солдатские казармы.
		Половник и тесак -- кухню. Флаг -- главный зал. Остальные двери никак не
		отмечены.
	]];
};
