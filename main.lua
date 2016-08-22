-- $Name: debut$
-- $Version: 0.1.0$
-- $Author: mixsquad$

instead_version "1.9.1"

require "para" -- для оформления
require "dash"
require "quotes"

require "dbg" -- для отладки

game.act = 'Гм...';
game.use = 'Не сработает.';
game.inv = 'Зачем это мне?';

function init()
	-- инициализация, если она нужна
end


main = room {
	nam = 'Стартовый экран';
	dsc = [[
		TODO TODO TODO TODO
	]];
	way = {
		'home';
	};
}


gear = obj {
	nam = 'Охотничье снаряжение';
	dsc = [[
		На стене висит твоё {охотничье снаряжение}.
	]];
	tak = [[
		Ты снял снаряжение со стены и положил в рюкзак.
	]];
	inv = [[
		Ты внимательно разглядываешь своё снаряжение: арбалет, две бутылки пива
		и красное дилдо.
	]];
}

food = obj {
	nam = 'Еда';
	dsc = [[
		На столе лежит {еда}.
	]];
	tak = [[
		Ты завернул еду в обёрточную бумагу и положил в рюкзак.
	]];
	inv = [[
		Ты внимательно разглядываешь свой обед: немножечко укропа, кошачья попа,
		лягушачьи лапки, парик старой бабки.
	]];
}

trophies = obj {
	nam = 'Боевые трофеи';
	dsc = [[
		На стене висят {твои трофеи с войны}.
	]];
	act = [[
		Ты внимательно рассматриваешь свои трофеи. Вещи нагоняют воспоминания.
		Вот эту пику, например, ты когда-то загнал орку прямо в... глаз,
		кажется.
	]];
}

journal = obj {
	nam = '"Горячие баронессы"';
	dsc = [[
		На столе лежит {последний номер журнала "Горячие баронессы"}, который
		обошёлся тебе в целое состояние.
	]];
	tak = [[
		Ты берёшь журнал и кладёшь его в рюкзак.
	]];
	inv = [[
		Хотелось бы полистать, но сейчас не время.
	]];
}

posters = obj {
	nam = 'Коллекция плакатов "Разыскивается живым или мёртвым"';
	dsc = [[
		На стене висит {коллекция плакатов "Разыскивается живым или мёртвым"}. На каждом --
		твой портрет и внушительные суммы.
	]];
	act = [[
		Ты разглядываешь плакаты. Вот на этом совсем не похож, вот тут -- средне,
		а вот тут -- будто с натуры рисовали.
	]];
}

home = room {
	nam = 'Твоя хижина';
	dsc = [[
		Тридцать пять лет назад ты родился в этой маленькой деревянной хижине,
		которую ты построил своими собственными руками. С тех пор она мало изменилась.
	]];
	obj = {
		'gear';
		'food';
		'trophies';
		'journal';
		'posters';
	};
	way = {
		'square';
	};
}


square_well = obj {
	nam = 'Колодец';
	dsc = [[
		В середине площади стоит {колодец}.
	]];
	tak = [[
		Воровато оглядевшись, ты подбираешь колодец и кладёшь его в рюкзак.
	]];
	inv = [[
		Ты внимательно рассматриваешь колодец. Обычный колодец, бетонный,
		весит тонны две. Слегка потрескался, но в целом неплохо выглядит.
	]];
}

head = obj {
	nam = 'Старейшина';
	dsc = [[
		Около колодца стоит {старейшина}.
	]];
}

blacksmith = obj {
	nam = 'Кузнец';
	dsc = [[
		Около тебя стоит {кузнец}. Он выглядит усталым.
	]];
}

square = room {
	nam = 'Центральная площадь';
	dsc = [[
		Ты стоишь на центральной площади деревни. Ещё совсем светло, и людей почти
		нет.
	]];
	obj = {
		'square_well';
		'head';
		'blacksmith';
	};
	way = {
		'home',
		'forest',
		'village_neib'
	};
}


forest = room {
	nam = 'Край леса';
	dsc = [[
		Ты стоишь на краю леса. Перед тобой зеленятся деревья, позади тебя - дорога.
	]];
	way = {
		'square';
	};
}

village_neib = room {
	nam = 'Окрестности деревни',
	dsc = [[
		Окрестности деревни.
	]];
	obj = {
		'warren'
	}
}

warren = obj {
	nam = 'Уорри Ростовщик';
	dsc = [[
		{Уорри "Ростовщик"} - последний человек в деревне, которому стоило задолжать.
	]];
}

uh_camp = room {
	nam = 'Лагерь урук-хай',
}