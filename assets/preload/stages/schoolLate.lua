function onCreate()
	-- background si
	makeLuaSprite('SchoolLate1', 'weeb/SchoolLate1', -300, -90);
	setLuaSpriteScrollFactor('SchoolLate1', 0.89, 0.9);
	scaleObject('SchoolLate1', 6.5, 6.5);
	
	makeLuaSprite('SchoolLate2', 'weeb/SchoolLate2', -250, -2);
	setLuaSpriteScrollFactor('SchoolLate2', 1.0, 1.0);
	scaleObject('SchoolLate2', 5.6, 5.5);
	
	makeLuaSprite('SchoolLate3', 'weeb/SchoolLate3', -370, -90);
	setLuaSpriteScrollFactor('SchoolLate3', 1.0, 1.0);
	scaleObject('SchoolLate3', 7.1, 6.6);

	makeLuaSprite('FunInfinite4', 'weeb/FunInfinite4', -300, -90);
	setLuaSpriteScrollFactor('FunInfinite4', 0.89, 0.9);
	scaleObject('FunInfinite4', 8.0, 8.0);

	setProperty('SchoolLate1.antialiasing', false);
	setProperty('SchoolLate2.antialiasing', false);
	setProperty('SchoolLate3.antialiasing', false);

	addLuaSprite('SchoolLate1', false);
	addLuaSprite('SchoolLate2', false);
	addLuaSprite('SchoolLate3', false);
	addLuaSprite('FunInfinite4', true);

end

function onBeatHit()
	--for every beat
       health = getProperty('health')
    if getProperty('health') > 0.5 then
       setProperty('health', health- 0.02);
	end
end


function onStepHit()

    if curStep == 1 then

       setProperty('defaultCamZoom',1.05)
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
      startDialogue('dialogue', 'Lunchbox');
   end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
   -- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
   -- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end


