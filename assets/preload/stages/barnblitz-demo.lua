function onCreatePost()

    makeLuaSprite('demo', 'demo/barnblitz1', -200, -140) 
    addLuaSprite('demo', false)

end

function onUpdate()

       if curStep == 0 then
          doTweenZoom('menuZoom', 'camHUD', 50, 10, 'linear')
end
end