function onCreate()
    addCharacterToList('sky-annoyed', 'dad')
  if lowQuality then
    makeLuaSprite("low", "Sky/norLow", -388.05 - 1200, -202);
    setGraphicSize('low', 7000, 2700)
    addLuaSprite('low', false)
  end

  if not lowQuality then
    makeAnimatedLuaSprite("shift", "Sky/bg_normal", -388.05 - 1200, -202);
    addAnimationByPrefix('shift', 'bop', 'bg', 24, true);
     objectPlayAnimation('shift', 'idle', true);
    setGraphicSize('shift', 7000, 2700)
    addLuaSprite("shift", false);
   end
end