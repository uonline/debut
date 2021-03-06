-- Переходы локации
under_scaffold_to_dark_lane = vroom('Тёмный проулок', 'burning_quarter');
under_scaffold_to_dark_lane:disable();

-- Локация
under_scaffold = room {
	nam = 'Под эшафотом';
	dsc = [[
		Оклемавшись, ты обнаруживаешь, что воцарились сумерки. Если бы
		не зарево пожара, было бы сложно что-то разглядеть в сгущающейся
		темноте.
		^
		Тебя поднимает на ноги жгучее желание убраться подальше от эшафота.
		Жизнь, которую ты уже посчитал законченной, вливается в тебя с новой силой.
		Особенно остро чувствуется теперь, пропитавший воздух запах смерти.
	]];
	obj = {
		'under_scaffold_square';
		'dead_marauder';
		'axe_in_guardsman';
		'orc_slave';
		'soldier_and_thug';
		'half_reptile';
	};
	way = {
		under_scaffold_to_dark_lane;
	};
	entered = function()
		-- Clear inventory, add whitelisted items
		inv():zap();

		return [[
			Ты мешком падаешь вниз на залитую кровью землю и чувствуешь, как
			голова ударяется обо что-то твёрдое, так что искры сыпятся из глаз.
			Ты теряешь счёт времени, в попытках отойти от падения и удара.
		]];
	end;
}

-- Объекты локации
-- Площадь
under_scaffold_square = obj {
	nam = 'Площадь Режима';
	dsc = [[
		Вся {площадь} усеяна трупами так, что от них начинает рябить в глазах.
		Среди изрубленных тел горожан и стражи можно заметить редких убитых
		урук-хай.
		^
	]];
	act = function()
		local text = [[
			Часть зданий, уже успевших стать тебе хорошо знакомыми, охвачена пламенем.
			Самая широкая улица перекрыта баррикадой. С других доносятся звуки борьбы
			и крики о помощи.
			^
		]];

		if not under_scaffold_to_dark_lane:disabled() then
			return text .. [[
				Твоё внимание притягивает тёмный проулок. Он выглядит как единственный
				путь к спасению. Единственное препятствие -- проклятый полуящер, мечтающий
				полакомиться свежим мясом.
			]];
		end;

		return text .. [[
			Тебе начинает казаться, что бежать некуда.
		]];
	end;
}

-- Мародёр
dead_marauder = obj {
	nam = 'Огромный мародёр';
	dsc = [[
		Совсем рядом с тобой застыл без движения {огромный урук} в тяжёлой броне.
		Его туша привалилась спиной к опоре эшафота и скрывает от тебя половину площади.
	]];
	act = function()
		dead_marauder:disable()
		under_scaffold_to_dark_lane:enable();
		return [[
			Ты с опаской осматриваешь эту гору мускулов, железа и шкур.
			Эти урук-хай не просто так получили своё название мародёров.
			На поле боя это настоящие чудовища, а после сражения они дерутся
			насмерть с другими орками за трофеи: доспехи и оружие побеждённых.
			Тебе сложно поверить, что такого воина можно убить, но зияющая
			рана от ключицы до пояса развеивает твои сомнения. Ты догадываешься,
			что над мародёром поработал жуткий меч богоизбранного.
			^
			Ты осторожно касаешься громадного орка. Тот внезапно издаёт гортанный
			булькающий звук и заваливается на бок.
			^
			Тебе открывается вид на тёмный проулок в другом конце площади. Огонь
			пока что обходит проулок стороной.
		]];
	end;
}

-- Стражник с секирой в спине
axe_in_guardsman = obj {
	nam = 'Секира';
	dsc = function()
		if not dead_marauder:disabled() then
			return [[
				У его ног лицом вниз лежит бездыханный стражник с торчащей из спины {секирой}.
			]];
		end;

		return [[
			Бездыханный стражник лежит лицом вниз с торчащей из спины {секирой}.
		]];
	end;
	act = function()
		axe_in_guardsman:disable();
		return [[
			Ты рассматриваешь гигантскую секиру. За ней можно прятаться от стрел и ударов
			как за щитом. Ты не сомневаешься, что раньше она была оружием мародёра.
			Удар таким оружием наверняка пробил беднягу стражника насквозь, пригвоздив
			его тело к земле.
			^
			Ты подбираешься к трупу стража и разрезаешь о секиру верёвку, связывающую руки.
		]];
	end;
}

