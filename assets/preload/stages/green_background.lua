function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'DaveandBambi/green_background', -500, -300);
	setLuaSpriteScrollFactor('stageback', 0.9, 0.9);
        scaleObject('stageback', 2, 2)

	addLuaSprite('stageback', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end