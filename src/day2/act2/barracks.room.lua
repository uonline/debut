barracks_to_barracks_hq = vroom('Комната капитана', 'barracks_hq')
barracks_to_barracks_hq:disable()

barracks = room {
	nam = 'Бараки';
	dsc = [[
		Тут много народу и все спят.
	]];
	obj = {
		'barracks_soldiers';
		'barracks_stash';
		'barracks_oak_door';
	};
	way = {
		'barracks_hall';
		barracks_to_barracks_hq;
	};
}

barracks_soldiers = obj {
	nam = 'Спящие солдаты';
	dsc = [[
		{Солдаты} храпят в своих постелях.
	]];
	act = [[
		Ты внимательно разглядываешь солдат. Без оружия они такие милые,
		ми-ми-ми.
	]];
}

barracks_stash = obj {
	nam = 'Тумбочки';
	dsc = [[
		У кроватей стоят {тумбочки}.
	]];
	act = function()
		if have('guard_letter') then
			return [[
				Ты обыскиваешь тумбочки ещё раз, но не находишь там
				ничего интересного.
			]]
		end
		take 'guard_letter'
		return [[
			Ты обыскиваешь тумбочки и находишь там документы на имя Реджинальда
			Курсемдумбла. Лишняя бумага никогда не помешает.
		]]
	end;
}

barracks_oak_door = obj {
	nam = 'Дверь';
	dsc = [[
		{Массивная дубовая дверь} ведёт в соседнее помещение.
	]];
	act = [[
		Ты скептически осматриваешь дверь. Такую без шума не выломать.
	]];
	used = function(self, what)
		if what == rat then
			barracks_to_barracks_hq:enable()
			return [[
				Ты снова используешь крысу как отмычку. Замок открывается,
				замок открывается, открывается замок, и ты едва успеваешь
				подхватить его, чтобы он не грохнулся на пол.
			]]
		end
	end;
}
