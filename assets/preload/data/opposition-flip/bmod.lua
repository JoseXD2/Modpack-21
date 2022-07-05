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
end

function onCreate()
setProperty('health', 2)
setProperty('timeTxt.color', getColorFromHex('2F0068'))
setProperty('botplayTxt.color', getColorFromHex('2F0068'))
makeLuaText('texto', 'You Fucked...', 0, 0, 700) --why
addLuaText('texto')
setTextSize('texto', '17.5')
setTextColor('texto', '2F0068')
end

function onUpdatePost()
       setProperty('timeBar.alpha', false)
       if curStep == 768 then
          doTweenAlpha('dadAlpha', 'dad', 0, 24, 'linear') -- expunged on the end just vine boom
          doTweenAlpha('HudAlpha', 'camHUD', 0, 12, 'linear')
	  doTweenColor('bfcolour', 'boyfriend', '2F0068', 4.5, 'linear');
	  doTweenColor('gfcolour', 'gf', '2F0068', 4.5, 'linear');
	  doTweenColor('dadcolour', 'dad', '2F0068', 4.5, 'linear');
	  doTweenColor('skycolour', '3dfuckedbside', '000000', 24, 'linear'); 
	  doTweenZoom('camZOOm', 'camGame', '1', 24, 'linear'); 
       end
end
function opponentNoteHit(id, direction, noteType, isSustainNote)
	health = getProperty('health')
	if health > 0.05 then
		setProperty('health', health - 0.000002);	
        if dadName == "expungedb-tilt" then
	setProperty('camGame.angle', getProperty('camGame.angle')+1)    
	setProperty('camHUD.angle', getProperty('camHUD.angle')+1)      
      end 
   end
end
function onGameOver()
restartSong(true)
end
