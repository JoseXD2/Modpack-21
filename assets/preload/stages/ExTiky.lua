function onCreate()
	-- background boi
	makeLuaSprite('BgTiky1', 'weeb/BgTiky1', -500, -90);
	setLuaSpriteScrollFactor('BgTiky1', 1.0, 0.9);
	scaleObject('BgTiky1', 8.6, 8.6);
		
	makeLuaSprite('BgTiky2', 'weeb/BgTiky2', -400, -90);
	setLuaSpriteScrollFactor('BgTiky2', 0.8, 0.8);
	scaleObject('BgTiky2', 5.0, 5.0);

	makeLuaSprite('BgTiky3', 'weeb/BgTiky3', -400, -90);
	setLuaSpriteScrollFactor('BgTiky3', 1.0, 1.0);
	scaleObject('BgTiky3', 7.32, 7.32);

	makeLuaSprite('BgTiky4', 'weeb/BgTiky4', -530, -90);
	setLuaSpriteScrollFactor('BgTiky4', 1.0, 1.0);
	scaleObject('BgTiky4', 16.40, 16.40);

	setProperty('BgTiky1.antialiasing', false);
	setProperty('BgTiky2.antialiasing', false);
	setProperty('BgTiky3.antialiasing', false);
	setProperty('BgTiky4.antialiasing', false);

	addLuaSprite('BgTiky1', false);
	addLuaSprite('BgTiky2', false);
	addLuaSprite('BgTiky3', false);
	addLuaSprite('BgTiky4', true);
end

function onBeatHit()
	--for every beat
       health = getProperty('health')
    if getProperty('health') > 0.2 then
       setProperty('health', health- 0.011);
	end
end




