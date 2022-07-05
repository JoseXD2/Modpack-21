function onCreate()
	precacheImage('Edd/DoorOpen')
	precacheImage('Edd/Matt')
	precacheImage('Edd/Tom')
	precacheImage('Edd/Eduardo')
	precacheImage('Edd/EduardoCUTSCENE')
	precacheImage('Edd/Mark')
	precacheImage('Edd/John')
	makeAnimationList();
	-- background shit
	makeLuaSprite('sky', 'Edd/SkyBox', -1790, -800);
	setScrollFactor('sky', 0.1, 0.5);
	scaleObject('sky', 4, 4);
	
	makeLuaSprite('houses', 'Edd/HousesAndFloor', -1790, -600);
	setScrollFactor('houses', 1, 1);
	scaleObject('houses', 2, 2);
	
	if not lowQuality then
		makeAnimatedLuaSprite('doorOpen', 'Edd/DoorOpen', 600, 300); -- from that door on Hard comes up Matt with Tom
		addAnimationByPrefix('doorOpen', 'open', 'Door Opening', 12, false)
		setScrollFactor('doorOpen', 1, 1);
		setProperty('doorOpen.alpha', 0);
		scaleObject('doorOpen', 1.3, 1.3);
	
		makeLuaSprite('city', 'Edd/SecondParalax', -1290, -500);
		setScrollFactor('city', 0.65, 0.65);
		scaleObject('city', 0.8, 0.8);
		
		makeAnimatedLuaSprite('matt', 'Edd/Matt', 560, 245); -- matt !!
		addAnimationByPrefix('matt', 'walk', 'MattWalking', 24, true)
		addAnimationByPrefix('matt', 'idle', 'MattSnappingFinger', 24, true)
		addAnimationByPrefix('matt', 'reaction', 'MattReaction', 24, false)
		addAnimationByPrefix('matt', 'idol', 'MattPISSED', 24, false)
		setScrollFactor('matt', 1, 1);
		setProperty('matt.alpha', 0);
		scaleObject('matt', 1.5, 1.5);
		
		makeAnimatedLuaSprite('tom', 'Edd/Tom', 610, 245); -- tom !!
		addAnimationByPrefix('tom', 'walk', 'TomWalkingBy', 24, true)
		addAnimationByPrefix('tom', 'trans', 'TomTransition', 24, false)
		addAnimationByPrefix('tom', 'idle', 'TomIdle', 24, true)
		addAnimationByPrefix('tom', 'lookin', 'TomLooking', 24, false)
		addAnimationByPrefix('tom', 'idol', 'TomIdol', 24, false)
		addAnimationByPrefix('tom', 'reaction', 'TomReaction', 24, false)
		setScrollFactor('tom', 1, 1);
		setProperty('tom.alpha', 0);
		scaleObject('tom', 1.5, 1.5);
		
		makeAnimatedLuaSprite('john', 'Edd/John', -915, 205); -- john
		addAnimationByPrefix('john', 'idle', 'JohnIdle', 24, false)
		setScrollFactor('john', 1, 1);
		setProperty('john.alpha', 0);
		scaleObject('john', 0.9, 0.9);
		
		makeAnimatedLuaSprite('mark', 'Edd/Mark', -760, 245); -- mark
		addAnimationByPrefix('mark', 'idle', 'MarkIdle', 24, false)
		setScrollFactor('mark', 1, 1);
		setProperty('mark.alpha', 0);
		scaleObject('mark', 0.8, 0.8);
		
		makeLuaSprite('car', 'Edd/Car', -1790, -600);
		setScrollFactor('car', 1.15, 1.15);
		
		makeLuaSprite('plane', 'Edd/Plane', -890, 0);
		setScrollFactor('plane', 0.2, 0.6);
	end
	
	makeLuaSprite('fence', 'Edd/Fence', -1790, -600);
	setScrollFactor('fence', 1, 1);
	scaleObject('fence', 2, 2);
		
	makeAnimatedLuaSprite('eduarC', 'Edd/EduardoCUTSCENE', -1080, 125); -- eduardo punches john, cry about it =l
	addAnimationByPrefix('eduarC', 'punch', 'EduardoPunch', 7, false)
	setScrollFactor('eduarC', 1, 1);
	setProperty('eduarC.alpha', 0);
		
	makeAnimatedLuaSprite('eduar', 'Edd/Eduardo', -1080, 125); -- eduardo
	addAnimationByPrefix('eduar', 'idle', 'EduardoIdle', 24, false)
	addAnimationByPrefix('eduar', 'singLEFT', 'EduardoLeft', 24, false)
	addAnimationByPrefix('eduar', 'singDOWN', 'EduardoDown', 24, false)
	addAnimationByPrefix('eduar', 'singUP', 'EduardoUp', 24, false)
	addAnimationByPrefix('eduar', 'singRIGHT', 'EduardoRight', 24, false)
	addAnimationByPrefix('eduar', 'well', 'EduardoWell', 24, false)
	setScrollFactor('eduar', 1, 1);
	setProperty('eduar.alpha', 0);

	addLuaSprite('sky', false); --bg
	addLuaSprite('plane', false);
	addLuaSprite('city', false);
	addLuaSprite('houses', false);
	addLuaSprite('doorOpen', false);
	
	addLuaSprite('mark', false); --dumbasses
	addLuaSprite('john', false);
	addLuaSprite('eduar', false);
	addLuaSprite('eduarC', false);
	addLuaSprite('fence', false); --fence lol
	
	addLuaSprite('matt', false); -- matt
	addLuaSprite('tom', false); --tom
	
	addLuaSprite('car', true);
