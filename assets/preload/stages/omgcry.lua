
function onCreate()
	makeLuaSprite('bg','opposition/omgcry',-1600, -600)
        scaleObject('bg', 2, 2)
	addLuaSprite('bg',false)
end

function onStartCountdown()
	doTweenAngle('bgSPIN', 'bg', 36000, 360, 'linear');
end