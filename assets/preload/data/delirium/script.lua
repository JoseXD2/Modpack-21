local boyfriendLosing = false
local dadLosing = false

function onUpdate(elapsed)
	if curStep == 20 then
		started = true
	end
	songPos = getSongPosition()
	local currentBeat = (songPos/5000)*(curBpm/60)
function onMoveCamera(focus)
	if focus == 'boyfriend' then
		-- called when the camera focus on boyfriend
	elseif focus == 'dad' then
		setProperty('camFollowPos.y',getProperty('camFollowPos.y') + (math.sin(currentBeat) * 0.6))
	end
end

songPos = getSongPosition()
local currentBeat = (songPos/5000)*(curBpm/60)
local currentBeat2 = (songPos/500)*(curBpm/60)
setCharacterY('dad',getCharacterY('dad') + (math.sin(currentBeat) * 0.3))
function opponentNoteHit(id, direction, noteType, isSustainNote)
cameraShake(game, 0.015, 0.2)
cameraSetTarget('dad')
characterPlayAnim('gf', 'scared', true)
doTweenZoom('camerazoom','camGame',1.05,0.15,'quadInOut')
end
function noteMiss(direction)
setProperty('health', getProperty('health') + 0.025)
end
function noteMissPress(direction)
setProperty('health', getProperty('health') + 0.025)
end
if getProperty('health') > 1.6 then
doTweenAlpha('iconDadFadeEventTween', 'iconP2', 0, 0.25, 'linear');
dadLosing = true
else
if dadLosing == true then
doTweenAlpha('iconDadFadeEventTween', 'iconP2', 1, 0.25, 'linear');
dadLosing = false
end
end
if getProperty('health') < 0.4 then
doTweenAlpha('iconBFFadeEventTween', 'iconP1', 0, 0.25, 'linear');
boyfriendLosing = true
else
if boyfriendLosing == true then
doTweenAlpha('iconBFFadeEventTween', 'iconP1', 1, 0.25, 'linear');
boyfriendLosing = false
end
end
end