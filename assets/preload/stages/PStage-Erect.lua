function onCreate()
	-- background YEAH
	makeLuaSprite('PStage-Erect', 'weeb/PStage-Erect', -400, -90);
	setLuaSpriteScrollFactor('PStage-Erect', 0.9, 0.9);
	scaleObject('PStage-Erect', 6.5, 6.5);

	makeLuaSprite('LightsGreen', 'weeb/LightsGreen', -400, -90);
	setLuaSpriteScrollFactor('LightsGreen', 0.9, 1.0);
	scaleObject('LightsGreen', 6.5, 6.5);

	setProperty('PStage-Erect.antialiasing', false);
	setProperty('LightsGreen.antialiasing', true);

	addLuaSprite('PStage-Erect', false);
	addLuaSprite('LightsGreen', true);
end

function onBeatHit()
	--for every beat
       health = getProperty('health')
    if getProperty('health') > 0.4 then
       setProperty('health', health- 0.013);
	end
end

function onEvent(name,value1,value2)
	if name == 'Play Animation' then 
		
		if value1 == '1' then

			setProperty('PStage-Erect.visible', true);
			setProperty('LightsGreen.visible', false);
		end

		if value1 == '2' then

			setProperty('PStage-Erect.visible', false);
			setProperty('LightsGreen.visible', false);
		end

	end
end

	
local squish= 120
local incs = false

function onUpdate( elapsed )

	setProperty('gf.visible',true)
	if not middlescroll then
		noteTweenX('0',0,defaultOpponentStrumX0+squish,0.01,'linear')
		noteTweenX('1',1,defaultOpponentStrumX1+squish,0.01,'linear')
		noteTweenX('2',2,defaultOpponentStrumX2+squish,0.01,'linear')
		noteTweenX('3',3,defaultOpponentStrumX3+squish,0.01,'linear')
		noteTweenX('4',4,defaultPlayerStrumX0-squish,0.01,'linear')
		noteTweenX('5',5,defaultPlayerStrumX1-squish,0.01,'linear')
		noteTweenX('6',6,defaultPlayerStrumX2-squish,0.01,'linear')
		noteTweenX('7',7,defaultPlayerStrumX3-squish,0.01,'linear')

	end



	setProperty('gf.visible',false)
	
	for i = 0, getProperty('opponentStrums.length')-1 do
		setPropertyFromGroup('opponentStrums',i,'visible',false)
		setPropertyFromGroup('opponentStrums',i,'y',130)
		setPropertyFromGroup('opponentStrums',i,'x',-9999)
	end
end

function onBeatHit()

    setProperty('iconP2.flipY', false)
   setProperty('gf.flipX', true)
	--for every beat
end