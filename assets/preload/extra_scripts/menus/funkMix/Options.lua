local activeSubgroup = nil

local curSelection = 1
local curSelected = 1
local curSelectionGroup = 1
local curPipe = 3
-- local curSelectedScript = nil
local curCategory = nil

local lockedMovement = false
local isPipes = true
local enteringPipe = false
local marioY = 0

local pipes = {"prefs", "ctrls", "exit"}
local grpPipes = {"pipe1", "pipe2", "pipe3"}
local grpPipeText = {"pipeText1", "pipeText2", "pipeText3"}

local wideScreen = (26 * 6) + 4
local timerRunning = false
local subMenuLoaded = false

local moveByY = 27 * 6
local holdTime = 0

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

function onCreate()
	initSaveData("playerSettings", "funkmixadvance")
	initSaveData("gameGenie", "funkmixadvance")

	psychOptions = {"Funk Mix", "Graphics", "Visuals and UI", "Gameplay"}
	genieCodes = {"Invincible"}

	funkMix = {"Psych Pipe", "Show Border", "Quant Notes", "Tier Rating", "Unique Pause Music", nil, "Showcase Cam", "BotPlay Cheat", "Debug Info"}

	graphics = {"Low Quality", "Framerate:"}

	visualsAndUI = {"Note Splashes", "Hide Hud", "Time Bar:", "Flashing Lights", "Health Bar Transparency"}
	timeBarStrings = {"Time Left", "Time Elapsed", "Song Name", "Disabled"}

	gameplay = {"Controller Mode", "Downscroll", "Middlescroll", "Ghost Tapping", "Disable Reset Button", "Hitsound Volume", "Rating Offset", "Sick! Hit Window", "Good Hit Window", "Bad Hit Window", "Safe Frames"}

	-- preferences = {"Downscroll", "Centered Notefield", "Ghost Tapping", "Quant Notes", nil, "Framerate Cap", "FPS Counter", "Memory Counter", "Debug Info"}
	preferences = {"Downscroll", "Centered Notefield", "Ghost Tapping", "Quant Notes", nil, "Framerate Cap", "Psych Pipe", "Show Border", "Debug Info"}

	if getDataFromSave("playerSettings", "psychPipe") then
		categoryMap = {psychOptions, genieCodes, exit}
	else
		-- categoryMap = {preferences, controls, exit} -- Original
		categoryMap = {preferences, genieCodes, exit}
	end
    
	makeLuaSprite("bgOptions", "menus/options/bg", 0, 0)
	setObjectCamera("bgOptions", "other")
	scaleObject("bgOptions", 6, 6)
	updateHitbox("bgOptions")
	screenCenter("bgOptions", "x")
	setProperty("bgOptions.x", getProperty("bgOptions.x") + 3)
	setProperty("bgOptions.antialiasing", false)
	addLuaSprite("bgOptions", false)

	makeLuaSprite("bgOptions2", "menus/options/bg2", 0, 0)
	setObjectCamera("bgOptions2", "other")
	scaleObject("bgOptions2", 6, 6)
	updateHitbox("bgOptions2")
	screenCenter("bgOptions2", "x")
	setProperty("bgOptions2.antialiasing", false)
	setProperty("bgOptions2.visible", false)
	addLuaSprite("bgOptions2", false)

	makeLuaText("warpText", "WELCOME TO\nWARP ZONE!", 0, (41 * 6) + wideScreen - 3, (23 * 6) - 3)
	setTextSize("warpText", 8 * 6)
	setTextBorder("warpText", 0, "000000")
	setTextFont("warpText", "smb1.ttf")
	setObjectCamera("warpText", "other")
	setObjectOrder("warpText", getObjectOrder("bgOptions") + 1)
	updateHitbox("warpText")
	addLuaText("warpText")

	loadPipes()
end

function loadPipes()
	isPipes = true
	lockedMovement = false
	enteringPipe = false
	timerRunning = false
	subMenuLoaded = false
	setTextString("canControlGlobal", not lockedMovement)
	if getDataFromSave("playerSettings", "psychPipe") then
		pipes[1] = "psych"
		pipes[2] = "genie"
	else
		pipes[1] = "prefs"
		pipes[2] = "genie"
	end

	for i = 1,11 do
		-- kill previous subgroup if it exists
		if activeSubgroup ~= nil then
			removeLuaText("thisOption"..i, true)
			removeLuaSprite("checkmark"..i, true)
			removeLuaSprite("checkmarkFilled"..i, true)
			removeLuaSprite("selectorLeft"..i, true)
			removeLuaSprite("selectorRight"..i, true)
		end
	end

	makeAnimatedLuaSprite("mario", "menus/options/mario", 0 + wideScreen, 56 * 6)
	addAnimationByIndices("mario", "idle", "idle0", "0", 0)
	setObjectCamera("mario", "other")
	scaleObject("mario", 6, 6)
	setProperty("mario.antialiasing", false)
	addLuaSprite("mario", false)

	for i = 1,tablelength(pipes) do
		j = i - 1
		makeLuaText("pipeText"..i, pipes[i], 0, 4 * 6 + wideScreen + 3, 66 * 6 + 3)
		setTextSize("pipeText"..i, 8 * 6)
		setTextBorder("pipeText"..i, 0, "000000")
		setProperty("pipeText"..i..".x", getProperty("pipeText"..i..".x") + 56 * 6 * j)
		setTextFont("pipeText"..i, "smb1.ttf")
		setObjectOrder("pipeText"..i, getObjectOrder("warpText") + 1)
		setObjectCamera("pipeText"..i, "other")
		setTextAlignment("pipeText"..i, "center")
		if i == 1 then
			setProperty("pipeText"..i..".x", getProperty("pipeText"..i..".x") + 1 * 6)
		elseif i == 3 and pipes[3] == "exit" then
			setProperty("pipeText"..i..".x", getProperty("pipeText"..i..".x") + 4 * 6)
		end
		addLuaText(grpPipeText[i])

		makeLuaSprite("pipe"..i, "menus/options/pipe", 8 * 6 + wideScreen, 88 * 6)
		setProperty("pipe"..i..".x", getProperty("pipe"..i..".x") + 56 * 6 * j)
		setObjectCamera("pipe"..i, "other")
		scaleObject("pipe"..i, 6, 6)
		updateHitbox("pipe"..i)
		setProperty("pipe"..i..".antialiasing", false)
		addLuaSprite(grpPipes[i], false)
	end

	selectPipe(0)

	setProperty("mario.visible", true)
	setProperty("bgOptions.visible", true)
	setProperty("warpText.visible", true)
	setProperty("bgOptions2.visible", false)

	setProperty("mario.x", 42 * 6 - 2)
	setProperty("mario.x", getProperty("mario.x") + 56 * 6 * (curPipe - 1))
	marioY = 56 * 6
	setProperty("mario.y", 56 * 6)

	for i = 1,tablelength(pipes) do 
		if i == curPipe then
			setProperty("pipeText"..i..".visible", false)
		else
			setProperty("pipeText"..i..".visible", true)
		end
		setProperty(grpPipes[i]..".visible", true)
	end

	for i = 1,11 do
		setProperty("thisOption"..i..".visible", getProperty("bgOptions2.visible"))
		setProperty("checkmark"..i..".visible", getProperty("bgOptions2.visible"))
		setProperty("selectorLeft"..i..".visible", getProperty("bgOptions2.visible"))
		setProperty("selectorRight"..i..".visible", getProperty("bgOptions2.visible"))
		setProperty("chosenOptionString"..i..".visible", getProperty("bgOptions2.visible"))
	end
