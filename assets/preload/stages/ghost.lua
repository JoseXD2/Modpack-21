function onCreate()
	addLuaScript("extra_scripts/Default Font")

	makeLuaSprite("bg", "backgrounds/ghost/bg", 0, -5 * 6)
	setScrollFactor("bg", 1, 1)
	setProperty("bg.antialiasing", false)
	scaleObject("bg", 6, 6)
	updateHitbox("bg")
	addLuaSprite("bg", false)
end