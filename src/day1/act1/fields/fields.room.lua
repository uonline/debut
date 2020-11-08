-- Переменные локации
_fields_go_to_racket = false; -- отправились бить Уорри с кузнецом

-- Локация
fields = room {
	nam = 'Окрестности деревни';
	dsc = function()
		return [[
			Ты стоишь в окрестностях деревни. Здесь чернеет несколько давно
			заброшенных домов -- теперь в них живут разве что какие-нибудь ползучие
			гады. Самый главный из них -- Уорри по прозвищу Ростовщик.
			Его жилище не выглядит настолько заброшенным, как прочие,
			но ощущение ветхости присутствует.
		]];
	end;
	obj = {
		'warren';
		'warren_with_crossbow';
		'victim';
		'hanged_man';
		'lying_man';
	};
	way = {
		'square';
	};
	entered = function()
		-- Проверяем пошли ли мы с кузнецом бить Уорри
		if _fields_go_to_racket then
			event 'fail warren racket';
			return [[
				Вы чо вы чо вы чо!
				^
				Всё поняли, валим.
			]];
		end;
	end;
}

-- Отправлямся бить Уорри
on_event('go to warren racket', function()
	_fields_go_to_racket = true;
	-- Уорри больше с нами не разговаривает
end)
