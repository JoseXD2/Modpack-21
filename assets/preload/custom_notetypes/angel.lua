function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'angel' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Ectospasm/Spectre_Note'); --Change texture
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
				getPropertyFromGroup('unspawnNotes', i, 'mustPress', true);
			end
		end
	end
	--debugPrint('Script started!')      

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'angel' then
		playSound('SpectreArrow', 1);
        noteTweenAlpha("NoteAlpha1", 7, 1, 0.1, linear)
        noteTweenAlpha("NoteAlpha2", 6, 1, 0.1, linear)
        noteTweenAlpha("NoteAlpha3", 5, 1, 0.1, linear)
        noteTweenAlpha("NoteAlpha4", 4, 1, 0.1, linear)
	end
end

-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'Instakill Note' then
		-- put something here if you want
	end
end