-- $Name: debut$
-- $Version: 0.8.0$
-- $Author: m1kc$

instead_version "1.9.1"

DEBUG = true
--<<BUILD_DEBUG>>
BUILD_DATE = 'unknown'
--<<BUILD_DATE>>
BUILD_COMMIT = 'unknown'
--<<BUILD_COMMIT>>

require "para" -- для оформления
require "dash"
require "quotes"

require "dbg" -- для отладки
inv():del('debug_tool'); -- F7 is enough

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
