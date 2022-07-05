function onCreate()

	makeLuaSprite('stage','e/TempStage',-560,-380);
        scaleObject('stage', 2, 2)
	addLuaSprite('stage',false)
	setScrollFactor('stage',1.0,1.0);
	
	makeLuaSprite('ThyLighting','e/TempStagelighting',-560,-380);
        scaleObject('ThyLighting', 2, 2)
	addLuaSprite('ThyLighting',true)
	setScrollFactor('ThyLighting',1.0,1.0);

	

end

