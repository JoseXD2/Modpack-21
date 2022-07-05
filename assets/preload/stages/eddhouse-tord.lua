function onCreate()
	setProperty('timeTxt.text', 'ChallengEdd')
	precacheImage('Edd/DoorOpen')
	precacheImage('Edd/Matt')
	precacheImage('Edd/Fallin')
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
	
		makeLuaSprite('city', 'Edd/SecondParalax', -1390, -500);
		setScrollFactor('city', 0.65, 0.65);
		scaleObject('city', 0.9, 0.8);
		
		makeAnimatedLuaSprite('matt', 'Edd/Matt', 560, 245); -- matt !!
		addAnimationByPrefix('matt', 'walk', 'MattWalking', 24, true)
		addAnimationByPrefix('matt', 'idle', 'MattSnappingFinger', 24, true)
		addAnimationByPrefix('matt', 'reaction', 'MattReactionTord', 24, false)
		addAnimationByPrefix('matt', 'lookin', 'MattHarpoonBit', 24, false)
		addAnimationByPrefix('matt', 'lookidle', 'MattHarpoonIdle', 24, true)
		setScrollFactor('matt', 1, 1);
		setProperty('matt.alpha', 0);
		scaleObject('matt', 1.5, 1.5);
		
		makeAnimatedLuaSprite('tom', 'Edd/TomEND', 1210, 299); -- tom !!
		addAnimationByPrefix('tom', 'walk', 'Tom Running In', 24, false)
		addAnimationByPrefix('tom', 'harp', 'TomHarpoonLine', 24, false)
		addAnimationByPrefix('tom', 'harpidle', 'TomHarpoonIdle', 24, true)
		setScrollFactor('tom', 1, 1);
		setProperty('tom.alpha', 0);
		scaleObject('tom', 1.5, 1.5);
		
		makeLuaSprite('car', 'Edd/Car', -1790, -600);
		setScrollFactor('car', 1.15, 1.15);
		
		makeLuaSprite('plane', 'Edd/Plane', -890, 0);
		setScrollFactor('plane', 0.2, 0.6);
		
		makeAnimatedLuaSprite('tord', 'Edd/TordHelicopter', 1270, -45); -- this red mf
		addAnimationByPrefix('tord', 'mama', 'TordHelicopter', 24, false)
		setScrollFactor('tord', 0.2, 0.6);
		setProperty('tord.alpha', 0);
		scaleObject('tord', 2, 2);
		
		makeAnimatedLuaSprite('tord2', 'TordFallin', 600, -845); -- this red mf fallin
		addAnimationByPrefix('tord2', 'idle', 'TordFlailing', 24, true)
		setScrollFactor('tord2', 0.9, 0.9);
		setProperty('tord2.alpha', 0);
		scaleObject('tord2', 1.6, 1.6);
	end
		
	makeAnimatedLuaSprite('tordbot', 'Edd/TordBot', 340, -145); -- this red mf
	addAnimationByPrefix('tordbot', 'idle', 'TordBot0', 24, true)
	addAnimationByPrefix('tordbot', 'explode', 'TordBotBlowingUp', 24, true)
	setScrollFactor('tordbot', 0.9, 0.9);
	scaleObject('tordbot', 1.3, 1.3);
	
	makeLuaSprite('fence', 'Edd/Fence', -1790, -600);
	setScrollFactor('fence', 1, 1);
	scaleObject('fence', 2, 2);
	
	makeLuaSprite('tordBG', 'Edd/TordBG', -100, -200);
	setScrollFactor('tordBG', 0, 0);
	scaleObject('tordBG', 2, 2);
	setProperty('tordBG.alpha', 0);
	
	makeLuaSprite('cock', 'Edd/CockPitUpClose', 60, 0);
	setScrollFactor('cock', 0, 0);
	scaleObject('cock', 1, 1);
	setProperty('cock.alpha', 0);

	addLuaSprite('sky', false); --bg
	addLuaSprite('plane', false);
	addLuaSprite('tord', false);
	addLuaSprite('city', false);
	addLuaSprite('tordbot', false);
	addLuaSprite('tord2', false);
	addLuaSprite('houses', false);
	addLuaSprite('doorOpen', false);
	
	addLuaSprite('fence', false); --fence lol
	
	addLuaSprite('matt', false); -- matt
	addLuaSprite('tom', true); --tom
	
	addLuaSprite('car', true);
	addLuaSprite('tordBG', false);
	addLuaSprite('cock', true);
end

