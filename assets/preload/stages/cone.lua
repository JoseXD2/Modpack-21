function onCreate()
	-- background shit
	makeLuaSprite('cone', 'opposition/cone', -1800, -300);
	setScrollFactor('cone', 0.9, 0.9);
        scaleObject('cone', 2, 2)
	addLuaSprite('cone', false);
	addGlitchEffect('cone', 2, 2); 
	
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end