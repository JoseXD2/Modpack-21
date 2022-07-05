local grpMenuShit2 = {"optionTextB1", "optionTextB2", "optionTextB3", "optionTextB4"}
local grpMenuShit1 = {"optionTextA1", "optionTextA2", "optionTextA3", "optionTextA4"}
local curSelected = 1
local menuItems = {"STORY MODE", "FREEPLAY", "OPTIONS"}
-- local menuItems = {"STORY MODE", "OPTIONS", "EXIT"}
local canControl = true
local wideScreen = (26 * 6) + 4
local accepted = false

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

function onCreate()
	if not isStoryMode then
		-- menuItems[1] = "FREEPLAY"
	end

	-- background
	makeLuaSprite("bgTitle", "menus/title/bg", 0, 0)
	setObjectCamera("bgTitle", "other")
	scaleObject("bgTitle", 6, 6)
	updateHitbox("bgTitle")
	screenCenter("bgTitle", "x")
	setProperty("bgTitle.x", getProperty("bgTitle.x") + 3)
	setProperty("bgTitle.antialiasing", false)
	addLuaSprite("bgTitle", false)

	-- logo
	makeLuaSprite("logo", "menus/title/logo", (6 * 6) + wideScreen, 4 * 6)
	setObjectCamera("logo", "other")
	scaleObject("logo", 6, 6)
	updateHitbox("logo")
	setProperty("logo.antialiasing", false)
	addLuaSprite("logo", false)

	-- version
	makeLuaSprite("version", "menus/title/version", (132 * 6) + wideScreen, 112 * 6)
	setObjectCamera("version", "other")
	scaleObject("version", 6, 6)
	updateHitbox("version")
	setProperty("version.antialiasing", false)
	addLuaSprite("version", false)

	makeLuaSprite("selector", "menus/title/selector", 0 + wideScreen, (12 * 6))
	setObjectCamera("selector", "other")
	scaleObject("selector", 6, 6)
	setProperty("selector.antialiasing", false)
	addLuaSprite("selector", false)

	for i = 1,tablelength(menuItems) do
		makeLuaText("optionTextA"..i, menuItems[i], 0, 0 + wideScreen, (16 * 6 * i) + (49 * 6) - 3)
		setTextSize("optionTextA"..i, 8 * 6)
		setTextBorder("optionTextA"..i, 0, "000000")
		setTextFont("optionTextA"..i, "smb1.ttf")
		setObjectCamera("optionTextA"..i, "other")
		updateHitbox("optionTextA"..i)

		if i == 1 then
			screenCenter("optionTextA"..i, "x")
			setProperty("optionTextA"..i..".x", (math.floor(getProperty("optionTextA"..i..".x") / 6) * 6) + (17 * 6) + 1)
		else
			setProperty("optionTextA"..i..".x", getProperty(grpMenuShit1[1]..".x"))
		end

		makeLuaText("optionTextB"..i, menuItems[i], 0, 0 + wideScreen, (16 * 6 * i) + (49 * 6) - 3)
		setTextSize("optionTextB"..i, 8 * 6)
		setTextBorder("optionTextB"..i, 0, "000000")
		setTextFont("optionTextB"..i, "smb1.ttf")
		setObjectCamera("optionTextB"..i, "other")
		updateHitbox("optionTextB"..i)
		setProperty("optionTextB"..i..".x", getProperty("optionTextA"..i..".x") + 1 * 6)
		setProperty("optionTextB"..i..".y", getProperty("optionTextA"..i..".y") + 1 * 6)
		setTextColor("optionTextB"..i, "0x000000")

		addLuaText(grpMenuShit2[i])
		addLuaText(grpMenuShit1[i])
	end
	changeSelection()

	setProperty("selector.x", getProperty(grpMenuShit1[1]..".x") - (16 * 6) + 3)
	setProperty("selector.y", getProperty(grpMenuShit1[1]..".y") + (1 * 6) + 3)
end

function onUpdate()
	if getTextString("curMenuGlobal") == "1" then
		setTextString("curSelectedGlobal", curSelected)
		if getTextString("inMenuGlobal") ~= "MainMenu" then
			setTextString("inMenuGlobal", "MainMenu")
			canControl = true
		end
		if getTextString("optionsPipeExitFix") == "false" then
			setTextString("optionsPipeExitFix", "true")
			canControl = true
		end
		
		setTextString("canControlGlobal", canControl)

		if canControl then
			if keyJustPressed("up") then
				changeSelection(-1)
			end
			if keyJustPressed("down") then
				changeSelection(1)
			end
		end

		if keyJustPressed("accept") and canControl then
			local daSelected = menuItems[curSelected]
			local menuItem = grpMenuShit1[curSelected]
			local menuItemBG = grpMenuShit2[curSelected]
			canControl = false
			setTextString("canControlGlobal", "false")

			if daSelected == "STORY MODE" then
				playSound("coin", 1)
				flicker(menuItem, 0.8, 0.05, false)
				runTimer("storyTime", 1, 1)
			elseif daSelected == "FREEPLAY" then
				playSound("stomp", 1)
				flicker(menuItem, 0.8, 0.05, false)
				runTimer("freeForAll", 1, 1)
			elseif daSelected == "OPTIONS" then
				playSound("stomp", 1)
				flicker(menuItem, 0.8, 0.05, false)
				runTimer("workerMario", 1, 1)
			elseif daSelected == "EXIT" then
				playSound("power_down", 1)
				flicker(menuItem, 0.8, 0.05, false)
				runTimer("quitMenu", 1, 1)
			end
		end
		setProperty(grpMenuShit2[curSelected]..".visible", getProperty(grpMenuShit1[curSelected]..".visible"))
	else
		setProperty("selector.x", getProperty(grpMenuShit1[curSelected]..".x") - (16 * 6) + 3)
		setProperty("selector.y", getProperty(grpMenuShit1[curSelected]..".y") + (1 * 6) + 3)
		for i = 1,tablelength(menuItems) do
			setProperty(grpMenuShit2[i]..".visible", true)
			setProperty(grpMenuShit1[i]..".visible", true)
		end
	end
end

function changeSelection(change)
	if getTextString("curMenuGlobal") == "1" then
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
				setProperty("selector.x", getProperty(grpMenuShit1[item]..".x") - (16 * 6) + 3)
				setProperty("selector.y", getProperty(grpMenuShit1[item]..".y") + (1 * 6) + 3)
			end
			bullShit = bullShit + 1
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
	end
end