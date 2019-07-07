-- Локация
berlinstrasse = room {
	nam = 'Главная улица';
	dsc = [[
		Ты на главной улице -- широкой мощёной дороге по сторонам которой
		высятся здания разной высоты. Первые этажы занимают всяческие мастерские
		и лавочки. Периодически они перемежаются постоялыми дворами и питейными
		заведениями. Улица заполнена людьми.
		Солнце и свежий ветерок навевают на них состояние неги. Повременив
		с делами, жители города и его гости неторопливо шагают по дороге,
		согреваясь под тёплыми лучами. Над деревянными крышами вьются полосы
		дыма печей, а воздухе чувствуется манящий запах выпечки.
		^
		Ты охотно проникаешься настроением горожан, впитывая эту непринуждённую
		неспешность, радуясь призывам пекарей и молочников, растворяясь в солнечном свете.
		Взгляд твой скользит по каменной кладке оснований домов дальше по улице, пока не
		упирается в высокую башню. Будучи в тени облака, она выглядит мрачно и покинуто.
		Будто светило отказывается освещать эти холодные стены,
		поросшие густым мхом.
		^
		Твоё приподнятое настроение сходит на нет.
	]];
	obj = {
		'berlinstrasse_boy';
		'berlinstrasse_scribe';
		'berlinstrasse_artists';
		'berlinstrasse_stranger';
		'berlinstrasse_salers';
		'berlinstrasse_mangroup';
	};
	way = {
		'regimenstrasse';
		'bazaar';
	};
}

-- События
-- Пугаем мальчика
on_event('berlinstrasse lost boy', function()
	objs('berlinstrasse'):del('berlinstrasse_boy')
end)

-- Разгоняем компанию
on_event('berlinstrasse lost mangroup', function()
	objs('berlinstrasse'):del('berlinstrasse_mangroup')
end)

-- Объекты
-- Мальчишка
berlinstrasse_boy = obj {
	nam = "Мальчишка";
	dsc = [[
		Вокруг тебя крутиться {мальчишка} лет семи, толи передразнивая, толи играя.
	]];
	act = function()
		event 'berlinstrasse lost boy'
		return [[
			Не выдерживая очередного озорства, ты жестом подзываешь этого бесёнка.
			Тот с блеском в глазах подбегает и тут же выпаливает:
			^
			-- Расскажите что-нибудь о службе! А орки страшные? А много вы их
			перебили? А где ваш меч?
			^
			Ты только усмехаешься такому шквалу вопросов.
			^
			-- Хорошо малец, я поделюсь с тобой одной историей, но только по секрету.
			После неё у тебя отпадут все вопросы.
			^
			Мальчишка с нетерпением закивал.
			^
			-- Это история про Чёрного мечника. Во время войны, когда банды орков
			стали объединяться и нападать на города Приграничья, Режим прислал на помощь
			свою армию. Вместе с ней в страну пришло и много наёмников,
			мечтающих поживиться богатствами здешних лордов. Среди них был один воитель
			-- мечник, которому не было равных в его отряде. В одной из деревень он встретил
			девушку, и взял её с собой, поклявшись на своём мече, что женится на ней,
			как только война закончится. Капитан отряда мечника был завистливым человеком.
			Он увидев эту девушку, и тоже захотел заполучить её.
			Он и до этого завидовал мастерству мечника, а теперь решил сгубить его
			окончательно. В ночь перед битвой, он предложил ему спор, кто больше выпьет,
			и мечник, уверенный в своей победе, согласился. Но коварный капитан
			разбавил своё пиво водой. Когда его соперник захмелев уснул, он подменил
			его меч на деревянный. Утром на лагерь напали орки. Мечника терзало похмелье,
			и он не успел заметить подмены меча.
			^
			Мальчишка зажал рот руками от волнения
			^
			-- И вот когда он бросился в бой, топор урук-хай с лёгкостью разрубил
			деревянный меч и сразил воителя. Его невеста долго горевала, но война
			закончилась и она не смогла отказать капитану, став его женой.
			Они поселись в её родной деревне. И вот однажды в дождь и грозу на пороге их
			дома появился незнакомец. Жена открыла ему дверь и впустила в дом.
			Он был укутан в чёрный плащ и скрывал лицо.
			"Вы верно устали с дороги и голодны" -- сказала ему девушка: "прошу садитесь за
			стол, обогрейтесь у огня и разделите с нами ужин".
			Но тот ответил скрипучим голосом из-под низко надвинутого капюшона:
			"Мне не нужна ни еда, ни тепло. Только -- мой меч!"
			И тут-то она и узнала в нём своего бывшего возлюбленного.
			Он извлёк из ножен деревянный обрубок и пронзил им её сердце.
			^
			Мальчишка вскрикнул от испуга.
			^
			-- Капитан, что сидел за столом, опрокинул его и бросился к своему мечу.
			Но чёрный мечник терпеливо ждал. И вот капитан ликуя обрушился на своего
			давнего противника с мечом против палки. Но стальной клинок к его удивлению
			переломился пополам не выдержав и одного удара.
			Так и нашли капитана и его жену убитыми в собственном доме,
			а убица исчёз бесследно. С тех пор чёрный мечник так и бродит по миру
			в поисках своего меча, вызывая на бой всякого у кого есть ножны на поясе.
			^
			Со страхом на лице мальчик переводит взгляд на место на твоём поясе, где
			должен крепиться меч.
			^
			-- Поэтому я и не ношу меча, -- завершаешь ты свой рассказ, с удовольствием
			наблюдая сверкающие пятки мальчишки.
		]];
	end;
}

