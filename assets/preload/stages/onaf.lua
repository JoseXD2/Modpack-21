function onCreate()
	makeLuaSprite('facecam', 'Gapple/facecam', 600, 200);
	addLuaSprite('facecam', false);
	
	makeLuaSprite('onaf', 'Gapple/onaf', 677, 200);
	addLuaSprite('onaf', true);
	
	makeAnimatedLuaSprite('flumpty', 'Gapple/flumpty', 1350, 500);
	addAnimationByPrefix('flumpty', 'idle', 'idle', 24, true);
	objectPlayAnimation('flumpty', 'idle', false, 24);
	scaleObject('flumpty', 0.6, 0.6);
	addLuaSprite('flumpty', true);
end