end

function onStepHit()
	if curStep == 144 then -- tord plane comin
		setProperty('eduar.alpha', 1);
		doTweenX('PlaneTweenX', 'plane', 1600, 25);
	end
	if curStep == 272 then -- matt coming up
		objectPlayAnimation('doorOpen', 'open', true)
		setProperty('doorOpen.alpha', 1);
		runTimer('doorGoesInvis', 1, 1)
		setProperty('matt.alpha', 1);
		doTweenX('MattTweenX', 'matt', 10, 1.9);
		function onTimerCompleted(tag, loops, loopsLeft)
			if tag == 'doorGoesInvis' then
				setProperty('doorOpen.alpha', 0);
			end
		end
	end
	if curStep == 416 then -- tom coming up
		setProperty('doorOpen.alpha', 1);
		objectPlayAnimation('doorOpen', 'open', true)
		runTimer('doorGoesInvis', 1, 1)
		setProperty('tom.alpha', 1);
		setProperty('tom.flipX', true);
		doTweenX('tomTweenX', 'tom', 1390, 4.8);
		function onTimerCompleted(tag, loops, loopsLeft)
			if tag == 'doorGoesInvis' then
				setProperty('doorOpen.alpha', 0);
			end
		end
	end
	if curStep == 920 then -- neighbours coomin up
		setProperty('eduar.alpha', 1);
	end
	if curStep == 928 then -- well
		objectPlayAnimation('eduar', 'well', true)
		doTweenAlpha('SkyTweenAlpha', 'sky', 0.9, 0.2);
		doTweenZoom('ZoominToNeighbours', 'camGame', 0.75, 0.2);
	end
	if curStep == 932 then -- well
		objectPlayAnimation('eduar', 'well', true)
		doTweenAlpha('SkyTweenAlpha2', 'sky', 0.8, 0.2);
		doTweenZoom('ZoominToNeighbours2', 'camGame', 0.8, 0.2);
	end
	if curStep == 936 then -- well
		objectPlayAnimation('eduar', 'well', true)
		doTweenAlpha('SkyTweenAlpha3', 'sky', 0.7, 0.2);
		doTweenZoom('ZoominToNeighbours3', 'camGame', 0.9, 0.2);
		runTimer('SkyToNormal', 1, 1)
		function onTimerCompleted(tag, loops, loopsLeft)
			if tag == 'SkyToNormal' then
				doTweenAlpha('SkyTweenAlpha4', 'sky', 1, 2);
			end
		end
	end
	if curStep == 1600 then -- but i didnt even said anything
		removeLuaSprite('mark')
		removeLuaSprite('eduar')
		removeLuaSprite('john')
		setProperty('eduarC.alpha', 1);
		objectPlayAnimation('eduarC', 'punch', true)
	end
end -- hello im serdzhant

function onBeatHit()
	if curBeat == 74 then
		objectPlayAnimation('matt', 'idle', true);
		setProperty('matt.x', -120); -- offset
	end
	if curBeat == 119 then
		objectPlayAnimation('tom', 'trans', true);
		setProperty('tom.flipX', false);
	end
	if curBeat == 120 then
		objectPlayAnimation('tom', 'idle', true);
	end
	if curBeat == 228 then
		objectPlayAnimation('tom', 'reaction', true);
		objectPlayAnimation('matt', 'reaction', true);
		setProperty('eduar.alpha', 1);
		setProperty('john.alpha', 1);
		setProperty('mark.alpha', 1);
	end
	if curBeat > 235 then
		objectPlayAnimation('matt', 'idol', true);
		objectPlayAnimation('tom', 'idol', true);
		objectPlayAnimation('eduar', 'idle', false);
		objectPlayAnimation('john', 'idle', false);
		objectPlayAnimation('mark', 'idle', false);
	end
end
--eduardo shit
--script by Shadow Mario,
animationsList = {}
holdTimers = {eduar = -1.0};
noteDatas = {eduar = 0};
function makeAnimationList()
	animationsList[0] = 'singLEFT';
	animationsList[1] = 'singDOWN';
	animationsList[2] = 'singUP';
	animationsList[3] = 'singRIGHT';
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Special Sing' then
		if not isSustainNote then
			noteDatas.eduar = direction;
		end	
	characterToPlay = 'eduar'
	animToPlay = noteDatas.eduar;
	holdTimers.eduar = 0;
			
	playAnimation(characterToPlay, animToPlay, true);
	end
end

function onUpdate(elapsed)
	holdCap = stepCrochet * 0.004;
	if holdTimers.eduar >= 0 then
		holdTimers.eduar = holdTimers.eduar + elapsed;
	end
	if getProperty('dad.curCharacter') == 'eddside' then
		if getProperty('dad.animation.curAnim.name') == 'what' then
			setProperty('dad.holdTimer', 0);
		end
	end
end

function playAnimation(character, animId, forced)
	animName = animationsList[animId];
	--debugPrint(animName);
	if character == 'eduar' then
		objectPlayAnimation('eduar', animName, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)
	end
end
--eduardo shit ends