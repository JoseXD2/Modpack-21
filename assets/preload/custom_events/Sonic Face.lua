function onCreate()
	makeLuaSprite('jumps', 'SonicExe/simplejump', -125, -50);
	setScrollFactor('jumps', 0, 0);
	setObjectCamera('jumps', 'other');
	scaleObject('jumps',1.6,1.6)
	addLuaSprite('jumps',true)
	setProperty('jumps.visible', false)
end

function onEvent(name, value1)
    if name == "Sonic Face" then
		playSound('sppok', 1)
		setProperty('jumps.visible', true)
		runTimer('jummpu', 0.18);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'jummpu' then
		setProperty('jumps.visible', false)
	end
end