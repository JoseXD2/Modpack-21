local tic = 1
local letter = 2
local bruh = true
local alpha = true
local loosing = false
local pos = {240, 830}
local txt = {'one', 'two'}
local allshit = {'gray', 'layer'}
local anims = {'A', 'B', 'C', 'D', 'E'}
local assets = {'revealM', 'revealC', 'Alterlayer', 'Alterlayer2', 'Alterlayer3', 'black'}

function IconFilterShit()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'cesar')
    if downscroll then
        makeAnimatedLuaSprite('cIcon', 'bg/cesariconss', 635, 15)
    else
        makeAnimatedLuaSprite('cIcon', 'bg/cesariconss', 635, 570)
    end
    addAnimationByPrefix('cIcon', 'quiet', 'cesarstill', 1, true)
    addAnimationByPrefix('cIcon', 'shakey', 'shakey', 24, true)
    setObjectCamera('cIcon', 'camHud')
    scaleObject('cIcon', 0.7, 0.7)
    addLuaSprite('cIcon', true)
    objectPlayAnimation('cIcon', 'quiet', true)

    makeAnimatedLuaSprite('vintage', 'bg/vintage', -200, -350)
    scaleObject('vintage', 3, 3)
    addAnimationByPrefix('vintage', 'idle', 'idle', 16, true)
    objectPlayAnimation('vintage', 'idle', true)
    setBlendMode('vintage', 'lighten')
    setObjectCamera('vintage', 'camHud')
    setProperty('vintage.alpha', 0.3)
    addLuaSprite('vintage', true)

    makeAnimatedLuaSprite('eyeV', 'bg/vintage', -200, -350)
    scaleObject('eyeV', 3, 3)
    addAnimationByPrefix('eyeV', 'idle', 'idle', 16, true)
    objectPlayAnimation('eyeV', 'idle', true)
    --setBlendMode('eyeV', 'add')
    setObjectCamera('eyeV', 'camHud')
    setProperty('eyeV.alpha', 0)
    addLuaSprite('eyeV', true)
end

function preCacheShit()
    for i = 1,#assets do
        precacheImage(assets[i])
    end
    precacheSound('boomend')
end

function onCreate()
    makeLuaText('mark', 'Mark Heathcliff', '424', 180, 150)
    setTextAlignment('mark', 'left')
    setTextSize('mark', '40')
    setProperty('mark.alpha', 0)
    makeLuaText('cesar', 'Cesar Torres', '424', 810, 150)
    setTextAlignment('cesar', 'left')
    setTextSize('cesar', '40')
    setProperty('cesar.alpha', 0)

    preCacheShit()

    IconFilterShit()

    makeLuaSprite('gray2', 'bg/gray', -300, -300)
    scaleObject('gray2', 10, 10)
    addLuaSprite('gray2', true)
    setProperty('gray2.alpha', 0.08)

    setProperty('iconP1.alpha', 0)

    addLuaText('mark')
    addLuaText('cesar')

    --setBlendMode('vintage', 'darken')

    for i = 1,2 do
        makeLuaText('Victim'..i, 'victim ' .. txt[i], 324, pos[i], 150)
        setTextAlignment('Victim'..i, 'left')
        setTextSize('Victim'..i, '40')
        setProperty('Victim'..i..'.alpha', 0)
        addLuaText('Victim'..i)
    end
end

function onUpdate(elapsed)
    if bruh == true then
        setProperty('gf.alpha', 0)
    end
    if alpha == true then
        for i = 0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
    end

    setProperty('cIcon.x', 635 - 290 * (getProperty('health')-1))

    if getProperty('health') < 0.5 and loosing == false then
        objectPlayAnimation('cIcon', 'shakey', false)
        loosing = true
    elseif loosing == true and getProperty('health') >= 0.5 then
        objectPlayAnimation('cIcon', 'quiet', false)
        loosing = false
    end
end

