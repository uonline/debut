-- $Name: debut$
-- $Version: 0.3.0$
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
	print '-- Game init'
	stead.phrase_prefix = '-- ';
end

function start()
	print '-- Game start'
end


dofile 'deps.lua'