end

function loadGroup()
	if getDataFromSave("playerSettings", "psychPipe") then
		categoryMap = {psychOptions, genieCodes, exit}
		settingTypePref = {"subgroup", "subgroup", "subgroup", "subgroup", "subgroup", "subgroup"}
	else
		categoryMap = {preferences, genieCodes, exit}
		settingTypePref = {"checkmark", "checkmark", "checkmark", "checkmark", nil, "selector", "checkmark", "checkmark", "checkmark"}
	end

	-- local subgroupName = "preferences"

	lockedMovement = false
	setTextString("canControlGlobal", not lockedMovement)

	for i = 1,tablelength(pipes) do
		setProperty(grpPipes[i]..".visible", false)
		setProperty(grpPipeText[i]..".visible", false)
	end

	for i = 1,11 do
		-- kill previous subgroup if it exists
		if activeSubgroup ~= nil then
			removeLuaText("thisOption"..i, true)
			removeLuaSprite("checkmark"..i, true)
			removeLuaSprite("checkmarkFilled"..i, true)
			removeLuaSprite("selectorLeft"..i, true)
			removeLuaSprite("selectorRight"..i, true)
			removeLuaText("chosenOptionString"..i, true)
		end
	end

	-- load subgroup lmfao
	if pipes[curPipe] == "genie" then
		settingTypePref = {"checkmark"}
	end

	setProperty("mario.visible", false)
	setProperty("bgOptions.visible", false)
	setProperty("warpText.visible", false)
	setProperty("bgOptions2.visible", true)

	if categoryMap[curPipe] == psychOptions then
		moveByY = 35 * 6
	else
		moveByY = 27 * 6
	end

	activeSubgroup = categoryMap[curPipe]
	returnSubgroup(categoryMap[curPipe])
	returnExtrasMap(settingTypePref)

	-- -- set the category
	-- curCategory = subgroupName

	-- reset the selection
	curSelection = 1
	selectOption(curSelection)

	updateCheckmark()
	updateTable()
end

function selectPipe(change)
	if getTextString("curMenuGlobal") == "3" and getTextString("subMenuGlobal") == "0" then
		if change ~= 0 then
			playSound("menu_select", 1)
		end

		curPipe = curPipe + change
		if curPipe > tablelength(pipes) then
			curPipe = 1
		elseif curPipe < 1 then
			curPipe = tablelength(pipes)
		end
		
		setProperty("mario.x", 42 * 6 - 2)
		setProperty("mario.x", getProperty("mario.x") + 56 * 6 * (curPipe - 1))

		for i = 1,tablelength(grpPipeText) do 
			if i == curPipe then
				setProperty("pipeText"..i..".visible", false)
			else
				setProperty("pipeText"..i..".visible", true)
			end
		end
	end
end

function selectOption(newSelection)
	if newSelection ~= curSelection and getTextString("thisOption"..curSelection) ~= "thisOption"..curSelection then
		playSound("menu_select", 1)
	end

	-- direction increment finder
	if newSelection > curSelection then
		directionIncrement = 1 
	else 
		directionIncrement = -1
	end

	-- updates to that new selection
	curSelection = newSelection

	-- wrap the current selection
	if curSelection < 1 then
		curSelection = tablelength(activeSubgroup) + 1
	elseif curSelection >= tablelength(activeSubgroup) + 2 then
		curSelection = 1
	end

	-- set the correct group stuffs lol
	for i = 1,tablelength(activeSubgroup) + 1 do
	 	setProperty("thisOption"..i..".color", 0xE69C21)
		if curSelection ~= nil then
			setAttachmentColor("thisOption"..i, 0xE69C21)
			setAttachmentColor("checkmark"..i, 0xE69C21)
			setAttachmentColor("selectorLeft"..i, 0xE69C21)
			setAttachmentColor("selectorRight"..i, 0xE69C21)
			setAttachmentColor("chosenOptionString"..i, 0xE69C21)
		end

		-- check for null members and hardcode the dividers
		setProperty("thisOption"..curSelection..".color", 0xFFFFFF)
		setProperty("checkmark"..curSelection..".color", 0xFFFFFF)
		setProperty("selectorLeft"..curSelection..".color", 0xFFFFFF)
		setProperty("selectorRight"..curSelection..".color", 0xFFFFFF)
		setProperty("chosenOptionString"..curSelection..".color", 0xFFFFFF)
	end

	setProperty(activeSubgroup[curSelection]..".color", 0xFFFFFF)
	setProperty("checkmark"..curSelection..".color", 0xFFFFFF)
	if curSelection == nil then
		setAttachmentColor(activeSubgroup[curSelection], 0xFFFFFF)
		setAttachmentColor("checkmark"..curSelection, 0xFFFFFF)
		setAttachmentColor("selectorLeft"..curSelection, 0xFFFFFF)
		setAttachmentColor("selectorRight"..curSelection, 0xFFFFFF)
		setAttachmentColor("chosenOptionString"..curSelection, 0xFFFFFF)
	end
end

