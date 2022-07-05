function onCreate()

	makeLuaSprite('BoxingBG', 'Matt voiid/boxingnight2', -500, 500);
	addLuaSprite('BoxingBG',false)
	setLuaSpriteScrollFactor('BoxingBG', 0.02, 0.9);
        scaleObject('BoxingBG', 2, 2);

	makeLuaSprite('BoxingRound', 'Matt voiid/boxingnight3', 0, 500);
	addLuaSprite('BoxingRound',false)
	setLuaSpriteScrollFactor('boxingnight3', 1, 0.9);
        scaleObject('BoxingRound', 2, 2);

   if not lowQuality then
	makeLuaSprite('lights', 'Matt voiid/lights', 500, 800);
	addLuaSprite('lights', true);
	setLuaSpriteScrollFactor('lights', 2, 1.8);
        scaleObject('lights', 4, 4);

	makeLuaSprite('ruido', 'Matt voiid/ruido', -500, -400);
	addLuaSprite('ruido', true);
	setLuaSpriteScrollFactor('ruido', 0, 0);
        scaleObject('rudio', 4, 4);
     end
	close(true)
end