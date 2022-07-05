poisona = 0
function onCreate()
    makeLuaText("Poison", 'Poison Level: 0', 170, tnhx, 150);
    addLuaText("Poison",0,0);
    setTextSize('Poison', 40);
    setProperty('healthBarBG.alpha', 0);
    setProperty('scoreTxt.alpha', 0);
    setTextColor('Poison', '00ff00')
    setProperty('iconP2.alpha', 0)
    setProperty('iconP1.alpha', 0)
end
function onUpdate(elapsed)
    songPos = getSongPosition()
    local currentBeat = (songPos/5000)*(curBpm/60)
    if curStep >= 512 and curStep < 639 then
        noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 70*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
        noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 70*math.sin((currentBeat+5*0.25)*math.pi), 0.5)
        noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 70*math.sin((currentBeat+6*0.25)*math.pi), 0.5)
        noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 70*math.sin((currentBeat+7*0.25)*math.pi), 0.5) 
    end           
    addChromaticAbberationEffect('dad', 0.003)
    if curStep >= 639 and curStep < 895 then
    songPos = getSongPosition()
    local currentBeat = (songPos/4000)*(curBpm/60)
        noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 110*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
        noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 110*math.sin((currentBeat+5*0.25)*math.pi), 0.5)
        noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 110*math.sin((currentBeat+6*0.25)*math.pi), 0.5)
        noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 110*math.sin((currentBeat+7*0.25)*math.pi), 0.5)   
    end
    if curStep >= 895 and curStep < 897 then
        local currentBeat = (songPos/5000)*(curBpm/60)
        noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 275*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
        noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 275*math.sin((currentBeat+5*0.25)*math.pi), 0.5)
        noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 275*math.sin((currentBeat+6*0.25)*math.pi), 0.5)
        noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 275*math.sin((currentBeat+7*0.25)*math.pi), 0.5)  
        noteTweenAngle("NoteAngle1", 4, 360, 0.3, linear)
        noteTweenAngle("NoteAngle2", 5, 360, 0.3, linear)
        noteTweenAngle("NoteAngle3", 6, 360, 0.3, linear)
        noteTweenAngle("NoteAngle4", 7, 360, 0.3, linear)
    end
    if curStep == 897 then
        noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 0*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
        noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 0*math.sin((currentBeat+5*0.25)*math.pi), 0.5)
        noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 0*math.sin((currentBeat+6*0.25)*math.pi), 0.5)
        noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 0*math.sin((currentBeat+7*0.25)*math.pi), 0.5)  
    end
    if curStep >= 1408 and curStep < 1664 then
        local currentBeat = (songPos/5000)*(curBpm/30)
		noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 372*math.sin((currentBeat+4*2)*math.pi), 1)
		noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 375*math.sin((currentBeat+14*2)*math.pi), 1)
		noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 382*math.sin((currentBeat+4*2)*math.pi), 1)
		noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 395*math.sin((currentBeat+14*2)*math.pi), 1)
    end
    if curStep == 1664 then
        noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 0*math.sin((currentBeat+4*2)*math.pi), 1)
		noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 0*math.sin((currentBeat+14*2)*math.pi), 1)
		noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 0*math.sin((currentBeat+4*2)*math.pi), 1)
		noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 0*math.sin((currentBeat+14*2)*math.pi), 1)
    end
    if curStep >= 1696 and curStep < 1952 then
        local currentBeat = (songPos/5000)*(curBpm/60)
        noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 110*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
        noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 110*math.sin((currentBeat+5*0.25)*math.pi), 0.5)
        noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 110*math.sin((currentBeat+6*0.25)*math.pi), 0.5)
        noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 110*math.sin((currentBeat+7*0.25)*math.pi), 0.5)
    end
    if curStep == 1952 then
        local currentBeat = (songPos/5000)*(curBpm/30)
        noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 0*math.sin((currentBeat+4*0.25)*math.pi), 0.5)
        noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 0*math.sin((currentBeat+5*0.25)*math.pi), 0.5)
        noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 0*math.sin((currentBeat+6*0.25)*math.pi), 0.5)
        noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 0*math.sin((currentBeat+7*0.25)*math.pi), 0.5)   
    end
    if curStep >= 2207 and curStep < 2543 then
        local currentBeat = (songPos/5000)*(curBpm/30)
        noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 - 350*math.sin((currentBeat+4*0.25)*math.pi), 1.5)
        noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 - 350*math.sin((currentBeat+5*0.25)*math.pi), 1.5)
        noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 - 350*math.sin((currentBeat+4*0.25)*math.pi), 1.5)
        noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 - 350*math.sin((currentBeat+5*0.25)*math.pi), 1.5)
    end
    if curStep == 2543 then
        noteTweenY('defaultPlayerStrumY0', 4, defaultPlayerStrumY0 - 0*math.sin((currentBeat+4*0.25)*math.pi), 1.5)
        noteTweenY('defaultPlayerStrumY1', 5, defaultPlayerStrumY1 - 0*math.sin((currentBeat+5*0.25)*math.pi), 1.5)
        noteTweenY('defaultPlayerStrumY2', 6, defaultPlayerStrumY2 - 0*math.sin((currentBeat+6*0.25)*math.pi), 1.5)
        noteTweenY('defaultPlayerStrumY3', 7, defaultPlayerStrumY3 - 0*math.sin((currentBeat+7*0.25)*math.pi), 1.5)
    end
    for Notes = 0, 3 do
        setPropertyFromGroup('opponentStrums', Notes, 'texture', 'NOTE_assets_retro')
    if not getPropertyFromGroup('unspawnNotes', Notes, 'mustPress') then
        setPropertyFromGroup('unspawnNotes', Notes, 'texture', 'NOTE_assets_retro')
    end
    setProperty('healthBar.angle', 90)
    setProperty('healthBar.x', 950)
    if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
    setProperty('healthBar.y', 300)
    
    elseif getPropertyFromClass('ClientPrefs', 'downScroll') == false then
        setProperty('healthBar.y', 410)
    end
    end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
		cameraShake('camGame', 0.01, 0.05)
        cameraShake('hud', 0.01, 0.05)
end
function goodNoteHit(id, direction, noteType, isSustainNote)
     if noteType == 'poision' then
        poisona = poisona + 1;
        setTextString("Poison", 'Poison Level: ' .. tostring(poisona))
    end
end
function onCreatePost()
	makeLuaSprite('strip', 'stripBar', getProperty('healthBarBG.x')-4, getProperty('healthBarBG.y')-1)
	setObjectCamera('strip', 'hud')
	setBlendMode('strip', 'multiply')
	setGraphicSize('strip', getProperty('strip.width')+6, getProperty('strip.height')+2)
	setObjectOrder('strip', getObjectOrder('healthBar')+1)
	addLuaSprite('strip')
end