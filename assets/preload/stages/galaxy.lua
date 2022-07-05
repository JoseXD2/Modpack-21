function onCreate()
	makeLuaSprite('galaxy', 'Gapple/galaxy', -1475, -775);
	scaleObject('galaxy', 3.5, 3.5);
	addLuaSprite('galaxy', false)
end

function onStartCountdown()
	doTweenAngle('anglelele', 'galaxy', 14040, 205, 'linear');
end