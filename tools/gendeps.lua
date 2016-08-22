require "lfs"

-- Function by David Kastrup
-- Source: http://lua-users.org/wiki/DirTreeIterator
function dirtree(dir)
	assert(dir and dir ~= "", "directory parameter is missing or empty")
	if string.sub(dir, -1) == "/" then
		dir=string.sub(dir, 1, -2)
	end

	local function yieldtree(dir)
		for entry in lfs.dir(dir) do
			if entry ~= "." and entry ~= ".." then
				entry=dir.."/"..entry
				local attr=lfs.attributes(entry)
				coroutine.yield(entry,attr)
				if attr.mode == "directory" then
					yieldtree(entry)
				end
			end
		end
	end

	return coroutine.wrap(function() yieldtree(dir) end)
end


local prefix = [[-- DO NOT EDIT!
-- This file was generated automatically
-- using tools/gendeps.lua.]]
local template = "dofile '{}'"

print(prefix)
print ''
for filename, attr in dirtree("src/") do
	if attr.mode == 'file' then
		local line = string.gsub(template, '{}', filename)
		print(line)
	end
end
