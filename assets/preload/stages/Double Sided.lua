function onCreate()
	screenWidthV = getPropertyFromClass('FlxG', 'width')
	makeLuaSprite('Henron BG', 'bundix/Henron BG', -2000, -1000);
	setLuaSpriteScrollFactor('Henron BG', 0.9, 0.9);
	addLuaSprite('Henron BG', false)
	scaleObject('Henron BG', 3.2, 3.2)
	addGlitchEffect('Henron BG', 2, 2)
end

function onStepHit()
	if curStep == 2176 then
		makeLuaSprite('Dundio BG', 'bundix/Dundio BG', -2000, -1000);
		setLuaSpriteScrollFactor('Dundio BG', 0.9, 0.9);
		addLuaSprite('Dundio BG', false)
		scaleObject('Dundio BG', 3.2, 3.2)
		addGlitchEffect('Dundio BG', 2, 2)
	end
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
