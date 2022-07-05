function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'DaveandBambi/god2bg', -500, -300);
        scaleObject('stageback', 2, 2)
	addLuaSprite('stageback', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end