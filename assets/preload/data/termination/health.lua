function onCreate()
         makeLuaText('b', 'If you have 25% hp you will die', 400, 440, 320)
         setTextSize('b', '45')
         setTextColor('b', 'ff0000')
         addLuaText('b', true)

makeLuaSprite('Lba', '18+/healthBarQT')
addLuaSprite('Lba', true);
setProperty('Lba.x', getProperty('healthBarBG.x')-1.9)
setProperty('Lba.y', getProperty('healthBarBG.y'))
setObjectCamera('Lba', 'hud')
setBlendMode('Lba', 'multiply')
setObjectOrder('Lba', 4)
setObjectOrder('healthBarBG', 2)
setObjectOrder('healthBar', 3)

end

function onUpdate()

       curHealth = getProperty('health')
          if 0 > curHealth - (0.5) then
          setProperty('health', -1)

      else if curStep == 64 then
         setProperty('b.alpha', 0, 1)
end
end
end

function opponentNoteHit() -- health draining mechanic
	health = getProperty('health')
    	if getProperty('health') > 0.55 then
        setProperty('health', health-0.002);
  end
end