-- Старик
berlinstrasse_scribe = obj {
	nam = "Книжник";
	dsc = [[
		На пороге одного из домов сидит {старик} с поношенной дорожной
		сумкой и посохом. Он призывно смотрит на прохожих в надежде
		на ответное внимание.
	]];
	act = function()
		walk 'berlinstrasse_history'
	end;
}

-- Художники
berlinstrasse_artists = obj {
	nam = 'Художники';
	dsc = [[
		Дальше по улице пара {художников} поглощена работой над своими полотнами.
		Похоже, они пишут вид на башню.
	]];
	act = function()
		return [[
			Почему-то тебя совсем не привлекает этот пейзаж, и ты избегаешь смотреть на картины.
		]];
	end;
}

-- Иностранец
berlinstrasse_stranger = obj {
	nam = 'Иностранец';
	dsc = [[
		Рядом в восхищении жестикулирует {человек} в пёстром наряде.
	]];
	act = function()
		return [[
			-- Взгляните на это, только взгляните, -- восторженно обращается к тебе незнакомец,
			-- сколько оттенков в этом полотне, хотя палитра так скудна на цвета! Приграничье
			-- рай для художников! Сколько мистики в полотнах Шагэла или Бронзе! Сколько
			загадок на картинах Райнара! А Эвайрзе с его полуночными мистериями? А Кречес
			со своим вторжением чёрных птиц?
			^
			Эти имена и названия ниочём тебе не говорят. Но незнакомцу всё равно и он с
			упоением продолжает.
			^
			-- О, я всерьёз подумываю о торговле картинами у себя в Вольных городах,
			в родном Агодлоре. Нынешняя знать, к сожалению, ничего не смыслит в высоком.
			Покупателя на картины здесь найти очень сложно. Нынче в цене плотские забавы,
			-- он по-дружески хлопает тебя по плечу, --
			Слышали, одна из орочьих банд вернулась из-за моря ??? со сказочными трофеями
			-- эльфискими рабынями? Немыслимо! О таком улове
			писали разве что в древних трактатах Тантикула сотни лет назад!
			Теперь каждый лорд при деньгах мечтает заполучить хотя бы одну такую
			эльфийку.
		]];
	end;
}

-- Торговцы
berlinstrasse_salers = obj {
	nam = 'Торговцы';
	dsc = [[
		Словно позируя художникам в конце улицы раскинулось разноцветье {торговых рядов}.
	]];
	act = function()
		return [[
			Ты проходишь мимо лотков, подолгу задерживаясь у каждого. Одни торговцы
			услужливо нахваливают свой товар, другие явно нервничают, ожидая проверки.
			Ты выспрашиваешь некоторых, не видели ли они каких-либо подозрительных людей.
			Намекаешь, что у тебя есть кое-какая информация.
			Но всюду тебя встречает стена непонимания.
		]];
	end;
}

-- Группа мужчин
berlinstrasse_mangroup = obj {
	nam = "Группа мужчин";
	dsc = [[
		Среди них курсирует шумная {компания мужчин}.
	]];
	act = function()
		event 'berlinstrasse lost mangroup'
		return [[
			Едва ты приближаешься к этой компании, как шумные разговоры
			и смех обрываются. Тебя встречают мрачные взгляды и перешёптывания.
			Ты в нерешительности останавливаешься, но мужчины уже расходятся
			кто-куда.
			^
			Ты считаешь, что тебе повезло.
		]];
	end;
}
