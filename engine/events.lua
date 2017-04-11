event_handlers = {}

event = function(x)
	print('Event fired: '..x)

	count = 0
	for i,v in ipairs(event_handlers) do
		if v.event == x then
			v.fn()
			count = count + 1
		end
	end

	print('(handlers called: '..count..')')
end

on_event = function(k, v)
	table.insert(event_handlers, {
		event = k;
		fn = v;
	})
end
