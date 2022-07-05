function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'heart' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Ectospasm/NOTE_heart'); --Change texture
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
	if noteType == 'heart' then
		playSound('sakuNote', 0.3);
		removeLuaSprite('Saku',false)
	end
end