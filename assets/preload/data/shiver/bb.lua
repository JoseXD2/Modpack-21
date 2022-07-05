function onCreate()
	makeLuaSprite('bb', 'BlackBorders', 0,0)
	setScrollFactor('bb', 0.9, 0.9);
	addLuaSprite('bb', false)
	setObjectCamera("bb", "hud")
        setProperty('bb.alpha', 0)
end


function onUpdate()
        setProperty('healthBar.alpha', 0)
        setProperty('healthBarBG.alpha', 0)
        setProperty('iconP1.alpha', 0)
        setProperty('iconP2.alpha', 0)
        setProperty('scoreTxt.alpha', 0)
        setProperty('timeBar.alpha', 0)
        setProperty('timeBarBG.alpha', 0)
        setProperty('timeTxt.alpha', 0)

     if curStep == 192 then
        doTweenAlpha('bbalpha', 'bb', 1, 0.15, 'linear')
     else if curStep == 832 then
        doTweenAlpha('bbalpha', 'bb', 0, 0.15, 'linear')
      end
   end
end