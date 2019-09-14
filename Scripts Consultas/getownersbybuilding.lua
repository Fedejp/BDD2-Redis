--Get all the owners of a building
--KEYS >> none
--ARGV[1] >>Building short name

local building= ARGV[1]
local units=redis.call("SSCAN", "buildings:"..building..":units", 0, "match", "*") --Here, we look for the set of units of the building and return it as a list
local unitowners = {}

for i, unit in ipairs(units[2]) do --for each unit in the resulting list of units
	local owners=redis.call("SSCAN", "buildings:"..building..":units:"..unit..":owners", 0, "match", "*") --we get the owners
	for j, owner in ipairs(owners[2]) do
		table.insert(unitowners, owner) --and insert them into the resulting table

	end
end
return unitowners

