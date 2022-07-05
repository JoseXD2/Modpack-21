function onCreate()
	screenWidthV = getPropertyFromClass('FlxG', 'width')
	makeLuaSprite('Space', 'bundix/Space', -2000, -1250);
	setLuaSpriteScrollFactor('Space', 0.9, 0.9);
	addLuaSprite('Space', false)
	scaleObject('Space', 3.2, 3.2)
	addGlitchEffect('Space', 2, 2)
end

function onUpdate(elapsed)    if curStep == 0 then

        started = true

    end

songPos = getSongPosition()

local currentBeat = (songPos/5000)*(curBpm/60)

doTweenY('opponentmove', 'dad', -0 - 75*math.sin((currentBeat+12*12)*math.pi), 2)

doTweenX('disruptor2', 'disruptor2.scale', 0 - 50*math.sin((currentBeat+1*0.1)*math.pi), 6)

doTweenY('disruptor2', 'disruptor2.scale', 0 - 31*math.sin((currentBeat+1*1)*math.pi), 6)

end