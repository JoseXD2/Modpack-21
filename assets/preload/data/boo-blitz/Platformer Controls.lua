bfVelocityX = 0
bfVelocityY = 0
bfJumps = 0
pixelOffsetX = 0
pixelOffsetY = 0
bfAccel = 750
bfSpeed = 450
bfFriction = 900
platformerControls = true

function clamp(min, value, max)
	return math.max(min, math.min(max, value))
end

function sign(number)
	return number > 0 and 1 or (number == 0 and 0 or -1)
end

-- Running Animations
function isMovementAnim()
	return (getProperty("boyfriend.animation.name") == "run" or getProperty("boyfriend.animation.name") == "skid")
end

-- Jumping Animation
function isJumpingAnim()
	return (getProperty("boyfriend.animation.name") == "jump" or getProperty("boyfriend.animation.name") == "fall")
end

function boyfriendMovement(elapsed)
	moveDirection = 0
	if keyPressed("left") then
		moveDirection = moveDirection - 1
	end
	if keyPressed("right") then
		moveDirection = moveDirection + 1
	end

	bfVelocityX = bfVelocityX + bfAccel * moveDirection * elapsed
	if moveDirection == -1 and bfVelocityX <= -bfSpeed then
		bfVelocityX = -bfSpeed
	end
	if moveDirection == 1 and bfVelocityX >= bfSpeed then
		bfVelocityX = bfSpeed
	end

	if moveDirection == 0 then
		if bfVelocityX > 0 then
			bfVelocityX = bfVelocityX - bfFriction * elapsed
			if bfVelocityX <= 0 then
				bfVelocityX = 0
			end
		end
		if bfVelocityX < 0 then
			bfVelocityX = bfVelocityX + bfFriction * elapsed
			if bfVelocityX >= 0 then
				bfVelocityX = 0
			end
		end
	else
		setProperty("boyfriend.animation.curAnim.frameRate", 10.5 * clamp(0.5, (math.abs(bfVelocityX) / bfSpeed), 1))
		setProperty("boyfriend.flipX", moveDirection == 1)

		if math.abs(bfVelocityX) > 0 and sign(bfVelocityX) ~= moveDirection then
			bfVelocityX = bfVelocityX + bfAccel * moveDirection * 2 * elapsed
			if getProperty("boyfriend.animation.name") ~= "skid" and bfJumps <= 0 then
				characterPlayAnim("boyfriend", "skid", false)
			end
		end
	end

	if math.abs(bfVelocityX) > 0 and getProperty("boyfriend.animation.name") ~= "run" then
		if not (math.abs(bfVelocityX) > 0 and sign(bfVelocityX) ~= moveDirection) and bfJumps <= 0 then
			characterPlayAnim("boyfriend", "run", false)
		end
	elseif math.abs(bfVelocityX) == 0 and isMovementAnim() then
		setProperty("boyfriend.specialAnim", false)
		characterDance("boyfriend")
		setProperty("boyfriend.animation.curAnim.frameRate", 12)
		setProperty("boyfriend.animation.curAnim.curFrame", 6)
	end

	bfX = bfX + bfVelocityX * elapsed

	-- For wall collision
	if bfX > (152 * 6) then
		bfX = 152 * 6
		bfVelocityX = 0
	end
	if bfX < (68 * 6) then
		bfX = 68 * 6
		bfVelocityX = 0
	end

	-- For X Wrap
	-- if bfX > (168 * 6) then
	-- 	bfX = -16 * 6
	-- end
	-- if bfX < (-16 * 6) then
	-- 	bfX = 168 * 6
	-- end
end

function boyfriendJump(elapsed)
	if keyJustPressed("space") and bfJumps <= 0 then
		bfJumps = 1
		bfVelocityY = -800 * 1.5
		characterPlayAnim("boyfriend", "jump", false)
		setProperty("boyfriend.specialAnim", true)
	end
	
	if bfJumps > 0 then
		if bfY > groundPos then
			bfJumps = bfJumps - 1
			if bfJumps > 0 then
				bfY = groundPos - 6
				bfVelocityY = -800 * 1.5
				setProperty("boyfriend.specialAnim", true)
				characterPlayAnim("boyfriend", "jump", false)
			else
				bfY = groundPos - 2
				bfVelocityY = 0
				setProperty("boyfriend.specialAnim", false)
				characterDance("boyfriend")
			end
		end
		bfVelocityY = bfVelocityY + 3000 * elapsed
		bfY = bfY + bfVelocityY * elapsed
	end
end

