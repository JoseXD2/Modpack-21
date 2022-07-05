local poison = 0
function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'poision' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Ectospasm/PoisonArrows'); --Change texture
			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0'); --Default value is: 0.023, health gained on hit
                health = getProperty('health')
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
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'poision' then
		playSound('acid', 1);
	runTimer('end', 9999, 9999);
	startDraining = true
	setProperty('health', getProperty('health') + 0);
	end
end

function onUpdatePost()
	if startDraining == true then
	setProperty('health', getProperty('health') - 0.00075);
		if health == 0 then
			startDraining = false
		end
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'end' then
	startDraining = false
	end
end