berlinstrasse = room {
	nam = 'Главная улица';
	dsc = [[
		Ты стоишь на главной улице города. Сразу понятно, что она главная,
		потому что улица тут же говорит тебе, что ты скотина и вообще
		ничего из себя не представляешь.
		^
		(Улица ведёт к башне Наместника: мрачное описание?)
		^
		(куча НПС с которыми ты можешь поговорить)
		^
		- Старик книжник Прираничья -- диалоги о Книжниках, истории Приграничья, цели Книжника (исследовать город):
			* Книжники Приграничья бывшие мейстеры рыцарских Орденов. Странствующие хранители истории страны, учителя в городах и селах:
         		* Страна, которая со временем изменяет жителей:
         		* Королевства и Ордена;
         		* Режим не сможет оккупировать эту страну;
      		* Свободные люди Приграничья (аналог цыган);
		- Мальчишка;
		- Группа мужчин;
		^
		(Вместе с необходимости влюбить игрока в город, нужно и покачнуть его уверенность в реальности города. Иллюзии мирной жизни)
		^
		(Будучи солдатом Режима, ГГ расспрашивает всех о подозрительных личностях и гильдии воров)
	]];
	obj = {
		-- ^_^
	};
	way = {
		'regimenstrasse';
		'bazaar';
	};
}

-- TODO
regimenstrasse_todo = obj {
	nam = 'Todo';
	dsc = [[
		{...}
	]];
	act = function()
		return [[
			- Воспоминания ГГ о городах Приграничья и людях. Нужно влюбить игрока в город, чтобы он сопереживал его гибели в огне;
			^
			- куча НПС с которыми ты можешь поговорить, помимо мененстреля и глашатая;
			^
			- Будучи солдатом Режима, ГГ расспрашивает всех о подозрительных личностях и гильдии воров;
		]];
	end;
}