function onSongStart()
    for i = 1,2 do
        doTweenAlpha('appear'..i, 'Victim'..i, 1, 1, 'linear')
    end

    runTimer('dissAppear', 2.0)
    runTimer('nameOneAppear', 4.0)
    runTimer('nameTwoAppear', 4.0)
    runTimer('nameOneDisappear', 6.0)
    runTimer('nameTwoDisappear', 6.0)

    bruh = false
    runTimer('alphaSHIT', 4)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'alphaSHIT' then
        alpha = false
        for i = 0,7 do
            noteTweenAlpha('noteAppear'..i, i, 0.6, 2, 'linear')
        end
    end

    if tag == 'dissAppear' then
        for i = 1,2 do
            doTweenAlpha('appear'..i, 'Victim'..i, 0, 1, 'linear')
        end
    end

    if tag == 'nameOneAppear' then
            doTweenAlpha('nameOneAppear', 'mark', 1, 1.5, 'linear')
        end

    if tag == 'nameTwoAppear' then
            doTweenAlpha('nameTwoAppear', 'cesar', 1, 1.5, 'linear')
        end

    if tag == 'nameOneDisappear' then
            doTweenAlpha('nameOneDisappear', 'mark', 0, 1, 'linear')
        end

    if tag == 'nameTwoDisappear' then
            doTweenAlpha('nameTwoDisappear', 'cesar', 0, 1, 'linear')
        end

    if tag == 'WHOAREYOU' then
        setProperty('revealC.x', 690)
        setProperty('revealC.y', -30 - 7 * (loops - loopsLeft))
        if tic == 1 then
            setProperty('black.alpha', 1)
            tic = 2
        elseif tic == 2 then
            setProperty('black.alpha', 0)
            objectPlayAnimation('revealC', anims[letter], true)
            letter = letter + 1
            tic = 1
        end

        if loopsLeft == 0 then
            playSound('boomend')
            setProperty('revealC.x', 730)
            setProperty('revealC.y', -220)
            scaleObject('revealC', 1, 1.3)
            setProperty('Alterlayer.alpha', 0)
            setProperty('AlterlayerB.alpha', 1)
            runTimer('eyes', 2.6)
        end
    end

    if tag == 'eyes' then
        setProperty('black.alpha', 1)
        makeLuaSprite('eyes', 'bg/eyes', 740, 30)
        addLuaSprite('eyes', true)
    end
end

function onStepHit()
    if curStep == 1334 then
        nothingIsWorthTheRisk()
    end

end

function nothingIsWorthTheRisk()
    setProperty('camHUD.alpha', 0)
    for i = 0,7 do
        setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
    end

    setProperty('dad.alpha', 0)
    setProperty('boyfriend.alpha', 0)

    for i = 1,#allshit do
        removeLuaSprite(allshit[i], true)
    end

    makeLuaSprite('revealM', 'bg/revealM', 100, 100)
    addLuaSprite('revealM', true)

    makeLuaSprite('Alterlayer', 'bg/layerNORMAL', -540, -725)
    addLuaSprite('Alterlayer', true)
    scaleObject('Alterlayer', 4, 4)

    makeLuaSprite('AlterlayerB', 'bg/Alterlayer', -540, -725)
    setProperty('AlterlayerB.alpha', 0)
    addLuaSprite('AlterlayerB', true)
    scaleObject('AlterlayerB', 4, 4)


    makeAnimatedLuaSprite('revealC', 'bg/revealC', 770, 100)
    for i = 1,5 do
        addAnimationByPrefix('revealC', anims[i], anims[i], 24, true)
    end
    addLuaSprite('revealC', true)
    objectPlayAnimation('revealC', 'A', true)


    makeLuaSprite('Alterlayer2', 'bg/Alterlayer2', -540, -725)
    setProperty('Alterlayer2.alpha', 0)
    addLuaSprite('Alterlayer2', true)
    scaleObject('Alterlayer2', 4, 4)

    makeLuaSprite('Alterlayer3', 'bg/Alterlayer3', -540, -725)
    setProperty('Alterlayer3.alpha', 0)
    addLuaSprite('Alterlayer3', true)
    scaleObject('Alterlayer3', 4, 4)


    makeLuaSprite('black', 'bg/black', -540, -725)
    scaleObject('black', 2, 2)
    setProperty('black.alpha', 0.01)
    addLuaSprite('black', true)

    runTimer('WHOAREYOU', 0.15, 8)

    makeAnimatedLuaSprite('Vint', 'bg/vintage', -200, -350)
    scaleObject('Vint', 3, 3)
    addAnimationByPrefix('Vint', 'idle', 'idle', 16, true)
    objectPlayAnimation('Vint', 'idle', true)
    setBlendMode('Vint', 'lighten')
    setObjectCamera('Vint', 'camGame')
    setProperty('Vint.alpha', 0.3)
    addLuaSprite('Vint', true)
end

function onGameOver()
    alpha = false
    return Function_Continue;
end