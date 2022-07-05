function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health- 0.02);
    end
end

function onCreatePost()

	addChromaticAbberationEffect('camHUD', 0.003)
	addVCREffect('camgame')
	addGlitchEffect('camHUD', 4, 4)
end
