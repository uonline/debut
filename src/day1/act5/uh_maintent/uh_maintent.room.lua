_got_dagger = false
_maintent_countdown = 3

local deadly_act = function(text)
	return function()
		_maintent_countdown = _maintent_countdown - 1
		if _maintent_countdown <= 0 then
			walk 'assassinated'
		else
			return text
		end
	end
end

uh_maintent = room {
	nam = 'Шатёр главаря';
	dsc = [[
		В шатре царит полумрак. Со временем глаза привыкают к темноте,
		и ты начинаешь различать окружающие предметы.
	]];
	obj = {
		'big_table';
		'boss';
		'maintent_rack';
		'maintent_chest';
		'battle_trophies';
		'maintent_guard';
	};
	way = {
		-- no way
	};
	entered = function()
		-- Clear inventory, add whitelisted items
		inv():zap();
	end;
}

dagger = obj {
	nam = 'Кинжал';
	inv = [[
		Ты внимательно рассматриваешь кинжал. Кривое лезвие в форме
		змеи хищно ловит блики тусклого света. Неожиданная для орка
		вещица.
	]];
}

big_table = obj {
	nam = 'Большой стол';
	dsc = [[
		Посреди шатра стоит большой {стол}, на нём беспорядок.
		Рядом воткнут потухший факел.
	]];
	act = function()
		local ret = [[
			Ты подкрадываешься к столу и рассматриваешь, что на нём лежит.
			Кто бы мог подумать, урук используют карты! Хотя, возможно,
			всё дело в этом главаре со странностями?
			^
			Осмотрев карту беглым взглядом, ты замечаешь на ней маркировку Режима
			Ремана. Обычно орки предпочитают трофеи иного рода...
			На карте изображено Приграничье в мелких подробнотях. Картографы Режима
			знают своё дело. Нашлась даже твоя деревня. Через неё проложена линия пути.
			С одной стороны она ведёт в замок местного лорда,
			и похоже туда урук уже наведывались. Вот только зачем?
			Иногда какой-нибудь лорд может нанять банду, чтобы избавиться от другой
			банды, которая разоряет его земли. Ты про это ничего не слышал.
			^
			По другую сторону от твоей деревни путь урук-хай лежит к ближайшему городу.
			И судя по вонзённому кинжалу на него планируется нападение.Тебе сложно
			в это поверить, ведь ты помнишь, какие гарнизоны Режим выставил в оккупированных
			городах Приграничья после войны. Ты пытаешься вспомнить как называется город, но
			тщетно. На карте тоже не разобрать. 
		]]
		if _got_dagger then
			return ret .. ' ' .. [[
				Дыра от кинжала красуется прямо на месте названия города.
			]]
		else
			_got_dagger = true
			inv():add('dagger')
			return ret .. ' ' .. [[
				Кинжал приходится торчит прямо в названии.
				^
				У тебя получается по-тихому высвободить клинок. Но с картами
				лучше не рисковать и оставить стол в покое.
			]]
		end
	end;
}

