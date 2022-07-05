doPowerUp = false
beatsUntilSpawn = -1
damageCooldown = 0
powerup = 1
powerupVisuals = false
suffix = ""
skinPrefix = ""
getFlipX = nil

function onCreate()
	bfPrefix = boyfriendName
	setProperty("healthGain", 0)
	setProperty("healthLoss", 0)
	
	-- The blacklist of players who don"t have unique power-up characters.
	if boyfriendName ~= "luigi-player" then
		powerup = 2
		powerupVisuals = true
	end
end

function onCreatePost()
	if boyfriendName == "bf" then
		bfPrefix = "boyfriend"
		triggerEvent("Change Character", "bf", "boyfriend")
	end

	setProperty("healthBarBG.visible", false)
	setProperty("healthBar.visible", false)
	setProperty("healthBarOverlay.visible", false)
	setProperty("iconP1.visible", false)
	setProperty("iconP2.visible", false)

	-- Note that the songName variable is SUPER SPECIFIC! The casing of the letters, spaces, and hyphens matter.
	if songName == "2 PLAYER GAME" then
		powerup = 1
		powerupVisuals = true
	elseif songName == "balls" then
		powerup = 0
		powerupVisuals = false
		triggerEvent("Change Character", "bf", bfPrefix..suffix)
		if getProperty("practiceMode") == false and (getDataFromSave("gameGenie", "invincible") == false or getDataFromSave("gameGenie", "invincible") == "invincible") then
			setProperty("instakillOnMiss", true)
		end
	elseif songName == "Green Screen" then
		powerup = 2
		powerupVisuals = false
		triggerEvent("Change Character", "bf", bfPrefix..suffix)
	end

	-- Note Skins for Power-Ups
	if songName == "Deep Deep Voyage" or songName == "Hop Hop Heights" then
		skinPrefix = "lostLevels"
	elseif songName == "Portal Power" then
		skinPrefix = "mari0"
	elseif songName == "first level" then
		skinPrefix = "smm"
	elseif songName == "Green Screen" then
		skinPrefix = "gameboy"
	elseif songName == "Game Over" then
		skinPrefix = "pcport"
	end
end

function onUpdate(elapsed)
	if damageCooldown > 0 and songName ~= "Green Screen" and getTextString("isPaused") ~= "true" then
		setProperty("boyfriend.alpha", getPropertyFromClass("flixel.FlxG", "game.ticks") % 2)
		damageCooldown = damageCooldown - elapsed
		if damageCooldown <= 0 then
			damageCooldown = 0
			setProperty("boyfriend.alpha", 1)
		end
	elseif damageCooldown > 0 and songName == "Green Screen" and flashingLights then
		setProperty("boyfriend.alpha", getPropertyFromClass("flixel.FlxG", "game.ticks") % 2)
		setProperty("dad.alpha", getPropertyFromClass("flixel.FlxG", "game.ticks") % 2)
		damageCooldown = damageCooldown - elapsed
		if damageCooldown <= 0 then
			damageCooldown = 0
			setProperty("boyfriend.alpha", 1)
			setProperty("dad.alpha", 1)
		end
	end

	if powerupVisuals then
		if powerup == 0 and boyfriendName ~= bfPrefix.."-small" then
			suffix = "-small"
			getFlipX = getProperty("boyfriend.flipX")
			getAnim = getProperty("boyfriend.animation.curAnim.name")
			getFrame = getProperty("boyfriend.animation.curAnim.curFrame")
			triggerEvent("Change Character", "bf", bfPrefix..suffix)
			setProperty("boyfriend.flipX", getFlipX)
			characterPlayAnim("boyfriend", getAnim, true)
			setProperty("boyfriend.animation.curAnim.curFrame", getFrame)
			if songName ~= "2 PLAYER GAME" then
				beatsUntilSpawn = 24
			end
		elseif powerup == 1 and boyfriendName ~= bfPrefix then
			suffix = ""
			getFlipX = getProperty("boyfriend.flipX")
			getAnim = getProperty("boyfriend.animation.curAnim.name")
			getFrame = getProperty("boyfriend.animation.curAnim.curFrame")
			triggerEvent("Change Character", "bf", bfPrefix..suffix)
			setProperty("boyfriend.flipX", getFlipX)
			characterPlayAnim("boyfriend", getAnim, true)
			setProperty("boyfriend.animation.curAnim.curFrame", getFrame)
			if songName ~= "2 PLAYER GAME" then
				beatsUntilSpawn = 48
			end
		elseif powerup == 2 and boyfriendName ~= bfPrefix.."-fire" then
			suffix = "-fire"
			getFlipX = getProperty("boyfriend.flipX")
			getAnim = getProperty("boyfriend.animation.curAnim.name")
			getFrame = getProperty("boyfriend.animation.curAnim.curFrame")
			triggerEvent("Change Character", "bf", bfPrefix..suffix)
			setProperty("boyfriend.flipX", getFlipX)
			characterPlayAnim("boyfriend", getAnim, true)
			setProperty("boyfriend.animation.curAnim.curFrame", getFrame)
			beatsUntilSpawn = -1
		end
	else
		if boyfriendName ~= bfPrefix then
			triggerEvent("Change Character", "bf", bfPrefix..suffix)
		end
	end

	if powerup < 0 then
		if getProperty("practiceMode") then
			powerup = 0
		else
			setProperty("health", 0)
		end
	elseif powerup == 0 then
		setProperty("health", 0.001)
	elseif powerup == 1 then
		setProperty("health", 1)
	elseif powerup == 2 then
		setProperty("health", 2)
	end

	if getProperty("health") > 2 then
		setProperty("health", 2)
	end

	if keyJustPressed("reset") and not getPropertyFromClass("ClientPrefs", "noReset") then
		if boyfriendName ~= "luigi-player" then
			if damageCooldown <= 0 and getProperty("practiceMode") and songName ~= "Funk Mix" then
				playSound("power_down", 1)
			end

			if damageCooldown <= 0 then
				setProperty("health", 0.001)
				powerup = 0
			end

			if damageCooldown <= 0 then
				damageCooldown = 2
			end
		end
	end

	for i = 0, getProperty("unspawnNotes.length") - 1 do
		if getPropertyFromGroup("unspawnNotes", i) and getPropertyFromGroup("unspawnNotes", i, "strumTime") - getPropertyFromClass("Conductor", "songPosition") < 3500 then
			if getPropertyFromGroup("unspawnNotes", i, "noteType") == "" and beatsUntilSpawn == 0 and getPropertyFromGroup("unspawnNotes", i, "mustPress") and not getPropertyFromGroup("unspawnNotes", i, "isSustainNote") and songName ~= "2 PLAYER GAME" then
				if powerup == 0 then
					beatsUntilSpawn = 24  -- These are extra percautions to make sure that you"re not swarmed with the power-up.
					setPropertyFromGroup("unspawnNotes", i, "noteType", "Power-Up Note")
					setPropertyFromGroup("unspawnNotes", i, "texture", "shroom"..skinPrefix.."NOTE_assets")
				elseif powerup == 1 then
					beatsUntilSpawn = 48
					setPropertyFromGroup("unspawnNotes", i, "noteType", "Power-Up Note")
					setPropertyFromGroup("unspawnNotes", i, "texture", "flower"..skinPrefix.."NOTE_assets")
				else
					beatsUntilSpawn = -1
					setPropertyFromGroup("unspawnNotes", i, "texture", skinPrefix.."NOTE_assets")
				end
			end
		end
	end

	if getPropertyFromClass("ClientPrefs", "ghostTapping") == false and not botPlay and (keyJustPressed("left") or keyJustPressed("down") or keyJustPressed("up") or keyJustPressed("right")) and (songName ~= "Funk Mix" or songName == "Funk Mix DX") then
		if (getDataFromSave("gameGenie", "invincible") == false or getDataFromSave("gameGenie", "invincible") == "invincible") and getTextString("isPaused") ~= "true" then
			if powerup < 0 then
				setProperty("boyfriend2.visible", false)
			end
			if boyfriendName ~= "luigi-player" then
				if (damageCooldown <= 0 and powerup ~= 0) or (damageCooldown <= 0 and getProperty("practiceMode")) then
					playSound("power_down", 1)
				end
			end
	
			if damageCooldown <= 0 and powerup == 2 then
				powerup = 1
			elseif damageCooldown <= 0 and powerup == 1 then
				powerup = 0
			elseif damageCooldown <= 0 and powerup == 0 and getProperty("practiceMode") == false then
				powerup = -1
			end
	
			if damageCooldown <= 0 then
				damageCooldown = 2
			end
		end
	end

	if songName == "Boo Blitz" then
		if getProperty("fireball1.animation.name") == "shoot" then
			hitDetection()
		end
	end
