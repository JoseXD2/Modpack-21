

function onCreate()
  if lowQuality then
    makeLuaSprite("low", "Sky/bg_manifest", -388.05, -232);
    scaleObject('low', 2, 2)
    addLuaSprite("low", false);
  end

  if not lowQuality then
    makeAnimatedLuaSprite("shift", "Sky/bg_manifest", -388.05, -232);
    addAnimationByIndices("shift", "idle", "bg_manifest", "5", 24);
    addAnimationByPrefix('shift', 'bop', 'bg_manifest', 24, false);
    scaleObject('shift', 2, 2)
	objectPlayAnimation('shift', 'idle');
    makeAnimatedLuaSprite("floor", "Sky/floorManifest", -1053.1, -464.7);
    addAnimationByIndices("floor", "idle", "floorManifest", "5", 24);
    addAnimationByPrefix('floor', 'bop', 'floorManifest', 24, false);
    scaleObject('floor', 2, 2)
	objectPlayAnimation('floor', 'idle');
    addLuaSprite("shift", false);
    addLuaSprite("floor", false);
   end
end

function onBeatHit()
    local gfspd = getProperty("gfSpeed");
	    if curBeat % gfspd == 0 then
        objectPlayAnimation('shift', 'bop');
        objectPlayAnimation('floor', 'bop');
        end
end