function loadSubgroup(subgroupName)
	lockedMovement = false
	setTextString("canControlGlobal", not lockedMovement)

	for i = 1,11 do
		-- kill previous subgroup if it exists
		if activeSubgroup ~= nil then
			removeLuaText("thisOption"..i, true)
			removeLuaSprite("checkmark"..i, true)
			removeLuaSprite("checkmarkFilled"..i, true)
			removeLuaSprite("selectorLeft"..i, true)
			removeLuaSprite("selectorRight"..i, true)
			removeLuaText("chosenOptionString"..i, true)
		end
	end

	if subgroupName == funkMix then
		moveByY = 25 * 6
	elseif subgroupName == graphics then
		moveByY = 55 * 6
	elseif subgroupName == visualsAndUI then
		moveByY = 42 * 6
	elseif subgroupName == gameplay then
		moveByY = 19 * 6
	else
		moveByY = 27 * 6
	end

	-- load subgroup lmfao
	activeSubgroup = subgroupName
	returnSubgroup(subgroupName)
	returnExtrasMap(settingTypePref)

	-- -- set the category
	-- curCategory = subgroupName

	setProperty("mario.visible", false)
	setProperty("bgOptions.visible", false)
	setProperty("warpText.visible", false)
	setProperty("bgOptions2.visible", true)

	-- reset the selection
	curSelection = 1
	selectOption(curSelection)

	for i = 1,tablelength(activeSubgroup) + 1 do
		setProperty("thisOption"..i..".visible", getProperty("bgOptions2.visible"))
		setProperty("checkmark"..i..".visible", getProperty("bgOptions2.visible"))
		setProperty("selectorLeft"..i..".visible", getProperty("bgOptions2.visible"))
		setProperty("selectorRight"..i..".visible", getProperty("bgOptions2.visible"))
		setProperty("chosenOptionString"..i..".visible", getProperty("bgOptions2.visible"))
	end

	updateCheckmark()
	updateTable()
end

function setAttachmentColor(attachment, newColor)
	-- oddly enough, you can't set alphas of objects that arent directly and inherently defined as a value.
	-- ya flixel is weird lmao
	if attachment ~= nil then
		setProperty(attachment..".color", newColor)
		-- therefore, I made a script to circumvent this by defining the attachment with the `attachment` variable!
		-- pretty neat, huh?
	end
end

function onUpdate(elapsed)
	if getTextString("curMenuGlobal") == "3" then
		if getTextString("subMenuGlobal") == "0" then
			setTextString("subMenuGlobal", 0)
			setTextString("curSelectedGlobal", curPipe)
			if not lockedMovement then
				if keyJustPressed("left") then
					selectPipe(-1)
				end
				if keyJustPressed("right") then
					selectPipe(1)
				end
				if keyJustPressed("down") then
					lockedMovement = true
					setTextString("canControlGlobal", "false")
					enteringPipe = true
					playSound("power_down", 1)

					if pipes[curPipe] == "exit" then
						if getTextString("optionsPipeExitFix") == "true" then
							setTextString("optionsPipeExitFix", "false")
						end
					end
				end
			end

			if enteringPipe then
				marioY = marioY + (1 * 6) * 48 * elapsed
				setProperty("mario.y", math.floor(marioY / 6) * 6)

				if marioY > 88 * 6 and timerRunning == false then
                   	timerRunning = true
					runTimer("pipeEntered", 1, 1)
				end
			end

			if subMenuLoaded == true then
				subMenuLoaded = false
			end
		else
			-- just uses my outdated code for the main menu state where I wanted to implement
			-- hold scrolling but I couldnt because I'm dumb and lazy
			if not lockedMovement then
				-- check for the current selection
				setTextString("curSelectedGlobal", curSelection)
				if keyJustPressed("up") then
					selectOption(curSelection - 1)
				end
				if keyJustPressed("down") then
					selectOption(curSelection + 1)
				end
				if keyJustPressed("accept") then
					getFromOption()
				end
				if settingTypePref[curSelection] == "selector" then
					if keyJustPressed("right") then
						updateSelector(1)
						playSound("menu_select", 1)
					elseif keyJustPressed("left") then
						updateSelector(-1)
						playSound("menu_select", 1)
					end
					if (keyPressed("left") or keyPressed("right")) and activeSubgroup[curSelection] ~= "Framerate Cap" and activeSubgroup[curSelection] ~= "Time Bar:" then
						holdTime = holdTime + elapsed
					end
					if holdTime > 0.5 then
						if holdTime > 0.55 and keyPressed("right") then
							updateSelector(1)
							holdTime = 0.5
						elseif holdTime > 0.55 and keyPressed("left") then
							updateSelector(-1)
							holdTime = 0.5
						end
					end
					if keyReleased("left") then
						setAttachmentColor("selectorLeft"..curSelection, 0xFFFFFF)
						holdTime = 0
					end
					if keyReleased("right") then
						setAttachmentColor("selectorRight"..curSelection, 0xFFFFFF)
						holdTime = 0
					end
				end
			end

			if subMenuLoaded == false then
				subMenuLoaded = true
				loadGroup()
			end

			if keyJustPressed("back") and getTextString("subMenuGlobal") == "1" then
				loadPipes()
				cancelTimer("flickerInt")
				cancelTimer("flickerDur")
			elseif keyJustPressed("back") and getTextString("subMenuGlobal") == "2" then
				settingTypePref = {"subgroup", "subgroup", "subgroup", "subgroup", "subgroup", "subgroup"}
				loadGroup()
				cancelTimer("flickerInt")
				cancelTimer("flickerDur")
			end
		end
	else
		marioY = 56 * 6
		setProperty("mario.y", 56 * 6)
		enteringPipe = false
		timerRunning = false
	end
	
	if getProperty("mario.y") > getProperty("pipe1.y") then
		setProperty("mario.y", getProperty("pipe1.y"))
	end

	setTextString("originalFPScheck", getPropertyFromClass("ClientPrefs", "framerate"))
	setTextString("timeBarString", getPropertyFromClass("ClientPrefs", "timeBarType"))
end

function returnSubgroup(groupName)
	for i = 1,tablelength(groupName)+1 do
		if groupName[i] ~= nil then
			makeLuaText("thisOption"..i, groupName[i], 0, 0, 0)
			setTextFont("thisOption"..i, "pixel_small.ttf")
			setTextBorder("thisOption"..i, 0, "000000")
			setTextSize("thisOption"..i, 5 * 6)
			updateHitbox("thisOption"..i)
			setObjectCamera("thisOption"..i, "other")
			setObjectOrder("thisOption"..i, getObjectOrder("bgOptions2") + 1)

			screenCenter("thisOption"..i, "x")
			setProperty("thisOption"..i..".x", math.floor(getProperty("thisOption"..i..".x") / 6) * 6 + (1 * 6) + 1)
			setProperty("thisOption"..i..".y", getProperty("thisOption"..i..".y") + (8 * 6 * (i - 1)) + moveByY - 3)
			addLuaText("thisOption"..i)

			if settingTypePref[i] == "subgroup" then
				setTextFont("thisOption"..i, "smb1.ttf")
				setTextSize("thisOption"..i, 8 * 6)
				screenCenter("thisOption"..i, "x")
				setProperty("thisOption"..i..".x", math.floor(getProperty("thisOption"..i..".x") / 6) * 6 + (1 * 6) + 1)
				setProperty("thisOption"..i..".y", (12 * 6 * (i - 1)) + moveByY - 2)
			end
		end
	end
