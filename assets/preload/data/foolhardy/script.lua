function onCreate()
    objectPlayAnimation('ZardyBackground', 'Zardy/Maze', true)
end

function onStepHit()
    if curStep == 2426 then
        objectPlayAnimation('ZardyBackground', 'Mazefast', true)
    end
    
    if curStep == 2427 then
        doTweenAlpha('DadAlpha', 'dad', 0.8, 0.4, 'linear');
		doTweenAlpha('iconP2Alpha', 'iconP2', 0.8, 0.4, 'linear');
    end
    
    if curStep == 2943 then
        doTweenAlpha('DadAlpha', 'dad', 0, 0.4, 'linear');
		doTweenAlpha('iconP2Alpha', 'iconP2', 0, 0.4, 'linear');
    end
end