local waterBGPos = 0
local waterBGPos2 = 0
local waterBGPos3 = 0
local mVelocityX = 0
local mVelocityY = 0
local mSwimX = 128 * 6
local mSwimY = 16 * 6
local mSwimPower = 1.85
local mSwimGravity = 2.25
local swimThres = 24 * 6

function onCreate()
	defaultBF = boyfriendName
	addLuaScript("extra_scripts/Lost Levels Font")

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite("sky", "backgrounds/water/sky", -160 * 3, -81 * 3)
		setScrollFactor("sky", 1, 1)
		setProperty("sky.antialiasing", false)
		scaleObject("sky", 6, 6)
		updateHitbox("sky")
		addLuaSprite("sky", false)

		makeLuaSprite("background", "backgrounds/water/background", -160 * 3, -81 * 3)
		setScrollFactor("background", 1, 1)
		setProperty("background.antialiasing", false)
		scaleObject("background", 6, 6)
		updateHitbox("background")
		addLuaSprite("background", false)
		makeLuaSprite("background2", "backgrounds/water/background", getProperty("background.width"), -81 * 3)
		setScrollFactor("background2", 1, 1)
		setProperty("background2.antialiasing", false)
		scaleObject("background2", 6, 6)
		updateHitbox("background2")
		addLuaSprite("background2", false)
		makeLuaSprite("background3", "backgrounds/water/background", -getProperty("background.width"), -81 * 3)
		setScrollFactor("background3", 1, 1)
		setProperty("background3.antialiasing", false)
		scaleObject("background3", 6, 6)
		updateHitbox("background3")
		addLuaSprite("background3", false)
		setProperty("background.alpha", 0.5)
		setProperty("background2.alpha", 0.5)
		setProperty("background3.alpha", 0.5)
		
		makeLuaSprite("coral", "backgrounds/water/coral", -160 * 3, -81 * 3)
		setScrollFactor("coral", 1, 1)
		setProperty("coral.antialiasing", false)
		scaleObject("coral", 6, 6)
		updateHitbox("coral")
		addLuaSprite("coral", false)
		makeLuaSprite("coral2", "backgrounds/water/coral", getProperty("coral.width"), -81 * 3)
		setScrollFactor("coral2", 1, 1)
		setProperty("coral2.antialiasing", false)
		scaleObject("coral2", 6, 6)
		updateHitbox("coral2")
		addLuaSprite("coral2", false)
		makeLuaSprite("coral3", "backgrounds/water/coral", -getProperty("coral.width"), -81 * 3)
		setScrollFactor("coral3", 1, 1)
		setProperty("coral3.antialiasing", false)
		scaleObject("coral3", 6, 6)
		updateHitbox("coral3")
		addLuaSprite("coral3", false)

		makeAnimatedLuaSprite("ground", "backgrounds/water/ground", -160 * 3, -81 * 3)
		setScrollFactor("ground", 1, 1)
		setProperty("ground.antialiasing", false)
		scaleObject("ground", 6, 6)
		updateHitbox("ground")
		addLuaSprite("ground", false)
		makeAnimatedLuaSprite("ground2", "backgrounds/water/ground", getProperty("ground.width"), -81 * 3)
		setScrollFactor("ground2", 1, 1)
		setProperty("ground2.antialiasing", false)
		scaleObject("ground2", 6, 6)
		updateHitbox("ground2")
		addLuaSprite("ground2", false)
		makeAnimatedLuaSprite("ground3", "backgrounds/water/ground", -getProperty("ground.width"), -81 * 3)
		setScrollFactor("ground3", 1, 1)
		setProperty("ground3.antialiasing", false)
		scaleObject("ground3", 6, 6)
		updateHitbox("ground3")
		addLuaSprite("ground3", false)
		if flashingLights then
			addAnimationByPrefix("ground", "idle", "idle0", 9)
			addAnimationByPrefix("ground2", "idle", "idle0", 9)
			addAnimationByPrefix("ground3", "idle", "idle0", 9)
		end
	else
		makeAnimatedLuaSprite("waterBG", "backgrounds/water/bg", 0, -5 * 6)
		setScrollFactor("waterBG", 1, 1)
		setProperty("waterBG.antialiasing", false)
		scaleObject("waterBG", 6, 6)
		updateHitbox("waterBG")
		addLuaSprite("waterBG", false)
		makeAnimatedLuaSprite("waterBG2", "backgrounds/water/bg", 0, -5 * 6)
		setScrollFactor("waterBG2", 1, 1)
		setProperty("waterBG2.antialiasing", false)
		scaleObject("waterBG2", 6, 6)
		updateHitbox("waterBG2")
		addLuaSprite("waterBG2", false)
		if flashingLights then
			addAnimationByPrefix("waterBG", "idle", "idle0", 9)
			addAnimationByPrefix("waterBG2", "idle", "idle0", 9)
		end
	end

	-- background shit
	makeAnimatedLuaSprite("marioSwim", "backgrounds/water/mario", 0, 0)
	addAnimationByPrefix("marioSwim", "swim", "swim0", 9)
	setScrollFactor("marioSwim", 1, 1)
	setProperty("marioSwim.antialiasing", false)
	scaleObject("marioSwim", 6, 6)
	updateHitbox("marioSwim")
	addLuaSprite("marioSwim", false)
