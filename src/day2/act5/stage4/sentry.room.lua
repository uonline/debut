-- События
on_event('freedom for black bird', function()
	-- Освобаждаем чёрную птицу
	objs('tower_stage4_sentry'):add('sentry_black_bird');
end)

-- Локация
tower_stage4_sentry = room {
	nam = 'Караульная';
	dsc = [[
		За приоткрытой дверью оказывается ещё одна лестница: крутая и винтовая.
		Она приводит тебя в маленькую каморку, скупо обставленную, но на первый
		взгляд довольно уютную. Похоже, раньше это помещение было караульной,
		и сюда давно никто не заходил.
	]];
	obj = {
		'tower_stage4_sentry_window';
		'tower_stage4_sentry_stone_heap';
		'tower_broken_spyglass';
		'tower_spear';
		'tower_spyglass_paper';
		'tower_stage4_sentry_black_bird';
	};
	way = {
		vroom('Назад', 'tower_stage4');
	};
}

-- Объекты локации
-- Окно
tower_stage4_sentry_window = obj {
	nam = 'Окно';
	dsc = [[
		Прямо напротив входа в комнатку зияет {огромное окно}. Из него открывается вид на
		город и его окрестности.
	]];
	act = [[
		Ты видишь, как над лесом за стенами города беспокойно кружат стаи птиц,
		TODO
		Удлинняющиеся тени зданий и деревьев. Рынок закончил работать и люди постепенно стекаются на главную
		улицу и площадь Режима.
		Караульная -- окна. Вид на Приграничье с небывалой высоти. ГГ анализирует свое место в своей родине и этом мире;
		и чувствуешь смутную угрозу.
		Странно, в такой большой стране тебе за всю жизнь так и не нашлось места.
		Ты вынужден прятаться и убегать.
	]];
}

-- Разрушенная кладка
tower_stage4_sentry_stone_heap = obj {
	nam = '';
	dsc = [[
		Окно существенно увеличилось в размерах из-за разрушения части стены.
		Пол усеян {остатками каменной кладки}.
	]];
	act = function()
		if not have 'tower_stone' then
			take 'tower_stone';
			return [[
				Снедаемый тревогой, ты подбираешь один из камней и подбрасываешь его в воздух.
				Камень с радостью приземляется обратно в твою ладонь. Повторив операцию
				ещё пару раз, ты представляешь как запустишь его кому-нибудь в голову.
				Дождавшись пока воорбажение докончит свою работу, ты прячешь камень в карман.
			]];
		end;
		
		return [[
			Машинально ты раскидываешь ногой кучку обломков кладки на полу.
			Камни и крошево, нынешние хозяева караульной, недовольно разлетаются по углам комнатки.
		]];
	end;
}

-- Разбитая подзорная труба
tower_broken_spyglass = obj {
	nam = 'Разбитая подзорная труба';
	dsc = [[
		Среди обломков валяется {подзорная труба}.
	]];
	act = [[
		Ты подбираешь трубу, чтобы рассмотреть поближе.
		Линза покрыта густой сетью трещин.
		Возможно, трубу уронили со стола или она скатилась сама.
	]];
}

-- Копьё
tower_spear = obj {
	nam = 'Копьё';
	dsc = [[
		К стене у окна, словно в надежде остановить дальнейшее её разрушение, приставлено {копьё}.
	]];
	inv = [[
		Ты придирчиво осматриваешь копьё. Древко оказывается трухлявой палкой, поэтому
		оно такое лёгкое. Наконечник тупой и покрыт ржавчиной. Так себе оружие, но хоть
		что-то.
	]];
	tak = [[
		Ты берёшь копьё в руки и взвешиваешь. Оружие оказывается на удивление лёгким.
		^
		Последнее время ты общался с таким количеством людей,
		с каким не общался за прошедший год. Это породило в тебе
		страстное желание хоть чем-то вооружиться.
		Ты решаешь прихватить копьё с собой.
	]];
}

