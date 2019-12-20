-- События
on_event('got spyglass paper', function()
	tower_stage2_stock_elder_dlg:pon('spyglass_request');
end)

-- Локация
tower_stage2_stock = room {
	nam = 'Склад';
	dsc = [[
		Ты стоишь посреди большого помещения, уставленного стеллажами. Больше
		всего это похоже на склад. Тут лежит всё: свитки, какие-то ящики,
		колбы, непонятные механизмы, медные трубки, музыкальные инструменты,
		швабры, рулоны разноцветной ткани и даже наборы масляных красок.
	]];
	obj = {
		'tower_stage2_stock_elder';
	};
	way = {
		vroom('Назад', 'tower_stage2');
	};
}

-- Объекты
-- Кладовщик
tower_stage2_stock_elder = obj {
	nam = 'Старец';
	dsc = [[
		Посреди всего этого великолепия стоит почти незаметный маленький столик,
		за которым дремлет {усатый старик.}
	]];
	act = function()
		walk 'tower_stage2_stock_elder_dlg';
	end;
}

-- Подзорная труба
tower_spyglass = obj {
	nam = 'Подзорная труба';
	inv = [[
		Ты внимательно рассматриваешь подзорную трубу. Ты не специалист по таким
		вещам, но она явно не людской работы.
	]];
}

-- Test
-- Кинжал для взлома заклятий
tower_dagger = obj {
	nam = 'Кинжал';
	inv = [[
		Ты внимательно рассматриваешь кинжал...
	]];
}

-- Диалог с кладовщиком
tower_stage2_stock_elder_dlg = dlg {
	nam = 'Зав. складом';
	hideinv = true;
	entered = [[
		Ты подходишь к столу. Храп прекращается, и старик, не меняя позы,
		приоткрывает один глаз:
		^
		-- Да?
		^Test
		^Учёный оторвавшийся в своих исследованиях от реальности?
	]];
	phr = {
		{
			tag = 'spyglass_request';
			false;
			'У меня тут прошение на подзорную трубу';
			[[
				-- Прошение? От кого? И почему вы... нет, давайте, давайте его
				сюда. Кто вы вообще такой? Впервые вас вижу. Так, печать,
				кажется, настоящая, давайте-ка посмотрю на свет... Хм, кажется,
				всё в порядке. А вы..? Ладно, не хотите говорить -- как хотите.
				Вечно у вас всё секретно, вечно от старого Руаки всё утаивают...
				Как всегда. Время идёт, а ничего не меняется. Держите свою
				трубу. И распишитесь вот тут. И вот тут.
^
			-- Так уж ли много на свете правдивых историй. Память и ограниченность человеческого восприятия;
			^
			-- Насколько ты охвачен течением, и что за сила тобой движет? Не использует ли тебя какая-либо
			сила? Сумеешь ли ты отвести Рок?

			]];
			function()
				inv():del 'tower_spyglass_paper';
				inv():add 'tower_spyglass';
			end;
		};
		{
			always = true;
			'Я пойду.';
			function()
				back();
			end;
		};
	};
}
