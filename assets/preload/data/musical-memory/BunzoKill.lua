local allowCountdown = false
local bunzoNum = 0
local heightLimit = 0
local cymbalBeat = 3 * 4
local bfY = 0
local songStarted = false
local Cheating = 0
local cymbalSound = 0.3

-- "this song is hellish as fuck" - rorutop


if ghosttapping then
  Cheating=1
end

function lerp(a, b, t)
    return a + (b - a) * t
end

function onSongStart()
  playSound('cymbal',0.3)
  songStarted = true
end


function onCreate()
  setPropertyFromClass('ClientPrefs', 'ghostTapping', false)
  precacheSound('cymbal')
end

function onCreatePost()
  bunzoNum = getProperty('dad.y')
  heightLimit = getProperty('dad.y') + 1700
  bfY = getProperty('boyfriend.y') - 1700
  -- INVISIBRUU
  setProperty('healthBar.visible', false)
  setProperty('healthBarBG.visible', false)
  setProperty('iconP2.visible', false)
  setProperty('iconP1.visible', false)
  setProperty('timeBar.visible', false)
  setProperty('timeBarBG.visible', false)
  setProperty('timeTxt.visible', false)

  setProperty('gf.visible', false) -- dum ass
end
function onUpdatePost(elapsed)
  if songStarted then
  setProperty('dad.y', lerp(getProperty('dad.y'), bunzoNum, elapsed * 4))
  if curBeat <= 316 then
    bunzoNum = bunzoNum + elapsed * 26
  elseif curBeat >= 320 then
    bunzoNum = bunzoNum - 4
  end
  end
    if bfY <= bunzoNum then
        setHealth(0)
    else
        setHealth(1) 
    end
    if bfY <= bunzoNum + 240 then
      cymbalBeat = 1.5 * 4
      setProperty('dad.animation.curAnim.frameRate', 36) -- put bunzo fast anim change here maybe
      cymbalSound = 0.6
    elseif bfY <= bunzoNum + 450 then
      cymbalBeat = 3 * 4
      setProperty('dad.animation.curAnim.frameRate', 30)
      cymbalSound = 0.4
    else
      cymbalBeat = 6 * 4
      setProperty('dad.animation.curAnim.frameRate', 24)
      cymbalSound = 0.3
    end
end

function onStepHit()
  if getProperty('dad.animation.curAnim.name') == 'idle' and curStep % cymbalBeat == 0 then
    if bfY <= bunzoNum + 450 then
      objectPlayAnimation('dad','idle', true)
    else
      characterDance('dad', true)
    end
  end
  if  curStep % cymbalBeat == 0  then
    playSound('cymbal',cymbalSound)
  end

end

function goodNoteHit(id, dir, type, sus)
  if getProperty('dad.y') >= -2100 then
    if not sus then
      bunzoNum = bunzoNum - 30
    else
      bunzoNum = bunzoNum - 14
    end
  end
end

function noteMiss(id, dir, nt, sus)
  if not sus then
    bunzoNum = bunzoNum + 10
  else
    bunzoNum = bunzoNum + 17
  end
end

function noteMissPress()
  bunzoNum = bunzoNum + 13
end

function onDestroy()
  if Cheating == 1 then
    setPropertyFromClass('ClientPrefs', 'ghostTapping', true)
  end
end
function onEndSong()
  if Cheating == 1 then
    setPropertyFromClass('ClientPrefs', 'ghostTapping', true)
  end
end

function onPause()
  if songStarted then
  bunzoNum = bunzoNum + 80
  end
end

function onGameOver()
  if Cheating == 1 then
    setPropertyFromClass('ClientPrefs', 'ghostTapping', true)
  end
end