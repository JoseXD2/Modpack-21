function onCreate()

         makeLuaText('text', 'Misha21220 - Ported song', 800, 200, 150)
         setTextSize('text', '40')
         setTextColor('text', 'ffffff')
         setProperty('text.alpha', 0)
         addLuaText('text', true)

end

function onUpdate()

       if curStep == 1 then
          doTweenAlpha('textAlpha', 'text', 1, 2.1, 'linear')
       else if curStep == 24 then 
          doTweenY('textY', 'text', 160, 0.05, 'linear')
       else if curStep == 27 then 
          doTweenY('textY', 'text', 140, 0.05, 'linear')
       else if curStep == 30 then 
          doTweenX('textX', 'text', 190, 0.05, 'linear')
          doTweenY('textY', 'text', 150, 0.05, 'linear')
       else if curStep == 32 then 
          doTweenAlpha('textAlpha', 'text', 0, 2, 'linear')
          doTweenX('textX', 'text', 600, 2, 'linear')
          doTweenAngle('textAngle', 'text', 120, 2, 'linear')
end
end
end
end
end
end