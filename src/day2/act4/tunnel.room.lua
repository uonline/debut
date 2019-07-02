_tunnel_letsrock = false
on_event('ready to rock the boat', function()
	_tunnel_letsrock = true
end)

tunnel = room {
	nam = 'Тоннель с тупиком';
	dsc = [[
		Ты стоишь в очередном сраном тоннеле.
	]];
	obj = {
		'tunnel_leader';
	};
	way = {
		'guild_camp';
	};
}

tunnel_leader = obj {
	nam = 'Главарь';
	dsc = [[
		Какой-то {мужик в плаще} курит самокат.
	]];
	act = function()
		if _tunnel_letsrock then
			event 'tower penetration'
			return [[
				-- Старик? Заговор? Синяя птица удачи? Интим и гербалайф?
				Что ж ты сразу-то не сказал, ща соберёмся и пойдём.
			]]
		end

		return [[
			-- И чё ты щёлкаешь, как дятел?
   			-- Так уж ли много на свете правдивых историй. Память и ограниченность человеческого восприятия;
			-- Насколько ты охвачен течением, и что за сила тобой движет? Не использует ли тебя какая-либо
			-- сила? Сумеешь ли ты отвести Рок?
		]]
	end;
}