end

function returnExtrasMap(alphabetGroup)
	for i = 1,tablelength(alphabetGroup) + 1 do
		if getTextString(alphabetGroup[i]) ~= nil then
			if alphabetGroup[i] == "checkmark" then
				-- checkmark
				makeLuaSprite("checkmark"..i, "ui/checkboxThingie", 0, 0)
				makeLuaSprite("checkmarkFilled"..i, "ui/checkboxThingieFilled", 0, 0)
				setObjectCamera("checkmark"..i, "other")
				setObjectCamera("checkmarkFilled"..i, "other")
				setProperty("checkmark"..i..".x", getProperty("thisOption"..i..".x") - (7 * 6) + 2)
				setProperty("checkmarkFilled"..i..".x", getProperty("thisOption"..i..".x") - (7 * 6) + 2)
				setProperty("checkmark"..i..".y", getProperty("thisOption"..i..".y") + 2 + 1)
				setProperty("checkmarkFilled"..i..".y", getProperty("thisOption"..i..".y") + 2 + 1)
				scaleObject("checkmark"..i, 6, 6)
				scaleObject("checkmarkFilled"..i, 6, 6)
				addLuaSprite("checkmark"..i, false)
				addLuaSprite("checkmarkFilled"..i, false)
				setObjectOrder("checkmark"..i, getObjectOrder("bgOptions2") + 1)
				setObjectOrder("checkmarkFilled"..i, getObjectOrder("bgOptions2") + 1)
			elseif alphabetGroup[i] == "selector" then
				-- selector
				makeLuaText("chosenOptionString"..i, nil, 0, 0, 0)
				setTextFont("chosenOptionString"..i, "pixel_small.ttf")
				setTextBorder("chosenOptionString"..i, 0, "000000")
				setTextSize("chosenOptionString"..i, 5 * 6)
				updateHitbox("chosenOptionString"..i)
				setObjectCamera("chosenOptionString"..i, "other")
				setObjectOrder("chosenOptionString"..i, getObjectOrder("bgOptions2") + 1)
				setProperty("chosenOptionString"..i..".x", getProperty("thisOption"..i..".x") + getProperty("thisOption"..i..".width") + (1 * 6) - 1)
				setProperty("chosenOptionString"..i..".y", getProperty("thisOption"..i..".y"))
				addLuaText("chosenOptionString"..i)

				makeLuaSprite("selectorLeft"..i, "ui/selectorLeft", 0, 0)
				makeLuaSprite("selectorRight"..i, "ui/selectorRight", 0, 0)
				setObjectCamera("selectorLeft"..i, "other")
				setObjectCamera("selectorRight"..i, "other")
				setProperty("selectorLeft"..i..".x", getProperty("thisOption"..i..".x") - (6 * 6) + 2)
				setProperty("selectorRight"..i..".x", getProperty("thisOption"..i..".x") + getProperty("thisOption"..i..".width") + (1 * 6) - 1)
				setProperty("selectorLeft"..i..".y", getProperty("thisOption"..i..".y") + 3)
				setProperty("selectorRight"..i..".y", getProperty("thisOption"..i..".y") + 3)
				scaleObject("selectorLeft"..i, 6, 6)
				scaleObject("selectorRight"..i, 6, 6)
				addLuaSprite("selectorLeft"..i, false)
				addLuaSprite("selectorRight"..i, false)
				setObjectOrder("selectorLeft"..i, getObjectOrder("bgOptions2") + 1)
				setObjectOrder("selectorRight"..i, getObjectOrder("bgOptions2") + 1)
			end
		end
	end
end

-- This is the base option return
function getFromOption()
	if settingTypePref[curSelection] == "checkmark" or settingTypePref[curSelection] == "subgroup" then
		if keyJustPressed("accept") then
			playSound("stomp", 1)
			lockedMovement = true
			setTextString("canControlGlobal", not lockedMovement)
			flicker("thisOption"..curSelection, 0.5, 0.06 * 2, true)

			if settingTypePref[curSelection] == "checkmark" then
				if activeSubgroup[curSelection] == "Quant Notes" then
					setDataFromSave("playerSettings", "quantNotes", not getDataFromSave("playerSettings", "quantNotes"))
				elseif activeSubgroup[curSelection] == "Tier Rating" then
					setDataFromSave("playerSettings", "tierRating", not getDataFromSave("playerSettings", "tierRating"))
				elseif activeSubgroup[curSelection] == "Psych Pipe" then
					setDataFromSave("playerSettings", "psychPipe", not getDataFromSave("playerSettings", "psychPipe"))
				elseif activeSubgroup[curSelection] == "Show Border" then
					setDataFromSave("playerSettings", "showBorder", not getDataFromSave("playerSettings", "showBorder"))
				elseif activeSubgroup[curSelection] == "Unique Pause Music" then
					setDataFromSave("playerSettings", "uniquePauseMusic", not getDataFromSave("playerSettings", "uniquePauseMusic"))
				elseif activeSubgroup[curSelection] == "Showcase Cam" then
					setDataFromSave("playerSettings", "showcaseCam", not getDataFromSave("playerSettings", "showcaseCam"))
				elseif activeSubgroup[curSelection] == "BotPlay Cheat" then
					setDataFromSave("playerSettings", "botplayCheat", not getDataFromSave("playerSettings", "botplayCheat"))
				elseif activeSubgroup[curSelection] == "Debug Info" then
					setDataFromSave("playerSettings", "debugInfo", not getDataFromSave("playerSettings", "debugInfo"))
				elseif activeSubgroup[curSelection] == "Low Quality" then
					setPropertyFromClass("ClientPrefs", "lowQuality", not getPropertyFromClass("ClientPrefs", "lowQuality"))
				elseif activeSubgroup[curSelection] == "Note Splashes" then
					setPropertyFromClass("ClientPrefs", "noteSplashes", not getPropertyFromClass("ClientPrefs", "noteSplashes"))
				elseif activeSubgroup[curSelection] == "Hide Hud" then
					setPropertyFromClass("ClientPrefs", "hideHud", not getPropertyFromClass("ClientPrefs", "hideHud"))
				elseif activeSubgroup[curSelection] == "Flashing Lights" then
					setPropertyFromClass("ClientPrefs", "flashing", not getPropertyFromClass("ClientPrefs", "flashing"))
				elseif activeSubgroup[curSelection] == "Controller Mode" then
					setPropertyFromClass("ClientPrefs", "controllerMode", not getPropertyFromClass("ClientPrefs", "controllerMode"))
				elseif activeSubgroup[curSelection] == "Downscroll" then
					setPropertyFromClass("ClientPrefs", "downScroll", not getPropertyFromClass("ClientPrefs", "downScroll"))
				elseif activeSubgroup[curSelection] == "Centered Notefield" or activeSubgroup[curSelection] == "Middlescroll" then
					setPropertyFromClass("ClientPrefs", "middleScroll", not getPropertyFromClass("ClientPrefs", "middleScroll"))
				elseif activeSubgroup[curSelection] == "Ghost Tapping" then
					setPropertyFromClass("ClientPrefs", "ghostTapping", not getPropertyFromClass("ClientPrefs", "ghostTapping"))
				elseif activeSubgroup[curSelection] == "Disable Reset Button" then
					setPropertyFromClass("ClientPrefs", "noReset", not getPropertyFromClass("ClientPrefs", "noReset"))
				elseif activeSubgroup[curSelection] == "Invincible" and getDataFromSave("gameGenie", "invincible") ~= "invincible" then
					setDataFromSave("gameGenie", "invincible", not getDataFromSave("gameGenie", "invincible"))
				end
			end
		end
	end
