function onCreate()
	makeLuaSprite('mic', 'Zardy/Mic', 230, 525);
	scaleObject('mic', 0.4, 0.4);
	setProperty('mic.alpha', '0');
	addLuaSprite('mic', false);

	makeLuaSprite('hand', 'Zardy/Arm0', -2600, 500);
	scaleObject('hand', 0.8, 0.8);
	setProperty('hand.alpha', '0');
	addLuaSprite('hand', false);

	makeLuaSprite('otherHand', 'Zardy/Grab', -1250, 500);
	scaleObject('otherHand', 0.8, 0.8);
	setProperty('otherHand.alpha', '0');
	addLuaSprite('otherHand', false);

	setProperty('gf.alpha', '0');

	addCharacterToList('cableCrowPog', 'dad')
end

function onStepHit()
	if curStep == 1910 then
		doTweenAlpha('DadAlpha', 'dad', 0, 0.3, 'linear');
		doTweenAlpha('iconP2Alpha', 'iconP2', 0, 0.3, 'linear');
		doTweenAlpha('micAlpha', 'mic', 1, 0.1, 'linear');
	end
	
	if curStep == 1920 then
		triggerEvent('Change Character', 'dad', 'cableCrowPog')
		setProperty('hand.alpha', '1');
		doTweenX('handTween', 'hand', -950, 1, 'linear');
	end
	
	if curStep == 1932 then
		playSound('cable_claw_impact')
		playSound('cable_claw_retract')
		setProperty('hand.alpha', '0');
		setProperty('mic.alpha', '0');
		setProperty('otherHand.alpha', '1');
		doTweenX('otherhandTween', 'otherHand', -2600, 0.8, 'linear');
	end
	
	if curStep == 1942 then
        doTweenZoom('bruh', 'camGame', 1.6, 1, 'linear')
        setProperty('defaultCamZoom', 1.6)
		playSound('micfuckinhit')
	end
	
	if curStep == 1967 then
        doTweenZoom('bruh', 'camGame', 0.7, 0.4, 'linear')
        setProperty('defaultCamZoom', 0.7)
		setProperty('otherHand.alpha', '0');
		setProperty('dad.alpha', '1');
		doTweenAlpha('iconP2Alpha', 'iconP2', 1, 0.3, 'linear');
	end
end