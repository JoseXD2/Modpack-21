local prefix = ""

function onCreate()
	if songName == "Portal Power" then
		prefix = "mari0"
	end
end

function onCreatePost()
	for i = 0, getProperty("unspawnNotes.length")-1 do
		if getPropertyFromGroup("unspawnNotes", i, "noteType") == "" or getPropertyFromGroup("unspawnNotes", i, "noteType") == "GF Sing" then
			setPropertyFromGroup("unspawnNotes", i, "texture", prefix.."NOTE_quants"..math.random(10))
			if getPropertyFromGroup("unspawnNotes", i, "isSustainNote") then
				setPropertyFromGroup("unspawnNotes", i, "texture", getPropertyFromGroup("unspawnNotes", i, "prevNote.texture"))
			end
		end
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