end

function updateCheckmark()
	for i = 1,tablelength(activeSubgroup) + 1 do
		if activeSubgroup[i] == "Quant Notes" then
			setProperty("checkmarkFilled"..i..".visible", getDataFromSave("playerSettings", "quantNotes"))
		elseif activeSubgroup[i] == "Tier Rating" then
			setProperty("checkmarkFilled"..i..".visible", getDataFromSave("playerSettings", "tierRating"))
		elseif activeSubgroup[i] == "Psych Pipe" then
			setProperty("checkmarkFilled"..i..".visible", getDataFromSave("playerSettings", "psychPipe"))
		elseif activeSubgroup[i] == "Show Border" then
			setProperty("checkmarkFilled"..i..".visible", getDataFromSave("playerSettings", "showBorder"))
		elseif activeSubgroup[i] == "Unique Pause Music" then
			setProperty("checkmarkFilled"..i..".visible", getDataFromSave("playerSettings", "uniquePauseMusic"))
		elseif activeSubgroup[i] == "Showcase Cam" then
			setProperty("checkmarkFilled"..i..".visible", getDataFromSave("playerSettings", "showcaseCam"))
		elseif activeSubgroup[i] == "BotPlay Cheat" then
			setProperty("checkmarkFilled"..i..".visible", getDataFromSave("playerSettings", "botplayCheat"))
		elseif activeSubgroup[i] == "Debug Info" then
			setProperty("checkmarkFilled"..i..".visible", getDataFromSave("playerSettings", "debugInfo"))
		elseif activeSubgroup[i] == "Low Quality" then
			setProperty("checkmarkFilled"..i..".visible", getPropertyFromClass("ClientPrefs", "lowQuality"))
		elseif activeSubgroup[i] == "Note Splashes" then
			setProperty("checkmarkFilled"..i..".visible", getPropertyFromClass("ClientPrefs", "noteSplashes"))
		elseif activeSubgroup[i] == "Hide Hud" then
			setProperty("checkmarkFilled"..i..".visible", getPropertyFromClass("ClientPrefs", "hideHud"))
		elseif activeSubgroup[i] == "Flashing Lights" then
			setProperty("checkmarkFilled"..i..".visible", getPropertyFromClass("ClientPrefs", "flashing"))
		elseif activeSubgroup[i] == "Controller Mode" then
			setProperty("checkmarkFilled"..i..".visible", getPropertyFromClass("ClientPrefs", "controllerMode"))
		elseif activeSubgroup[i] == "Downscroll" then
			setProperty("checkmarkFilled"..i..".visible", getPropertyFromClass("ClientPrefs", "downScroll"))
		elseif activeSubgroup[i] == "Centered Notefield" or activeSubgroup[i] == "Middlescroll" then
			setProperty("checkmarkFilled"..i..".visible", getPropertyFromClass("ClientPrefs", "middleScroll"))
		elseif activeSubgroup[i] == "Ghost Tapping" then
			setProperty("checkmarkFilled"..i..".visible", getPropertyFromClass("ClientPrefs", "ghostTapping"))
		elseif activeSubgroup[i] == "Disable Reset Button" then
			setProperty("checkmarkFilled"..i..".visible", getPropertyFromClass("ClientPrefs", "noReset"))
		elseif activeSubgroup[i] == "Invincible" and getDataFromSave("gameGenie", "invincible") ~= "invincible" then
			setProperty("checkmarkFilled"..i..".visible", getDataFromSave("gameGenie", "invincible"))
		end

		if activeSubgroup[i] == "Invincible" and getDataFromSave("gameGenie", "invincible") == "invincible" then
			removeLuaText("thisOption"..i, true)
			removeLuaSprite("checkmark"..i, true)
			removeLuaSprite("checkmarkFilled"..i, true)
		end
	end
end

