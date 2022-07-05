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
doTweenColor('timeTxt', 'timeTxt', '00ff00', 0.1, 'linear'); 
doTweenColor('timeBar', 'timeBar', '00ff00', 0.1, 'linear'); 
doTweenColor('botplayTxt', 'botplayTxt', '00ff00', 0.1, 'linear'); 
end

function onStartCountdown()
setProperty('health', 2)
end

function onUpdatePost(elapsed)
    setProperty("botplayTxt.text", "i HATE YOUR PHONE!!!!!!")
    setPropertyFromClass("openfl.Lib", "application.window.title", "OPPOSITIONs.exe")
end

function onGameOver()
restartSong(true)
return Function_Stop
end

function onSongEnd()
playSong('opposition-bandu', true)
return Function_Stop
end
