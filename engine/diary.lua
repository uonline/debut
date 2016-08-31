_diary_entries = {}

diary_add = function(id, text)
	table.insert(_diary_entries, {
		["id"] = id;
		["text"] = text;
	})
end

diary_del = function(id)
	tmp = {}
	for i,v in ipairs(_diary_entries) do
		if v.id ~= id then
			table.insert(tmp, v)
		end
	end
	_diary_entries = tmp
end


diary = obj {
	nam = 'Дневник';
	inv = function()
		ret = 'Ты открываешь дневник и листаешь последние записи.'
		-- cycle
		for i,v in ipairs(_diary_entries) do
			ret = ret .. '^-- ' .. v.text
		end
		-- eof
		ret = ret .. [[
			^
			...
			^
			Больше ничего интересного в дневнике нет.
		]]
		return ret
	end
}

-- always take
take(diary)
