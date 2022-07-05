function onBeatHit()
	if getProperty('curBeat') == 198 then
		setProperty('defaultCamZoom', 0.95)
		setProperty('cameraSpeed', 1.8)
	end
	if getProperty('curBeat') == 327 then
		doTweenAlpha('hudAlpha', 'camHUD', 0, 0.4, 'linear');
		setProperty('defaultCamZoom', 0.95)
		triggerEvent('Camera Follow Pos',460,460)
	end
	if getProperty('curBeat') == 357 then
		doTweenAlpha('hudAlpha', 'camHUD', 255, 0.4, 'linear')
		setProperty('defaultCamZoom', 1.0)
	end
end