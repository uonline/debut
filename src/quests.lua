-- global state

-- d1a1
_hunt_gear = false
_hunt_food = false
_need_new_bow = false
_warren_conflict = false

-- stuff
event_handlers = {}

event = function(x)
	event_handlers[x]()
end

on_event = function(ev, fn)
	event_handlers[ev] = fn
end
