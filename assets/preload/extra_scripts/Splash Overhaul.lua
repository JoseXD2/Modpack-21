suffix = "pixel"
stopSplash = 0

function onCreatePost()
	if songName == "Portal Power" then
		suffix = "mari0"
	elseif songName == "Wrong Warp" then
		suffix = "glitch"
	elseif songName == "first level" then
		suffix = "smm"
	elseif songName == "Green Screen" then
		suffix = "gameboy"
	end

	if getPropertyFromClass("ClientPrefs", "noteSplashes") then
		makeAnimatedLuaSprite("splash0", "splash-"..suffix, defaultPlayerStrumX0 - 4 * 6, defaultPlayerStrumY0 - 2 * 6)
		addAnimationByPrefix("splash0", "splash", "splash0", 12, false)
		setProperty("splash0.antialiasing", false)
		setProperty("splash0.alpha", 0.6)
		scaleObject("splash0", 6, 6)
		setObjectCamera("splash0", "hud")
		updateHitbox("splash0")
		addLuaSprite("splash0", true)

		makeAnimatedLuaSprite("splash1", "splash-"..suffix, defaultPlayerStrumX1 - 4 * 6, defaultPlayerStrumY1 - 2 * 6)
		addAnimationByPrefix("splash1", "splash", "splash1", 12, false)
		setProperty("splash1.antialiasing", false)
		setProperty("splash1.alpha", 0.6)
		scaleObject("splash1", 6, 6)
		setObjectCamera("splash1", "hud")
		updateHitbox("splash1")
		addLuaSprite("splash1", true)

		makeAnimatedLuaSprite("splash2", "splash-"..suffix, defaultPlayerStrumX2 - 4 * 6, defaultPlayerStrumY2 - 2 * 6)
		addAnimationByPrefix("splash2", "splash", "splash2", 12, false)
		setProperty("splash2.antialiasing", false)
		setProperty("splash2.alpha", 0.6)
		scaleObject("splash2", 6, 6)
		setObjectCamera("splash2", "hud")
		updateHitbox("splash2")
		addLuaSprite("splash2", true)

		makeAnimatedLuaSprite("splash3", "splash-"..suffix, defaultPlayerStrumX3 - 4 * 6, defaultPlayerStrumY3 - 2 * 6)
		addAnimationByPrefix("splash3", "splash", "splash3", 12, false)
		setProperty("splash3.antialiasing", false)
		setProperty("splash3.alpha", 0.6)
		scaleObject("splash3", 6, 6)
		setObjectCamera("splash3", "hud")
		updateHitbox("splash3")
		addLuaSprite("splash3", true)

		setProperty("splash0.visible", false)
		setProperty("splash1.visible", false)
		setProperty("splash2.visible", false)
		setProperty("splash3.visible", false)
	end
end

function onUpdatePost()
	for i = 0,3 do
		if songName == "Game Over" then
			setProperty("splash"..i..".x", _G['defaultOpponentStrumX'..i] - 4 * 6)
			setProperty("splash"..i..".y", _G['defaultOpponentStrumY'..i] - 2 * 6) -- in case of cutscene
		else
			setProperty("splash"..i..".x", _G['defaultPlayerStrumX'..i] - 4 * 6)
			setProperty("splash"..i..".y", _G['defaultPlayerStrumY'..i] - 2 * 6) -- in case of cutscene
		end
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if getPropertyFromClass("ClientPrefs", "noteSplashes") then
		if getProperty("sicks") > getProperty("sicks") - 1 and getProperty("boyfriend.animation.curAnim.name") ~= "idle" then
			for i = 0,3 do
				if noteData == i then
					if isSustainNote and stopSplash == 0 then
						setProperty("splash"..i..".visible", true)
						objectPlayAnimation("splash"..i, "splash", false)
						if getProperty("splash"..i..".animation.curAnim.curFrame") == 4 then
							stopSplash = 1
							setProperty("splash"..i..".visible", false)
						end
					elseif not isSustainNote then
						setProperty("splash"..i..".visible", true)
						objectPlayAnimation("splash"..i, "splash", false)
					end
				end
			end
		end
	end
end