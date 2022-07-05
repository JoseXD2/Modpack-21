-- Reference used: https://www.consoledatabase.com/cheats/nes/supermariobros/
local gameGenie = {"S", "S", "A", "S", "S", "A"}
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
	initSaveData("songSaveData", "funkmixadvance")
	initSaveData("gameGenie", "funkmixadvance")
end

function onUpdate()
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
		if (songName == "Funk Mix" or songName == "Funk Mix DX") and getDataFromSave("songSaveData", "ballsUnlocked") == false then
			gameGenieComplete = false
			gameGenieCount = 1
			setDataFromSave("songSaveData", "ballsUnlocked", true)
			setDataFromSave("gameGenie", "invincible", false)
			setPropertyFromClass("PlayState", "isStoryMode", false)
			playSound("coin", 1)
			loadSong("balls")
		else
			gameGenieComplete = false
			gameGenieCount = 1
			setDataFromSave("gameGenie", "invincible", not getDataFromSave("gameGenie", "invincible"))
			runTimer("codeUpdate", 0.0001)
			playSound("coin", 1)
		end
	end
end