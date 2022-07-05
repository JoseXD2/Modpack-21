function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'DrunkNotes' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Demo/Drunk_ARROWS'); --Change texture
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
	if noteType == 'DrunkNotes' then
                setProperty('health', getProperty('health')+0.0002);
		playSound('burp', 1);
	end
end
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'DrunkNotes' then
		playSound('A', 0.4);
		setProperty('health', getProperty('health')-0.02);
		runTimer('aaaa', 0.2, 10);
                doTweenZoom('aaaaZoom', 'camGame', 2, 1.9, 'linear')
end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'aaaa' then
		setProperty('health', getProperty('health')-0.02);
        end
end