end

function onUpdatePost()
	if inGameOver then
		damageCooldown = 0
	end
end

function onBeatHit()
	if beatsUntilSpawn > 0 then
		beatsUntilSpawn = beatsUntilSpawn - 1
		if beatsUntilSpawn <= 0 then
			beatsUntilSpawn = 0
		end
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == "Power-Up Note" then
		if powerup == 0 then
			playSound("powerup", 1)
			powerup = 1
		elseif powerup == 1 then
			playSound("powerup", 1)
			powerup = 2
		end
	end
end

function noteMiss()
	if (getDataFromSave("gameGenie", "invincible") == false or getDataFromSave("gameGenie", "invincible") == "invincible") then
		if powerup < 0 then
			setProperty("boyfriend2.visible", false)
		end
		if boyfriendName ~= "luigi-player" then
			if (damageCooldown <= 0 and powerup ~= 0) or (damageCooldown <= 0 and getProperty("practiceMode")) then
				playSound("power_down", 1)
			end
		end

		if damageCooldown <= 0 and powerup == 2 then
			powerup = 1
		elseif damageCooldown <= 0 and powerup == 1 then
			powerup = 0
		elseif damageCooldown <= 0 and powerup == 0 and getProperty("practiceMode") == false then
			powerup = -1
		end

		if damageCooldown <= 0 then
			damageCooldown = 2
		end
	end
	if boyfriendName == bfPrefix.."-small" then
		setProperty("rating.x", getProperty("boyfriend.x") - (21 * 6) + 2)
	end
end

-- For "Boo Blitz"
function hitDetection()
	if damageCooldown <= 0 then
		for i = 1,6 do
			if getProperty("fireball"..i..".exists") and (getProperty("bfHitbox.x") + (8 * 6)) > getProperty("fireball"..i..".x") then
				if getProperty("bfHitbox.x") < getProperty("fireball"..i..".x") + (16 * 6) then
					if damageCooldown <= 0 then
						powerup = powerup - 1
						if powerup >= 0 then
							playSound("power_down", 1)
							damageCooldown = 2
						end
					end
				end
			end
		end
	end
end

-- For "Game Over"
function onStepHit()
	if songName == "Game Over" then
		if curStep == 768 then -- 769 then
			if powerup == 0 then
				setProperty("boyfriend.x", getProperty("boyfriend.x") + 5)
				setProperty("boyfriend.y", getProperty("boyfriend.y") + 4)
			end
			bfPrefix = "bf-chase"
		elseif curStep == 1532 then
			bfPrefix = "bf-wall"
		elseif curStep == 2034 then
			bfPrefix = "bf-chase"
		end
	end
end