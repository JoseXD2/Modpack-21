function onEvent(name, value1, value2)
	if name == "ScreenRotHUD" then
		if value2 == nil then
			value2 = 0.005
		end
		
		doTweenAngle('turn', 'camHUD', value1, value2, 'circOut')
	end
end