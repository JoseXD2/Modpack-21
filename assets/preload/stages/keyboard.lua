function onCreate()
	makeLuaSprite('keyboard', 'Gapple/ocs/keyboard', -1475, -775);
	scaleObject('keyboard', 3.5, 3.5);
	addLuaSprite('keyboard', false)
end

function onStartCountdown()
	doTweenAngle('anglelele', 'keyboard', 14040, 205, 'linear');
end