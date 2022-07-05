function onCreatePost()

    makeLuaSprite('normal', '18+/streetBack', -450, -100) 
    scaleObject('normal', 2, 2)

    makeLuaSprite('owo', '18+/tv', 100, 570) 
    scaleObject('owo', 2, 2)

  if not lowQuality then
    makeAnimatedLuaSprite('tv', '18+/TV_V5', 100, 570);
    addAnimationByPrefix('tv','att','TV_Attention',70,true)
    addAnimationByPrefix('tv','blue','TV_Bluescreen',70,true)
    addAnimationByPrefix('tv','idle','TV_Idle',70,true)
    addAnimationByPrefix('tv','quide','TV_Instructions-Normal',70,true)
    addAnimationByPrefix('tv','scary','TV_brutality',70,true)

    makeLuaSprite('error', '18+/streetError', -450, -100) 
    scaleObject('error', 2, 2)
    addLuaSprite('error')
    end

    addLuaSprite('normal')
end

function onUpdate()
       if lowQuality then
          addLuaSprite('owo')
       end

       
       if not lowQuality and curStep == 0 then
          addLuaSprite('tv')
          objectPlayAnimation('tv', 'quide', true)

       else if curStep == 128 then
          objectPlayAnimation('tv', 'idle', true)
          
       else if curStep == 2816 then
          setProperty('normal.visible',false)
          objectPlayAnimation('tv', 'blue', true)

       else if curStep == 3328 then
          setProperty('normal.visible',true)
          setProperty('error.visible',false)
          objectPlayAnimation('tv', 'scary', true)

       else if curStep == 4351 then
          objectPlayAnimation('tv', 'idle', true)
end
end
end
end
end
end