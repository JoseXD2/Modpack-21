local originy = 0
function onCreatePost()
    debugPrint('Welcome...  Girlfriend??')

	originy = getProperty('boyfriend.y')

	setProperty('gf.visible',false)
	
	for i = 0, getProperty('opponentStrums.length')-1 do
		setPropertyFromGroup('opponentStrums',i,'visible',false)
		setPropertyFromGroup('opponentStrums',i,'y',130)
		setPropertyFromGroup('opponentStrums',i,'x',-9999)
	end

end
function onCreate()
	-- background shit

	makeLuaSprite('FinaleBG_1', 'weeb/DokiDoki/FinaleBG_1', -500, -290);
	setLuaSpriteScrollFactor('FinaleBG_1', 0.89, 0.9);
	scaleObject('FinaleBG_1', 1.9, 1.9);
	
	makeLuaSprite('FinaleBG_2', 'weeb/DokiDoki/FinaleBG_2', -400, -90);
	setLuaSpriteScrollFactor('FinaleBG_2', 0.7, 0.7);
	scaleObject('FinaleBG_2', 2.1, 2.1);

	makeLuaSprite('FinaleFG', 'weeb/DokiDoki/FinaleFG', -480, -185);
	setLuaSpriteScrollFactor('FinaleFG', 0.9, 1.0);
	scaleObject('FinaleFG', 1.8, 1.8);

	makeLuaSprite('Dark', 'weeb/Dark', -500, -185);
	setLuaSpriteScrollFactor('Dark', 0.9, 1.0);
	scaleObject('Dark', 8.8, 8.8);

	setProperty('FinaleBG_1.antialiasing', false);
	setProperty('FinaleBG_2.antialiasing', false);
	setProperty('FinaleFG.antialiasing', false);
	setProperty('Dark.antialiasing', false);

	addLuaSprite('FinaleBG_1', false);
	addLuaSprite('Dark', true);
	addLuaSprite('FinaleBG_2', false);
	addLuaSprite('FinaleFG', false);
end

function onBeatHit()
	--for every beat
	health = getProperty('health')
	if getProperty('health') > 0.3 then
		setProperty('health', health- 0.02);
	end
    
end

function onEvent(name,value1,value2)
	if name == 'Play Animation' then 
		
		if value1 == '1' then
			setProperty('FinaleBG_1.visible', true);
			setProperty('FinaleBG_2.visible', true);
			setProperty('FinaleFG.visible', true);
			setProperty('Dark.visible', false);
		end

		if value1 == '2' then
			setProperty('FinaleBG_1.visible', false);
			setProperty('FinaleBG_2.visible', false);
			setProperty('FinaleFG.visible', false);
			setProperty('Dark.visible', true);
		end

	end
end

