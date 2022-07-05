function onCreate()

         makeLuaText('1', 'NotAn127 - ported D-side', 800, 200, 150)
         setTextSize('1', '40')
         setTextColor('1', 'ffffff')
         setProperty('1.alpha', 0)
         addLuaText('1', true)

         makeLuaText('2', 'An Undertale Fan - UI', 800, 200, 200)
         setTextSize('2', '40')
         setTextColor('2', 'ffffff')
         setProperty('2.alpha', 0)
         addLuaText('2', true)

         makeLuaText('3', 'ImposterDeSus - Stage', 800, 200, 250)
         setTextSize('3', '40')
         setTextColor('3', 'ffffff')
         setProperty('3.alpha', 0)
         addLuaText('3', true)

         makeLuaText('4', 'Zoe.exe - Hud', 800, 200, 300)
         setTextSize('4', '40')
         setTextColor('4', 'ffffff')
         setProperty('4.alpha', 0)
         addLuaText('4', true)

         makeLuaText('5', 'RenanGamerProOfficial - Stage Event', 900, 200, 350)
         setTextSize('5', '40')
         setTextColor('5', 'ffffff')
         setProperty('5.alpha', 0)
         addLuaText('5', true)

end

function onUpdate()
        if curStep == 1 then
           doTweenAlpha('1Alpha', '1', 1, 1, 'linear')
        else if curStep == 16 then
           doTweenAlpha('2Alpha', '2', 1, 1, 'linear')
        else if curStep == 32 then
           doTweenAlpha('3Alpha', '3', 1, 1, 'linear')
        else if curStep == 48 then
           doTweenAlpha('4Alpha', '4', 1, 1, 'linear')
        else if curStep == 64 then
           doTweenAlpha('5Alpha', '5', 1, 1, 'linear')
        else if curStep == 112 then
           setTextColor('1', ff0000)
           setTextColor('2', ff0000)
           setTextColor('3', ff0000)
           setTextColor('4', ff0000)
           setTextColor('5', ff0000)
        else if curStep == 128 then
           doTweenAlpha('1Alpha', '1', 0, 1, 'linear')
           doTweenAlpha('2Alpha', '2', 0, 1, 'linear')
           doTweenAlpha('3Alpha', '3', 0, 1, 'linear')
           doTweenAlpha('4Alpha', '4', 0, 1, 'linear')
           doTweenAlpha('5Alpha', '5', 0, 1, 'linear')
               end
               end
               end
           end
        end
     end
  end
end