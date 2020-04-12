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
					-- Посмотрите, сколько здесь всего, -- долговязый обводит
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
					-- выжидающе добавляет мужчина в конце.
				]];
			end;
		};
		{
			tag = 'about_time';
			false;
			'И сколько вы этим занимаетесь?';
			function()
				tower_stage2_stock_storekeeper_dlg:pon('about_master');
				return [[
					-- Так, меня назначили кладовщиком, ещё до завершения строительства
					башни, это значит... -- он задумывается.
					^
					Минуту вы стоите в тишине и смотрите друг на друга.
					^
					-- Честно говоря, я не слежу за временем, столько работы, просто некогда,
					-- признаётся он, -- Нужно ещё разобрать левое крыло, там вообще завал.
					^
					-- То есть вы всё время здесь, работаете в четырёх стенах? -- делаешь
					вывод ты.
					^
					-- Пожалуй, так и есть. Я давно не покидал этих четырёх стен, --
					соглашается долговязый, -- раньше я прогуливался по башне, чтобы развеяться,
					но после того как однажды заблудился и плутал по этажам несколько часов,
					я более не покидаю склада. Разве что по работе, например, поднимаюсь иногда
					в архив. А так мне и ходить-то никуда не нужно. Это жe склад, здесь есть всё
					необходимое.
					^
					От этой мысли, весь день торчать в одной комнате, утопающей в дыме, тебе
					становится не по себе. Мужчина кивает с пониманием.
					^
					-- Всё в порядке, здесь безопаснее, чем где либо. Чтобы не болтали о башне,
					но в ней хотя бы нет бандитов и орков. Да и режимники наведываются редко.
					Всё стало очень спокойно. Изредка захаживают какие-то странные типы.
					Но у них с хозяином строгая договорённость.
					^
					-- Странно, что вы до сих пор не сошли с ума. Сидеть день за днём в одном и
					том же месте. Не зная, что творится снаружи.
					среди в
					^
					-- Возможно уже сошёл, -- усмехается долговязый, -- например, периодически,
					-- я беседую с Квантом.
					^
					Он кивнул в сторону кота.
					^
					-- Странное имя, -- замечаешь ты.
					^
					-- Он не жалуется, - возражает долговязый, а кот лишь устало жмурит глаза.
				]];
			end;
		};
		{
			tag = 'about_master';
			false;
			'Кто такой этот ваш хозяин?';
			[[
				^Был нанят "хозяином башни" для складирования и испытаний различных артефактов
				-- Человек. Он объявился в башне, после того, как исчез первый наместник,
				и интерес к башне со строны Режима и города угас.
				После этого здесь стало, мягко говоря, не людно.
				Когда я уже подумывал сбежать вслед за всеми, хозяин пришёл ко мне и сказал,
				что теперь он владелец башни, и если... теперь я работаю на него.
				^
				-- И сколько времени ты тут сидишь?
				
			]];
		};
		-- Забираем подзорную трубу
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
