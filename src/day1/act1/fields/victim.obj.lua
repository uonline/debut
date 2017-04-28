_seen_victim = false

victim = obj {
	nam = 'Труп';
	dsc = [[
		^
		Вдалеке стоит дерево. На дереве улей. В улье жужжат пчёлы.
		Возле дерева {что-то виднеется}.
	]];
	act = function()
		if not _seen_victim then
			_seen_victim = true
			event 'found the body'
		end
		return [[
			Батюшки-светы, да это же труп!
		]]
	end;
}
