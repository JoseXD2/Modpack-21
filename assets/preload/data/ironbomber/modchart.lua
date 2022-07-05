local weee = false
local defaultNotePos = {};

function onSongStart()
	for i = 0, 7 do
		y = getPropertyFromGroup('strumLineNotes', i, 'y')

		table.insert(defaultNotePos, y);
	end
end

function onUpdate(elapsed)
	local currentBeat = (getSongPosition() / 1000)*(bpm/60)

    if weee and not inGameOver then
        for i = 0, 7 do
            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1] + 32 * math.sin((currentBeat + i*4)));
        end

		setProperty('camHUD.angle', 1 * math.sin(currentBeat * math.pi));
		setProperty('camGame.angle', 1 * math.sin(currentBeat * math.pi));
    end
end

function onStepHit()
	if curStep == 384 then
		weee = true
    end
	if curStep == 640 then
	    weee = false
		setDefaults()
	end
	if curStep == 895 then
		weee = true
    end
	if curStep == 1023 then
	    weee = false
		setDefaults()
	end
	if curStep == 1151 then
		weee = true
    end
	if curStep == 1535 then
	    weee = false
		setDefaults()
	end
end

function setDefaults()
	for i = 0, 7 do
		setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1]);
	end

	setProperty('camHUD.angle', 0)
	setProperty('camGame.angle', 0)
end