function onStepHit()
	if curStep == 144 then -- tord plane comin
		doTweenX('PlaneTweenX', 'plane', 1600, 25);
	end
	if curStep == 272 then -- matt coming up
		objectPlayAnimation('doorOpen', 'open', true)
		setProperty('doorOpen.alpha', 1);
		runTimer('doorGoesInvis', 1, 1)
		setProperty('matt.alpha', 1);
		doTweenX('MattTweenX', 'matt', 10, 1.9);
	end
	if curStep == 397 then -- tord comnin
		doTweenY('TordTweenY', 'tord', 110, 2, 'cubeIn');
		objectPlayAnimation('tord', 'mama', true)
		setProperty('tord.alpha', 1);
	end
	if curStep == 928 then -- tordbot comnin
		doTweenAlpha('hudFunne', 'camHUD', 0, 0.2, 'linear')
		objectPlayAnimation('matt', 'reaction', true);
		setProperty('cameraSpeed', getProperty('cameraSpeed') - 0.8)
		doTweenY('TordbotTweenY', 'tordbot', -610, 5);
	end
	if curStep == 936 then -- tordbot comnin
		setProperty('tom.alpha', 1);
		objectPlayAnimation('tom', 'walk', true);
	end
	if curStep == 1024 then -- inside tordbot intro
		doTweenAlpha('hudFunne', 'camHUD', 1, 1, 'linear')
		setProperty('defaultCamZoom', 1.3);
		setProperty('cameraSpeed', getProperty('cameraSpeed') + 1.6);
		setProperty('cock.alpha', 1);
		doTweenAlpha('cockTweenalfa', 'cock', 0, 0.5);
		setProperty('tordBG.alpha', 1);
		setProperty('gf.y', -900); -- tord as gf
		setProperty('gf.x', 100); -- tord as gf
	end
	if curStep == 1132 then -- slide edd
		setProperty('dad.y', -100);
		setProperty('dad.x', 250);
	end
	if curStep == 1260 then -- slide bf
		setProperty('boyfriend.y', -100);
		setProperty('boyfriend.x', 950);
	end
	if curStep == 1312 then -- offsets reason of cuz 'change character' event changing it
		setProperty('gf.y', -900); -- tord as gf
		setProperty('gf.x', 100); -- tord as gf
	end
	if curStep == 1327 then -- offsets reason of cuz 'change character' event changing it
		setProperty('gf.y', -900); -- tord as gf
		setProperty('gf.x', 100); -- tord as gf
	end
	if curStep == 1984 then -- offsets reason of cuz 'change character' event changing it
		doTweenAlpha('hudFunne', 'camHUD', 0, 0.2, 'linear')
		setProperty('gf.y', -900); -- tord as gf
		setProperty('gf.x', 100); -- tord as gf
	end
	if curStep == 2016 then -- camera getin out of tordbot
		setProperty('boyfriend.y', 420);
		setProperty('boyfriend.x', 1060);
		setProperty('dad.y', 240);
		setProperty('dad.x', 245);
		setProperty('gf.y', 130);
		setProperty('gf.x', 460);
		removeLuaSprite('tordBG'); --optimization!!
		setProperty('defaultCamZoom', 0.7);
		setProperty('cameraSpeed', getProperty('cameraSpeed') - 0.4);
		setProperty('cock.alpha', 1);
		doTweenAlpha('cockTweenalfa', 'cock', 0, 0.5);
	end
	if curStep == 2032 then -- KABOOOM
		runTimer('tordbotExploded', 0.7, 1)
		setProperty('tordbot.x', -200); -- animation offset
		setProperty('tordbot.y', -900); -- animation offset
		objectPlayAnimation('tordbot', 'explode', true)
		setProperty('tom.x', 700); --offset
		setProperty('matt.x', 100); --offset
		setProperty('cameraSpeed', 0.2);
	end
	if curStep == 2047 then -- camera slow movin shit
		objectPlayAnimation('tom', 'harpidle', true)
		objectPlayAnimation('matt', 'lookidle', true)
		setProperty('tord2.alpha', 1);
		doTweenY('tordFallinAgainTweenY', 'tord2', 400, 1, 'linear');
	end
	if curStep == 2078 then -- tom sayin funny wors
		objectPlayAnimation('matt', 'lookin', true)
		setProperty('matt.x', 35); --offset
	end
	if curStep == 2087 then -- tom sayin funny wors
		objectPlayAnimation('tom', 'harp', true)
	end
end -- hello im serdzhant

function onBeatHit()
	if curBeat == 74 then
		objectPlayAnimation('matt', 'idle', true);
		setProperty('matt.x', -120); -- offset
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote) --slide bf and slide edd inside tordbot
	if noteType == 'Special Sing' and boyfriendName == 'slide-bf' then
		setProperty('boyfriend.y', -600);
		doTweenY('BfTweenY', 'boyfriend', -300, 1, 'cubeIn');
	end
	if noteType == 'Opponent Sing' and dadName == 'slide-edd' then
		setProperty('dad.y', -500);
		doTweenY('EddTweenY', 'dad', -200, 1, 'cubeIn');
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote) --health drain by tord
	if gfName == 'tord' then
		setProperty('health', getProperty('health') - 0.018)
	end
end

function onTweenCompleted(tag) 
	if tag == 'PlaneTweenX' then
		removeLuaSprite('plane'); -- optimization
	end
	if tag == 'TordTweenY' then
		doTweenY('Tord2TweenY', 'tord', 510, 10, 'linear');
	end
	if tag == 'Tord2TweenY' then
		removeLuaSprite('tord');  -- optimization
	end
	if tag == 'tordFallinAgainTweenY' then
		removeLuaSprite('tord2');  -- optimization
	end
end


function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'doorGoesInvis' then
		setProperty('doorOpen.alpha', 0);
	end
	if tag == 'tordbotExploded' then
		removeLuaSprite('tordbot'); --optimization
	end
end