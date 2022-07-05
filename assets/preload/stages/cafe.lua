function onCreate()
	-- background shit
	makeLuaSprite('cafe', 'caffe/bgg', -600, -450);
        scaleObject('cafe', 1.4, 1.4)

	addLuaSprite('cafe', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end