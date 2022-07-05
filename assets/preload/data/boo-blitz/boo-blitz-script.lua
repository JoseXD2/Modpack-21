local xx = 160 * 3
local yy = 81 * 3

fireballs = {"fireball1","fireball2","fireball3","fireball4","fireball5","fireball6"}
beatsLeft = 0
nextFlash = 0
nextFlip = 0
fireSpots = 2
fireCooldown = 0

local damageCooldown = 0

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

function spawnFireballs()
	beatsLeft = 4
	fireCooldown = 0.5

	local safeSpots = {nil,nil,nil,nil,nil,nil}
	local exclude = 0
	for i = 1,fireSpots do
		safeSpots[getRandomInt(1,6,exclude)] = {i}
		for j = 1,6 do
			if safeSpots[j] ~= nil then
				exclude = j
			end
		end
	end

	local index = 1
	for i = 1,6 do 
		setProperty("fireball"..i..".x", (64 * 6) + (16 * (index - 1) * 6))
		setProperty("fireball"..i..".exists", not safeSpots[index])

		objectPlayAnimation("fireball"..i, "warning", false)
		setProperty("fireball"..i..".visible", false)
		index = index + 1
	end
end

function updateFireballs(elapsed)
	nextFlash = nextFlash - elapsed
	if nextFlash <= 0 then
		nextFlash = 0.2 * (beatsLeft / 4)
		for i = 1,6 do 
			setProperty("fireball"..i..".visible", not getProperty("fireball"..i..".visible"))
		end
	end
end

function shootFire()
	for i = 1,6 do
		setProperty("fireball"..i..".visible", true)
		objectPlayAnimation("fireball"..i, "shoot", false)
	end
end

function hitDetection()
	if damageCooldown <= 0 then
		for i = 1,6 do
			if getProperty("fireball"..i..".exists") and (getProperty("bfHitbox.x") + (8 * 6)) > getProperty("fireball"..i..".x") then
				if getProperty("bfHitbox.x") < getProperty("fireball"..i..".x") + (16 * 6) then
					if damageCooldown <= 0 then
						playSound("missnote", 1)
						setProperty("health", getProperty("health") - 0.085)
						damageCooldown = 0.15
					end
				end
			end
		end
	end
end

function onCreate()
	triggerEvent("Camera Follow Pos", xx, yy)

	for i = 1,6 do
		makeAnimatedLuaSprite("fireball"..i, "backgrounds/ghost/fireball", 0, 0)
		addAnimationByIndices("fireball"..i, "warning", "anim", "3", 12)
		addAnimationByIndices("fireball"..i, "shoot", "anim", "0, 1, 2", 12)
		addAnimationByIndices("fireball"..i, "retract", "anim", "2, 1, 0, 4", 12)
		objectPlayAnimation("fireball"..i, "warning", true)

		setProperty("fireball"..i..".antialiasing", false)
		scaleObject("fireball"..i, 6, 6)
		updateHitbox("fireball"..i)
		setProperty("fireball"..i..".exists", false)
		
		addLuaSprite("fireball"..i, false)
	end
end

function onUpdate(elapsed)
	if difficulty ~= 0 then
		if damageCooldown > 0 and getTextString("isPaused") ~= "true" then
			setProperty("boyfriend.alpha", getPropertyFromClass("flixel.FlxG", "game.ticks") % 2)
			damageCooldown = damageCooldown - elapsed
			if damageCooldown <= 0 then
				damageCooldown = 0
				setProperty("boyfriend.alpha", 1)
			end
		end
	end

	if fireCooldown > 0 then
		fireCooldown = fireCooldown - elapsed
		if fireCooldown < 0 then
			fireCooldown = 0
		end
	end

	if difficulty ~= 0 then
		if getProperty("fireball1.animation.name") == "shoot" and not inGameOver then
			hitDetection()
		end
	end

	if beatsLeft > 0 then
		updateFireballs(elapsed)
	else
		nextFlip = nextFlip - elapsed
		if nextFlip <= 0 then
			for i = 1,6 do
				setProperty("fireball"..i..".flipX", not getProperty("fireball"..i..".flipX"))
				nextFlip = 0.075
			end
		end
	end
end

function onBeatHit()
	if beatsLeft > 0 then
		beatsLeft = beatsLeft - 1
		if beatsLeft <= 0 then
			shootFire()
		end
	elseif beatsLeft <= 0 then
		if getProperty("fireball1.animation.name") == "shoot" then
			if curBeat % 2 == 0 then
				for i = 1,6 do
					objectPlayAnimation("fireball"..i, "retract", true)
				end
			end
		else
			beatsLeft = beatsLeft - 1
		end
	end

	if curBeat > 95 and fireSpots > 1 then
		fireSpots = 1
	end

	if curBeat % 8 == 0 and not mustHitSection and fireCooldown <= 0 and curBeat < 256 then
		spawnFireballs()
	end

	if dadName == "big-boo" and mustHitSection and curBeat % 2 == 0 then
		characterPlayAnim("dad", "shy", true)
	end
end