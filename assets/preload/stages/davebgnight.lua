function onCreate()
	-- background shit

	makeLuaSprite('hills_night', 'DaveandBambi/hills_nightShade', -300, -400);
	setScrollFactor('hills_night', 0.9, 0.9);
	scaleObject('hills_night', 2.2, 2.2);
        addLuaSprite('hills_night', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end