function updateTable()
	for i = 1,tablelength(activeSubgroup) + 1 do		
		if activeSubgroup[i] == "Framerate Cap" then
			if getPropertyFromClass("ClientPrefs", "framerate") < 100 then
				setTextString("chosenOptionString"..i, "0"..getPropertyFromClass("ClientPrefs", "framerate"))
			else
				setTextString("chosenOptionString"..i, getPropertyFromClass("ClientPrefs", "framerate"))
			end
			if getDataFromSave("playerSettings", "psychPipe") then
				local moveByX = 22 * 6
				setProperty("thisOption"..i..".x", getProperty("thisOption"..i..".x") - moveByX)
				setProperty("selectorLeft"..i..".x", getProperty("thisOption"..i..".x") - (6 * 6) + 2)
				setProperty("chosenOptionString"..i..".x", getProperty("chosenOptionString"..i..".x") - moveByX)
				setProperty("selectorRight"..i..".x", getProperty("chosenOptionString"..i..".x") + getProperty("chosenOptionString"..i..".width") + 2)
			end
			setProperty("selectorRight"..i..".x", getProperty("chosenOptionString"..i..".x") + getProperty("chosenOptionString"..i..".width") + 2)
		elseif activeSubgroup[i] == "Framerate:" then
			setTextString("chosenOptionString"..i, getPropertyFromClass("ClientPrefs", "framerate").." FPS")
			if getDataFromSave("playerSettings", "psychPipe") then
				local moveByX = 22 * 6
				setProperty("thisOption"..i..".x", getProperty("thisOption"..i..".x") - moveByX)
				setProperty("selectorLeft"..i..".x", getProperty("thisOption"..i..".x") - (6 * 6) + 2)
				setProperty("chosenOptionString"..i..".x", getProperty("chosenOptionString"..i..".x") - moveByX)
				setProperty("selectorRight"..i..".x", getProperty("chosenOptionString"..i..".x") + getProperty("chosenOptionString"..i..".width") + 2)
			end
			setProperty("selectorRight"..i..".x", getProperty("chosenOptionString"..i..".x") + getProperty("chosenOptionString"..i..".width") + 2)
		elseif activeSubgroup[i] == "Time Bar:" then
			setTextString("chosenOptionString"..i, getPropertyFromClass("ClientPrefs", "timeBarType"))
			if getDataFromSave("playerSettings", "psychPipe") then
				local moveByX = 24 * 6
				setProperty("thisOption"..i..".x", getProperty("thisOption"..i..".x") - moveByX)
				setProperty("selectorLeft"..i..".x", getProperty("thisOption"..i..".x") - (6 * 6) + 2)
				setProperty("chosenOptionString"..i..".x", getProperty("chosenOptionString"..i..".x") - moveByX)
				setProperty("selectorRight"..i..".x", getProperty("chosenOptionString"..i..".x") + getProperty("chosenOptionString"..i..".width") + 2)
			end
			setProperty("selectorRight"..i..".x", getProperty("chosenOptionString"..i..".x") + getProperty("chosenOptionString"..i..".width") + 2)
		elseif activeSubgroup[i] == "Health Bar Transparency" then
			setTextString("chosenOptionString"..i, (getPropertyFromClass("ClientPrefs", "healthBarAlpha") * 100).."%")
			if getDataFromSave("playerSettings", "psychPipe") then
				local moveByX = 10 * 6
				setProperty("thisOption"..i..".x", getProperty("thisOption"..i..".x") - moveByX)
				setProperty("selectorLeft"..i..".x", getProperty("thisOption"..i..".x") - (6 * 6) + 2)
				setProperty("chosenOptionString"..i..".x", getProperty("chosenOptionString"..i..".x") - moveByX)
				setProperty("selectorRight"..i..".x", getProperty("chosenOptionString"..i..".x") + getProperty("chosenOptionString"..i..".width") + 2)
			end
			setProperty("selectorRight"..i..".x", getProperty("chosenOptionString"..i..".x") + getProperty("chosenOptionString"..i..".width") + 2)
		elseif activeSubgroup[i] == "Hitsound Volume" then
			setTextString("chosenOptionString"..i, (getPropertyFromClass("ClientPrefs", "hitsoundVolume") * 100).."%")
			if getDataFromSave("playerSettings", "psychPipe") then
				local moveByX = 10 * 6 + 3
				setProperty("thisOption"..i..".x", getProperty("thisOption"..i..".x") - moveByX)
				setProperty("selectorLeft"..i..".x", getProperty("thisOption"..i..".x") - (6 * 6) + 2)
				setProperty("chosenOptionString"..i..".x", getProperty("chosenOptionString"..i..".x") - moveByX)
				setProperty("selectorRight"..i..".x", getProperty("chosenOptionString"..i..".x") + getProperty("chosenOptionString"..i..".width") + 2)
			end
			setProperty("selectorRight"..i..".x", getProperty("chosenOptionString"..i..".x") + getProperty("chosenOptionString"..i..".width") + 2)
		elseif activeSubgroup[i] == "Rating Offset" then
			setTextString("chosenOptionString"..i, getPropertyFromClass("ClientPrefs", "ratingOffset").."ms")
			if getDataFromSave("playerSettings", "psychPipe") then
				local moveByX = 8 * 6 + 3
				setProperty("thisOption"..i..".x", getProperty("thisOption"..i..".x") - moveByX)
				setProperty("selectorLeft"..i..".x", getProperty("thisOption"..i..".x") - (6 * 6) + 2)
				setProperty("chosenOptionString"..i..".x", getProperty("chosenOptionString"..i..".x") - moveByX)
				setProperty("selectorRight"..i..".x", getProperty("chosenOptionString"..i..".x") + getProperty("chosenOptionString"..i..".width") + 2)
			end
			setProperty("selectorRight"..i..".x", getProperty("chosenOptionString"..i..".x") + getProperty("chosenOptionString"..i..".width") + 2)
		elseif activeSubgroup[i] == "Sick! Hit Window" then
			setTextString("chosenOptionString"..i, getPropertyFromClass("ClientPrefs", "sickWindow").."ms")
			if getDataFromSave("playerSettings", "psychPipe") then
				local moveByX = 10 * 6 + 3
				setProperty("thisOption"..i..".x", getProperty("thisOption"..i..".x") - moveByX)
				setProperty("selectorLeft"..i..".x", getProperty("thisOption"..i..".x") - (6 * 6) + 2)
				setProperty("chosenOptionString"..i..".x", getProperty("chosenOptionString"..i..".x") - moveByX)
				setProperty("selectorRight"..i..".x", getProperty("chosenOptionString"..i..".x") + getProperty("chosenOptionString"..i..".width") + 2)
			end
			setProperty("selectorRight"..i..".x", getProperty("chosenOptionString"..i..".x") + getProperty("chosenOptionString"..i..".width") + 2)
		elseif activeSubgroup[i] == "Good Hit Window" then
			setTextString("chosenOptionString"..i, getPropertyFromClass("ClientPrefs", "goodWindow").."ms")
			if getDataFromSave("playerSettings", "psychPipe") then
				local moveByX = 9 * 6 + 3
				setProperty("thisOption"..i..".x", getProperty("thisOption"..i..".x") - moveByX)
				setProperty("selectorLeft"..i..".x", getProperty("thisOption"..i..".x") - (6 * 6) + 2)
				setProperty("chosenOptionString"..i..".x", getProperty("chosenOptionString"..i..".x") - moveByX)
				setProperty("selectorRight"..i..".x", getProperty("chosenOptionString"..i..".x") + getProperty("chosenOptionString"..i..".width") + 2)
			end
			setProperty("selectorRight"..i..".x", getProperty("chosenOptionString"..i..".x") + getProperty("chosenOptionString"..i..".width") + 2)
		elseif activeSubgroup[i] == "Bad Hit Window" then
			setTextString("chosenOptionString"..i, getPropertyFromClass("ClientPrefs", "badWindow").."ms")
			if getDataFromSave("playerSettings", "psychPipe") then
				local moveByX = 11 * 6 + 3
				setProperty("thisOption"..i..".x", getProperty("thisOption"..i..".x") - moveByX)
				setProperty("selectorLeft"..i..".x", getProperty("thisOption"..i..".x") - (6 * 6) + 2)
				setProperty("chosenOptionString"..i..".x", getProperty("chosenOptionString"..i..".x") - moveByX)
				setProperty("selectorRight"..i..".x", getProperty("chosenOptionString"..i..".x") + getProperty("chosenOptionString"..i..".width") + 2)
			end
			setProperty("selectorRight"..i..".x", getProperty("chosenOptionString"..i..".x") + getProperty("chosenOptionString"..i..".width") + 2)
		elseif activeSubgroup[i] == "Safe Frames" then
			setTextString("chosenOptionString"..i, getPropertyFromClass("ClientPrefs", "safeFrames").."ms")
			if getDataFromSave("playerSettings", "psychPipe") then
				local moveByX = 10 * 6 + 3
				setProperty("thisOption"..i..".x", getProperty("thisOption"..i..".x") - moveByX)
				setProperty("selectorLeft"..i..".x", getProperty("thisOption"..i..".x") - (6 * 6) + 2)
				setProperty("chosenOptionString"..i..".x", getProperty("chosenOptionString"..i..".x") - moveByX)
				setProperty("selectorRight"..i..".x", getProperty("chosenOptionString"..i..".x") + getProperty("chosenOptionString"..i..".width") + 2)
			end
			setProperty("selectorRight"..i..".x", getProperty("chosenOptionString"..i..".x") + getProperty("chosenOptionString"..i..".width") + 2)
		end
	end
