function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'DaveandBambi/hills_night', -500, -300);
	setLuaSpriteScrollFactor('stageback', 0.9, 0.9);
        scaleObject('stageback', 2, 2)
	addLuaSprite('stageback', false);

   if not lowQuality then
	makeLuaSprite('dark', 'DaveandBambi/dark', -100, 50);
        scaleObject('dark', 99, 99)
        addLuaSprite('dark', true)
   end
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end