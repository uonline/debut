-- Локация
tower_stage3 = room {
	nam = 'Башня';
	dsc = function()
		if not tower_stage2_thieves_leader:disabled() then
			event 'thieves leader disappeared';
			return [[
				Вы в спешке поднимаетесь по лестнице. Главарь подполья снова впереди, ты едва
				поспеваешь за ним. Бывший торгаш преодолевает по несколько ступенек за раз,
				и исчезает за поворотом лестницы. Ты поднимаешься на следующий этаж и понимаешь,
				что больше тебя никто не сопровождает. Главарь исчез.
			]];
		end;

		return [[
			Ты снова поднимаешься выше и оказываешься на следующем этаже.
		]];
	end;
	obj = {
		'tower_stage3_armor';
		'tower_stage3_windows';
		'tower_stage3_floor_paper';
		'tower_stage3_floor_map';
		'tower_stage3_tabels';
		'tower_stage3_chairs';
		'tower_stage3_bookshekves';
		'tower_stage3_picture';
	};
	way = {
		vroom('Архив', 'tower_stage3_archive');
		vroom('Лестница', 'tower_stage4');
	};
}

-- Объекты локации
-- Доспехи
tower_stage3_armor = obj {
	nam = '';
	dsc = [[
		Перед тобой просторная зала с высокими потолками, всем своим видом и обстановкой
		похожая на покои для проведения советов. Кажется, что совсем недавно здесь заседали
		влиятельные горожане, решающие важные проблемы своего города.
		^
		Подобно страже вдоль стен расставлены {истуканы доспехов},
		поблескивающие сталью лат и громоздких двуручных мечей.
	]];
	act = [[
		Ты с интересом рассматриваешь истуканов. Больше всего внимания, привлекают
		мечи, которые сжимают в руках латные рукавицы. Это внушительное вооружение
		оживляет у тебя в памяти армейские рассказы о крестоносцах -- знаменитых
		богоизбранных воителях. Говорили, что их доспехи и оружие настолько
		тяжелы, что лишь использование магии позволяло с ними обращаться.
	]];
	used = function(self, what)
		if what == tower_spear then
			-- Тыкаем копьём в доспехи
			return [[
				Из любопытства ты тычешь копьём в ближайший доспех.
				Доспех отвечает гулким звоном, но истукан продолжает стоять.
				^
				Любуясь, как клинок в руках истукана вибрирует, словно на ветру,
				ты вспоминаешь ещё одну байку о силе крестоносцев. Ветераны рассказывали,
				что богоизбранные подчиняли себе воздушную стихию. Их удары рождали порывы
				ветра, способные опрокинуть с десяток человек в строю. Даже самые
				могучие орки, не могли устоять перед их мощью.
			]];
		end;
	end;
}

-- Окна
tower_stage3_windows = obj {
	nam = '';
	dsc = [[
		Над ними красуются просторные {окна}, скрытые за синими полупрозрачными шторами.
		Благодаря им зала наполняется каким-то магическим голубоватым светом.
	]];
	act = [[
		Ты рассматриваешь витиеватый узор, покрывающий синеву штор. Тебе неизвестна
		ткань, из которой они сделаны. Пробуя её на ощупь, ты вспоминаешь торговцев
		из Вольных городов, которых ты выставил с рынка.
		Тебе кажется что, это всё было в другой жизни, хотя прошло всего лишь несколько часов.
	]];
	used = function(self, what)
		if what == tower_spear then
			return [[
				От нечего делать, ты сдвигаешь копьём одну из штор, и к своему удивлению
				обнаруживаешь, что окружающий тебя солнечный свет не меняет своего цвета.
				Солнечные лучи из окна продолжают заполнять пространство голубым сиянием.
				Тебе начинает казаться, что воздух наполнен чем-то, каким-то дурманящим
				разум веществом. Иначе как объяснить твоё странное спокойствие, граничащее
				с безразличием.
			]];
		end;
	end;
}

