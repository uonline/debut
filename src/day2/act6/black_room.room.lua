-- Локация
black_room = room {
	nam = 'Чёрная комната';
	dsc = [[
		^
		-- Так уж ли много на свете правдивых историй. Память и ограниченность человеческого восприятия;
		^
		^
		Иначе про идеи толкает проповедник на эшафоте;
		После того как героя хватают в башне, он пытается сопротивляться и солдаты вырубают его;
		Герой призодит в себя в Темной комнате;
		Там с ним разговаривает Она -- ПБ в образе темноволосой женщины.
		Сначала герой принимает её за Полукровку.
		В процессе разговора ПБ несколько раз меняет личины;
		^
		^
		-- Орки, люди, эльфы. Все мы не так уж отличаемся от друг друга.
		Мы состоим из плоти и крови. Дышим одним воздухом. Едим и спим.
		Нам всем знакомы эмоции. Мы способны чувствовать и мыслить.
		Мы боремся за существование. Мы не так уж отличимы друг от друга;
		^
		-- Но в этом мире существуют и другие. Раса нематериальных существ,
		что обитает на границе нашего восприятия и понимания.
		Их принцип существования принципиально иной, ведь они не имеют
		привычного нам воплощения. Напротив, они жаждут его.
		Жаждут проникнуть в наш мир, обрести в нем плоть и кровь, подобно нам;
		^
		-- Это раса паразитов. Неизвестно сколько они ждали в пустоте нашего появления.
		Ждали своих хозяев -- разумнх существ;
		^
		-- Они всегда были рядом с нами, и мы всегда чувствовали их.
		Они блуждали по кромке наших сознаний. Выжидали, словно хищник жертву.
		Ждали шанса пробраться в нас;
		^
		-- Мы назвали их -- идеи. Этих коварных созданий холодных созданий,
		алчущих жизни, плоти и крови. Они проникают нам в головы и захватывают нас.
		Мы становимся их марионетками, покорными и исполнительными.
		Они начинают смотреть на мир нашиит глазами, отражать себя нашими телами.
		Одним они расправляют плечи, другим горбят спину.
		У одних вырастают крылья, у иных рога. Наша жизнь принадлежит им,
		отдаляетмя от родных и близких, от жизни, которая считается нормальной в нашем обществе.
		Они используют наше воображение против нас, и с его помощью заражают окружающих нас людей,
		близких нам по духу. Их цель -- воплотиться в нашем мире, стать его влиятельной частью,
		изменить его. Так они скществуют и живут среди нас, питаясь нами, используя нас;
		^
		-- Но так же как они зависят от нас, мы зависим от них.
		Их существование и воплощение, напрямую влияет на нашу жизнь.
		Ведь они стремятся процветать. Идеи, которые клучшают нашужизнь считаются хорошими.
		Тех, которым это не удается, называют плохими. Они действуют как симбтонты и стараются,
		заботится о нас, выращивая кау животных на ферме, увеличивая нашу популяцию;
		^
		-- Противостояние идеям, умение отказываться от них.
		^
		^
		* в образе мага-крысы: О Магосе и ипользование одними магами головы других для хранения воспоминаний.
		^
		^
		-- Сложно сказать, -- девушка показывает тебе ровные белые зубы, -- в этом мире всё
		так зыбко и преходяще. Одно мгновение может разделить человека и страдание,
		человека и смерть. И он, в свою очередь, даже не сможет найти причину произошедшего.
		Перед глазами у него пронесётся вся его нелепая жизнь, а он так и не сможет осознать,
		почему же он умирает. О, воистину, мы не так представляем себе то, чего случиться
		не может. Ведь каждый из нас в глубине души верит, что он не сможет умереть.
		Но когда происходит именно это, тогда-то обнажается истинная реальность
		этого мира...
		^
		В её необычных лиловых глазах загорается огонь.
		^
		-- Ужас. Вот что правит бал в жизнях людей. Безопасность так иллюзорна,
		-- она вытирает нож о куртку крутки и прячет её в рукав,
		-- через пару часов этот город будет гореть в огне. Сможешь ли ты считать,
		что именно ты приложил руку к этой трагедии? Что не смог ей помешать?
		Думаю что не сможешь. Ведь тогда ты должен будешь считать себя <b>кем-то</b>.
		Краеугольным камнем судьбы, фигурой действия, не меньше.
		Но никак не безвольной марионеткой.
		^
		Она подходит к окну, раскрывает его, и бросает на тебя прощальный взгляд.
		^
		-- Теперь я оставлю тебя с мыслями об этом. Возможно мы ещё встретимся,
		дезертир. В этом мире возможно всё, когда речь идёт о смерти.

	]];
	obj = {};
	entered = function()
		-- Clear inventory, add whitelisted items
		inv():zap();
	end;
}

-- Объёкты локации
-- Она

-- События локации
on_event('caught in action', function()
	walk 'scaffold';
end)