function boyfriendAccend(elapsed)
	accendDirection = 0
	if keyPressed("up") then
		accendDirection = accendDirection - 1
	end
	if keyPressed("down") then
		accendDirection = accendDirection + 1
	end

	bfVelocityY = bfVelocityY + bfAccel * accendDirection * elapsed
	if moveDirection == -1 and bfVelocityY <= -bfSpeed then
		bfVelocityY = -bfSpeed
	end
	if accendDirection == 1 and bfVelocityY >= bfSpeed then
		bfVelocityY = bfSpeed
	end

	if accendDirection == 0 then
		if bfVelocityY > 0 then
			bfVelocityY = bfVelocityY - bfFriction * elapsed
			if bfVelocityY <= 0 then
				bfVelocityY = 0
			end
		end
		if bfVelocityY < 0 then
			bfVelocityY = bfVelocityY + bfFriction * elapsed
			if bfVelocityY >= 0 then
				bfVelocityY = 0
			end
		end
	else
		setProperty("boyfriend.animation.curAnim.frameRate", 10.5 * clamp(0.5, (math.abs(bfVelocityY) / bfSpeed), 1))

		if math.abs(bfVelocityY) > 0 and sign(bfVelocityY) ~= accendDirection then
			bfVelocityY = bfVelocityY + bfAccel * accendDirection * 2 * elapsed
			if getProperty("boyfriend.animation.name") ~= "fall" then
				characterPlayAnim("boyfriend", "fall", false)
			end
		end
	end

	if math.abs(bfVelocityY) > 0 and getProperty("boyfriend.animation.name") ~= "jump" then
		if not (math.abs(bfVelocityY) > 0 and sign(bfVelocityY) ~= accendDirection) then
			characterPlayAnim("boyfriend", "jump", false)
		end
	elseif math.abs(bfVelocityY) == 0 and isJumpingAnim() then
		setProperty("boyfriend.specialAnim", false)
		characterDance("boyfriend")
		setProperty("boyfriend.animation.curAnim.frameRate", 12)
		setProperty("boyfriend.animation.curAnim.curFrame", 6)
	end

	bfY = bfY + bfVelocityY * elapsed

	-- For floor and ceiling collision
	-- if bfY > (152 * 6) then
		-- bfY = 152 * 6
		-- bfVelocityY = 0
	-- end
	-- if bfY < (68 * 6) then
		-- bfY = 68 * 6
		-- bfVelocityY = 0
	-- end
end

-- Funkin Setup
function onCreatePost()
	bfX = getProperty("boyfriend.x")
	bfY = getProperty("boyfriend.y")
	groundPos = getProperty("boyfriend.y")
	daBF = boyfriendName

	makeLuaSprite("bfHitbox", "", 0, 0)
	makeGraphic("bfHitbox", getProperty("boyfriend.width"), getProperty("boyfriend.height"), "000000")
	-- addLuaSprite("bfHitbox", false)
end

function onUpdate(elapsed)
	if math.floor(curStep / 16) ~= nil then
		platformerControls = not mustHitSection
	else
		platformerControls = true
	end

	if not platformerControls then
		setProperty("boyfriend.flipX", false)
		setProperty("boyfriend.animation.curAnim.frameRate", 12)
		bfVelocityX = 0
		if bfY < groundPos - 2 then
			boyfriendJump(elapsed)
		else
			bfY = groundPos - 2
			bfVelocityY = 0
		end
		if isMovementAnim() then
			setProperty("boyfriend.specialAnim", false)
			characterDance("boyfriend")
		end
		if isJumpingAnim() then
			characterDance("boyfriend")
		end
	end

	if getProperty("boyfriend.animation.curAnim.name") == ("run" or "skid" or "jump" or "fall") then
		setProperty("boyfriend.specialAnim", true)
	end

	if getProperty("boyfriend.animation.curAnim.name") == ("idle" or "singLEFT" or "singDOWN" or "singUP" or "singRIGHT" or "trueLEFTmiss" or "trueDOWNmiss" or "trueUPmiss" or "trueRIGHTmiss") then
		setProperty("boyfriend.animation.curAnim.frameRate", 12)
	end

	if platformerControls then
		boyfriendMovement(elapsed)
		-- boyfriendJump(elapsed)
		-- boyfriendAccend(elapsed) -- the funny one

		setProperty("bfHitbox.x", getProperty("boyfriend.x") - (1 * 6))
		setProperty("bfHitbox.y", getProperty("boyfriend.y") - (3 * 6))
		
		if getProperty("boyfriend.flipX") then
			setProperty("bfHitbox.x", getProperty("bfHitbox.x") - (2 * 6))
		end
	end
end

function onUpdatePost()
	-- Pixel Alignment
	setProperty("boyfriend.x", math.floor(bfX / 6) * 6 - pixelOffsetX)
	if boyfriendName ~= daBF.."-small" then
		pixelOffsetX = 1
	else
		pixelOffsetX = 5
	end
	setProperty("boyfriend.y", math.floor(bfY / 6) * 6 + pixelOffsetY)
	if boyfriendName ~= daBF.."-small" then
		pixelOffsetY = 5
	else
		pixelOffsetY = 1
	end
end

function onGameOverStart()
	removeLuaScript("data/boo-blitz/Platformer Controls")
end