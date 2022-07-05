function onCreate()
	-- background shit
	makeLuaSprite('OIP', 'bambinote/OIP', -600, -300);
        scaleObject('OIP', 2, 2)
	setScrollFactor('OIP', 0.9, 0.9);

	addLuaSprite('OIP', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end