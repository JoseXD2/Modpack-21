function onCreate()
    precacheImage('exe_redfade');
	makeLuaSprite('whoosh','SonicExe/Angel-Island/exe_redfade',0,0)
        scaleObject('whoosh', 10, 10)
	setObjectCamera('whoosh', 'other');
	setScrollFactor('whoosh', 0, 0)
end

function onEvent(name, value1)
    if name == "Red Fade" then
	
	addLuaSprite('whoosh',true)
	doTweenAlpha('whoosh', 'whoosh', 0, value1, 'linear')

	runTimer('apocolypsspef', value1);

	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'apocolypsspef' then
		removeLuaSprite('whoosh',false)
	end
end