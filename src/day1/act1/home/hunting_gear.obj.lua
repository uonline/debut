hunting_gear = obj {
	nam = 'Охотничье снаряжение';
	dsc = [[
		На тряпице у кровати разложено твоё {охотничье снаряжение}.
		Ты подготовил его с вечера, и, кажется, остался чем-то недоволен.
	]];
	tak = function()
		event 'gear taken'
		return [[
			Ты взял лук и попробовал натянуть тетиву... И верно, вчера
			тебе не показалось. Этот кузнец опять схалтурил. Придётся
			снова наведаться к нему за новым луком с утра пораньше.
			Пусть у него будет похмелье и стук в дверь колоколом
			отзовётся в его пустой голове!
			^
			Ты завернул снаряжение и положил в рюкзак.
		]]
	end;
	inv = [[
		Лук, колчан с десятком стрел, верный кинжал и небольшой
		нож для освежевания. Среди всёго этого завалялась ещё
		нетерпимость к кузнецам.
	]];
}

on_event('gear taken', function()
	_hunt_gear = true
	_need_new_bow = true
end)
