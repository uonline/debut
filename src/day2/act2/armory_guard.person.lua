armory_guard = obj {
	nam = 'Старый солдат';
	dsc = [[
		^
		Прямо перед тобой за низким столиком сидит {немолодой солдат} с сединой в бороде,
		занятый чисткой ржавчины с внушительного вида двуручного меча.
	]];
	act = function()
		walk 'armory_guard_dlg'
	end;
}

armory_guard_dlg = dlg {
	nam = 'Старый солдат';
	hideinv = true;
	entered = [[
		Солдат поднимает голову.
		^
		-- Утро доброе. Тебе чего?
	]];
	phr = {
		{
			true;
			'Э-э-э, я новый рекрут, прибыл за оружием и экипировкой.';
			[[
				-- Чего? -- солдат резко поворачивает голову вбок, выглядя
				при этом крайне удивлённым.
			]];
			function()
				armory_guard_dlg:pon('phr2');
			end;
		};
		{
			tag = 'phr2';
			false;
			'Ну, мне сказали, что их здесь выдают... А в чём, собственно, дело?';
			[[
				-- Ну да, железяка-то, значится, не плохая! -- солдат неожиданно взмахивает мечом,
				едва не разделив тебя на две половины, -- он принадлежал, отцу нынешнего
				лорда. Во времена войны, как сейчас помню, он этим мечом
				бошки оркам в два счёта сносил. А потом его самого, значится, ну,
				головы-то и лишили. А меч трофейный теперь. Да только, стало быть, не нашлось
				умельцев больше, кто бы с ним мог управился.
				Так, палач, изредка на эшафоте машет. Да, я его от пыли оттираю.
				^
				Старик резко замолчал, густистые брови сомкнулись на переносице.
				Ты понял, что он погрузился в воспоминания.
				^
				-- Так тебе чего надо-то? -- очнулся солдат.
			]];
			function()
				armory_guard_dlg:pon('phr3');
			end;
		};
		{
			tag = 'phr3';
			false;
			'Я говорю, рекрут я новый! Доспехи мне дай!';
			[[
				-- А-а-а-а! Ну так бы сразу и сказал.
				Сейчас чего-нибудь подберём...
				^
				Солдат с удивительной лёгкостью вскакивает со стула и оценивающе
				осматривает тебя с головы до ног. Закончив с мыслительной примеркой,
				он исчезает в лесу из манекенов.
				^
				-- Шустрый старикан, -- слышишь ты шёпот мага, -- только на ухо туговат.
				^
				После пары минут грохота и лязга, солдат возвращается с набором доспехов
				в руках.
				^
				-- Неплохая, значится, выправка для рекрута, сынок, -- заключает старик,
				глядя на результат своих трудов -- тебя в облачении солдата Режима.
				^
				-- Мечом я тоже машу неплохо. Кстати, его-то можно получить?
				^
				-- А вот этого не положено, -- солдат строго оттапыривает указательный палец,
				чтобы поводить им из стороны в сторону, -- приказ капитана. Без его личного
				разрешения, стало быть, никому ничего острого!
			]];
			function()
				take 'guard_armor';
			end;
		};
		{
			always = true;
			'Я пойду.';
			'Солдат продолжает свою борьбу с ржавчиной, так что ты просто уходишь.';
			function()
				back()
			end;
		};
	};
}
