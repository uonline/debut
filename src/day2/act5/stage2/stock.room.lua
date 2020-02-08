-- События
on_event('got spyglass paper', function()
	tower_stage2_stock_elder_dlg:pon('spyglass_request');
end)

-- Переменные локации
_tower_stage2_stock_dagger_quest = false -- признак взятия квеста на кинжал

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
		'tower_dagger';
		'tower_stage2_stock_elder';
	};
	way = {
		vroom('Назад', 'tower_stage2');
	};
}

-- Объекты
-- Кладовщик
-- Возможно он не такой уж и старый. Слишком много уже стариков было. Наоборот можно описать его, как человека чей возраст трудно определить
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
	-- TODO
	-- На трубу можно попробовать воздействовать книжалом. Тот должен отреагировать на неё
}

-- Разрушитель чар ввиде кинжала
tower_dagger = obj {
	nam = 'Кинжал';
	dsc = [[
		^Test
		Ты подходишь к кинжалу и тот внезапно вспыхивает белым сиянием. Кладовщик замечает это
		и удивлённо говорит ГГ, что это клмнок реагирует на заклятья (находишься под влиянием заклятья).
	]];
	inv = [[
		Ты внимательно рассматриваешь кинжал. На первый взгляд он
		выглядит вполне обычно, но со временем ты замечаешь как
		клинок вспыхивает белым сиянием, словно отражает солнечный
		свет.
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
		^Был нанят "хозяином башни" для складирования и испытаний различных артефактов
		^Рассказывает о наместнике и о хозяине
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

				^ Tst
				-- Хорошо, вот вам труба. Только будьте аккуратней, она была подвергнута
				магическому излучению. Я не могу ручаться, что она работает <b>так как надо</b>.
				Верней даже, она может работать как удобно.
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
			tag = 'book_guard_quest';
			true;
			'Что за кинжал?';
			[[
				Нужен кинжал? Могу дать если сходишь и пренесёшь мне один из свитков из архива.
				Там будет одна книга, напишешь на ней: Мне нужен свиток Ваалама. И всё будет.
			]];
			function()
				_tower_stage2_stock_dagger_quest = true;
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
