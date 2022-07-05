function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'DaveandBambi/dark_background', -500, -300);
        scaleObject('stageback', 2, 2)
	setLuaSpriteScrollFactor('stageback', 0.9, 0.9);

	addLuaSprite('stageback', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end