end

function updateSelector(updateBy)
	-- bro I dont even know if the engine works in html5 why am I even doing this
	-- lazily hardcoded fps cap
	curSelected = curSelected + updateBy
	if keyPressed("left") then
		setAttachmentColor("selectorLeft"..curSelection, 0xE69C21)
	end
	if keyPressed("right") then
		setAttachmentColor("selectorRight"..curSelection, 0xE69C21)
	end

	if activeSubgroup[curSelection] == "Framerate Cap" then
		local increase = 15 * updateBy
		if getPropertyFromClass("ClientPrefs", "framerate") + increase < 60 then
			increase = 0
			setPropertyFromClass("ClientPrefs", "framerate", 60)
		elseif getPropertyFromClass("ClientPrefs", "framerate") + increase > 240 then
			increase = 0
			setPropertyFromClass("ClientPrefs", "framerate", 240)
		end
		setPropertyFromClass("ClientPrefs", "framerate", getPropertyFromClass("ClientPrefs", "framerate") + increase)
		if getPropertyFromClass("ClientPrefs", "framerate") < 100 then
			setTextString("chosenOptionString"..curSelection, "0"..getPropertyFromClass("ClientPrefs", "framerate"))
		else
			setTextString("chosenOptionString"..curSelection, getPropertyFromClass("ClientPrefs", "framerate"))
		end
	elseif activeSubgroup[curSelection] == "Framerate:" then
		local increase = 1 * updateBy
		if getPropertyFromClass("ClientPrefs", "framerate") + increase < 60 then
			increase = 0
			setPropertyFromClass("ClientPrefs", "framerate", 60)
		elseif getPropertyFromClass("ClientPrefs", "framerate") + increase > 240 then
			increase = 0
			setPropertyFromClass("ClientPrefs", "framerate", 240)
		end
		setPropertyFromClass("ClientPrefs", "framerate", getPropertyFromClass("ClientPrefs", "framerate") + increase)
		setTextString("chosenOptionString"..curSelection, getPropertyFromClass("ClientPrefs", "framerate").." FPS")
	elseif activeSubgroup[curSelection] == "Time Bar:" then
		if curSelected < 1 then
			curSelected = tablelength(timeBarStrings)
		elseif curSelected > tablelength(timeBarStrings) then
			curSelected = 1
		end
		setPropertyFromClass("ClientPrefs", "timeBarType", timeBarStrings[curSelected])
		setTextString("chosenOptionString"..curSelection, getPropertyFromClass("ClientPrefs", "timeBarType"))
	elseif activeSubgroup[curSelection] == "Health Bar Transparency" then
		local increase = 0.1 * updateBy
		if getPropertyFromClass("ClientPrefs", "healthBarAlpha") + increase <= 0.11 then
			increase = 0
			setPropertyFromClass("ClientPrefs", "healthBarAlpha", 0.1)
		elseif getPropertyFromClass("ClientPrefs", "healthBarAlpha") + increase >= 0.99 then
			increase = 0
			setPropertyFromClass("ClientPrefs", "healthBarAlpha", 1)
		end
		setPropertyFromClass("ClientPrefs", "healthBarAlpha", getPropertyFromClass("ClientPrefs", "healthBarAlpha") + increase)
		setTextString("chosenOptionString"..curSelection, (getPropertyFromClass("ClientPrefs", "healthBarAlpha") * 100).."%")
	elseif activeSubgroup[curSelection] == "Hitsound Volume" then
		local increase = 0.1 * updateBy
		if getPropertyFromClass("ClientPrefs", "hitsoundVolume") + increase <= 0.01 then
			increase = 0
			setPropertyFromClass("ClientPrefs", "hitsoundVolume", 0)
		elseif getPropertyFromClass("ClientPrefs", "hitsoundVolume") + increase >= 0.99 then
			increase = 0
			setPropertyFromClass("ClientPrefs", "hitsoundVolume", 1)
		end
		setPropertyFromClass("ClientPrefs", "hitsoundVolume", getPropertyFromClass("ClientPrefs", "hitsoundVolume") + increase)
		setTextString("chosenOptionString"..curSelection, (getPropertyFromClass("ClientPrefs", "hitsoundVolume") * 100).."%")
	elseif activeSubgroup[curSelection] == "Rating Offset" then
		local increase = 1 * updateBy
		if getPropertyFromClass("ClientPrefs", "ratingOffset") + increase <= -30 then
			increase = 0
			setPropertyFromClass("ClientPrefs", "ratingOffset", -30)
		elseif getPropertyFromClass("ClientPrefs", "ratingOffset") + increase >= 30 then
			increase = 0
			setPropertyFromClass("ClientPrefs", "ratingOffset", 30)
		end
		setPropertyFromClass("ClientPrefs", "ratingOffset", getPropertyFromClass("ClientPrefs", "ratingOffset") + increase)
		setTextString("chosenOptionString"..curSelection, getPropertyFromClass("ClientPrefs", "ratingOffset").."ms")
	elseif activeSubgroup[curSelection] == "Sick! Hit Window" then
		local increase = 1 * updateBy
		if getPropertyFromClass("ClientPrefs", "sickWindow") + increase <= 15 then
			increase = 0
			setPropertyFromClass("ClientPrefs", "sickWindow", 15)
		elseif getPropertyFromClass("ClientPrefs", "sickWindow") + increase >= 45 then
			increase = 0
			setPropertyFromClass("ClientPrefs", "sickWindow", 45)
		end
		setPropertyFromClass("ClientPrefs", "sickWindow", getPropertyFromClass("ClientPrefs", "sickWindow") + increase)
		setTextString("chosenOptionString"..curSelection, getPropertyFromClass("ClientPrefs", "sickWindow").."ms")
	elseif activeSubgroup[curSelection] == "Good Hit Window" then
		local increase = 1 * updateBy
		if getPropertyFromClass("ClientPrefs", "goodWindow") + increase <= 15 then
			increase = 0
			setPropertyFromClass("ClientPrefs", "goodWindow", 15)
		elseif getPropertyFromClass("ClientPrefs", "goodWindow") + increase >= 90 then
			increase = 0
			setPropertyFromClass("ClientPrefs", "goodWindow", 90)
		end
		setPropertyFromClass("ClientPrefs", "goodWindow", getPropertyFromClass("ClientPrefs", "goodWindow") + increase)
		setTextString("chosenOptionString"..curSelection, getPropertyFromClass("ClientPrefs", "goodWindow").."ms")
	elseif activeSubgroup[curSelection] == "Bad Hit Window" then
		local increase = 1 * updateBy
		if getPropertyFromClass("ClientPrefs", "badWindow") + increase <= 15 then
			increase = 0
			setPropertyFromClass("ClientPrefs", "badWindow", 15)
		elseif getPropertyFromClass("ClientPrefs", "badWindow") + increase >= 135 then
			increase = 0
			setPropertyFromClass("ClientPrefs", "badWindow", 135)
		end
		setPropertyFromClass("ClientPrefs", "badWindow", getPropertyFromClass("ClientPrefs", "badWindow") + increase)
		setTextString("chosenOptionString"..curSelection, getPropertyFromClass("ClientPrefs", "badWindow").."ms")
	elseif activeSubgroup[curSelection] == "Safe Frames" then
		local increase = 0.1 * updateBy
		if getPropertyFromClass("ClientPrefs", "safeFrames") + increase < 2 then
			increase = 0
			setPropertyFromClass("ClientPrefs", "safeFrames", 2)
		elseif getPropertyFromClass("ClientPrefs", "safeFrames") + increase > 10 then
			increase = 0
			setPropertyFromClass("ClientPrefs", "safeFrames", 10)
		end
		setPropertyFromClass("ClientPrefs", "safeFrames", getPropertyFromClass("ClientPrefs", "safeFrames") + increase)
		setTextString("chosenOptionString"..curSelection, getPropertyFromClass("ClientPrefs", "safeFrames").."ms")
	end
	setProperty("selectorRight"..curSelection..".x", getProperty("chosenOptionString"..curSelection..".x") + getProperty("chosenOptionString"..curSelection..".width") + 2)
