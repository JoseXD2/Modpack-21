-- EXPERIMENTAL MIGHT NOT COME TO FULL VERSION
function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.05 then
        setProperty('health', health- 0.0085);
    end
end