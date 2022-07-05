function onCreate()
	-- background shit
    makeLuaSprite('pinkBackgroundComplete','rosie/pinkBackgroundComplete',-600,0);
	scaleObject('pinkBackgroundComplete',1.2,1.2);
		
    addLuaSprite('pinkBackgroundComplete', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end