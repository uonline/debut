lake_tree_mirror = obj {
	nam = 'Дерево у озера';
	dsc = [[
		Людей лорда укрывает тень раскидистого {дерева}, возвышающегося из воды.
		Ты стараешься не свалиться им на головы с одной из ветвей, где закреплёно
		зеркало. В зеркале видно {отражение дочери лорда}.
	]];
	act = [[
		Засмотревшись на отражение в зеркале, ты едва не падаешь с дерева.
	]];
	used = function(self, what)
		if what == photo_scroll then
			event 'photographed the princess';
			return [[
				Последний раз окинув отражение в зеркале взглядом, ты убеждаешься
				что образ дочери лорда без труда всплывает у тебя перед глазами.
				С трудом резвернув свиток, ты шёпотом зачитываешь текст, старась
				вторить шуму ветра и не выпускать девушку из головы.
				Скоро бессмысленные слова на пергаменте начинают приходить в движение.
				Ты замолкаешь, с удивлением глядя, как магия свитка оживает у тебя в руках.
				Буквы вытягиваются в нити и в причудливом танце плетут картину из твоей головы.
				Через минуту вместо свитка с текстом заклинания ты держишь свиток
				с захватывающим дух изображением. Похоже, твоя фантазия кое-что приукрасила,
				но дочь лорда ты узнаешь с лёгкостью.
			]];
		end
	end;
}
