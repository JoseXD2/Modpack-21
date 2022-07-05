function onCreate()

  addCharacterToList('sonic', 'dad')
  addCharacterToList('mightyline', 'dad')

  makeLuaSprite('fg2','TOO-SLOW/main stage spoopy',-600,0)
  scaleObject('fg2',2,2)
  makeLuaSprite('fg1','TOO-SLOW/main stage',-600,0)
  scaleObject('fg1',2,2)
  addLuaSprite('fg2',false)
  addLuaSprite('fg1',false)
  end
function onStepHit()
  if curStep==383 then
    setProperty('iconP2.visible', false)
    makeLuaSprite('black','black',-300,0)
    scaleObject('black',111,111)
    setObjectCamera('black','front')
    addLuaSprite('black',true)
  end
  if curStep==448 then
  doTweenAlpha('black','black',0,1)
  setProperty('iconP2.visible', true)
  setProperty('health', 1)
  setProperty('songScore', 0)
  setProperty('songMisses', 0)
end
  end