end

function onCreatePost()
	if boyfriendName == "bf-water" then
		setProperty("marioSwim.x", getProperty("boyfriend.x") + (3 * 6) + 2)
		setProperty("marioSwim.y", getProperty("boyfriend.y") - (21 * 6) - 1)
	end
end

function onUpdate(elapsed)
	if getProperty("boyfriend.visible") == false then
		setProperty("marioSwim.visible", false)
	else
		setProperty("marioSwim.visible", true)
	end

	mVelocityY = mVelocityY + (mSwimGravity * elapsed)

	mSwimX = mSwimX + (mVelocityX * (elapsed * 120))
	mSwimY = mSwimY + (mVelocityY * (elapsed * 120))

	if not inGameOver then
		setProperty("marioSwim.x", math.floor(mSwimX / 6) * 6 - (2 * 6))
		setProperty("marioSwim.y", (math.floor(mSwimY / 6) * 6) + (2 * 6) + 3)
		if boyfriendName == defaultBF.."-small" then
			setProperty("boyfriend.y", (math.floor(mSwimY / 6) * 6) + (23 * 6) + 4)
		else
			setProperty("boyfriend.y", (math.floor(mSwimY / 6) * 6) + (22 * 6) + 4)
		end
	end

	if mSwimY > swimThres then
		mVelocityY = -mSwimPower * 0.8
		-- mVelocityY = -mSwimPower * math.random(0.8, 1)
	end

	if flashingLights then
		moveMult = 1
	else
		moveMult = 0.5
	end	

	waterBGPos = waterBGPos - (960 * elapsed * moveMult)
	if lowQuality then
		if waterBGPos + getProperty("waterBG.width") <= 0 then
			waterBGPos = 0
		end

		setProperty("waterBG.x", math.floor(waterBGPos / 6) * 6)
		setProperty("waterBG2.x", getProperty("waterBG.x") + getProperty("waterBG.width"))
	else
		if waterBGPos + getProperty("ground.width") <= 0 then
			waterBGPos = 0
		end

		setProperty("ground.x", math.floor(waterBGPos / 6) * 6)
		setProperty("ground2.x", getProperty("ground.x") + getProperty("ground.width"))
		setProperty("ground3.x", getProperty("ground.x") - getProperty("ground.width"))
	end

	waterBGPos2 = waterBGPos2 - (960 * elapsed * (moveMult/2))
	if waterBGPos2 + getProperty("coral.width") <= 0 then
		waterBGPos2 = 0
	end

	setProperty("coral.x", math.floor(waterBGPos2 / 6) * 6)
	setProperty("coral2.x", getProperty("coral.x") + getProperty("coral.width"))
	setProperty("coral3.x", getProperty("coral.x") - getProperty("coral.width"))

	waterBGPos3 = waterBGPos3 - (960 * elapsed * (moveMult/4))
	if waterBGPos3 + getProperty("background.width") <= 0 then
		waterBGPos3 = 0
	end

	setProperty("background.x", math.floor(waterBGPos3 / 6) * 6)
	setProperty("background2.x", getProperty("background.x") + getProperty("background.width"))
	setProperty("background3.x", getProperty("background.x") - getProperty("background.width"))
end