local angleshit = 1;
local anglevar = 12;
function onStartCountdown()
	setTextFont('scoreTxt', 'comic-sans-ms.ttf')
	setTextFont('timeTxt', 'comic-sans-ms.ttf')
	setTextFont('botplayTxt', 'comic-sans-ms.ttf')
	if not downscroll then
		setProperty('timeTxt.y', 10)
	else
		setProperty('timeTxt.y', screenHeight*0.9 + 20)
	end
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets_3D'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'antialiasing', false)
		end
	end
end

function onBeatHit()
	if curBeat % 2 == 0 then
		angleshit = anglevar;
	else
		angleshit = -anglevar;
	end
	setGraphicSize('iconP1', angleshit*10)
	setGraphicSize('iconP2', angleshit*-10)
	setProperty('iconP1.angle',angleshit*3)
	setProperty('iconP2.angle',angleshit*-3)
	doTweenAngle('turn', 'iconP1', 0, stepCrochet*0.004, 'circOut')
	doTweenX('tuin', 'iconP1', -angleshit*8, crochet*0.001, 'linear')
	doTweenAngle('tt', 'iconP2', 0, stepCrochet*0.004, 'circOut')
	doTweenX('ttrn', 'iconP2', -angleshit*8, crochet*0.001, 'linear')
	end

function onUpdate(elapsed)
	setProperty('iconP2.antialiasing', false)
	health = getProperty('health')
	if health >= 0 then
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets_3D')
			setPropertyFromGroup('opponentStrums', i, 'antialiasing', false)
		end
	end
end
	