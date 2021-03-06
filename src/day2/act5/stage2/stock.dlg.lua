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
		-- Чем же вам может помочь скромный кладовщик?
		-- выдыхает он очередное облако дыма.
	]];
	phr = {
		{
			tag = 'about_storekeeper';
			true;
			'Много дел?';
			function()
				tower_stage2_stock_storekeeper_dlg:pon('about_time');
				return [[
					-- Шутите? -- усмехается кладовщик.
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
					-- Пожалуй, так и есть. Я давно не покидал этих самых четырёх стен, --
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
					но в ней хотя бы нет бандитов и орков. Да и ваша братия -- режимники,
					наведываются редко. Всё стало очень спокойно. Изредка захаживают какие-то
					странные типы. Но у них с хозяином строгая договорённость.
					^
					-- Странно, что вы до сих пор не сошли с ума. Сидеть день за днём в одном и
					том же месте. Не зная, что творится снаружи.
					^
					-- Возможно уже сошёл, -- усмехается долговязый, -- например, я периодически,
					представляю, что снаружи бушует страшная неизвестная болезнь. Что с виду
					здоровые люди могут заразить тебя при простом разговоре. Что Режим установил
					закон всем сидеть по домам, а нарушителей избивают дубинками. И тогда мне
					сразу становится как-то легче. У меня здесь есть еда и работа. А ещё Неделимый,
					с которым временами можно поговорить.
					^
					Он кивает в сторону кота.
					^
					-- Чертовски странное имя для кота, -- замечаешь ты.
					^
					-- Он не жалуется, -- возражает долговязый, -- обычно я зову его просто -- Неделя.
					Ну знаете, семь пятниц у Недели.
					^
					Кладовщик смущённо улыбается.
					^
					-- Котёнком он умудрился разбить излучённое зеркало.
					Осколкли порубили ближайшие предметы на части. Но этот шкодник остался цел.
					Тогда-то я и дал ему эту кличку. Однажды его зачем-то попытались похитить,
					в те времена, когда люди побежали из башни. Но всё обошлось, да Неделя?
					^
					Кот жмурит глаза и устало зевает.
				]];
			end;
		};
		{
			tag = 'about_master';
			false;
			'Кто такой этот ваш хозяин?';
			[[
				-- Человек. Он объявился в башне, после того, как исчез первый наместник,
				и интерес к башне со строны Режима и города угас.
				После этого здесь стало, мягко говоря, не людно.
				Когда я уже подумывал сбежать вслед за всеми, хозяин пришёл ко мне. Он сказал,
				что теперь владеет башней лично, и если я хочу, то могу остаться и работать
				на него. Я согласился. Я всё тот же кладовщик, только работы прибавилось в разы,
				и она стала интересней. Часто мне удаётся "пощупать" различные занятные вещички.
				^
				-- А откуда они берутся, эти вещички? -- уточняешь ты.
				^
				-- Обычно, их приносит сам хозяин. Он весьма... занятный человек. И я думаю, --
				долговязый переходит на шёпот, -- он колдун. Но мне до этого нет дела. Я всего
				лишь кладовщик. Моё дело маленькое: складировать, классифицировать, сортировать,
				каталогизировать и, иногда, выдавать. Если документы в наличии.
			]];
		};
		-- Забираем подзорную трубу
		{
			tag = 'spyglass_request';
			false;
			'У меня тут прошение на новую подзорную трубу';
			[[
				-- Подзорную трубу? Давайте ка посмотрим, -- кладовщик принимает
				деловитый вид и забирает протянутую бумагу.
				^
				-- Хммм, -- долговязый быстро пробегает глазами по тексту, и восклицает --
				весьма давнишний документ! Ну да ладно, печать, кажется, настоящая,
				давайте-ка посмотрю на свет... Х для котам, кажется, всё в порядке. Да-да.
				^
				Он оценивающе смотрит на твой нагрудник.
				^
				-- Рад знать, что кто-то из Режима ещё работает здесь, --
				замечает кладовщик, -- временами бывет одиноко. Рутина, знаете ли.
				Никаких новых подзорных труб, у нас никогда не было. Так что,
				здесь вы напутали. Поэтому будете довольствоваться, тем, что есть.
				Одну минуточку.
				^
				Он кладёт книгу на стол, аккуратно, чтобы не потревожить кота,
				и исчезает где-то среди стеллажей и дыма. Через пару минут
				кладовщик возвращается с подзорной трубой и объёмным журналом
				в руках.
				^
				-- Вот, держите свою трубу. И поставьте закорючку вот здесь, -- он
				подсовывает тебе журнал и перо, -- И вот тут.
				^
				Ты покорно рисуешь закорючку.
				^
				-- Ну вот, официоз соблюдён, -- довольно сообщает кладовщик, --
				Теперь, собственно о нашем предмете, то есть вашем.
				Предупреждаю вас, будьте аккуратней с этой трубой. Она была подвергнута
				магическому излучению. Я не могу ручаться, что она работает
				<b>так как надо</b>. Верней даже, она может работать <b>как угодно</b>.
				Но другой у меня нет. Так что удачи.
			]];
			function()
				inv():del 'tower_spyglass_paper';
				inv():add 'tower_spyglass';
			end;
		};
		-- О кинжале
		-- Доступен, если игрок взаимодействовал с кинжалом
		{
			tag = 'about_dagger';
			false;
			'Вы что-то говорили о том кинжале? О "разрушителе чар"?';
			function()
				return [[
					-- О разрушителе чар? -- переспрашивает долговязый, -- да, у меня
					тут есть несколько. Весьма занятные вещицы, кстати. Их массово
					изготавливают в Магосе для нужд его армии наёмников.
					Это оружие против магов и всего магического.
					^
					-- Против магов, -- удивляешься ты, -- но Магос это же
					государство магов. Зачем им снаряжать наёмников оружием
					против себя же?
					^
					-- Хммм, -- кладовщик задумчиво затягивается, -- кажется всё дело в том,
					что Магос с кем-то воюет. С эльфами? Да, возмножно. Разрушители
					чар, способны... разрушать всяческие заклинания, защитные, атакующие,
					любые. Кажется так. А, ещё они способны причинять вред существам,
					которых нельзя ранить обычным оружием. Но я использую этот кинжал
					не для этого. Видите ли, разрушители чар чувтвительны к проявлениям
					магии. С их помощью можно распознавать наложенные чары.
					Так я различаю у себя на складе магические и обычные вещи.
					^
					-- Вы довольно много знаете об этом, -- ты отмахиваешься нового
					клуба дыма в лицо.
					^
					-- Я скромный кладовщик, -- заключает долговязый, -- это моя работа,
					знать много о разных вещах.
				]];
			end;
		};
		-- Квест на кинжал для освобождения птицы
		{
			tag = 'book_guard_quest';
			false;
			'Знаете, мне бы хотелось получить у вас одну вещь...';
			function()
				-- Включаем квест
				_tower_stage2_stock_dagger_quest = true;
				-- Получаем ключ для книги
				inv():add 'tower_book_guard_key';
				return [[
					-- Всегда пожалуйста, -- кладовщик расплывается в улыбке,
					-- только предъявите мне документ на её выдачу.
					^
					-- А можно как-нибудь обойтись без документа? -- спрашиваешь ты с надеждой
					в голосе.
					^
					-- Исключено, -- хмуро отвечает кладовщик, -- вы же солдат, вы должны
					знать как с этим строго.
					^
					-- Возможно, вы согласитесь в обмен на какую-нибудь помощь? -- вкрадчиво
					проговариваешь ты.
					^
					Кладовщик задумывается.
					^
					-- Ну, может быть, -- произносит он растягивая слова, -- что это за вещь,
					которая вам так нужна?
					^
					Ты указываешь на стол с кинжалом.
					^
					-- Проблемы с оружием, -- кивает кладовщик, -- что ж, понимаю. Но
					учтите сразу, разрушитель чар, это не привычное вам оружие. Он довольно
					хрупкий. Ладно, фактически я уже не работаю на Режим, никто не приходит
					за отчётами, знаете ли. Кинжал этот вещь заурядная. И главное, у меня
					действительно есть одно дело.
					^
					Ты обращаешься в слух.
					^
					-- Я сейчас пытаюсь разобраться с одной вещицей, но знаний не хватает.
					-- Я бы не отказался, если бы вы принёсли мне один свиток из архива.
					^
					-- Какой свиток? Как я его найду? -- быстро спрашиваешь ты.
					^
					-- Хм. Насколько я знаю архивные работники давно сбежали. Поэтому хозяин
					установил вместо них какое-то магическое приспособление.
					Я сам никогда им не пользовался, не было желания разбираться.
					Внешне это похоже на книгу на кафере. Ты пишешь в этой книге название
					нужной тебе книги или свитка, и его доставляют тебе практически
					прямо в руки. Правда, хозяин говорил, что это приспособление
					ещё не совсем правильно работает... Но я думаю, у вас всё выйдет.
					Копаться на полках самому то ещё занятие.
					^
					-- Так, что написать в этой книге? -- уточнаешь ты.
					^
					-- Свиток Ваалама, -- просто отвечает кладовщик, -- и да, чтобы открыть
					ту книгу, понадобится ключ. Вот возьми.
					^
					Кладовщик суёт тебе в руку небольшой металлический жетон.
				]];
			end;
		};
		-- Забираем кинжал
		{
			tag = 'get_dagger';
			false;
			'Я принёс свиток, который вы просили.';
			function()
				-- Отдаём свиток
				inv():del 'tower_scroll';
				-- Получаем кинжал
				take 'tower_dagger';
				objs('tower_stage2_stock'):del('tower_dagger');
				return [[
					-- Что ж, давайте, взглянем на него, -- кладовщик принимает свиток и
					бегло просматривает его содержимое.
					^
					-- Всё верно, это то что нужно, -- заключает он, -- как договаривались,
					кинжал теперь ваш. Думаю, хозяин его не хватится, а я возьму себе в пользование
					другой.
					^
					Твоя рука уже тянется к кинжалу, но возглас кладовщика
					останавливает тебя.
					^
					-- Постойте ка! Хотелось бы получить обратно ключ от книги,
					-- выводит долговязый требовательным голосом.
					^
					Тебе остаётся лишь развести руками:
					^
					-- Сожалею, но, похоже, книга забрала его в качестве платы за свои услуги.
					Ключ исчез прямо в замке во вспышке пламени, едва я получил свиток.
					^
					-- В самом деле? -- удивляется кладовщик, -- ну что же, хозяин предупреждал,
					что эта штука может сбоить. Хм, возможно, на складе есть ещё ключи.
					^
					Пользуясь моментом, ты поспешно забираешь кинжал.
				]];
			end;
		};
		-- Уходим
		{
			always = true;
			'Я пойду.';
			function()
				if not _tower_stage2_stock_dagger_quest then
					if _tower_stage2_stock_dagger_quest then
						-- Включаем этот диалог снова, пока игрок не возьмёт квест
						tower_stage2_stock_storekeeper_dlg:pon('book_guard_quest');
					end;
				end;
				tower_stage2_stock_storekeeper_dlg:pon('about_storekeeper');
				back();
				return [[
					-- Всего доброго, -- бросает тебе кладовщик и возвращается
					к складированию и каталогизации.
				]]
			end;
		};
	};
}
