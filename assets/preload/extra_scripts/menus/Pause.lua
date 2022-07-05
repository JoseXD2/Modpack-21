local grpMenuShit = {"songText1", "songText2", "songText3"}
local menuItems = {"CONTINUE", "RETRY", "END"}
local curSelected = 1
local transitionType = 0
local canControl = false
local bgPos = nil
local wideScreen = (26 * 6) + 1
local paused = false
local canPause = false
local chars = {"boyfriend", "gf", "dad"}

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

function onCreate()
	initSaveData("songSaveData", "funkmixadvance")
	defNoReset = getPropertyFromClass("ClientPrefs", "noReset")

	isMari0 = songName == "Portal Power"
	isMinus = songName == "Wrong Warp"
	isSMM = songName == "first level"

	pausePath = "menus/pause/PAUSE"
	marioPath = "menus/pause/walking"
	barPath = "menus/pause/progressbar"

	if isMinus then
		pausePath = "menus/pause/PAUSE-glitched"
		marioPath = "menus/pause/walking-glitched"
	end

	if isMari0 then
		marioPath = "menus/pause/mari0/walking"
		barPath = "menus/pause/mari0/progressbar"
	end

	if isSMM then
		marioPath = "menus/pause/smm/walking"
		barPath = "menus/pause/smm/progressbar"
	end

	makeLuaText("isPaused", paused, 0, 0, 0)
	makeLuaText("curSelectedGlobal", curSelected, 0, 0, 16)
	makeLuaText("transitionType", transitionType, 0, 0, 32)
	makeLuaText("getBgPos", bgPos, 0, 0, 48)
	initSaveData("playerSettings", "funkmixadvance")
	if getDataFromSave("playerSettings", "debugInfo") then
		addLuaText("isPaused")
		addLuaText("curSelectedGlobal")
		addLuaText("transitionType")
		addLuaText("getBgPos")
	end

	makeLuaSprite("bgPauseWide", nil, 0, 0)
	makeGraphic("bgPauseWide", screenWidth, screenHeight, "000000")
	setObjectCamera("bgPauseWide", "hud")
	updateHitbox("bgPauseWide")
	setProperty("bgPauseWide.y", screenHeight)

	makeLuaSprite("bgPause", "menus/pause/bg", 0, 0)
	setObjectCamera("bgPause", "hud")
	scaleObject("bgPause", 6, 6)
	updateHitbox("bgPause")
	screenCenter("bgPause", "x")
	setProperty("bgPause.antialiasing", false)
	bgPos = screenHeight
	setProperty("bgPause.y", screenHeight)

	makeLuaText("levelInfo", songName, 0, 0, 31 * 6 - 3)
	setTextSize("levelInfo", 8 * 6)
	setTextBorder("levelInfo", 0, "000000")
	setTextFont("levelInfo", "smb1.ttf")
	setObjectCamera("levelInfo", "hud")
	updateHitbox("levelInfo")
	levelInfoPos = getProperty("levelInfo.y")

	makeLuaSprite("pauseText", pausePath, 0, 7 * 6)
	setObjectCamera("pauseText", "hud")
	scaleObject("pauseText", 6, 6)
	setProperty("pauseText.antialiasing", false)
	pauseTextPos = getProperty("pauseText.y")

	makeLuaSprite("progressBar", barPath, 0, 57 * 6 - 2)
	setObjectCamera("progressBar", "hud")
	scaleObject("progressBar", 6, 6)
	setProperty("progressBar.antialiasing", false)
	progressBarPos = getProperty("progressBar.y")

	makeAnimatedLuaSprite("marioPause", marioPath, 0, 46 * 6 - 2)
	addAnimationByPrefix("marioPause", "walk", "walk0", 9, true)
	setObjectCamera("marioPause", "hud")
	scaleObject("marioPause", 6, 6)
	setProperty("marioPause.antialiasing", false)
	marioPausePos = getProperty("marioPause.y")

	makeLuaSprite("selector", "menus/pause/selector", 0, 12 * 6)
	setObjectCamera("selector", "hud")
	scaleObject("selector", 6, 6)
	setProperty("selector.antialiasing", false)

	for i = 1,tablelength(menuItems) do
		makeLuaText("songText"..i, menuItems[i], 0, 0, (16 * 6 * (i - 1)) + (71 * 6) - 3)
		setTextSize("songText"..i, 8 * 6)
		setTextBorder("songText"..i, 0, "000000")
		setTextFont("songText"..i, "smb1.ttf")
		setObjectCamera("songText"..i, "hud")
		updateHitbox("songText"..i)

		if i == 1 then
			screenCenter("songText"..i, "x")
			setProperty("songText"..i..".x", (math.floor(getProperty("songText"..i..".x") / 6) * 6) + (1 * 6) + 1)
		else
			setProperty("songText"..i..".x", getProperty("songText1.x"))
		end
		songText1Pos = getProperty("songText1.y")
		songText2Pos = getProperty("songText2.y")
		songText3Pos = getProperty("songText3.y")
	end

	makeLuaSprite("blackBox", nil, 0, 0)
	makeGraphic("blackBox", screenWidth, screenHeight, "000000")
	setObjectCamera("blackBox", "hud")
	setProperty("blackBox.visible", false)

	screenCenter("levelInfo", "x")
	setProperty("levelInfo.x", math.floor(getProperty("levelInfo.x") / 6) * 6 + (1 * 6) + 1)

	screenCenter("pauseText", "x")
	setProperty("pauseText.x", math.floor(getProperty("pauseText.x") / 6) * 6 - (1 * 6) + 2)

	screenCenter("progressBar", "x")
	setProperty("progressBar.x", math.floor(getProperty("progressBar.x") / 6) * 6 + (1 * 6) - 2)
