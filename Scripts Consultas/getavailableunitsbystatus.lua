--Given a building short name and a desired status, returns the list of units from that building with the status
--ARGV[1] >> building short name 
--ARGV[2] >> desired status

local buildingname=ARGV[1]
local desired=ARGV[2]
local units=redis.call("SSCAN", "buildings:"..buildingname..":units", 0, "match", "*") --Here, we look for the set of units of the building and return it as a list
local availableunits= {}
for i, unit in ipairs(units[2]) do --for each unit in the resulting list of units
	local status= redis.call("hget", "buildings:"..buildingname..":units:"..unit, "status") --we fetch the status from the hash
	if(status == ARGV[2]) then
		table.insert(availableunits, "buildings:"..buildingname..":units:"..unit) --add the unit if matches
	end
end
return availableunits

