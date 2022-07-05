local anim = 0
local anotherCastle = false

function onEndSong()
	if isStoryMode and not anotherCastle then
		makeLuaSprite('endLayer0', 'cutscene/6/layer0', 0, 0)
		setScrollFactor('endLayer0', 1, 1)
		setProperty('endLayer0.antialiasing', false)
		updateHitbox('endLayer0')
		setObjectCamera('endLayer0','other')
		addLuaSprite('endLayer0', false)

		makeLuaSprite('endLayer1', 'cutscene/6/layer1', 160, 0)
		setProperty('endLayer1.antialiasing', false)
		scaleObject('endLayer1', 6, 6)
		updateHitbox('endLayer1')
		setObjectCamera('endLayer1', 'other')
		addLuaSprite('endLayer1', false)

		makeAnimatedLuaSprite('endLayer2', 'cutscene/6/layer2', 160, 0)
		addAnimationByPrefix('endLayer2', 'cutscene00', 'anim00', 24 * 0.125, false)
		setProperty('endLayer2.antialiasing', false)
		scaleObject('endLayer2', 6, 6)
		updateHitbox('endLayer2')
		setObjectCamera('endLayer2', 'other')
		objectPlayAnimation('endLayer2', 'cutscene00', true)
		addLuaSprite('endLayer2', false)

		makeLuaSprite('endLayer3', 'cutscene/6/layer3', 160, 0)
		setScrollFactor('endLayer3', 1, 1)
		setProperty('endLayer3.antialiasing', false)
		scaleObject('endLayer3', 6, 6)
		updateHitbox('endLayer3')
		setObjectCamera('endLayer3','other')
		addLuaSprite('endLayer3', false)

		runTimer('endWeek', 8.868, 1)
		playSound('cutscene/6/music', 0.5, 'music')
		playSound('cutscene/6/sounds', 1, 'sounds')

		setProperty('camGame.visible',false)
		setProperty('camHUD.visible',false)
		anotherCastle = true
		return Function_Stop
	else
		return Function_Continue
	end
end

function onUpdate()
	if anotherCastle == true then
		if keyJustPressed('accept') then
			stopSound('music')
			stopSound('sounds')
			cancelTimer(endWeek)
			endSong()
		end
	end
end

-- Animation Bits
function onUpdatePost()
	if isStoryMode and anotherCastle == true then
		if getProperty('endLayer2.animation.curAnim.finished') and anim == 0 then
			addAnimationByPrefix('endLayer2', 'cutscene01', 'anim01', 24, false)
			objectPlayAnimation('endLayer2', 'cutscene01', false)
			anim = anim + 1
		elseif getProperty('endLayer2.animation.curAnim.finished') and anim == 1 then
			addAnimationByPrefix('endLayer2', 'cutscene02', 'anim02', 12, false)
			objectPlayAnimation('endLayer2', 'cutscene02', false)
			anim = anim + 1
		elseif getProperty('endLayer2.animation.curAnim.finished') and anim == 2 then
			addAnimationByPrefix('endLayer2', 'cutscene03', 'anim03', 12 * (100/700), false)
			objectPlayAnimation('endLayer2', 'cutscene03', false)
			anim = anim + 1
		elseif getProperty('endLayer2.animation.curAnim.finished') and anim == 3 then
			addAnimationByPrefix('endLayer2', 'cutscene04', 'anim04', 12, false)
			objectPlayAnimation('endLayer2', 'cutscene04', false)
			anim = anim + 1
		elseif getProperty('endLayer2.animation.curAnim.finished') and anim == 4 then
			addAnimationByPrefix('endLayer2', 'cutscene05', 'anim05', 12 * (100/600), false)
			objectPlayAnimation('endLayer2', 'cutscene05', false)
			anim = anim + 1
		elseif getProperty('endLayer2.animation.curAnim.finished') and anim == 5 then
			addAnimationByPrefix('endLayer2', 'cutscene06', 'anim06', 24, false)
			objectPlayAnimation('endLayer2', 'cutscene06', false)
			anim = anim + 1
		elseif getProperty('endLayer2.animation.curAnim.finished') and anim == 6 then
			addAnimationByPrefix('endLayer2', 'cutscene07', 'anim07', 12 * (100/400), false)
			objectPlayAnimation('endLayer2', 'cutscene07', false)
			anim = anim + 1
		elseif getProperty('endLayer2.animation.curAnim.finished') and anim == 7 then
			addAnimationByPrefix('endLayer2', 'cutscene08', 'anim08', 24, false)
			objectPlayAnimation('endLayer2', 'cutscene08', false)
			anim = anim + 1
		elseif getProperty('endLayer2.animation.curAnim.finished') and anim == 8 then
			addAnimationByPrefix('endLayer2', 'cutscene09', 'anim09', 12, false)
			objectPlayAnimation('endLayer2', 'cutscene09', false)
			anim = anim + 1
		elseif getProperty('endLayer2.animation.curAnim.finished') and anim == 9 then
			addAnimationByPrefix('endLayer2', 'cutscene10', 'anim10', 12 * (100/600), false)
			objectPlayAnimation('endLayer2', 'cutscene10', false)
			anim = anim + 1
		elseif getProperty('endLayer2.animation.curAnim.finished') and anim == 10 then
			addAnimationByPrefix('endLayer2', 'cutscene11', 'anim11', 12, false)
			objectPlayAnimation('endLayer2', 'cutscene11', false)
			anim = anim + 1
		elseif getProperty('endLayer2.animation.curAnim.finished') and anim == 11 then
			addAnimationByPrefix('endLayer2', 'cutscene12', 'anim12', 6, false)
			objectPlayAnimation('endLayer2', 'cutscene12', false)
			anim = anim + 1
		elseif getProperty('endLayer2.animation.curAnim.finished') and anim == 12 then
			addAnimationByPrefix('endLayer2', 'cutscene13', 'anim13', 12, false)
			objectPlayAnimation('endLayer2', 'cutscene13', false)
			anim = anim + 1
		elseif getProperty('endLayer2.animation.curAnim.finished') and anim == 13 then
			addAnimationByPrefix('endLayer2', 'cutscene14', 'anim14', 3, false)
			objectPlayAnimation('endLayer2', 'cutscene14', false)
			anim = anim + 1
		elseif getProperty('endLayer2.animation.curAnim.finished') and anim == 14 then
			addAnimationByPrefix('endLayer2', 'cutscene15', 'anim15', 12 * (100/60), false)
			objectPlayAnimation('endLayer2', 'cutscene15', false)
			anim = anim + 1
		end
	end
end

function onTimerCompleted(endWeek)
	stopSound('music')
	stopSound('sounds')
	endSong()
end