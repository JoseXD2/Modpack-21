function onCreate()

         makeLuaText('1', 'BF Myt - ported Rosie', 800, 200, 150)
         setTextSize('1', '40')
         setTextColor('1', 'ffffff')
         setProperty('1.alpha', 0)
         addLuaText('1', true)

end

function onUpdate()
        if curStep == 1 then
           doTweenAlpha('1Alpha', '1', 1, 1, 'linear')
        else if curStep == 16 then
           setTextColor('1', 'ff00ee')
           doTweenAlpha('1Alpha', '1', 0, 1, 'linear')
      end
   end
end