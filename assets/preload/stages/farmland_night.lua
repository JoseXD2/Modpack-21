function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'DaveandBambi/farmland_night', -100, 50);
        scaleObject('stageback', 2, 2)
	setLuaSpriteScrollFactor('stageback', 0.9, 0.9);
	addLuaSprite('stageback', false);

   if not lowQuality then
	makeLuaSprite('dark', 'DaveandBambi/dark', -100, 50);
        scaleObject('dark', 99, 99)
        addLuaSprite('dark', true)
   end
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end