journal = obj {
	nam = 'Книга с картинками';
	dsc = function()
		if not have 'food' then
			return [[
				Рядом устроилась увесистая {книжица} с картинками весьма сомнительного толка.
			]];
		end;

		return [[
			На столе устроилась увесистая {книжица} с картинками весьма сомнительного толка.
		]];
	end;
	tak = function()
		event 'got journal'
		return [[
			Со вздохом ты берёшь книгу и кладёшь в рюкзак.
		]];
	end;
	inv = [[
		Ты вспоминаешь пару картинок из книжки и чувствуешь себя бодрее.
		Подобная "литература" появилась совсем недавно и успела завоевать популярность в армии 
		среди командиров. Она проходит много рук, меняет много хозяев.
		Конкретно эту книжку ты выудил у своего капитана, предусмотрительно не
		поставив его в известность. Пожалуй, она у тебя задержалась.
	]];
}
