-- barracks_to_barracks_hq = vroom('Комната капитана', 'barracks_hq')
-- barracks_to_barracks_hq:disable()

regimenstrasse = room {
	nam = 'Площадь Режима';
	dsc = [[
		Ты стоишь на площади. Понятно, что это центральная площадь, потому что
		весь булыжник тут окрашен в жёлтый цвет.
	]];
	obj = {
		-- ^_^
	};
	way = {
		-- ^_^
	};
	entered = function()
		inv():zap()
	end;
}
