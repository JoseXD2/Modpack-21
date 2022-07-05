function onCreate()
	-- background si
	makeLuaSprite('StagePixelWall', 'weeb/StagePixelWall', -400, -90);
	setLuaSpriteScrollFactor('StagePixelWall', 0.89, 0.9);
	scaleObject('StagePixelWall', 6.5, 6.5);
	
	makeLuaSprite('StagePixelGround', 'weeb/StagePixelGround', -400, -90);
	setLuaSpriteScrollFactor('StagePixelGround', 0.9, 0.9);
	scaleObject('StagePixelGround', 6.5, 6.5);
	
	makeLuaSprite('StagePixelLights', 'weeb/StagePixelLights', -400, -90);
	setLuaSpriteScrollFactor('StagePixelLights', 0.7, 0.8);
	scaleObject('StagePixelLights', 6.5, 6.5);

	makeLuaSprite('StagePixelCurtains', 'weeb/StagePixelCurtains', -400, 20);
	setLuaSpriteScrollFactor('StagePixelCurtains', 0.9, 1.0);
	scaleObject('StagePixelCurtains', 6.5, 6.5);

	setProperty('StagePixelWall.antialiasing', false);
	setProperty('StagePixelGround.antialiasing', false);
	setProperty('StagePixelLights.antialiasing', false);
	setProperty('StagePixelCurtains.antialiasing', false);

	addLuaSprite('StagePixelWall', false);
	addLuaSprite('StagePixelGround', false);
	addLuaSprite('StagePixelLights', false);
	addLuaSprite('StagePixelCurtains', false);

end

function onBeatHit()
	--for every beat

       health = getProperty('health')
    if getProperty('health') > 0.4 then
       setProperty('health', health- 0.001);
	end
end

function onStepHit()

    if curStep == 1 then

       setProperty('defaultCamZoom',1.03)
	end
end

function onEvent(name,value1,value2)
	if name == 'Play Animation' then 
		
		if value1 == '1' then
			setProperty('StagePixelWall.visible', true);
			setProperty('StagePixelGround.visible', true);
			setProperty('StagePixelLights.visible', true);
			setProperty('StagePixelCurtains.visible', true);
		end

		if value1 == '2' then
			setProperty('StagePixelWall.visible', false);
			setProperty('StagePixelGround.visible', false);
			setProperty('StagePixelLights.visible', false);
			setProperty('StagePixelCurtains.visible',false);
		end

	end
end

