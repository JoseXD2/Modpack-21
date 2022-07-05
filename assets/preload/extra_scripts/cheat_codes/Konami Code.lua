local konami = {"UP", "UP", "DOWN", "DOWN", "LEFT", "RIGHT", "LEFT", "RIGHT", "B", "A"}
local konamiCount = 1
local konamiComplete = false

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

function konamiSlot(int)
	return getPropertyFromClass("flixel.FlxG", "keys.justPressed."..konami[int])
end

function onUpdate()
	if getPropertyFromClass("flixel.FlxG", "keys.justPressed."..konami[konamiCount]) then
		konamiCount = konamiCount + 1
	elseif konamiSlot(1,tablelength(konami)) then
		konamiCount = 1
	end
	if konamiCount > tablelength(konami) then
		konamiComplete = true
	end
end

function onUpdatePost()
	if konamiComplete then
		if songName == "Funk Mix DX" then
			setProperty("camGame.visible", false)
			setProperty("camHUD.visible", false)
			setProperty("camOther.visible", false)
			playSound("gameboy_off", 1)
			loadSong("Green Screen")
		end
	end
end