function onBeatHit()
	--for every beat
	health = getProperty('health')
	if getProperty('health') > 0.4 then
		setProperty('health', health- 0.01);
	end
end

function onStepHit()

    if curStep == 1 then

       setProperty('defaultCamZoom',1.04)

	end
end
