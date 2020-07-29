thicket = room {
	nam = 'Чаща';
	dsc = [[
		Ты стоишь посреди чащи и смотришь по сторонам, пытаясь сориентироваться.
		В этой части леса можно легко заблудиться. Кроны могучих деревьев простираются
		высоко вверх, заставляя забыть, что где-то там есть небо и солнце.
		Валежник и кустарники сплетаются вместе, срастаясь в непроходимый лабиринт.
		Несмотря на то, что скоро полдень, вокруг царит прохладный полумрак.
		^
		Издалека доносится заунывный звук, похожий на вой. Ты вспоминаешь предостережение
		лесника насчёт волков и чувствуешь, как тело пробирает озноб. Странно, уже много
		раз тебе доводилось наведываться в эту запретную кладовую лорда, и не раз ты
		возвращался отсюда с добычей, сильно рискуя. Но сегодня ты почему-то
		не узнаёшь деревья вокруг и ощущаешь непонятную тревогу.
		^
		Хочется скорей выбраться отсюда.
	]];
	obj = {
		'thicket_deer_alive';
	};
}

thicket_deer_alive = obj {
	nam = 'Олень';
	dsc = [[
		Внезапный шорох заставляет тебя вздрогнуть. Вглядевшись в заросли, тебе
		удаётся кое-как разглядеть {оленя} совсем рядом. Он испуган не меньше твоего
		и тоже дышит через раз.
	]];
	act = [[
		Как завороженный ты рассматриваешь оленя. Если сейчас он сорвётся с места
		и скроется среди деревьев, ты с облегчением вздохнёшь и отправишься домой.
		Но упрямый олень стоит как вкопанный.
	]];
	used = function(self, what)
		if what == ll_bow then
			objs():del('thicket_deer_alive');
			objs():add('thicket_deer_dead');
		end
		return [[
			Собравшись, ты уверенным движением вскидываешь лук и плавно натягиваешь тетиву.
			Выдох -- и стрела пускается в полёт. Олень падает замертво
			с простреленной головой. Наверное, это впечатлило бы
			любого зрителя -- если бы тот не знал, что ты целился в шею.
		]];
	end;
}

thicket_deer_dead = obj {
	nam = 'Труп оленя';
	dsc = [[
		Где-то впереди среди зарослей лежит {мёртвый олень}.
	]];
	act = function()
		walk 'wet_cave';
		return [[
			Ты начинаешь продираться сквозь валежник и кусты, пытаясь добраться до оленя
			кратчайшим путём. Пробираясь под очередным поваленным стволом, ты слышишь
			неприятный хруст под ногой и в следующее мгновение проваливаешься
			куда-то вниз в кромешную темноту.
			^
			Ты приходишь в себя после падения. На секунду тебе кажется, что ты лежишь на
			дне того самого колодца в деревне. Стук крови в висках -- единственное,
			что ты пока слышишь. Ты медленно встаёшь на ноги, попутно проверяя,
			все ли кости целы.
			^
			Тебе в нос бьёт затхлый запах, а глаза пытаются привыкнуть к темноте.
			Удары пульса в голове постепенно сменяются ударами капель воды
			о что-то металлическое.
		]];
	end;
}
