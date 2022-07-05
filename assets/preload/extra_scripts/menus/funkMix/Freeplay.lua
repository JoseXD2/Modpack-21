local songs = {"Mushroom Plains", "Bricks and Lifts", "Lethal Lava Lair", "2 PLAYER GAME", nil, nil, nil, nil}
local curSelected = 1
-- var curDifficulty:Int = 1;
local grpSongs = {"songText1", "songText2", "songText3", "songText4", "songText5", "songText6", "songText7", "songText8"}
local canControl = true
local mainColor = "0xFFFFFF"
local wideScreen = (26 * 6) + 4

function onCreate()
	if getDataFromSave("songSaveData", "ballsUnlocked") then
		songs[5] = "balls"
	end

	makeLuaSprite("blackBG", nil, 0, 0)
	makeGraphic("blackBG", screenWidth, screenHeight, "000000")
	setObjectCamera("blackBG", "other")
	updateHitbox("blackBG")
	setProperty("blackBG.antialiasing", false)
	addLuaSprite("blackBG", false)

	makeLuaSprite("map", "menus/freeplay/map", 0 + wideScreen, 93 * 6)
	setObjectCamera("map", "other")
	scaleObject("map", 6, 6)
	updateHitbox("map")
	screenCenter("map", "x")
	setProperty("map.x", getProperty("map.x") + 3)
	setProperty("map.antialiasing", false)
	addLuaSprite("map", false)

	makeLuaSprite("infoText", "menus/freeplay/text", 37 * 6 + wideScreen, 10 * 6)
	setObjectCamera("infoText", "other")
	scaleObject("infoText", 6, 6)
	updateHitbox("infoText")
	setProperty("infoText.antialiasing", false)
	addLuaSprite("infoText", false)

	for i = 1,tablelength(songs) do
		makeLuaText("songText"..i, songs[i], 0, (25 * 6) + wideScreen - 3, (9 * 6 * i) + (24 * 6) - 3)
		setTextSize("songText"..i, 8 * 6)
		setTextBorder("songText"..i, 0, "000000")
		setTextFont("songText"..i, "smb1.ttf")
		setObjectCamera("songText"..i, "other")
		setObjectOrder("songText"..i, getObjectOrder("infoText") + 1)
		updateHitbox("songText"..i)
		addLuaText(grpSongs[i])

		makeAnimatedLuaSprite("icon"..i, "menus/freeplay/icons", 9 * 6 - 2 + wideScreen , getProperty("songText"..i..".y") + (1 * 6) + 1)
		addAnimationByPrefix("icon"..i, "idle", "idle000"..(i - 1), 0, true)
		setObjectCamera("icon"..i, "other")
		scaleObject("icon"..i, 6, 6)
		setProperty("icon"..i..".antialiasing", false)
		addLuaSprite("icon"..i, false)
	end
	changeSelection()
	-- changeDiff();

	local bullShit = 1

	for item = 1,tablelength(grpSongs) do
		setTextColor(grpSongs[item], "0xE69C21")
		setTextColor(grpSongs[1], "0xFFFFFF")
	end
end

function onUpdate(elapsed)
	if getTextString("curMenuGlobal") == "2" then
		setTextString("curSelectedGlobal", curSelected)
		if getTextString("inMenuGlobal") ~= "Freeplay" then
			setTextString("inMenuGlobal", "Freeplay")
			canControl = true
		end

		if canControl then
			if keyJustPressed("up") then
				changeSelection(-1)
			end
			if keyJustPressed("down") then
				changeSelection(1)
			end
		else
			setTextString("canControlGlobal", "false")
		end

		if keyJustPressed("accept") and canControl then
			canControl = false
			playSound("coin", 1)
			flicker(grpSongs[curSelected], 0.8, 0.05, false)
			runTimer("freeplaySong", 1, 1)
		end
	end
end

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

function changeSelection(change)
	if getTextString("curMenuGlobal") == "2" then
		if change ~= 0 then
			playSound("menu_select", 1)
		end

		curSelected = curSelected + change

		if curSelected < 1 then
			curSelected = tablelength(songs)
		elseif curSelected > tablelength(songs) then
			curSelected = 1
		end

		-- intendedScore = Highscore.getScore(songs[curSelected].songName, curDifficulty);

		local bullShit = 1

		for item = 1,tablelength(grpSongs) do
			bullShit = bullShit + 1

			setTextColor(grpSongs[item], "0xE69C21")

			if curSelected == bullShit - 1 then
				setTextColor(grpSongs[item], "0xFFFFFF")
			end
		end
	end
end

function flicker(object, duration, interval, endVisibility)
	local visability = false
	runTimer("flickerDur", duration)
	runTimer("flickerInt", interval, math.huge)

	function onTimerCompleted(tag)
		if tag == "flickerInt" then
			setProperty(object..".visible", visability)
			visability = not visability
		end

		if tag == "flickerDur" then
			cancelTimer("flickerInt")
			if endVisibility then
				setProperty(object..".visible", true)
			end
		end

		if tag == "freeplaySong" then
			setPropertyFromClass("PlayState", "isStoryMode", false)
			loadSong(songs[curSelected], -1, true)
		end
	end
end