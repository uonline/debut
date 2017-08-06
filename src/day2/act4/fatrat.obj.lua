_sewer_rathunt = false
on_event('we want meat', function()
	_sewer_rathunt = true
end)

fatrat = obj {
	nam = 'Крыса';
	dsc = [[
		По полу бегают {крысы.}
	]];
	tak = function()
		if _sewer_rathunt then
			return [[
				Ты проходишь мимо крыс, делая вид, что прогуливаешься,
				и неожиданно хватаешь самую жирную. Остальные разбегаются.
			]], true
		else
			return [[
				Ты спрашиваешь крыс о погоде на Миритале. Они всё понимают,
				но ничего не говорят.
			]], false
		end
	end;
	inv = [[
		Ты внимательно осматриваешь крысу. Крыса внимательно осматривает тебя.
	]];
}
