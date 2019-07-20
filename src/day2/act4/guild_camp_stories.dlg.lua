-- Переменные диалога
local _mage_greeting = false

-- Диалог с продавцом пряностей
guild_camp_stories = dlg {
	nam = 'Беглый маг';
	hideinv = true;
	entered = function()
		-- Приветствие
		if not _mage_greeting then
			_mage_greeting = true;
			return [[
				-- А вот и ты. Я знал, что у тебя всё получится.
			]];
		end;

		-- Повторный диалог
		return [[
			-- А вот и ты.
		]];
	end;

	phr = {
		-- Просишь рассказать откуда продавец
		{
			true;
			tag = 'first_question';
			'Так что, ты здесь делаешь?';
			[[
				Test (прочитать все диалоги с крысами)
				^
				-- Что ты здесь делаешь?
				^
				-- Скажем так, у меня есть здесь некоторые дела.
				^
				-- Дела? Тогда какого чёрта ты не взял меня с собой?
				^
				-- Ну, я предложил тебе план, но выбор оставил за тобой.
				^
				-- А как же башня?
				^
				-- О башня, ...
				^
				5. Меня волновал один вопрос. Я взял из сундука субстрат, но когда мы расстались,
				ты даже не попросил его. Хотя слёзно рассказывал, как ты зависишь от субстрата.
				^
				-- Решил, что он тебе нужней. Ты так ловко провёл того стражника в тюрьме. Я подумал,
				что ты тоже найдёшь ему применение.
				^
				<b>Это маг-крыса с которым ты сбежал из штаба. Из разговора становится понятно,
				что он работает на Синдикат из Вольных Городов. Синдикат налаживает связи
				в Приграничье надеясь укорениться в регионе и предлагает свою помощь в
				борьбе с Режимом.</b>
				^
				-- Эта башня идеально подходит для контрабанды субстрата в регионе.
				^
				-- Выходит ты работаешь на Синдикат. И ты использовал меня, чтобы добыть документы?
				^
				-- А что насчёт башни.
				^
				-- Узнаешь, -- отвечает он улыбаясь.
				^
				-- Вся жизнь -- игра теней. Мою тень ты рассмотрел не сразу.
				^
				-- 4. не очень-то ты молодо выглядишь.
				^
				-- Магос государство стариков. Ты можешь чего-то достичь там только будучи седым с окладистой
				бородой. Архимаги Магоса жили ещё до основания Режима Ремана.
				^
				-- И как им только это удаётся.
				^
				-- Магия поддерживает в них жизнь. Память человека ограничена. Горорят они выносят свои воспоминания
				в свои артефакты.
			]];
			function()
				guild_camp_stories:pon('free_kingdome_question');
				guild_camp_stories:pon('trade_way');
			end;
		};
		-- Просишь рассказать про Имперские колонии
		{
			false;
			tag = 'free_kingdome_question';
			[[1.]];
			[[
				1. -- Знаешь, тебя можно назвать внимательным слушателем. Даже если ты
				разговариваешь с крысой...
		^
		Маг что-то чувствует в ГГ, что-то схожее с Кевразой.
			]];
			function()
				guild_camp_stories:pon('termites');
			end;
		};
		-- Просишь рассказать про Термитники
		{
			false;
			tag = 'termites';
			'2.';
			[[
				-- Никогда не понимал, за что церковники вас так невзлюбили.
				Сидите вы там у себя на острове. Воюете с эльфами. Паства из вас никакая.
				^
				-- Инквизиторы охотятся на образ мыслей. И знаешь, некоторые мысли, действительно,
				могут быть весьма опасны. Поверь мне как студиоузу, как книжному червю.
				Я читал записи многих магов, и некоторые из них доходят до опеределённой грани
				разумного в своих рассуждениях. Маги башен -- свободные творцы, и их открытия
				иногда повергают в шок даже правителей Магоса, что уж говорить о простых обывателях.
				Магос живёт своей свободой, но кто знает, куда она может его завести.
				Церковь понимает это.
				^
				-- И боится?
				^
				-- Ты бы тоже стал бояться.
			]];
		};
		-- Просишь рассказать про Торговый путь
		{
			false;
			tag = 'trade_way';
			'3.';
			[[
				-- Сами богословы иногда мыслят весьма опасно. Например, религия Режима...
				Божественное сознание -- оно движет историю, подобно сознанию писателя...
				Развитие есть лишь там, куда падёт свет божественного провидения...
				Впрочем, я объясняю эти взгляды примитивностью, человеческого разума.
			]];
		};
		-- Уходишь
		{
			always = true;
			'Я пойду.';
			'Удачи.';
			function()
				guild_camp_stories:pon('first_question');
				back()
			end;
		};
	};
}
