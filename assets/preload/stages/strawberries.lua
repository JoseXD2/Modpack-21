function onCreate()
	makeLuaSprite('strawberries', 'Gapple/ocs/strawberries', -1475, -775);
	scaleObject('strawberries', 3.5, 3.5);
	addLuaSprite('strawberries', false)
end

function onStartCountdown()
	doTweenAngle('anglelele', 'strawberries', 14040, 205, 'linear');
end