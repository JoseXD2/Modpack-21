speed = 2.5
function onUpdate()
  songPos = getSongPosition()
  currentBeat = (songPos/2500)*(curBpm/30)
  if not inGameOver then
    for i=0,4,1 do
      setPropertyFromGroup('opponentStrums', i, 'x', ((screenWidth / 12) - (getPropertyFromGroup('opponentStrums', i, 'width') / 7) + (math.sin(currentBeat + i)) * 500) + 500) --math amiright gamers
      setPropertyFromGroup('opponentStrums', i, 'y', math.sin(currentBeat)*screenHeight/2+((screenHeight/2)*0.7))

      setPropertyFromGroup('playerStrums', i, 'x', ((screenWidth / 12) - (getPropertyFromGroup('playerStrums', i, 'width') / 7) + (math.sin(currentBeat + (i+(math.cos(currentBeat))))) * 500) + 500) --math amiright gamers x2
      setPropertyFromGroup('playerStrums', i, 'y', math.sin(currentBeat)*screenHeight/2+((screenHeight/2)*0.7))
    end
  end
end  --thx mayo78

function onCreate()
setProperty('health', 2) -- Good Night :)
setProperty('timeTxt.color', getColorFromHex('FF0000'))
setProperty('botplayTXT.color', getColorFromHex('FF0000')); 
makeLuaText('texto', 'You Fucked. Give Up!', 0, 0, 700)
addLuaText('texto')
setTextSize('texto', '17.5')
setTextColor('texto', 'ff0000')
end

function onUpdatePost()
       setProperty('timeBar.alpha', false)
       if curStep == 768 then
          doTweenAlpha('dadAlpha', 'dad', 0, 24, 'linear') -- expunged on the end just vine boom and invisible
       end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	health = getProperty('health')
	if health > 0.05 then
		setProperty('health', health - 0.002);	
   if dadName == "expunged-tilt" then
	setProperty('camGame.angle', getProperty('camGame.angle')+1)    
	setProperty('camHUD.angle', getProperty('camHUD.angle')+1)      
      end 
   end
end
function onGameOver()
restartSong(true)
return Function_Stop
end -- WOWOWOWOWOWOWOWOWOOWW (script by Misha21220 (sussy cube))