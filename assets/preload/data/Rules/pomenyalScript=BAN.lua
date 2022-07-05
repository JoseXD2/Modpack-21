function onCreate()

         skipCountdown()
end

function onUpdate()
       if curStep == 0 then
          doTweenZoom('menuZoom', 'camHUD', 50, 10, 'linear')
          setProperty('iconP2.alpha', 0)
       end
end