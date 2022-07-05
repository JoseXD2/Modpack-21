function onCreate()
	
    makeLuaSprite('city', 'nevada/nevada_city', -1200, -100) --the background
		addLuaSprite('city', false);
                scaleObject('city', 3.5,3)
	
    makeLuaSprite('stage', 'nevada/nevada_stage', -400, -220); --the stage where everybody sings!
		addLuaSprite('stage', false);
			setProperty('stage.scale.x', getProperty('stage.scale.x') + 0.6);
			setProperty('stage.scale.y', getProperty('stage.scale.y') + 0.8);
		
	if not lowQuality then
	
		makeLuaSprite('hill', 'nevada/nevada_hill', -200, -100) --the hill that deimos and sanford occupy.
			addLuaSprite('hill', false);
				setProperty('hill.scale.x', getProperty('hill.scale.x') + 0.8);
				setProperty('hill.scale.y', getProperty('hill.scale.y') + 0.6);
				setLuaSpriteScrollFactor('hill', 0.94, 0.94);
	end
end