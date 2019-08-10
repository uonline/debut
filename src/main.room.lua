local main_ways = {
	vroom('Начать игру^', 'home');
}

local main_ways_debug = {
	vroom('D1A2^', 'forest_edge');
	vroom('D1A3^', 'lords_lands');
	vroom('D1A4^', 'uh_prison');
	vroom('D1A5^', 'uh_maintent');
	vroom('D1A6^', 'tract_camp');
	vroom('D2A1^', 'your_cell');
	vroom('D2A2 (без крысы)^', 'barracks_hall');
	vroom('D2A2 (Комната капитана)^', 'barracks_hq');
	vroom('D2A3 (без субстрата)^', 'regimenstrasse');
	vroom('D2A3 (Переулок без бумаг)^', 'lane');
	vroom('D2A4^', 'sewer');
	vroom('D2A4 (Коллектор)^', 'collector');
	vroom('D2A5^', 'tower_stage1');
	vroom('D2A6^ (ну такой)', 'scaffold');
	vroom('D2A7^', 'under_scaffold');
}

if DEBUG then
	for k, v in ipairs(main_ways_debug) do
		table.insert(main_ways, v);
	end
end

main = room {
	nam = '';
	dsc = [[
		Привет! Это демоверсия, 6 актов, сборка ]]..BUILD_DATE..[[, коммит ]]..BUILD_COMMIT..[[. Принимать малыми дозами. Отпускается по рецепту врача
	]];
	way = main_ways;
}
