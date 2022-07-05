function onCreate()
	if difficulty == 0 then
		addLuaScript("extra_scripts/Power-Up System")
	end
end

function noteHit()
	function goodNoteHit() end
end

function onUpdate()
	if (getDataFromSave("gameGenie", "invincible") == false or getDataFromSave("gameGenie", "invincible") == "invincible") and getTextString("isPaused") ~= "true" then
		if difficulty ~= 0 then
			if getPropertyFromClass("ClientPrefs", "ghostTapping") == false and not botPlay and (songName ~= "Funk Mix" or songName == "Funk Mix DX") and not inGameOver then
				if not noteHit() then
					if keyJustPressed("left") then
						characterPlayAnim("boyfriend", "trueLEFTmiss", true)
						playSound("missnote", 1)
					end
					if keyJustPressed("down") then
						characterPlayAnim("boyfriend", "trueDOWNmiss", true)
						playSound("missnote", 1)
					end
					if keyJustPressed("up") then
						characterPlayAnim("boyfriend", "trueUPmiss", true)
						playSound("missnote", 1)
					end
					if keyJustPressed("right") then
						characterPlayAnim("boyfriend", "trueRIGHTmiss", true)
						playSound("missnote", 1)
					end
				end
			end

			if getProperty("boyfriend.animation.curAnim.name") == ("trueLEFTmiss") then
				setProperty("boyfriend.specialAnim", true)
			end
			if getProperty("boyfriend.animation.curAnim.name") == ("trueDOWNmiss") then
				setProperty("boyfriend.specialAnim", true)
			end
			if getProperty("boyfriend.animation.curAnim.name") == ("trueUPmiss") then
				setProperty("boyfriend.specialAnim", true)
			end
			if getProperty("boyfriend.animation.curAnim.name") == ("trueRIGHTmiss") then
				setProperty("boyfriend.specialAnim", true)
			end
		end
	end
end

function noteMiss(id, noteData, noteType, isSustainNote)
	if (getDataFromSave("gameGenie", "invincible") == false or getDataFromSave("gameGenie", "invincible") == "invincible") and getTextString("isPaused") ~= "true" then
		if difficulty ~= 0 then
			if noteData == 0 then
				characterPlayAnim("boyfriend", "trueLEFTmiss", true)
			end
			if noteData == 1 then
				characterPlayAnim("boyfriend", "trueDOWNmiss", true)
			end
			if noteData == 2 then
				characterPlayAnim("boyfriend", "trueUPmiss", true)
			end
			if noteData == 3 then
				characterPlayAnim("boyfriend", "trueRIGHTmiss", true)
			end
		end
	end
end