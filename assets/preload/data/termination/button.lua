function onCreate()

	makeAnimatedLuaSprite('dodge', 'virtualbuttons', 1150, 582.5);
	addAnimationByPrefix('dodge', 'anonPress', 'anonPress', 24, false);
	addAnimationByPrefix('dodge', 'aPressed', 'aPressed', 12, false);
	addLuaSprite('dodge', false);
	setObjectCamera('dodge', 'other');

	makeAnimatedLuaSprite('hey', 'virtualbuttons', 0, 582.5);
	addAnimationByPrefix('hey', 'bnonPress', 'bnonPress', 24, false);
	addAnimationByPrefix('hey', 'bPressed', 'bPressed', 12, false);
	addLuaSprite('hey', false);
	setObjectCamera('hey', 'other');

end

function onUpdate()
	if (getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mousePressed('left')) or keyReleased('space') then
		objectPlayAnimation('dodge', 'aPressed', false);
	else
		objectPlayAnimation('dodge', 'anonPress', false);
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') or (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 132) and (getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mouseReleased('left')) then
		playSound('HEY', 0.7);
                characterPlayAnim('boyfriend', 'hey', '24', true);
                setProperty('boyfriend.specialAnim', true);
		objectPlayAnimation('hey', 'bPressed', false);
	else
		objectPlayAnimation('hey', 'bnonPress', false);
	end
end
