diary_handlers = {}

diary_entry = function(fn)
	table.insert(diary_handlers, fn)
end

diary = obj {
	nam = 'Дневник';
	inv = function()
		ret = 'Ты открываешь дневник и листаешь последние записи.'
		-- cycle
		for i,v in ipairs(diary_handlers) do
			local tmp = v()
			if tmp ~= nil then
				ret = ret .. '^-- ' .. tmp
			end
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
