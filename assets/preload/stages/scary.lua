function onCreate()
	makeLuaSprite('bg', 'Gapple/bg', -600, -300);
	scaleObject('bg', 1.75, 1.75);
	addLuaSprite('bg', false);
	
	makeLuaSprite('meet', 'Gapple/meet', 0, -50);
	addLuaSprite('meet', true);
end