function onStepHit()

       if curStep == 57 then

         doTweenX('curCharacter', 'dad', 251.91, 0.5, 'linear')
         characterPlayAnim("boyfriend", "scared", true)  

   end

       if curStep == 112 then

         doTweenY('curCharacter', 'dad', -45.91, 0.5, 'linear')
   end

       if curStep == 279 then

         doTweenX('curCharacter', 'dad', 301.91, 0.5, 'linear')
         characterPlayAnim("boyfriend", "scared", true)           
   end

       if curStep == 458 then

         doTweenX('curCharacter', 'dad', 126.91, 0.5, 'linear')
   end   

       if curStep == 658 then

         doTweenX('curCharacter', 'dad', 161.91, 0.5, 'linear')
   end

       if curStep == 977 then

         doTweenY('curCharacter', 'dad', 80.91, 0.5, 'linear')
         characterPlayAnim("boyfriend", "scared", true)           
   end     

       if curStep == 658 then

         doTweenX('curCharacter', 'dad', 201.91, 0.5, 'linear')
         characterPlayAnim("boyfriend", "scared", true)          
   end    

       if curStep == 1698 then

         doTweenX('curCharacter', 'dad', -521.91, 1.5, 'linear')
          
   end     
end


function opponentNoteHit()
	--for every beat
       health = getProperty('health')
    if getProperty('health') > 0.3 then
       setProperty('health', health- 0.0001);
	end
end

function onBeatHit()
	--for every beat
       health = getProperty('health')
    if getProperty('health') > 0.3 then
       setProperty('health', health- 0.001);
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
      startDialogue('dialogue', 'LunchboxScary');
   end
end



