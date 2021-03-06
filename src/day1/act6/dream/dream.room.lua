dream = room {
	nam = 'Ночь';
	dsc = [[
		Ты просыпаешься глубокой ночью. Костёр еле тлеет, но высоко в небе тяжёлые тучи
		прорезает луна, и кое-что удаётся разглядеть. Капитан спит прямо у огня,
		накрывшись чем-то вроде шкуры. Ты и сам чем-то накрыт, похоже, плащом, но
		холод такой, что не особо помогает. Твой взгляд нащупывает тёмное пятно
		повозки, а рядом с ней едва заметное пятно твоего стража-бородача,
		изредка всхрапывающего. Ты догадываешься, что фигура в плаще ночует
		внутри повозки. Но вот второго стража нигде не видно. Похоже, он дозорный,
		а значит, следит за лагерем где-то поблизости.
		^
		Глубоко вздохнув, ты решаешь, что такой прекрасной возможности прогуляться
		ночью под луной тебе больше не представится. Укутавшись в плащ как следует,
		ты осторожно поднимаешься и, пригибаясь, направляешься прочь от стоянки и тракта,
		в сторону чёрного оскала елей.
		^
		Спасительный лес всё ближе, но ветер настигает тебя раньше. Он приводит в движение
		густое небо, и мрачные краски туч пожирают луну. Издалека доносится отзвук
		грома, словно утроба неведомого зверя возрадовалась этой пище -- ночному светилу.
		Ты застываешь в темноте, забыв о возможной погоне.
		^
		Но холод капель дождя на лице сбрасывает с тебя оцепенение. Ты выставляешь ладонь,
		собирая небесную влагу. Тебе кажется, что от воды исходит сияние, слово в ней
		растворился свет поглощённой небом луны. Тьма проясняется.
		Отбросив всякие страхи, ты входишь в лес.
		^
		Дождь усиливается. Его камни-капли стучат по листве, уже опавшей и ещё только
		собирающейся. Этот шум заглушает твои шаги. Но только ли твои?
		^
		Ты углубляешься в лес и скоро выходишь на тропу. Она ведёт под гору,
		на вершину утёса. Резкий порыв ветра подхватывает тебя и бросает вперёд, вверх.
		Снова гремит гром, но уже здесь, совсем рядом, и похожий на рёв.
		^
		Ты срываешься на бег.
		Ливень режет лицо, и ты прячешь его за рукавом плаща, тяжёлым и мокрым.
		^
		Ты бежишь, уставившись в грязь под ногами, пока вспышка оглушительной
		молнии не заставляет тебя замереть, а лес вокруг -- в ужасе отпрянуть.
		^
		Ты стоишь посреди бури перед голой вершиной утёса.
	]];
	obj = {
		'dream_figure';
	};
	way = {
		--'tract_camp';
	};
}

