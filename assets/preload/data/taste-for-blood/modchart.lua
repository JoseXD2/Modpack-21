function onCreate() 
    precacheImage('characters/sonic_dark')
	setProperty('gfGroup.visible', true)
	end

function onStepHit()

	
	if curStep >= 16 then
		setProperty('camHUD.visible', false);
	end

	if curStep >= 128 then
		setProperty('camHUD.visible', true);
	end

	if curStep >= 144 then
		
		noteTweenX('bfTween1', 4, 90, 0.2, 'linear');
		noteTweenX('bfTween2', 5, 205, 0.2, 'linear');
		noteTweenX('bfTween3', 6, 315, 0.2, 'linear');
		noteTweenX('bfTween4', 7, 425, 0.2, 'linear');
		noteTweenX('dadTween1', 0, 730, 0.2, 'linear');
		noteTweenX('dadTween2', 1, 845, 0.2, 'linear');
		noteTweenX('dadTween3', 2, 955, 0.2, 'linear');
		noteTweenX('dadTween4', 3, 1065, 0.2, 'linear');
	end

	if curStep >= 163 then

		for i=0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'downScroll', false)
	   	end
		
		noteTweenY('bfTween1', 0, 50, 0.2, cubeInOut)
		noteTweenY('bfTween2', 1, 50, 0.2, cubeInOut)
		noteTweenY('bfTween3', 2, 50, 0.2, cubeInOut)
		noteTweenY('bfTween4', 3, 50, 0.2, cubeInOut)
		noteTweenY('dadTween1', 4, 50, 0.2, cubeInOut)
		noteTweenY('dadTween2', 5, 50, 0.2, cubeInOut)
		noteTweenY('dadTween3', 6, 50, 0.2, cubeInOut)
		noteTweenY('dadTween4', 7, 50, 0.2, cubeInOut)
	end

	if curStep >= 196 then

		for i=0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'downScroll', true)
	   	end
		
		noteTweenY('bfTween1', 0, 570, 0.2, cubeInOut)
		noteTweenY('bfTween2', 1, 570, 0.2, cubeInOut)
		noteTweenY('bfTween3', 2, 570, 0.2, cubeInOut)
		noteTweenY('bfTween4', 3, 570, 0.2, cubeInOut)
		noteTweenY('dadTween1', 4, 570, 0.2, cubeInOut)
		noteTweenY('dadTween2', 5, 570, 0.2, cubeInOut)
		noteTweenY('dadTween3', 6, 570, 0.2, cubeInOut)
		noteTweenY('dadTween4', 7, 570, 0.2, cubeInOut)
	end

	if curStep >= 228 then

		noteTweenX('dadTween1', 0, 90, 0.2, 'linear');
		noteTweenX('dadTween2', 1, 205, 0.2, 'linear');
		noteTweenX('dadTween3', 2, 315, 0.2, 'linear');
		noteTweenX('dadTween4', 3, 425, 0.2, 'linear');
		noteTweenX('bfTween1', 4, 730, 0.2, 'linear');
		noteTweenX('bfTween2', 5, 845, 0.2, 'linear');
		noteTweenX('bfTween3', 6, 955, 0.2, 'linear');
		noteTweenX('bfTween4', 7, 1065, 0.2, 'linear');
	end

	if curStep >= 292 then

		for i=0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'downScroll', false)
	   	end
		
		noteTweenY('bfTween1', 0, 50, 0.2, cubeInOut)
		noteTweenY('bfTween2', 1, 50, 0.2, cubeInOut)
		noteTweenY('bfTween3', 2, 50, 0.2, cubeInOut)
		noteTweenY('bfTween4', 3, 50, 0.2, cubeInOut)
		noteTweenY('dadTween1', 4, 50, 0.2, cubeInOut)
		noteTweenY('dadTween2', 5, 50, 0.2, cubeInOut)
		noteTweenY('dadTween3', 6, 50, 0.2, cubeInOut)
		noteTweenY('dadTween4', 7, 50, 0.2, cubeInOut)
	end

	if curStep >= 323 then

		for i=0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'downScroll', true)
	   	end
		
		noteTweenY('bfTween1', 0, 570, 0.2, cubeInOut)
		noteTweenY('bfTween2', 1, 570, 0.2, cubeInOut)
		noteTweenY('bfTween3', 2, 570, 0.2, cubeInOut)
		noteTweenY('bfTween4', 3, 570, 0.2, cubeInOut)
		noteTweenY('dadTween1', 4, 570, 0.2, cubeInOut)
		noteTweenY('dadTween2', 5, 570, 0.2, cubeInOut)
		noteTweenY('dadTween3', 6, 570, 0.2, cubeInOut)
		noteTweenY('dadTween4', 7, 570, 0.2, cubeInOut)
	end

	if curStep >= 356 then
    	noteTweenX('bfTween1', 4, 432, 0.2, 'linear');
    	noteTweenX('bfTween2', 5, 540, 0.2, 'linear');
    	noteTweenX('bfTween3', 6, 645, 0.2, 'linear');
    	noteTweenX('bfTween4', 7, 750, 0.2, 'linear');

		noteTweenX('dadTween1', 0, 432, 0.2, 'linear');
    	noteTweenX('dadTween2', 1, 540, 0.2, 'linear');
    	noteTweenX('dadTween3', 2, 645, 0.2, 'linear');
    	noteTweenX('dadTween4', 3, 750, 0.2, 'linear');

		noteTweenAlpha("yes", 0, 0.2, 0.2, "linear")
        noteTweenAlpha("yes2", 1, 0.2, 0.2, "linear")
        noteTweenAlpha("yes3", 2, 0.2, 0.2, "linear")
        noteTweenAlpha("yes4", 3, 0.2, 0.2, "linear")
	end

	if curStep >= 528 then

		for i=0, 3 do
			setPropertyFromGroup('strumLineNotes', i, 'downScroll', false)
	   	end
		
		noteTweenY('dadTween1', 0, 50, 0.2, cubeInOut)
		noteTweenY('dadTween2', 1, 50, 0.2, cubeInOut)
		noteTweenY('dadTween3', 2, 50, 0.2, cubeInOut)
		noteTweenY('dadTween4', 3, 50, 0.2, cubeInOut)

		noteTweenAlpha("yes", 0, 1, 0.2, "linear")
        noteTweenAlpha("yes2", 1, 1, 0.2, "linear")
        noteTweenAlpha("yes3", 2, 1, 0.2, "linear")
        noteTweenAlpha("yes4", 3, 1, 0.2, "linear")
	end

	if curStep >= 635 then

		for i=0, 3 do
			setPropertyFromGroup('strumLineNotes', i, 'downScroll', false)
	   	end

		noteTweenX('bfTween1', 4, 90, 0.2, 'linear');
		noteTweenX('bfTween2', 5, 205, 0.2, 'linear');
		noteTweenX('bfTween3', 6, 315, 0.2, 'linear');
		noteTweenX('bfTween4', 7, 425, 0.2, 'linear');
		noteTweenX('dadTween1', 0, 730, 0.2, 'linear');
		noteTweenX('dadTween2', 1, 845, 0.2, 'linear');
		noteTweenX('dadTween3', 2, 955, 0.2, 'linear');
		noteTweenX('dadTween4', 3, 1065, 0.2, 'linear');
	end

	if curStep >= 657 then
		
		noteTweenAngle("sus1", 0, 360, 0.2, "linear")
		noteTweenAngle("sus2", 1, 360, 0.2, "linear")
		noteTweenAngle("sus3", 2, 360, 0.2, "linear")
		noteTweenAngle("sus4", 3, 360, 0.2, "linear")
		noteTweenAngle("sus5", 4, 360, 0.2, "linear")
		noteTweenAngle("sus6", 5, 360, 0.2, "linear")
		noteTweenAngle("sus7", 6, 360, 0.2, "linear")
		noteTweenAngle("sus8", 7, 360, 0.2, "linear")

		noteTweenX("dadTween1", 0, 955, 0.2, cubeInOut)
		noteTweenX("dadTween2", 1, 728, 0.2, cubeInOut)
		noteTweenX("dadTween3", 2, 1070, 0.2, cubeInOut)
		noteTweenX("dadTween4", 3, 840, 0.2, cubeInOut)
	end

	if curStep >= 784 then
		
		noteTweenAngle("sus1", 0, 360, 0.2, "linear")
		noteTweenAngle("sus2", 1, 360, 0.2, "linear")
		noteTweenAngle("sus3", 2, 360, 0.2, "linear")
		noteTweenAngle("sus4", 3, 360, 0.2, "linear")
		noteTweenAngle("sus5", 4, 360, 0.2, "linear")
		noteTweenAngle("sus6", 5, 360, 0.2, "linear")
		noteTweenAngle("sus7", 6, 360, 0.2, "linear")
		noteTweenAngle("sus8", 7, 360, 0.2, "linear")

		noteTweenX('dadTween1', 0, 90, 0.2, 'linear');
		noteTweenX('dadTween2', 1, 205, 0.2, 'linear');
		noteTweenX('dadTween3', 2, 315, 0.2, 'linear');
		noteTweenX('dadTween4', 3, 425, 0.2, 'linear');
		noteTweenX("bfTween1", 4, 955, 0.2, cubeInOut)
		noteTweenX("bfTween2", 5, 728, 0.2, cubeInOut)
		noteTweenX("bfTween3", 6, 1070, 0.2, cubeInOut)
		noteTweenX("bfTween4", 7, 840, 0.2, cubeInOut)
	end

	if curStep >= 912 then
		
		 for i=4, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'downScroll', false)
	   	end
		
		noteTweenY('bfTween1', 4, 50, 0.2, cubeInOut)
		noteTweenY('bfTween2', 5, 50, 0.2, cubeInOut)
		noteTweenY('bfTween3', 6, 50, 0.2, cubeInOut)
		noteTweenY('bfTween4', 7, 50, 0.2, cubeInOut)
	end

	if curStep >= 920 then
	   
	   noteTweenX('bfTween1', 4, 90, 0.2, 'linear');
	   noteTweenX('bfTween2', 5, 205, 0.2, 'linear');
	   noteTweenX('bfTween3', 6, 315, 0.2, 'linear');
	   noteTweenX('bfTween4', 7, 425, 0.2, 'linear');
	   noteTweenX('dadTween1', 0, 730, 0.2, 'linear');
	   noteTweenX('dadTween2', 1, 845, 0.2, 'linear');
	   noteTweenX('dadTween3', 2, 955, 0.2, 'linear');
	   noteTweenX('dadTween4', 3, 1065, 0.2, 'linear');
   end

	if curStep >= 1220 then
		
		for i=0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'downScroll', true)
	   	end
		
		noteTweenY('bfTween1', 0, 570, 0.2, cubeInOut)
		noteTweenY('bfTween2', 1, 570, 0.2, cubeInOut)
		noteTweenY('bfTween3', 2, 570, 0.2, cubeInOut)
		noteTweenY('bfTween4', 3, 570, 0.2, cubeInOut)
		noteTweenY('dadTween1', 4, 570, 0.2, cubeInOut)
		noteTweenY('dadTween2', 5, 570, 0.2, cubeInOut)
		noteTweenY('dadTween3', 6, 570, 0.2, cubeInOut)
		noteTweenY('dadTween4', 7, 570, 0.2, cubeInOut)
	end

	if curStep >= 1252 then

		for i=0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'downScroll', false)
	   	end
		
		noteTweenY('bfTween1', 0, 50, 0.2, cubeInOut)
		noteTweenY('bfTween2', 1, 50, 0.2, cubeInOut)
		noteTweenY('bfTween3', 2, 50, 0.2, cubeInOut)
		noteTweenY('bfTween4', 3, 50, 0.2, cubeInOut)
		noteTweenY('dadTween1', 4, 50, 0.2, cubeInOut)
		noteTweenY('dadTween2', 5, 50, 0.2, cubeInOut)
		noteTweenY('dadTween3', 6, 50, 0.2, cubeInOut)
		noteTweenY('dadTween4', 7, 50, 0.2, cubeInOut)
	end

	if curStep >= 1283 then
		
		noteTweenX('dadTween1', 0, 90, 0.2, 'linear');
		noteTweenX('dadTween2', 1, 205, 0.2, 'linear');
		noteTweenX('dadTween3', 2, 315, 0.2, 'linear');
		noteTweenX('dadTween4', 3, 425, 0.2, 'linear');
		noteTweenX('bfTween1', 4, 730, 0.2, 'linear');
		noteTweenX('bfTween2', 5, 845, 0.2, 'linear');
		noteTweenX('bfTween3', 6, 955, 0.2, 'linear');
		noteTweenX('bfTween4', 7, 1065, 0.2, 'linear');
	end

	if curStep >= 1348 then
		
		for i=0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'downScroll', true)
	   	end
		
		noteTweenY('bfTween1', 0, 570, 0.2, cubeInOut)
		noteTweenY('bfTween2', 1, 570, 0.2, cubeInOut)
		noteTweenY('bfTween3', 2, 570, 0.2, cubeInOut)
		noteTweenY('bfTween4', 3, 570, 0.2, cubeInOut)
		noteTweenY('dadTween1', 4, 570, 0.2, cubeInOut)
		noteTweenY('dadTween2', 5, 570, 0.2, cubeInOut)
		noteTweenY('dadTween3', 6, 570, 0.2, cubeInOut)
		noteTweenY('dadTween4', 7, 570, 0.2, cubeInOut)
	end

	if curStep >= 1380 then

		for i=0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'downScroll', false)
	   	end
		
		noteTweenY('bfTween1', 0, 50, 0.2, cubeInOut)
		noteTweenY('bfTween2', 1, 50, 0.2, cubeInOut)
		noteTweenY('bfTween3', 2, 50, 0.2, cubeInOut)
		noteTweenY('bfTween4', 3, 50, 0.2, cubeInOut)
		noteTweenY('dadTween1', 4, 50, 0.2, cubeInOut)
		noteTweenY('dadTween2', 5, 50, 0.2, cubeInOut)
		noteTweenY('dadTween3', 6, 50, 0.2, cubeInOut)
		noteTweenY('dadTween4', 7, 50, 0.2, cubeInOut)
	end

	if curStep >= 1412 then
    	noteTweenX('bfTween1', 4, 432, 0.2, 'linear');
    	noteTweenX('bfTween2', 5, 540, 0.2, 'linear');
    	noteTweenX('bfTween3', 6, 645, 0.2, 'linear');
    	noteTweenX('bfTween4', 7, 750, 0.2, 'linear');

		noteTweenX('dadTween1', 0, 432, 0.2, 'linear');
    	noteTweenX('dadTween2', 1, 540, 0.2, 'linear');
    	noteTweenX('dadTween3', 2, 645, 0.2, 'linear');
    	noteTweenX('dadTween4', 3, 750, 0.2, 'linear');

		noteTweenAlpha("yes", 0, 0.2, 0.2, "linear")
        noteTweenAlpha("yes2", 1, 0.2, 0.2, "linear")
        noteTweenAlpha("yes3", 2, 0.2, 0.2, "linear")
        noteTweenAlpha("yes4", 3, 0.2, 0.2, "linear")
	end

	if curStep >= 1632 then

		for i=0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'downScroll', false)
	   	end
		
		noteTweenY('bfTween1', 0, 50, 0.2, cubeInOut)
		noteTweenY('bfTween2', 1, 50, 0.2, cubeInOut)
		noteTweenY('bfTween3', 2, 50, 0.2, cubeInOut)
		noteTweenY('bfTween4', 3, 50, 0.2, cubeInOut)
		noteTweenY('dadTween1', 4, 50, 0.2, cubeInOut)
		noteTweenY('dadTween2', 5, 50, 0.2, cubeInOut)
		noteTweenY('dadTween3', 6, 50, 0.2, cubeInOut)
		noteTweenY('dadTween4', 7, 50, 0.2, cubeInOut)
	end

	if curStep >= 1808 then
		
		for i=0, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'downScroll', true)
	   	end
		
		noteTweenY('bfTween1', 0, 570, 0.2, cubeInOut)
		noteTweenY('bfTween2', 1, 570, 0.2, cubeInOut)
		noteTweenY('bfTween3', 2, 570, 0.2, cubeInOut)
		noteTweenY('bfTween4', 3, 570, 0.2, cubeInOut)
		noteTweenY('dadTween1', 4, 570, 0.2, cubeInOut)
		noteTweenY('dadTween2', 5, 570, 0.2, cubeInOut)
		noteTweenY('dadTween3', 6, 570, 0.2, cubeInOut)
		noteTweenY('dadTween4', 7, 570, 0.2, cubeInOut)
	end

	if curStep >= 1808 then
		
		for i=4, 7 do
			setPropertyFromGroup('strumLineNotes', i, 'downScroll',  false)
	   	end
		

		noteTweenY('dadTween1', 4, 50, 0.2, cubeInOut)
		noteTweenY('dadTween2', 5, 50, 0.2, cubeInOut)
		noteTweenY('dadTween3', 6, 50, 0.2, cubeInOut)
		noteTweenY('dadTween4', 7, 50, 0.2, cubeInOut)

		noteTweenAlpha("yes", 0, 1, 0.2, "linear")
        noteTweenAlpha("yes2", 1, 1, 0.2, "linear")
        noteTweenAlpha("yes3", 2, 1, 0.2, "linear")
        noteTweenAlpha("yes4", 3, 1, 0.2, "linear")
	end
end

function opponentNoteHit()
	health = getProperty('health')
 if getProperty('health') > 0.1 then
	setProperty('health', health- 0.01);
 end

 	triggerEvent('Screen Shake', '0.05, 0.01', '0, 0');
end

function onUpdate()
	setPropertyFromClass('ClientPrefs', 'middleScroll', false);
	setPropertyFromClass('ClientPrefs', 'upscroll', false);

	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.O') then
		setPropertyFromClass('ClientPrefs', 'ghostTapping', false);
		restartSong(true)
		return Function_Stop
	end

	setProperty('healthBar.visible', false);
    	setProperty('healthBarBG.visible', false);
    	setProperty('iconP1.visible', false);
    	setProperty('iconP2.visible', false);
    	setProperty("doof.visible", false)
    	setProperty('timeBarBG.visible', false)
    	setProperty('timeBar.visible', false)
	setProperty('scoreTxt.visible', false)

	setPropertyFromClass("Main", "fpsVar.visible", false)	
    setPropertyFromClass('ClientPrefs', 'downScroll', true);
end