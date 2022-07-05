function onCreate()

	-- background si
	makeLuaSprite('LightsR', 'weeb/LightsR', -400, -90);
	setLuaSpriteScrollFactor('LightsR', 0.0, 0.9);
	scaleObject('LightsR', 6.0, 6.0);

	addLuaSprite('LightsR', true);
end

function opponentNoteHit()
	--for every beat
       health = getProperty('health')
    if getProperty('health') > 0.3 then
       setProperty('health', health- 0.012);
       setProperty('defaultCamZoom',1.03)
	end
end

function onBeatHit()
	--for every beat
       health = getProperty('health')
    if getProperty('health') > 0.2 then
       setProperty('health', health- 0.004);
	end
end

local allowEndShit = false

function onEndSong()
 if not allowEndShit and isStoryMode and not seenCutscene then
  setProperty('inCutscene', true);
  startDialogue('dialogue2', 'breakfast'); 
  allowEndShit = true;
  return Function_Stop;
 end
 return Function_Continue;
end

function onStepHit()

    if curStep == 12 then
        doTweenZoom('asf', 'camGame', 1.3, 6, 'cubeIn')
        setProperty('defaultCamZoom', 1.0)
        triggerEvent('Trigger Static', 0, 0)
    end

    if curStep == 282 then
        doTweenZoom('asf', 'camGame', 1.1, 3, 'cubeIn')
        setProperty('defaultCamZoom', 1.3)
        triggerEvent('Trigger Static', 0, 0)
    end

    if curStep == 412 then
        doTweenZoom('asf', 'camGame', 1.4, 6, 'cubeIn')
        setProperty('defaultCamZoom', 1.0)
        triggerEvent('Trigger Static', 0, 0)
    end

    if curStep == 682 then
        doTweenZoom('asf', 'camGame', 1.1, 3, 'cubeIn')
        setProperty('defaultCamZoom', 1.3)
        triggerEvent('Trigger Static', 0, 0)
    end

    if curStep == 820 then
        doTweenZoom('asf', 'camGame', 1.5, 3, 'cubeIn')
        setProperty('defaultCamZoom', 0.9)
        triggerEvent('Trigger Static', 0, 0)
    end
end

function onCreatePost()
	if dadName == 'Dad-pixel-op' then --replace the name for your character name
		for i=0,4,1 do
			setPropertyFromGroup('opponentStrums', i, 'texture', 'GHOSTNOTES')
		end
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'GHOSTNOTES'); --Change texture
			end
		end
	end
end


local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'breakfast');
	end
end
