function onUpdate(elapsed)
songPos = getSongPosition()
local currentBeat = (songPos/300)*(curBpm/100)
local currentBeat2 = (songPos/1234)*(curBpm/100)
setCharacterY('dad',getCharacterY('dad') + (math.sin(currentBeat) * 1.6))

function opponentNoteHit(id, direction, noteType, isSustainNote)
cameraShake(game, 0.015, 0.15)

end
function goodNoteHit(id, direction, noteType, isSustainNote)

cameraShake(game, 0.0015, 0.15)

function noteMiss(direction)
    setProperty('health', getProperty('health') + 0)
    end
    function noteMissPress(direction)
    setProperty('health', getProperty('health') + 0)
    end
end
end
local angleshit = 2;
local anglevar = 2;

function onBeatHit()
	if curBeat < 989898 then

    	if curBeat %1 == 0 then
            doTweenY('ass', 'camHUD', -angleshit*20, crochet*0.003, 'quadinOut')
			doTweenAngle('Asd', 'camHUD', -angleshit*1, crochet*0.002, 'quadinOut')
		doTweenX('tuin', 'camHUD', -angleshit*10, crochet*0.001, 'quadinOut')
  end	
  if curBeat %2 == 0 then
    doTweenY('ass', 'camHUD', angleshit*20, crochet*0.003, 'quadinOut')
	doTweenAngle('Asd', 'camHUD', angleshit*1, crochet*0.002, 'quadinOut')
	doTweenX('tuin', 'camHUD', angleshit*1, crochet*0.001, 'quadinOut')
end	
end
end
