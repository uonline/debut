-- Переменные
_tower_stage2_stock_quest_avable = false;

-- Диалог с кладовщиком
tower_stage2_stock_storekeeper_dlg = dlg {
	nam = 'Кладовщик';
	hideinv = true;
	entered = [[
		Ты подходишь к столу и пару минут активно обращаешь на себя внимание
		суетящегося мужчины. Он упрямо продолжает заниматься своими делами,
		делая вид, что не замечает тебя. Но в конце-концов долговязый уступает,
		и захлопнув книгу, нетерпеливо замирает перед тобой.
		^
		-- Ну чего тебе? -- выдыхает он очередное облако дыма.
		]];
	phr = {
		{
			tag = 'about_storekeeper';
			true;
			'Много дел?';
			function()
				tower_stage2_stock_storekeeper_dlg:pon('about_time');
				return [[
					-- Шутите? -- усмехается долговязый.
					^
					Теперь, когда он наконец-то перестал сновать между стеллажей и столом,
					ты можешь толком разглядеть его внешность.
					Высокий и сухой, он одет в нечто похожее на мантию.
					В широких рукавах таких одежд обычно таится множество потайных карманов.
					Взгляд бесцветных глаз рассеянно бегает по твоему лицу.
					В волосах мужчины проглядывает седина,
					но ты не можешь назвать его стариком.
					Даже больше, тебе очень сложно определить возраст этого человека.
					^
					-- Посмотри, сколько здесь всего, -- долговязый обводит
					помещение взмахом руки, разгоняя плотный дым,
					-- и регулярно мне приносят ещё больше всяких
					интересностей.
					^
					Ты с интересом следишь за жилистой рукой в широком рукаве.
					^
					-- Я исследую свойства и явления всех этих вещей, -- без тени гордости
					сообщает он, -- систематизирую и каталогизирую.
					^
					Долговязый потрясает толстой книгой.
					^
					-- Иногда выдаю на руки, если ко мне приходят с прошением,
					-- добавляет мужчина в конце выжидающе.
				]];
			end;
		};
		{
			tag = 'about_time';
			false;
			'И сколько ты этим занимаешься?';
			function()
				tower_stage2_stock_storekeeper_dlg:pon('about_master');
				return [[
					-- Так, меня назначили кладовщиком, когда строительство башни
					было закончено, это значит... -- он задумывается.
					^
					Минуту вы стоите в тишине и смотрите друг на друга.
					^
					-- Честно говоря, я не слежу за временем, столько работы, просто некогда,
					-- признаётся он,
					-- Нужно ещё разобрать левое крыло, там вообще завал...
					^
					-- Откуда это всё? -- перебиваешь ты.
				]];
			end;
		};
		{
			tag = 'about_master';
			false;
			'Кто такой этот хозяин?';
			[[
				^Был нанят "хозяином башни" для складирования и испытаний различных артефактов
				^
				-- Что за хозяин?
				^
				-- Человек. Он объявился здесь, после того, как исчез первфй наместник и интерес к башне со строны
				Режима угас. Здесь теперь мягко говоря не людно. Он пришёл ко мне и сказал, что владеет башней
				и теперь я работаю на него.
				^
				-- И сколько времени ты тут сидишь?
				-- Понятия не имею. Я не слежу за временем. Я давно не покидал этих стен.
				Раньше я прогуливался по башне, чтобы развеяться,
				но после того как однажды заблудился и плутал по этажам несколько часов, я более не покидаю этих стен.
				Разве что по работе, например, в архив. Да мне это и не нужно. Это жe склад, здесь есть всё что нужно.
				К тому же, что бы не болтали о башне, а здесь безопасно. Ни бандитов, ни Режимников. Всё стало очень
				спокойно. Да, иногда захаживают какие-то странные типы. Но у них с хозяином строгая договорённость.
				^
				-- Странно, что ты до сих пор не сошёл с ума.
				^
				-- Возможно уже сошёл. Периодически, я беседую с Квантом, -- он кивнул в сторону кота.
			]];
		};
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
				-- Так прошение, хм, дата... Ну ладно. Честно говоря, я соврешенно потерял здесь
				счёт времени, -- неудивительно, думаешь ты, здесь даже нет окон, --
				ладно. Труба так труба.
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
			false;
			'Вы что-то говорили о том кинжале? О "разрушителе чар"?';
			function()
				_tower_stage2_stock_dagger_quest = true;
				return [[
					-- а можно получить его без прошения?
					-- Хмм, думаю, да, это возможно.
					Нужен кинжал? Могу дать если сходишь и пренесёшь мне один из свитков из архива.
					Там будет одна книга, напишешь на ней: Мне нужен свиток Ваалама. И всё будет.
					^
					Я сейчас пытаюсь разобраться с одной вещицей, но знаний не хватает. Я бы не отказался,
					если бы ты принёс мне один свиток из архива.
					^
					-- Какой свиток? Как я его найду?
					^
					-- Хм. Насколько я знаю архивные работники давно сбежали. Поэтому хозяин установил там
					какое-то магическое приспособление. Внешне это похоже на книгу на кафере. Ты пишешь в
					книге название нужной тебе книги или свитка, а доставлят его тебе практически прямо в руки.
					Правда, хозяин говорил, что она ещё не совсем, правильно, работает, но я думаю ты разберёшься.
					Все лучше, чем копаться на полках самому.
				]];
			end;
		};
		{
			always = true;
			'Я пойду.';
			function()
				if not _tower_stage2_stock_dagger_quest then
					if _tower_stage2_stock_dagger_quest then
						-- Включаем этот диалог снова, по игрок не возьмёт квест
						tower_stage2_stock_storekeeper_dlg:pon('book_guard_quest');
					end;
				end;
				tower_stage2_stock_storekeeper_dlg:pon('about_storekeeper');
				back();
			end;
		};
	};
}
