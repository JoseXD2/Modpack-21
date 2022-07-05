local prefix = ""

function tablelength(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end

function onCreate()
	if songName == "Portal Power" then
		prefix = "mari0"
	end
end

function onCreatePost() -- returnQuantNote
	for i = 0, getProperty("unspawnNotes.length")-1 do
		noteQuant = -1
		if noteQuant == -1 then
			quantArray = {4, 8, 12, 16, 20, 24, 32, 48, 64, 192}

			newTime = getPropertyFromGroup("unspawnNotes", i, "strumTime")

			beatTimeSeconds = 60 / curBpm -- beat in seconds
			beatTime = beatTimeSeconds * 1000 -- beat in milliseconds
			-- assumed 4 beats per measure?
			measureTime = beatTime * 4

			smallestDeviation = measureTime / quantArray[tablelength(quantArray)]

			for quant = 1,tablelength(quantArray) do
				-- please generate this ahead of time and put into array :)
				-- I dont think I will im scared of those
				quantTime = (measureTime / quantArray[quant])
				if (newTime + getPropertyFromClass("ClientPrefs", "noteOffset") + smallestDeviation) % quantTime < smallestDeviation * 2 then
					-- here it is, the quant, finally!
					noteQuant = quant
					break
				end
			end
		end

		-- note quants
		-- base quant notes
		if getPropertyFromGroup("unspawnNotes", i, "noteType") == "" or getPropertyFromGroup("unspawnNotes", i, "noteType") == "GF Sing" then
			setPropertyFromGroup("unspawnNotes", i, "texture", prefix.."NOTE_quants"..noteQuant) -- noteQuant
		end

		-- inherit last quant if hold note
		if getPropertyFromGroup("unspawnNotes", i, "isSustainNote") and getPropertyFromGroup("unspawnNotes", i, "prevNote") ~= nil then
			setPropertyFromGroup("unspawnNotes", i, "texture", getPropertyFromGroup("unspawnNotes", i, "prevNote.texture"))
		end

		-- Note Splashes
		if not lowQuality then
			if prefix == "" then
				splashPrefix = "pixel"
			else
				splashPrefix = prefix
			end
			
			for j = 1,10 do
				if getPropertyFromGroup("unspawnNotes", i, "texture") == prefix.."NOTE_quants"..j then
					setPropertyFromGroup("unspawnNotes", i, "noteSplashTexture", "quantSplashes/"..splashPrefix.."/"..j)
				end
			end
		end
	end
end

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if not lowQuality then
		for i = 1,10 do
			if getPropertyFromGroup("notes", id, "texture") == prefix.."NOTE_quants"..i then
				setPropertyFromGroup("playerStrums", noteData, "texture", getPropertyFromGroup("notes", id, "texture"))
			end
		end
	end
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
	if not lowQuality then
		for i = 1,10 do
			if getPropertyFromGroup("notes", id, "texture") == prefix.."NOTE_quants"..i then
				setPropertyFromGroup("opponentStrums", noteData, "texture", getPropertyFromGroup("notes", id, "texture"))
			end
		end
	end
end