boss = obj {
	nam = 'Главарь';
	dsc = [[
		Прямо за столом установлен помост, на котором спиной ко входу
		неподвижно сидит {Главарь банды}.
		
	]];
	act = deadly_act [[
		Ты внимательно рассматриваешь главаря. Он застрыл в довольно странной
		для урук позе: ноги скрещены, руки покоятся на коленях, широченные плечи
		расправлены. Мощная спина производит неизгладимое впечатление.
		Главарь ничуть не уступает по габаритам берсерку, не хватает только
		татуировок.
	]];
	used = function(self, what)
		if what == dagger then
			walk 'uh_pit'
			return [[
				Ты подкрадываешься к сидящему орку и заносишь кинжал. Обхватив эфес двумя руками,
				ты готовишь обрушить клинок вниз. Но в момент удара натыкаешься на стену
				-- рука главаря сдавливает твоё горло.
				Ты чувствуешь как твои пятки отрываются от пола. Главарь встаёт на
				ноги, и твоя голова оказывается под потолком шатра.
				Тебя отшвыривают прочь словно куклу. Непродолжительный полёт заканчивается
				треском стола под ствоей спиной. Корчась от боли, ты успеваешь заметить
				как мимо пронеслись два рызмытых пятна -- твои сообщники орки.
				^
				С трудом ты приподнимаешься на локте и видишь, как главарь
				ударом в горло заставляет пошатнуться урук-стаража. Орк-телохранитель
				уже замер на полу с ятаганом в животе. Следующий удар укладывает рядом
				с ним и стража. Ты слезаешь со стола, но на большее пока не способен.
				^
				Не торопясь, главарь берёт из обмякших рук своего бывшего телохранителя меч.
				Два взмаха, и головы заговорщиков отделяются от тел. Главарь поднимает их за
				хвосты густых чёрных волос и швыряет тебе. Зачем-то ты их ловишь.
				...
				Он отрывает сундук и достаёт оттуда внушительный рог.
				Благие знают, что за чудовище раньше его носило.
				(того самого из чучи трофеев)
				Начальник указывает тебе на выход.
				^
				Вы выходите на площадь и он трубит в рог.
				^
				Со всех концов деревни появляются урук-хай. с десяток выходит из других шатров.
				Толпа окружает вас с главарём. Тот легонько бъёт тебя по спине и две головы из твоих рук падают на землю
				перед замершими орками.
				^
				-- Раб оказался на свободе. И виновные понесли наказание... - сверкнул глазами.
				...
				^
				-- Но раб жаждет свободы. Так дадим же ему её!
				Толпа отвечает рёвом. орки начинают стучать о щиты и доспехи. Выбивая кровожадный ритм.
				-- Привести остальных пленников.
				Тебя поднимают на руки и куда-то несут.
				Скидывают в яму.
			]]
		end
	end
}

maintent_rack = obj {
	nam = 'Стойка';
	dsc = [[
		На нём нет ни оружия, ни брони, они сложены на {стойке}
		в левом дальнем углу.
	]];
	act = deadly_act [[
		Ты осматриваешь снаряжение главаря и заключаешь, что человек
		будет просто погребён под этой грудой металла.
	]];
}

maintent_chest = obj {
	nam = 'Сундук';
	dsc = [[
		Справа ты различаешь {что-то похожее на cундук}.
	]];
	act = deadly_act [[
		Сундук выглядит внушительно: дерево обитое железом. Замка
		вроде не видно, но подойти ближе ты не решаешься.
	]];
}

battle_trophies = obj {
	nam = 'Главарь';
	dsc = [[
		Прямо перед главарём высится {огромная куча награбленного}.
	]];
	act = deadly_act [[
		Ты внимательно рассматриваешь трофеи. В основании кучи стоит несколько сундуков.
		Сверху довольно неряшливо накиданы различные части доспехов, оружие, тряпьё вроде
		плащей или мантий из дорогой материи, какие-то мешки. На вершине кучи покоится
		крупный рогатый череп пугающей формы. Лишь Благие знают, какому чудовищу он
		принадлежал раньше, но от одного вида этого оскала у тебя внутри всё переворачивается.
		Один из рогов черепа обломан.
	]];
}

maintent_guard = obj {
	nam = 'Телохранитель';
	dsc = [[
		^
		Кроме вас троих в шатре есть {ещё один урук}, видимо телохранитель главаря.
		Он стоит в самом тёмном углу шатра и обменивается многозначительными
		взглядами с вошедшим с тобой орком. Ты чувствуешь, что
		медлить нельзя.
	]];
	act = deadly_act [[
		Ты ловишь взгляд урук. В ответ он выразительно проводит
		большим пальцем по горлу. Тебе остаётся только гадать,
		кого они имеет ввиду: своего главаря или сбежавшего раба.
	]];
}
