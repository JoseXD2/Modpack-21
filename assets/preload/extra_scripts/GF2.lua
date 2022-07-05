local danceDirection = true
local otherAnim = false

function onCreate()
	makeAnimatedLuaSprite("gf2", "characters/gf", 738, 156)
	addAnimationByIndices("gf2", "danceRight", "dancing", "0, 1, 2, 3, 4", 12)
	addAnimationByIndices("gf2", "danceLeft", "dancing", "5, 6, 7, 8, 9", 12)
	addAnimationByPrefix("gf2", "sad", "miss", 12, false)
	addAnimationByPrefix("gf2", "hey", "hey0", 12, false)
	setScrollFactor("gf2", 1, 1)
	setProperty("gf2.antialiasing", false)
	scaleObject("gf2", 6, 6)
	updateHitbox("gf2")
	addLuaSprite("gf2", false)
end

function onCreatePost()
	objectPlayAnimation("gf2", "danceRight", true)
end

function onBeatHit()
	if otherAnim == false then
		if danceDirection then
			danceDirection = false
			objectPlayAnimation("gf2", "danceLeft", false)
		else
			danceDirection = true
			objectPlayAnimation("gf2", "danceRight", false)
		end
	end
end

function onCountdownTick(swagCounter)
	if swagCounter <= 4 then
		if danceDirection then
			danceDirection = false
			objectPlayAnimation("gf2", "danceLeft", false)
		else
			danceDirection = true
			objectPlayAnimation("gf2", "danceRight", false)
		end
	end
end 

function noteMiss()
	otherAnim = true
	objectPlayAnimation("gf2", "sad", true)
end

function onUpdate()
	if getProperty("gf2.animation.curAnim.finished") then
		otherAnim = false
	end
end

function onEvent(name, value1, value2)
	if name == "Hey!" and value1 ~= "" or value1 ~= "BF" then
		otherAnim = true
		objectPlayAnimation("gf2", "hey", true)
	end
end