dream_figure = obj {
	nam = 'Фигуры в плаще';
	dsc = [[
		На вершине утёса стоят {четверо}.
	]];
	act = function()
		walk 'tract_camp'
		return [[
			Вокруг бушует ветер, но полы их плащей не двигаются. Капюшоны низко надвинуты.
			^
			Первая фигура делает шаг вперёд.
			^
			-- Люди -- вечные беглецы. И вот твоё бегство привело тебя к нам, -- говоривший
			снимает капюшон и являет тебе обрамлённую бородой улыбку.
			^
			-- Кто вы такие? -- твой голос звучит едва слышно.
			^
			Другая фигура выступает вперёд.
			^
			-- Все просто. Мы те, кто использует тебя. Использует твоё бездействие. Ты
			плывёшь по этой реке, которую вы называете жизнью, с упоением
			отдаваясь власти течения, -- капюшон откидывается на спину, открывая
			лицо капитана. Он с ухмылкой подмигивает тебе. -- Теперь мы -- твоё течение.
			^
			Ты делаешь шаг назад.
			^
			-- Ты хочешь спросить, как мы тебя используем, -- раздаётся вкрадчиво манящий
			голос у тебя в голове.
			^
			Третья фигура выступает вперёд.
			^
			-- Ты -- камушек, который породит оползень. Или скорее, жук, который
			толкнёт этот камушек, -- мокрые полы плаща высвобождают
			тонкую бледную руку с длинными пальцами. На одном из них призывно мерцает
			знакомый перстень. Изящным движением рука откидывает капюшон,
			и ты видишь привлекательное личико дочери местного лорда.
			^
			Твои мысли пускаются в судорожный бег. Последняя фигура, тот стражник,
			лица которого ты так и не увидел. Ты ловишь себя на мысли, что хочешь
			узнать, кто скрывается под тенью последнего капюшона.
			^
			Ты отступаешь назад, но вершина утёса становится только ближе.
			^
			-- Что ты хочешь увидеть? -- слышишь ты до боли знакомый голос.
			Последняя фигура приходит в движение. Тебе остаётся лишь с ужасом наблюдать,
			как она подходит к тебе вплотную. Твои руки сами обхватывают её капюшон.
			Дрожа, они отбрасывают его назад, открывая тебе такое знакомое лицо.
			Твоё лицо.
			^
			Буря вокруг доходит до своего апогея. Ты слышишь, как сзади ветер срывает
			листья с деревьев. Он закручивает их вокруг тебя. Капли дождя превращаются
			в льдинки, рвущие твою кожу на части. Ты пытаешься закричать, но твоё горло
			не в силах выдавить из себя ни звука.
			^
			-- Ты не можешь кричать, если у тебя нет рта, -- шепчешь ты сам себе, улыбаясь.
			^
			Ветер обрушивает на тебя облако листвы, и боль пронзает тело тысячей игл.
		]]
	end;
	used = function(self, what)
		if what == a6_the_thing then
			walk 'your_cell'
			return [[
				Вокруг бушует ветер, но полы их плащей не двигаются. Капюшоны низко надвинуты.
				^
				Первая фигура делает шаг вперёд.
				^
				-- Люди живут противоречиями. Верят в судьбу, но хотят её изменить.
				И тогда они приходят к нам, -- говоривший небрежно откидывает
				капюшон и являет тебе улыбку, спрятанную
				в седой бороде старосты из твоей деревни.
				^
				-- Так кто же вы? -- твой голос звучит едва слышно.
				^
				Другая фигура выступает вперёд.
				^
				-- Всё просто. Мы и есть судьба. Течение реки, которую вы называете жизнью,
				-- капюшон откидывается на спину, открывая
				лицо лесника. Он скрипуче усмехается. -- Теперь мы -- твоё течение.
				^
				Ты делаешь шаг назад.
				^
				-- Ты хочешь спросить, куда несёт тебя это течение, -- раздаётся сладкий, манящий
				голос у тебя в голове.
				^
				Играя бёдрами, третья фигура шагает вперёд.
				^
				-- Ты хочешь узнать свою судьбу. Познать, какие ответы таит в себе тьма,
				-- влажные полы плаща высвобождают
				тонкую бледную руку с длинными пальцами. Лёгким движением она откидывает
				капюшон, и ты видишь похотливое личико с картинки из твоей потёртой книжицы.
				^
				Твои мысли пускаются в судорожный бег. Дрожащей рукой ты достаёшь из глубин
				своего плаща амулет и протягиваешь его последней фигуре.
				^
				И она приходит в движение. С нетерпением ты смотришь, как она медленно
				приближается к тебе. Провал капюшона застывает напротив твоего лица.
				Незнакомец берёт твои руки и смыкает их на амулете.
				^
				-- Нет, теперь это твоё. Сделка заключена.
				^
				Внезапный приступ злости охватывает тебя. Амулет летит в грязь, а твоя рука
				сжимает капюшон. С силой ты срываешь его прочь.
				^
				Всполох молнии выхватывает белый гладкий овал головы, лишённой лица.
				Ты пытаешься закричать, но твоё горло не в силах выдавить из себя ни звука.
				^
				-- Ты не можешь кричать, если у тебя нет рта, -- раздаётся шёпот у тебя в голове.
				^
				Грохот грома кричит за тебя.
			]]
		end
	end;
}
