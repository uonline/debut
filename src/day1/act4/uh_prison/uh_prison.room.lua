uh_prison_to_uh_square = vroom('Площадь лагеря', 'uh_square');
uh_prison_to_uh_square:disable();

on_event('may leave prison', function()
	uh_prison_to_uh_square:enable();
end)

uh_prison = room {
	nam = 'Загон рабов';
	dsc = [[
		Тебя бросают в загон для рабов. Загон --
		несколько тесных клеток из железных прутьев, собранных
		в кучу. Неподалёку навалены друг на друга грубые деревянные телеги,
		на которые грузят клетки в походе. Тебе приходилось наблюдать, как
		их толкают сами рабы. Если урук-хай торопятся,
		то могут взяться за телеги сами. Если не пустят свой товар в расход.
		Ты надеешься, что эта участь тебя минует.
		^
		Твоя клетка весьма тесная. Кроме тебя здесь ещё
		трое невольников.
	]];
	obj = {
		'uhp_goblin';
		'uhp_warren';
		'uhp_blacksmith';
		'uhp_guardian';
	};
	way = {
		uh_prison_to_uh_square;
	};
	entered = function()
		-- Clear inventory, add whitelisted items
		inv():zap();
	end;
}

uhp_warren = obj {
	nam = 'Уорри';
	dsc = [[
		Рядом с ним ты видишь {Уорри Ростовщика}. Он сидит с низко опущенной
		головой. Голова раскачивается туда-сюда. Сам Уорри изредка вздрагивает.
	]];
	act = [[
		Уорри никак не реагирует на твои слова. Или спит, или бредит.
		Ты не решаешься его трогать.
	]];
}
