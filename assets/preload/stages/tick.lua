function onCreate()
	
	makeLuaSprite('g', 'Gapple/gunkk', -600, -200);
        setScrollFactor('g', 0.8, 1)
        scaleObject('g', 4, 4)
	addLuaSprite('g', false);

      if not lowQuality then
	makeAnimatedLuaSprite('tunnel', 'Gapple/ticking_tunnel', -600, -200);
	addAnimationByPrefix('tunnel', 'idle', 'TUNNEL', 16, true);
	objectPlayAnimation('tunnel', 'idle', false, 16);
	scaleObject('tunnel', 2, 2);
	addLuaSprite('tunnel', false);
      end
end