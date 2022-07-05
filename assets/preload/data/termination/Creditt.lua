function onCreate()

         makeLuaText('1', 'Misha21220 -', 800, 80, 150)
         setTextSize('1', '40')
         setTextColor('1', 'ffffff')
         setProperty('1.alpha', 0)
         addLuaText('1', true)

         makeLuaText('2', 'ported song', 800, 380, 150)
         setTextSize('2', '40')
         setTextColor('2', 'ffffff')
         setProperty('2.alpha', 0)
         addLuaText('2', true)

end

function onUpdate()

       if curStep == 32 then
          doTweenAlpha('1Alpha', '1', 1, 0.11, 'linear')
          doTweenAlpha('2Alpha', '2', 1, 0.11, 'linear')

       else if curStep == 120 then
           setTextColor('1', 'ff0000')
           setTextColor('2', 'ff0000')
           doTweenY('1Y', '1', 170, 0.1, 'linear')
           doTweenY('2Y', '2', 170, 0.1, 'linear')
           doTweenAngle('1Angle', '1', -60, 0.2, 'linear')
           doTweenAngle('2Angle', '2', 60, 0.2, 'linear')

       else if curStep == 126 then
           doTweenAlpha('1Alpha', '1', 0, 0.1, 'linear')
           doTweenAlpha('2Alpha', '2', 0, 0.1, 'linear')
end
end
end
end