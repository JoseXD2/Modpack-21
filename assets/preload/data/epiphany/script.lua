
local allowEndShit = false

function onEndSong()
 if not allowEndShit and isStoryMode and not seenCutscene then
  setProperty('inCutscene', true);
  startDialogue('dialogue2', 'break'); 
  allowEndShit = true;
  return Function_Stop;
 end
 return Function_Continue;
end

function onStepHit()

    if curStep == 22 then
        doTweenZoom('asf', 'camGame', 1.1, 6, 'cubeIn')
        setProperty('defaultCamZoom', 1.5)
        triggerEvent('Trigger Static', 0, 0)
    end

    if curStep == 172 then
        doTweenZoom('asf', 'camGame', 1.0, 3, 'cubeIn')
        setProperty('defaultCamZoom', 1.06)
        triggerEvent('Trigger Static', 0, 0)
    end

    if curStep == 312 then
        doTweenZoom('asf', 'camGame', 1.2, 6, 'cubeIn')
        setProperty('defaultCamZoom', 1.0)
        triggerEvent('Trigger Static', 0, 0)
    end

    if curStep == 732 then
        doTweenZoom('asf', 'camGame', 1.0, 3, 'cubeIn')
        setProperty('defaultCamZoom', 1.1)
        triggerEvent('Trigger Static', 0, 0)
    end

    if curStep == 831 then
        doTweenZoom('asf', 'camGame', 1.3, 3, 'cubeIn')
        setProperty('defaultCamZoom', 0.9)
        triggerEvent('Trigger Static', 0, 0)
    end

    if curStep == 1232 then
        doTweenZoom('asf', 'camGame', 1.0, 3, 'cubeIn')
        setProperty('defaultCamZoom', 1.3)
        triggerEvent('Trigger Static', 0, 0)
    end

    if curStep == 1732 then
        doTweenZoom('asf', 'camGame', 1.0, 3, 'cubeIn')
        setProperty('defaultCamZoom', 1.1)
        triggerEvent('Trigger Static', 0, 0)
    end

   if curStep == 2202 then
        doTweenZoom('asf', 'camGame', 1.1, 3, 'cubeIn')
        setProperty('defaultCamZoom', 0.9)
        triggerEvent('Trigger Static', 0, 0)
    end

    if curStep == 3002 then
        doTweenZoom('asf', 'camGame', 1.1, 4, 'cubeIn')
        setProperty('defaultCamZoom', 1.0)
        triggerEvent('Trigger Static', 0, 0)
    end

    if curStep == 3292 then
        doTweenZoom('asf', 'camGame', 110.1, 1, 'cubeIn')
        setProperty('defaultCamZoom', 110.1)
        triggerEvent('Trigger Static', 0, 0)
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
