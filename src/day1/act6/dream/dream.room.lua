dream = room {
	nam = 'Сон';
	dsc = [[
		Тёмные облака носятся по пасмурному небу. Дождь хлещет по твоему плащу,
		ветер хватает тебя за рукава и бьёт по лицу холодным, как лёд, воздухом.
		Гремит гром. Облака начинают кружить над тобой, словно вороны,
		и лес вдалеке шумит, словно радуясь твоему отчаянию.
	]];
	obj = {
		'dream_figure';
	};
	way = {
		--'tract_camp';
	};
}

dream_figure = obj {
	nam = 'Фигура в плаще';
	dsc = [[
		Чуть поодаль от тебя стоит {фигура в чёрном плаще}.
	]];
	act = function()
		walk 'tract_camp'
		return [[
			Ты протягиваешь руку к незнакомцу. Тот поворачивается к тебе, и ты
			понимаешь, что у него нет лица.
			^
			-- Что ты хочешь увидеть? -- кричит он тебе хриплым голосом,
			и облака эхом повторяют его слова в жутком диссонансе. -- Что ты
			хочешь увидеть? Ты ничего, ничего не понимаешь! Я был против.
			Я всегда был против. Они меня не послушали. Они..!
			^
			Листья, которые нёс с собой ветер, внезапно пронзают твоё тело
			тысячей игл. Капли дождя превращаются в льдинки, рвущие твою кожу
			на части. Ты пытаешься закричать, но твоё горло ни в силах выдавить
			из себя ни звука.
		]]
	end;
	used = function(self, what)
		if what == a6_the_thing then
			walk 'your_cell'
			return [[
				-- Кто бы ты ни был, ты не властен надо мной! Слышишь?
				Ты -- не -- властен -- надо -- мноооооой!
				^
				Облака кружатся вокруг тебя в жутком танце, а ветер, напротив,
				неожиданно стихает, так что становится непонятно, что за сила
				заставляет эти облака двигаться. Две молнии бьют в землю
				рядом с тобой, и ты видишь, что фигура в плаще начинает
				расплываться и отдаляться от тебя.
				^
				-- Как же ты глуп, человек. Но одну вещь ты, кажется, понял.
				Будь по-твоему. Я уйду. Скоро ты сам придёшь ко мне.
				^
				Последнее, что ты помнишь -- как из-под земли начинает
				подниматься неведомо откуда взявшийся туман.
			]]
		end
	end;
}
