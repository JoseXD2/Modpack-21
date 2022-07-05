function onCreate()

                -- button for poor mobile players 

                makeAnimatedLuaSprite('e', 'virtualbuttons', 0, 588);
                addAnimationByPrefix('e', 'e', 'e', 24, false);
	        addAnimationByPrefix('e', 'ePress', 'ePressed', 24, false);
	        setObjectCamera('e', 'other')

end

function onUpdate()

    if (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 132) and (getMouseY('camHUD') > 588 and getMouseY('camHUD') < 720 and mouseClicked('left')) or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ESCAPE') and songName == 'Last Song Stats' then
		endSong()
	end

end