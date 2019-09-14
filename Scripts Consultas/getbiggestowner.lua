--returns the key of the hash for the owner with the most units
--KEYS >> none
--ARGS >> none

local owners= redis.call("sscan", "owners", 0, "match", "*")
local biggestowner
local maxunits=0
for i, owner in ipairs(owners[2])do --Cicle through the set of owners

	local nunits=redis.call("scard","owners:"..owner..":owns") -- getting the number of units that the owner owns
	if nunits>=maxunits then --if it is higher than what was setted
		if nunits==maxunits then --if it has the same number of units as the last maximum
			biggestowner=biggestowner..", owners:"..owner --we concatenate the result
		else
			biggestowner="owners:"..owner -- we save it as the result
			maxunits=nunits -- and save the new number of maximun units
		end
	end
end
return biggestowner

