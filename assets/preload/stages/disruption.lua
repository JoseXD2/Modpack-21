function onCreate()
	makeLuaSprite('disruptor', 'disruption/disruptor', -1475, -775);
	scaleObject('disruptor', 3.5, 3.5);
	addLuaSprite('disruptor', false)
end

function onStartCountdown()
	doTweenAngle('anglelele', 'disruptor', 14040, 205, 'linear');
end