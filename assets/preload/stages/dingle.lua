function onCreate()
	makeLuaSprite('dingle/city', 'Gapple/dingle/city', -400, -450);
	setLuaSpriteScrollFactor('dingle/city', 0, 0);
	scaleObject('dingle/city', 2.5, 2.5);
	addLuaSprite('dingle/city', false);
	
	makeLuaSprite('dingle/street', 'Gapple/dingle/street', -400, -200);
	scaleObject('dingle/street', 2.5, 2.5);
	addLuaSprite('dingle/street', false);
	
	makeLuaSprite('dingle/sludd', 'Gapple/dingle/sludd', -200, -150);
	setLuaSpriteScrollFactor('dingle/sludd', 0, 0);
	scaleObject('dingle/sludd', 2, 2);
	setProperty('dingle/sludd.visible', false)
	addLuaSprite('dingle/sludd', false);
	
	makeLuaSprite('dingle/sand', 'Gapple/dingle/sand', -450, -150);
	scaleObject('dingle/sand', 2.5, 2.5);
	setProperty('dingle/sand.visible', false)
	addLuaSprite('dingle/sand', false);
	
	makeAnimatedLuaSprite('dingle/crowd', 'Gapple/dingle/crowd', 100, -100);
	luaSpriteAddAnimationByPrefix('dingle/crowd', 'idle', 'bop');
	scaleObject('dingle/crowd', 1.3, 1.3);
	setProperty('dingle/crowd.visible', false)
	addLuaSprite('dingle/crowd', false);
end

function onBeatHit()
	-- triggered 4 times per section
	luaSpritePlayAnimation('crowd', 'idle', true);
end