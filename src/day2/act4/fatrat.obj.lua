_sewer_rathunt = false
on_event('we want meat', function()
	_sewer_rathunt = true
end)

fatrat = obj {
	nam = 'Крысы';
	dsc = [[
		Где-то совсем рядом с тобой копошатся {крысы}. Ты слышишь их мерзкий писк и надеешься,
		что они не голодны.
	]];
	tak = function()
		if _sewer_rathunt then
			return [[
				Ты осторожно крадёшься в темноте пытаясь по писку определить,
				где снуёт будущий ужин. Через пять минут безнадёжных зачерпываний
				горстей нечистот и всякого хлама, тебе, перепачканному по пояс,
				удаётся сцапать крысу за хвост. Едва сдерживая отвращение, ты входишь
				под свет колодца, находишь кусок кирпича и не сколько раз с размаха
				бьёшь об него крысу. Когда писк прекращается, ты прячешь тушку за поясом.
				^
				Тебе удаётся добыть таким образом ещё парочку крыс, и копошение во тьме
				наконец стихает.
			]], true
		else
			return [[
				Ты ловишь себя на мысли, что чувствуешь себя беззащитным перед этими тварями.
				Тебе остаётся лишь уповать на то, что крысы не начнут кусать тебя за ноги.
			]], false
		end
	end;
	inv = [[
		Ты стараешься не думать о своём улове.
	]];
}
