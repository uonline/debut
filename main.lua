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

dofile 'deps.lua'



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
