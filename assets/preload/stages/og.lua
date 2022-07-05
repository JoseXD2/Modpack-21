function onCreate()
	-- background shit
	makeLuaSprite('ogBackground', 'Gapple/ogBackground', -600, -300);
	setScrollFactor('ogBackground', 0.9, 0.9);
	
	makeLuaSprite('ogWindow', 'Gapple/ogWindow', -600, -300);
	setScrollFactor('ogWindow', 0.9, 0.9);
        scaleObject('ogWindow', 2, 2)

	addLuaSprite('ogBackground', false);
	addLuaSprite('ogWindow', true);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end