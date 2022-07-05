
function onCreate()
	-- main stage and sky
	makeLuaSprite('HalloweenBg', 'modchart/Halloweenbg', -600, -300);
	setScrollFactor('HalloweenBg', 0.9, 0.9);
	scaleObject('HalloweenBg', 1.3, 1.3)

	makeLuaSprite('skybg', 'modchart/god_bg', 270, 0);
	setScrollFactor('skybg', 0.9, 0.9);
	scaleObject('skybg', 0.55, 0.55)

	makeLuaSprite('island', 'modchart/islandThing', 670, 590);
	setScrollFactor('island', 0.9, 0.9);
	scaleObject('island', 1.1, 1.1)

	addLuaSprite('HalloweenBg', false);
	addLuaSprite('skybg', false)
	addLuaSprite('island', false)
	setProperty('island.visible', false)
	setProperty('skybg.visible', false)

end
-- events fo da stage
function onEvent(name, value1, value2)
	if name == 'Play Animation' then
		if value1 == 'fire' then
			cameraFlash('game', 'FFFFFF', 1, false)
			setProperty('HalloweenBg.visible', false)
			setProperty('island.visible', true)
			setProperty('skybg.visible', true)
			triggerEvent('Change Character', 0 , 'bf')
			triggerEvent('Change Character', 2 , 'gf')
			triggerEvent('Change Character', 1 , 'spooky')
			triggerEvent('Camera Follow Pos', 1170, 570)
			noteTweenX('erg', 0, 730, 0.4, 'linear')
			noteTweenX('eijr', 1, 840, 0.4, 'linear')
			noteTweenX('ejr', 2, 955, 0.4, 'linear')
			noteTweenX('fgdfg', 3, 1070, 0.4, 'linear')
			noteTweenX('ncxm', 4, 90, 0.4, 'linear')
			noteTweenX('xvc', 5, 200, 0.4, 'linear')
			noteTweenX('mbf', 6, 320, 0.4, 'linear')
			noteTweenX('sddfoj', 7, 430, 0.4, 'linear')
			setProperty('corruptBG.visible', false)
			setProperty('gf.visible', false)
			setProperty('dad.x', 1070)
		end

		if value1 == 'unfire' then
			cameraFlash('game', 'FFFFFF', 1, false)
			setProperty('HalloweenBg.visible', true)
			setProperty('gf.visible', true)
			setProperty('island.visible', false)
			setProperty('skybg.visible', false)
			setProperty('dad.x', 100)
			triggerEvent('Camera Follow Pos','','')
			noteTweenX('erg', 4, 730, 0.4, 'linear')
			noteTweenX('eijr', 5, 840, 0.4, 'linear')
			noteTweenX('ejr', 6, 955, 0.4, 'linear')
			noteTweenX('fgdfg', 7, 1070, 0.4, 'linear')
			noteTweenX('ncxm', 0, 90, 0.4, 'linear')
			noteTweenX('xvc', 1, 200, 0.4, 'linear')
			noteTweenX('mbf', 2, 320, 0.4, 'linear')
			noteTweenX('sddfoj', 3, 430, 0.4, 'linear')
		end

		if value1 == 'fireAlone' then
			cameraFlash('game', 'FFFFFF', 1, false)
			setProperty('HalloweenBg.visible', false)
			setProperty('gf.visible', false)
			setProperty('island.visible', false)
			setProperty('skybg.visible', false)
			setProperty('dad.x', 2000)
			triggerEvent('Camera Follow Pos', 980 , 600)
			noteTweenX('erg', 4, 410, 0.0001, 'linear')
			noteTweenX('eijr', 5, 520, 0.0001, 'linear')
			noteTweenX('ejr', 6, 635, 0.0001, 'linear')
			noteTweenX('fgdfg', 7, 750, 0.0001, 'linear')
			noteTweenX('ncxm', 0, 1590, 0.0001, 'linear')
			noteTweenX('xvc', 1, 1700, 0.0001, 'linear')
			noteTweenX('mbf', 2, 1820, 0.0001, 'linear')
			noteTweenX('sddfoj', 3, 1930, 0.0001, 'linear')
                end
	end

end