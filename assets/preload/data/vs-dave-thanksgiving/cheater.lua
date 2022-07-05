function onCreate()

        makeAnimatedLuaSprite('y', 'virtualbuttons', 0, 588);
        addAnimationByPrefix('y', 'y', 'y', 24, false);
	addAnimationByPrefix('y', 'yPress', 'yPressed', 24, false);
	addLuaSprite('y', true);
	setObjectCamera('y', 'other')

         makeLuaText('Ch', 'Cheater!!!!!!!!!', 600, 360)
         setTextSize('Ch', '15')
         setTextColor('Ch', 'ff0000')
         setProperty('Ch.alpha', 0)
         addLuaText('Ch', true)
end
         
function onUpdate()

    if (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 132) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) then
        setProperty('cpuControlled', true)
         setProperty('Ch.alpha', 1)
         objectPlayAnimation('y', 'yPress', false);
    end
end