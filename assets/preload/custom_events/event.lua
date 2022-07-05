local defaultNotePos = {}
local spin = 5 -- how much it moves before going the other direction
 
function onSongStart()
    for i = 0, 7 do
        defaultNotePos[i] = {
            getPropertyFromGroup('strumLineNotes', i, 'x'),
            getPropertyFromGroup('strumLineNotes', i, 'y')
        }
    end
end

function onUpdate(elapsed)
        if noteType == 'angel' then
                noteTweenAlpha('NoteAlpha1', 7, 1, 0.1, elapsed)
                noteTweenAlpha('NoteAlpha2', 6, 1, 0.1, elapsed)
                noteTweenAlpha('NoteAlpha3', 5, 1, 0.1, elapsed)
                noteTweenAlpha('NoteAlpha4', 4, 1, 0.1, elapsed)
            else
                noteTweenAlpha('NoteAlpha5', 7, -1, 40, elapsed)
                noteTweenAlpha('NoteAlpha6', 6, -1, 40, elapsed)
                noteTweenAlpha('NoteAlpha7', 5, -1, 40, elapsed)
                noteTweenAlpha('NoteAlpha8', 4, -1, 40, elapsed)
        end
    local songPos = getPropertyFromClass('Conductor', 'songPosition') / 500 --How long it will take.
    
    if curStep >= 256 and curStep < 512 then
        setProperty("camHUD.angle", spin * math.sin(songPos))
    end
    
    if curStep == 512 then
        setProperty("camHUD.angle", 0)
    end
    if curStep >= 1952 and curStep < 2207 then
        setProperty("camHUD.angle", spin * math.sin(songPos))
    end
    if curStep >= 2207 and curStep < 2543 then
        local songPos = getPropertyFromClass('Conductor', 'songPosition') / 250 --How long it will take.
        setProperty("camHUD.angle", spin * math.sin(songPos))
    end
end