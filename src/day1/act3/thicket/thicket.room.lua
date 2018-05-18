thicket = room {
	nam = 'Чаща';
	dsc = [[
		Ты стоишь посреди чащи и смотришь по сторонам. Несмотря на то, что скоро
		полдень, темнота хоть глаз выколи.
	]];
	obj = {
		'thicket_deer_alive';
	};
}

thicket_deer_alive = obj {
	nam = 'Олень';
	dsc = [[
		Вдалеке ты видишь {оленя}.
	]];
	act = [[
		Ты внимательно рассматриваешь--ЧЁРТ ВОЗЬМИ, ХВАТИТ ПЯЛИТЬСЯ,
		СТРЕЛЯЙ В НЕГО!
	]];
	used = function(self, what)
		if what == ll_bow then
			objs():del('thicket_deer_alive');
			objs():add('thicket_deer_dead');
		end
		return [[
			Уверенным движением ты натягиваешь тетиву, пускаешь стрелу
			в оленя и попадаешь ему точно в глаз. Наверное, это впечатлило бы
			любого зрителя -- если бы тот не знал, что ты целился в шею.
		]];
	end;
}

thicket_deer_dead = obj {
	nam = 'Труп оленя';
	dsc = [[
		В сотне шагов от тебя лежит {мёртвый олень}.
	]];
	act = function()
		walk 'wet_cave';
		return [[
			Ты подходишь к оленю, чтобы разделать тушу, и проваливаешься
			куда-то вниз.
		]];
	end;
}