end

function onCreatePost()
	addLuaSprite("bgPauseWide", true)
	addLuaSprite("bgPause", true)
	addLuaText("levelInfo")
	addLuaSprite("pauseText", true)
	addLuaSprite("progressBar", true)
	addLuaSprite("marioPause", true)
	addLuaSprite("selector", true)
	for i = 1,tablelength(menuItems) do
		addLuaText(grpMenuShit[i])
	end
	addLuaSprite("blackBox", true)

	-- changeSelection(0)
end

function onUpdate(elapsed)
	if not inCutscene then
		if keyJustPressed("pause") and startedCountdown and canPause then
			if not paused then
				setPropertyFromClass("ClientPrefs", "noReset", true)
				setPropertyFromClass("flixel.FlxG", "sound.music.volume", 0)
				playSound("pause", 1)
				currentpausepos = getPropertyFromClass("Conductor", "songPosition")
				paused = true
				transitionType = 1
			end
		end
	end

	if paused then
		setPropertyFromClass("Conductor", "songPosition", currentpausepos)
		setPropertyFromClass("flixel.FlxG", "sound.music.time", currentpausepos)
		setProperty("vocals.time", currentpausepos)
		
		setProperty("boyfriend.animation.curAnim.paused", true)
		setProperty("dad.animation.curAnim.paused", true)
		setProperty("gf.animation.curAnim.paused", true)

		setProperty("boyfriend.specialAnim", true)
		setProperty("dad.specialAnim", true)
		setProperty("gf.specialAnim", true)
	else
		setProperty("boyfriend.animation.curAnim.paused", false)
		setProperty("dad.animation.curAnim.paused", false)
		setProperty("gf.animation.curAnim.paused", false)
	end
	setTextString("isPaused", paused)

	if canControl and paused then
		if keyJustPressed("up") then
			changeSelection(-1)
			setTextString("curSelectedGlobal", curSelected)
		end
		if keyJustPressed("down") then
			changeSelection(1)
			setTextString("curSelectedGlobal", curSelected)
		end
	end

	if keyJustPressed("accept") and canControl and getProperty("bgPause.y") == 0 then
		local daSelected = menuItems[curSelected]

		if daSelected == "CONTINUE" then
			transitionType = -1
			canControl = false
			playSound("pause", 1)
		elseif daSelected == "RETRY" then
			playSound("stomp", 1)
			setProperty("blackBox.visible", true)
			canControl = false
			runTimer("retrySong", 1)
		elseif daSelected == "END" then
			playSound("coin", 1)
			setProperty("blackBox.visible", true)
			canControl = false
			setDataFromSave("songSaveData", "keepCampaignScore", -1)
			setPropertyFromClass("PlayState", "SONG.validScore", false)
			runTimer("exitToMenu", 1)

			if week == "funkMix" then
				setPropertyFromClass("PlayState", "storyPlaylist", {songName, "Funk Mix"})
			elseif week == "funkMixDX" then
				setPropertyFromClass("PlayState", "storyPlaylist", {songName, "Funk Mix DX"})
			end
		end
	end

	if transitionType == 1 then
		bgPos = bgPos - (18 * 130 * elapsed)
		setProperty("bgPause.y", math.floor(bgPos / 6) * 6)
		setProperty("bgPauseWide.y", math.floor(bgPos / 6) * 6)
		if bgPos <= 0 then
			bgPos = 0
			setProperty("bgPause.y", 0)
			setProperty("bgPauseWide.y", 0)
			transitionType = 0
			canControl = true
		end
	end

	if transitionType == -1 then
		bgPos = bgPos + (18 * 130 * elapsed)
		setProperty("bgPause.y", math.floor(bgPos / 6) * 6)
		setProperty("bgPauseWide.y", math.floor(bgPos / 6) * 6)
		if bgPos >= screenHeight then
			bgPos = screenHeight
			setProperty("bgPause.y", screenHeight)
			setProperty("bgPauseWide.y", screenHeight)
			transitionType = 0
			paused = false

			setPropertyFromClass("ClientPrefs", "noReset", defNoReset)
			setPropertyFromClass("flixel.FlxG", "sound.music.volume", 1)
			setProperty("vocals.volume", 1)
		end
	end

	setProperty("songText1.y", songText1Pos + getProperty("bgPause.y"))
	setProperty("songText2.y", songText2Pos + getProperty("bgPause.y"))
	setProperty("songText3.y", songText3Pos + getProperty("bgPause.y"))
	setProperty("levelInfo.y", levelInfoPos + getProperty("bgPause.y"))
	setProperty("pauseText.y", pauseTextPos + getProperty("bgPause.y"))
	setProperty("progressBar.y", progressBarPos + getProperty("bgPause.y"))
	setProperty("marioPause.y", marioPausePos + getProperty("bgPause.y"))

	if not canControl then
		curSelected = 1
		setProperty("selector.x", getProperty("songText1.x") - (9 * 6) + 2)
		setProperty("selector.y", getProperty("songText1.y") + (1 * 6) - 4)
	end