-- Орк-раб
orc_slave = obj {
	nam = 'Орк-раб';
	dsc = [[
		Под помостом блестит от пота лысый череп {орка раба}.
		Его тело смешивается с тьмой под эшафотом, и, кажется, периодически
		шевелится.
	]];
	act = function()
		if not have 'soldier_sword' then
			walk 'slain_by_slave'
		else
			-- Орк бросается на героя
			orc_slave:disable();
			return [[
				Ты с подозрением поглядываешь на лысую макушку орка.
				На службе ты узнал, что среди урук череп налысо бреют только рабам.
				Их заставляют сражаться голыми руками, а в остальное время держат на цепи.
				Тебя всегда удивляло, как вообще такие свободолюбивые и агрессивные
				существа могут быть рабами. Потом уже ты услышал байку, что орки-рабы
				чаще всего заканчивают свою жизнь превращением в одичалого.
				^
				Твои размышления грубо прерывают. В одно мгновение орк
				выбирается из-под эшафота и нависает над тобой. К счастью руки твои
				действуют сами по себе. Ты машинально вгоняешь меч бугаю прямо под
				подбородок, и раб в ответ обдаёт тебя потоком чёрной крови. Дождавшись
				пока тело орка обмякнет и свалится в пыль, ты рывком вырываешь меч.
			]];
		end;
	end;
}

-- Солдат и головорез
soldier_and_thug = obj {
	nam = 'Солдат Режима и головорез';
	dsc = [[
		Неподалёку от него сцепились в грязи {солдат Режима и головорез.}
	]];
	act = function()
		local text = [[
			Ты разглядываешь сцепившихся мёртвой хваткой. Солдат лежащий на широкой груди
			орка, выглядит ребёнком по сравнению с урук-хай. Режимник пронзил своего
			противника мечом, но чёрные лапищи так и не разжали тонкую человеческую шею.
			^
		]];

		-- Проверка на развязанные руки
		if axe_in_guardsman:disabled() then
			soldier_and_thug:disable();
			take 'soldier_sword';
			return text .. [[
				Сразу отбросив попытки избавить солдата от орочьих клешней, ты просто
				переворачиваешь его тело набок. Высвободив из окоченевших рук солдата эфес меча,
				ты извлекаешь клинок из трупа урук-хай.
				^
				Пусть меч ещё раз послужит солдату Режима, пускай и бывшему.
			]];
		end;

		return text .. [[
			Ты приходишь к выводу, что со связанными руками заполучить меч
			тебе не удасться.
		]];
	end;
}

-- Меч солдата Режима
soldier_sword = obj {
	nam = 'Меч солдата Режима';
	inv = [[
		Ты оценивающе осматриваешь меч. Он покрыт кровью от острия
		до гарды и отвратительно пахнет. У тебя нет никакого
		желания мараться орочьей кровью сверх меры, и всё же по
		давней привычке ты пытаешься стряхнуть кровь с клинка.
		Кажется, рука ещё помнит, как обращаться с привычным
		мечом Режима.
	]];
}

-- Полуящер
half_reptile = obj {
	nam = 'Полуящер';
	dsc = [[
		Вокруг эшафота разгуливает {полуящер}. Забыв о штурме города, он обнюхивает
		трупы в поисках чем бы поживиться.
	]];
	act = [[
		Ты внимательно смотришь на полуящера -- рептилию вставшую на задние лапы,
		и подражающую повадками человеку. Грубая тёмно-бурая кожа, шипы на спине,
		острые длинные когти на крючковатых лапах-руках, шакальи зубы.
		У безоружного человека против такой твари нет шансов.
		^
		Во время войны ты не раз видывал полуящеров в бандах орков в качестве рабов
		и пушечного мяса. И если в гуще схватки они ведут себя трусливо, то после битвы
		ублюдки нагло рыщут среди падали, разыскивая раненных, чтобы отведать свежатинки.
	]];
}
