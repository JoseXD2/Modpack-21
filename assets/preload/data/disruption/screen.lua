function opponentNoteHit()
	triggerEvent('Screen Shake', '0.1, 0.01', '0.1, 0.005');
	health = getProperty('health')
	if difficulty == 2 then
		setProperty('health', health- 0.007);
	else
		setProperty('health', health- 0.005);
	end
end

function onBeatHit()
	if curBeat % 2 == 0 then
		characterPlayAnim('dad', 'idle2', false)
	end
	if curBeat % 4 == 0 then
		characterPlayAnim('dad', 'idle', false)
	end
end