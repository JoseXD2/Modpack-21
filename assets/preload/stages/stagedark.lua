function onCreate()
	-- background shit
	makeLuaSprite('tfbbg', 'modchart/tfbbg', -600, -300);
	setScrollFactor('tfbbg', 0.9, 0.9);
        scaleObject('tfbbg', 2, 2)

	addLuaSprite('tfbbg', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end