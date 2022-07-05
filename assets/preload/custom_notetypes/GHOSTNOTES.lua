function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'GHOSTNOTES' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'GHOSTNOTES'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false

function noteMiss(id, direction, noteType, isSustainNote)
	health = getProperty('hurt')
	if noteType == "GHOSTNOTES" then
		setProperty('hurt', health-0.1)
	end
end	

function goodNoteHit(id, direction, noteType, isSustainNote)
	
	if noteType == "GHOSTNOTES" then
		triggerEvent('Play Animation','singRIGHT-alt', '1')
		end
	if noteData == '1' then
		triggerEvent('Play Animation','singDOWN-alt', '1')
		end
	if noteData == '2' then
		triggerEvent('Play Animation','singUP-alt', '1')
		end
	if noteData == '3' then
		triggerEvent('Play Animation','singRIGHT-alt', '1')

	end
end	

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'GHOSTNOTES' then
		triggerEvent('Play Animation','Alt Animation', '0')
	end
end