tower_stage2_stock = room {
	nam = 'Склад';
	dsc = [[
		Похожее на склад помещение.
	]];
	obj = {
		'tower_stage2_stock_elder';
	};
	way = {
		vroom('Лестница', 'tower_stage3');
	};
}

tower_stage2_stock_elder = obj {
	nam = 'Старец';
	dsc = [[
		Внутри – {древний старец} с трясущимися руками.
	]];
	act = function()
		walk 'tower_stage2_stock_elder_dlg'
	end;
}

tower_stage2_stock_elder_dlg = dlg {
	nam = 'Зав. складом';
	hideinv = true;
	entered = [[
		-- Драсссте.
	]];
	phr = {
		{
			tag = 'spyglass_request';
			always = false;
			'А можено трубу посмотреть.';
			'-- Да на здоровье!';
			function()
				inv():add 'tower_spyglass'
			end;
		};
		{
			always = true;
			'Я пойду.';
			function()
				back()
			end;
		};
	};
}

tower_spyglass = obj {
	nam = 'Подзорная труба';
	inv = [[
		Carl Zeiss х500 made in China
	]];
}