end

function onUpdatePost()
	if week == "funkMix" or week == "funkMixDX" then
		if getProperty("border.exists") == false then
			loadGraphic("bgOptions2", "menus/options/bg2Wide")
			updateHitbox("bgOptions2")
			screenCenter("bgOptions2", "x")
		else
			loadGraphic("bgOptions2", "menus/options/bg2")
			updateHitbox("bgOptions2")
			screenCenter("bgOptions2", "x")
		end
	end
	-- skip line if the selected script is null (indicates line break)
	if activeSubgroup[curSelection] == nil then
		selectOption(curSelection + directionIncrement, false)
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

			if getTextString("curMenuGlobal") == "3" then
				if settingTypePref[curSelection] == "subgroup" then
					curSelectionGroup = curSelection
					setTextString("subMenuGlobal", "2")
					if activeSubgroup[curSelection] == "Funk Mix" then
						settingTypePref = {"checkmark", "checkmark", "checkmark", "checkmark", "checkmark", nil, "checkmark", "checkmark", "checkmark"}
						loadSubgroup(funkMix)
					elseif activeSubgroup[curSelection] == "Graphics" then
						settingTypePref = {"checkmark", "selector"}
						loadSubgroup(graphics)
					elseif activeSubgroup[curSelection] == "Visuals and UI" then
						settingTypePref = {"checkmark", "checkmark", "selector", "checkmark", "selector"}
						loadSubgroup(visualsAndUI)
					elseif activeSubgroup[curSelection] == "Gameplay" then
						settingTypePref = {"checkmark", "checkmark", "checkmark", "checkmark", "checkmark", "selector", "selector", "selector", "selector", "selector", "selector"}
						loadSubgroup(gameplay)
					end
				end
			end

			updateCheckmark()

			lockedMovement = false
			setTextString("canControlGlobal", not lockedMovement)
		end
	end
end

function onTimerCompleted(tag)
	if tag == "workerMario" then
		loadPipes()
	end
	if tag == "pipeEntered" then
        -- isPipes = false
		firstPipeEnter = true		
		if pipes[curPipe] == "exit" then
			setTextString("curMenuGlobal", 1)
			setTextString("inMenuGlobal", "MainMenu")
		else
			loadGroup()
		end
	end
	if tag == "codeUpdate" then
		for i = 1,tablelength(genieCodes) do
        	updateCheckmark()
		end
	end
end