-- Бумаги на полу
tower_stage3_floor_paper = obj {
	nam = '';
	dsc = [[
		Мистическую картину дополняют разбросанные по полу белые пятна {бумаг}.
		Исписанные чернилами, украшенные печатями, скрученные в свитки, они образуют
		какой-то завораживающий рисунок.
	]];
	act = [[
		Ты нехотя пинаешь ногой один из свитков. Рулон бумаги с удовольствием разгоняется,
		и уезжает под ближайший стол, оставляя после себя полотно с ровными строчками букв.
	]];
	used = function(self, what)
		if what == tower_spear then
		end;
	end;
}

-- Карта
tower_stage3_floor_map = obj {
	nam = '';
	dsc = [[
		Под этим рисунком на полу оказывается спрятан ещё один: если присмотреться, то
		среди бумаг можно разглядеть фрагменты {карты Приграничья}. Она изображена прямо в
		центре залы.
	]];
	act = [[
		Ты осматриваешь островки карты на полу в попытке отыскать тот самый город. С трудом
		отыскав знакомые названия нескольких крупных поселений, ты бросаешь эту затею.
		У тебя не возникает даже намёка на желание, расчистить пол от бумаг.
	]];
	used = function(self, what)
		if what == tower_spear then
		end;
	end;
}

-- Столики
tower_stage3_tabels = obj {
	nam = '';
	dsc = [[
		Вокруг карты расставлен десяток {столов}. К каждому приставлен один, а то
		и несколько подсвечников,
	]];
	act = [[
		Столы занимают стопки книг, свитки, огарки свечей и пятна от чернил.
		На всём присутсвует легко различимая пыль.
	]];
	used = function(self, what)
		if what == tower_spear then
		end;
	end;
}

-- Стулья
tower_stage3_chairs = obj {
	nam = '';
	dsc = [[
		а так же по паре {стульев}.
	]];
	act = [[
		Ты представляешь как благородные лорды и советники, восседают на этих стульях,
		обсуждая проблемы города.
		^
		Тебя самого так и подмывает развалиться на одном из резных стульев и погрузиться
		в сладостный сон. Ты так устал за день, что даже голод отступает на второй план.
	]];
	used = function(self, what)
		if what == tower_spear then
		end;
	end;
}

-- Полки с книгами у стен
tower_stage3_bookshekves = obj {
	nam = '';
	dsc = [[
		В глубине залы стену заслоняют {стеллажи с книгами}, между
		которыми можно разглядеть небольшую дверцу.
	]];
	act = [[
		Ты осматриваешь снизу вверх внушительных размеров стеллаж, полки которого
		полностью заставлены книгами. Остаётся только гадать, откуда взялось
		всё это богатство. Хотя тебе и известно, что Режим очень много внимания уделяет
		знанию и образованию, но не верится, что все эти книги появились здесь после
		войны. Школы для богоизбранных открываются лишь в самом Режиме. За его пределы
		просачиваются разве что миссионеры и учителя.
	]];
	used = function(self, what)
		if what == tower_spear then
		end;
	end;
}

-- Картина
tower_stage3_picture = obj {
	nam = 'Наклонённая картина';
	dsc = [[
		Стеллажи венчает несколько больших {полотен}.
	]];
	act = [[
		Ты любуешься мастерски написанными картинами. Несколько пейзажей
		городских предместий, кажется, вот-вот оживут у тебя на глазах.
		Ветви деревьев закачаются и нагонят ветер и птичий свист. Тучи
		прорвутся за рамку и заслонят наконец дурманящее солнце.
		^
		Одна из картин занимает твоё внимание больше других. На ней изображён
		благородный мужчина ... Взгляд с холста... Самопровозглашённый король
		Приграничья.
		Ты узнаешь на картине короля. Смерть известных личностей.
		Из-за того, что картина висит неровно, тебе кажется, что король внимательно
		наблюдает за тобой. Тебя охватывает странное желание, избавиться от этого
		взгляда.
	]];
	used = function(self, what)
		if what == tower_spear then
			tower_stage3_archive_to_secret_room:enable()
			tower_stage3_picture:disable()
			return [[
				Ты покрепче хватаешься за конец копья и тянешься им к краю картины...
				Картина наклонилась в другую сторону. За стеной послышался какой-то скрежет.
			]]
		end
	end;
}
