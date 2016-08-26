-- $Name: debut$
-- $Version: 0.2.0$
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
	stead.phrase_prefix = '-- ';
	-- инициализация, если она нужна
end


dofile 'engine/events.lua'
dofile 'engine/diary.lua'

dofile 'deps.lua'