-- Прошение на подзорную трубу
tower_spyglass_paper = obj {
	nam = 'Прошение на подзорную трубу';
	dsc = [[
		^
		Посреди комнатки стоит крохотный стол и пара стульев.
		На столике покоится чей-то давнишний обед: черствеет ломоть хлеба,
		мухи въются над тарелкой с останками высохшего супа, гниёт надкусанное яблоко.
		Скатертью для всей этой снеди служит какая-то засаленная {бумага}.
		Похоже, что караульную покидали в спешке.
		Вид всего этого запустения рождает в тебе непонятные тревогу и желание защититься от чего-то.
	]];
	inv = [[
		Ты достаёшь засаленную бумагу и ещё раз пробегаешь глазами
		по тексту украшенному печатью и жирными отпечатками пальцев.
		Убедившись, что ты не разучился читать, ты тешишь себя мыслью,
		что подзорная труба уже у тебя в кармане.
	]];
	tak = function()
		event 'got spyglass paper'
		return [[
			Ты освобождаешь лист от плена остатков былой трапезы, чтобы рассмотреть.
			Бумага оказывается покрыта текстом, подписью, печатью и парой жирных пятен.
			Ознакомившись с написанным, ты делаешь вывод, что у тебя в руках прошение
			на новую подзорную трубу взамен разбитой. Прошение, видимо, адресовано в
			местный склад башни. Решив, что лишняя бумажка никогда не повредит, а тем
			более, что она может превратиться в полезную вещь, ты оставляешь прошение
			при себе.
		]]
	end;
}

-- Чёрная птица
-- Появляется, если игрок расколдует и разобъёт скелет на втором этаже башни
tower_stage4_sentry_black_bird = obj {
	nam = 'Странная птица';
	dsc = [[
		^
		Возможно причина твоего беспокойства в {странной птице}, что устроилась на канделябре
		под потолком. Она висит вниз говой наподобие летучей мыши и поглядывает в твою
		сторону тёмно-красным глазом.
	]];
	act = function()
		walk 'sentry_black_bird_dlg';
	end;
	used = function(self,what)
		-- Смотрим на птицу через трубу
		if what == tower_spyglass then
			return [[
				Ты подносишь подзорную трубу к глазу и направляешь на птицу.
				^
				Расправив крылья, птица набрасывается на тебя. Огромная словно штормовая волна
				она накрывает тебя с головой, погружая в черноту своих перьев.
				^
				Ты размахиваешь руками, чтобы отбиться от острых перьев, но внезапно
				крылья превращаются в густой дым. Ты ощущаешь резкий привкус гари во врту.
				Внезапно, черноту разрывают крики, и ей на смену приходят багровые всполохи.
				Ты стоишь на гранитной мостовой, плавящейся от огненного жара. Вокруг тебя
				бушует пламя, с треском ломается и рушится горящая древесина. Крики усиливаются,
				им вторит лязг и скрежет стали. Под ноги тебе медленно устремляется черная струйка
				крови. К ней присоединяется ещё несколько. Постепенно они разрастается, и вот уже
				ты стоишь по щиколотку в кровавом потоке. Мимо проплывают жуткие изувеченные тела.
				У тебя на глазах, все как один, трупы раскрывают рты, и в голову к тебе врывается
				тот самый голос:
				^
				^
				Ловкой хваткой у огня
				^
				Перст возьмёт за хвост Червя,
				^
				чтобы бросить в жернова,
				^
				новой Смуте дар внеся,
				^
				^
				Поток крови усиливает своё течение, словно огромное сердце толкает его по венам.
				Он сбивает тебя с ног и подхватывает, унося вслед за трупами с раскрытыми ртами.
				^
				^
				Расползается огонь,
				^
				порождает свет и боль,
				^
				но сгущается в ответ
				^
				покрывало тьмы и бед,
				^
				^
				Чёрная волна накрывает тебя с головой, лишая возможности последний раз вдохнуть
				дым горящего города.
				^
				^
				Кто сумеет сквозь века
				^
				разгадать судьбу Червя..."
				^
				^
				Ты приходишь в себя, лёжа на полу среди каменного крошева. В руке у тебя
				чудом уцелевшая подзорная труба. Ты встаёшь на ноги и отряхиваешься от
				остатков кладки.
			]];
		end;
	end;
}
tower_stage4_sentry_black_bird:disable();

-- Камень
tower_stone = obj {
	nam = 'Камень';
	inv = [[
		Ты взвешиваешь камень в руке. Достаточно тяжёлый, чтобы
		проломить чью-то голову.
	]];
}