end

function onUpdatePost()
	changeSelection(0)

	setTextString("transitionType", transitionType)
	setTextString("getBgPos", bgPos)

	songProgress = getSongPosition() / songLength
	setProperty("marioPause.x", math.floor(songProgress * 64) * 6 + (67 * 6) - 2)

	if paused then
		setProperty("boyfriend.stunned", true)
		setProperty("vocals.volume", 0)
	else
		setProperty('boyfriend.stunned', false)
	end
end

function changeSelection(change)
	curSelected = curSelected + change

	if curSelected < 1 then
		curSelected = tablelength(menuItems)
	elseif curSelected > tablelength(menuItems) then
		curSelected = 1
	end

	if change ~= 0 then
		playSound("menu_select", 1)
	end

	local bullShit = 1

	for item = 1,tablelength(menuItems) do
		if bullShit == curSelected then
			setProperty("selector.x", getProperty(grpMenuShit[item]..".x") - (9 * 6) + 2)
			setProperty("selector.y", getProperty(grpMenuShit[item]..".y") + (2 * 6) - 4)
		end
		bullShit = bullShit + 1
	end
end

function onSongStart()
	canPause = true
end

function onPause()
	return Function_Stop
end

function onEndSong()
	canPause = false
end

function onTimerCompleted(tag)
	if tag == "retrySong" then
		restartSong(true)
	elseif tag == "exitToMenu" then
		if isStoryMode then
			endSong(true)
		else
			if week == "funkMix" then
				loadSong("Funk Mix", -1, true)
			elseif week == "funkMixDX" then
				loadSong("Funk Mix DX", -1, true)
			end
		end
	end
end

function onDestroy()
	setPropertyFromClass("ClientPrefs", "noReset", defNoReset)
end