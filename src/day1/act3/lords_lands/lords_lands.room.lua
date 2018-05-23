lords_lands_to_thicket = vroom('Чаща', 'thicket');
lords_lands_to_thicket:disable();

_lords_lands_wolves_arrival = 3;

bad_stuff = function()
	_lords_lands_wolves_arrival = _lords_lands_wolves_arrival - 1;
	if _lords_lands_wolves_arrival <= 0 then
		walk 'wolfest'
	end
end

lords_lands = room {
	nam = 'Лордские угодья';
	dsc = [[
		Ты стоишь у опушки леса среди угодий лорда. Солнце уже высоко. Его лучи 
		легко прорезают листву деревьев и кустарника, дразня тебя пятнами
		света на земле.
		^
		Что ж, пора найти какую-нибудь дичь. Если кто-нибудь кроме лесника
		увидит тебя здесь, охота может кончиться плохо.
	]];
	way = {
		lords_lands_to_thicket;
	};
	obj = {
		'lords_lands_bad1';
		'lords_lands_bad2';
		'lords_lands_bad3';
		'lords_lands_good';
		'lords_lands_bad4';
	};
	entered = function()
		-- Clear inventory, add whitelisted items
		inv():zap();
		inv():add('ll_bow');
	end;
}

lords_lands_good = obj {
	nam = 'Овраг';
	dsc = [[
		Вдалеке виднеется {овраг}, возможно, там есть ручей или ещё что.
	]];
	act = function()
		lords_lands_to_thicket:enable();
		return [[
			Ты спускаешься в овраг и находишь там следы оленя. Они ведут
			дальше в чащу.
		]];
	end
}

lords_lands_bad1 = obj {
	nam = 'Куст';
	dsc = [[
		Рядом с тобой заросли какого-то {ягодного куста}.
	]];
	act = function()
		bad_stuff();
		return [[
			Ты заглядываешь под куст и среди перезрелых ягод, находишь
			несколько старых следов то ли оленя, то ли кабана.
		]];
	end
}

lords_lands_bad2 = obj {
	nam = 'Дерево';
	dsc = [[
		Примерно в трёх шагах от тебя высится {здоровенный дуб}. Его могучий ствол густо
		зарос мхом.
	]];
	act = function()
		bad_stuff();
		return [[
			Ты подходишь к дереву и осматриваешь ствол. Мох похож на дырявое покрывало.
			Видимо его кто-то совсем недавно жевал. Жёлудей на земле тоже не особо много.
		]];
	end
}

lords_lands_bad3 = obj {
	nam = 'Грибы';
	dsc = [[
		Под деревом растёт {куча грибов}.
	]];
	act = function()
		bad_stuff();
		return [[
			Ты садишься и осматриваешь грибы. Большая часть никуда не годится,
			вряд ли на них вообще кто-нибудь позарился бы.
		]];
	end
}

lords_lands_bad4 = obj {
	nam = 'Сухие листья';
	dsc = [[
		Прямо у тебя под ногами {ковёр из опавших листьев}.
	]];
	act = function()
		bad_stuff();
		return [[
			Ты внимательно исследуешь листья, но не находишь там
			ни намёка на следы.
		]];
	end
}
