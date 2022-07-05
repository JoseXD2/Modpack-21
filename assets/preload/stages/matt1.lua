function onCreate()

	makeLuaSprite('Arena', 'Matt voiid/arena-bg', 0, 1500)
        scaleObject('Arena', 2, 2)
	addLuaSprite('Arena', false)

  if not lowQuality then
	makeAnimatedLuaSprite('people', 'Matt voiid/arena-characters', 0, 1864)
	addAnimationByPrefix('people', 'bounce', 'bg-characters', 24, true)
	addLuaSprite('people', false)
	objectPlayAnimation('people', 'bounce', true)

	makeLuaSprite('railingpeople', 'Matt voiid/railing', 0, 2020)
        scaleObject('railingpeople', 4, 4)
	addLuaSprite('railingpeople', false)

	makeLuaSprite('lights', 'Matt voiid/lights', 1600, 2300);
        scaleObject('light', 4, 4)
	addLuaSprite('lights', true);
	setLuaSpriteScrollFactor('lights', 2, 1.8);

	makeLuaSprite('ruido2', 'Matt voiid/ruido2', -500, -600);
        scaleObject('rudio2', 4, 4)
	addLuaSprite('ruido2', true);
	setLuaSpriteScrollFactor('ruido2', 0, 0);
     end
end



