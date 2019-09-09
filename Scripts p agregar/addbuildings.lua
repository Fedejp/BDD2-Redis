--Adds a building to the db
--KEYS none
--ARGV[1] = building name
--ARGV[2] = building address
--ARGV[3] = building n floors
--ARGV[4] = building n units per floor

local keyb="buildings:".. ARGV[1]
local keyu="buildings:".. ARGV[1]..":units"
local yaexiste="El edificio ya existe"
local exito="Exito!"
local countp=1
local countu=1

if redis.call("sismember","buildings",ARGV[1])==1 then
	return yaexiste
else
	redis.call("hset",keyb, "name",ARGV[1],"address", ARGV[2])
	redis.call("sadd","buildings", ARGV[1])
	while countp<=ARGV[3].tonumber() do
		while countu<=ARGV[4].tonumber() do
			local unitname=string.char(countp+48)..string.char(countu+64) --supuestamente, convierte el codigo ascii en caracter. +48 para numeros, +64 para letras mayusculas, y asi genera el nombre de la unidad
			redis.call("sadd",keyu,unitname)
			countu=countu+1
		end
		countp=countp+1
	end
	return exito
end
