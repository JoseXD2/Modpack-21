function onCreate()
	precacheSound('jumpscare');
	precacheSound('datOneSound');
	makeAnimatedLuaSprite('sonicsus','SonicExe/sonicJUMPSCARE',50,0)
	addAnimationByPrefix('sonicsus','spoopysnoc','sonicSPOOK',24,false)
	setScrollFactor('sonicsus', 0, 0);
	setObjectCamera('sonicsus', 'other');
	setProperty('sonicsus.visible',false)
	addLuaSprite('sonicsus',true)
end

function onEvent(name)
    if name == "Spoopy Scare" then
	
	objectPlayAnimation('sonicsus', 'spoopysnoc', true)
	setProperty('sonicsus.visible',true)
	playSound('jumpscare', 1)
	playSound('datOneSound', 1)

	runTimer('aaaaadies', 1);

	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'aaaaadies' then
		setProperty('sonicsus.visible',false)
	end
end