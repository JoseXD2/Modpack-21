function onCreate()

        makeLuaText('1', 'amogusgame - bg darken effect', 800, 200, 150)
        setTextSize('1', '40')
        setTextColor('1', 'ffffff')
        setProperty('1.alpha', 0)
        addLuaText('1', true)

        makeLuaText('2', 'Opposited Bambi - disruption modchart', 800, 200, 200)
        setTextSize('2', '40')
        setTextColor('2', 'ffffff')
        setProperty('2.alpha', 0)
        addLuaText('2', true)

end

function onUpdate()

      if curStep == 1 then 
          doTweenAlpha('1Alpha', '1', 1, 1, 'linear')
      else if curStep == 32 then 
          doTweenAlpha('2Alpha', '2', 1, 1, 'linear')
      else if curStep == 48 then 
           setTextColor('1', '00ff00')
           setTextColor('2', '00ff00')
      else if curStep == 60 then
           doTweenAlpha('1Alpha', '1', 0, 0.5, 'linear')
           doTweenAlpha('2Alpha', '2', 0, 0.5, 'linear')
         end
         end
      end
   end
end