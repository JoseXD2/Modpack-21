function onCreate()
  if lowQuality then
    makeLuaSprite('zardyLow', 'Zardy/Zardy1', -600, -200)
    scaleObject('zardyLow', 2, 2)
    addLuaSprite('zardyLow', false)
  end

  if not lowQuality then
    makeAnimatedLuaSprite('ZardyBackground', 'Zardy/Maze', -600, -200)
    addAnimationByPrefix('ZardyBackground', 'Mazefast', 'Stage', 20, true)
    addAnimationByPrefix('ZardyBackground', 'Maze', 'Stage', 16, true)
	setScrollFactor('ZardyBackground', 0.9, 0.9);
        scaleObject('ZardyBackground', 2, 2)
	addLuaSprite('ZardyBackground', false);
   end
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end