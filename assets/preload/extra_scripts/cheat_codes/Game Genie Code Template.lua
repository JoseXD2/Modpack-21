-- Reference used: https://www.consoledatabase.com/cheats/nes/supermariobros/
local gameGenie = {"Q", "W", "E", "R", "T", "Y"} -- Game Genie Code
local gameGenieCount = 1
local gameGenieComplete = false

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

function genieSlot(int)
	return getPropertyFromClass("flixel.FlxG", "keys.justPressed."..gameGenie[int])
end

function onCreate()
	-- Debug Info
	makeLuaText("gameGenieCount", gameGenieCount, 0, screenWidth - 16, 0)
	setObjectCamera("gameGenieCount", "other")
	addLuaText("gameGenieCount")
end

function onUpdate()
	setTextString("gameGenieCount", gameGenieCount) -- Debug info

	if getPropertyFromClass("flixel.FlxG", "keys.justPressed."..gameGenie[gameGenieCount]) then
		gameGenieCount = gameGenieCount + 1
	elseif genieSlot(1,tablelength(gameGenie)) then
		gameGenieCount = 1
	end
	if gameGenieCount > tablelength(gameGenie) then
		gameGenieComplete = true
	end
end

function onUpdatePost()
	if gameGenieComplete then
		gameGenieComplete = false
		gameGenieCount = 1
		-- Other code to load on completed.
		runTimer("codeUpdate", 0.0001)
		playSound("coin", 1)
	end
end