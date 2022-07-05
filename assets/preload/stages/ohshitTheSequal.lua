function onCreate()
  if lowQuality then
    makeLuaSprite('zardyLow', 'Zardy/Zardy2', -600, -200)
    scaleObject('zardyLow', 2, 2)
    addLuaSprite('zardyLow', false)
  end

  if not lowQuality then
    makeAnimatedLuaSprite('ZardyBackground', 'Zardy/Zardy2BG', -600, -200)
    addAnimationByPrefix('ZardyBackground', 'Maze', 'BG', 24, true)
    scaleObject('ZardyBackground', 2, 2)
    addLuaSprite('ZardyBackground', false);
  end
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end