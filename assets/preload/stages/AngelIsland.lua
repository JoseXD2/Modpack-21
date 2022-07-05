local xx = 460;
local yy = 460;
local xx2 = 900;
local yy2 = 520;
local ofs = 25;
local ofs2 = 25;
local followchars = true;
local del = 0;
local del2 = 0;
local gurg = 0

function onCreate()
	-- with addLuaSprite, the farther up it is on the script is how far back it is in layers
	luaDebugMode = true
	
	setProperty('skipCountdown', true);
	setPropertyFromClass('ClientPrefs', 'timeBarType', 'Disabled')
	setProperty('cameraSpeed', 1.5)
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'exe_gameover');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'exe_gameOverEnd');
	setPropertyFromClass('PlayState', 'introSoundsSuffix', '-bruh');

	makeLuaSprite('floor2_exe','SonicExe/Angel-Island/EXE_FLOOR2',-300,-100)
	makeLuaSprite('readthefiletitlelol', 'SonicExe/makeGraphicsucks', 0, 0);
	makeLuaSprite('introcircle', 'SonicExe/CircleTooSlow', 900, 0);
        scaleObject('introcircle', 2, 2)
	makeLuaSprite('introtext', 'SonicExe/TextTooSlow', -900, 0);
        scaleObject('introtext', 2, 2)
	makeAnimatedLuaSprite('tailspike_exe','SonicExe/Angel-Island/Exe_TailsSpikeAnimated',-100,-100)
	addAnimationByPrefix('tailspike_exe','Tails_pike','Tails Spike Animated instance 1',12,true)
	scaleObject('tailspike_exe',1.2,1.2)
	scaleObject('readthefiletitlelol', 6.0, 6.0);
	setObjectCamera('readthefiletitlelol', 'other');
	setObjectCamera('introcircle', 'other');
	setObjectCamera('introtext', 'other');
	setScrollFactor('sky_exe', 0.75, 1.0);
	setScrollFactor('hills_exe', 0.9, 1.0);

	addLuaSprite('floor2_exe',false)
	addLuaSprite('tailspike_exe',false)
	addLuaSprite('readthefiletitlelol', true);
	addLuaSprite('introcircle', true);
	addLuaSprite('introtext', true);
	

end

function onSongStart()
	doTweenX('circleTween', 'introcircle', -100, 2, 'quintOut')
	doTweenX('textTween', 'introtext', 100, 2, 'quintOut')
	runTimer('weeb2',2)
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'weeb2' then
		doTweenAlpha('graphicAlpha', 'readthefiletitlelol', 0, 0.4, 'linear');
		doTweenAlpha('circleAlpha', 'introcircle', 0, 0.4, 'linear');
		doTweenAlpha('textAlpha', 'introtext', 0, 0.4, 'linear');
		runTimer('savespace',3)
	end
	if tag == 'savespace' then
		removeLuaSprite('introtext', true)
		removeLuaSprite('introcircle', true)
		removeLuaSprite('readthefiletitlelol', true)
	end
end

function opponentNoteHit()
	if getProperty('curBeat') < 327 or getProperty('curBeat') > 357 then
		if followchars == true and mustHitSection == false then
			setProperty('defaultCamZoom', 1.0)
			if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
				triggerEvent('Camera Follow Pos',xx-ofs,yy)
			end
            
			if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
				triggerEvent('Camera Follow Pos',xx+ofs,yy)
			end
            
			if getProperty('dad.animation.curAnim.name') == 'singUP' then
				triggerEvent('Camera Follow Pos',xx,yy-ofs)
			end
           
			if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
				triggerEvent('Camera Follow Pos',xx,yy+ofs)
			end
		end
	end
end

function goodNoteHit(id, data, type, sussy)
	if getProperty('curBeat') < 327 or getProperty('curBeat') > 357 then
	if followchars == true and mustHitSection == true then

		setProperty('defaultCamZoom', 1.1)
		if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
            triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
        end
            
		if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
            triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
        end
            
		if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
            triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
        end
           
		if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
            triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
        end
    end
	end
end

function onUpdate()
	gurg = ((getPropertyFromClass('Conductor', 'songPosition') / 1000)*(bpm/84))

    if curStep >= 789 and curStep < 922 then
		for i = 0, getProperty('unspawnNotes.length')-1 do
			setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY1 + 5 * math.sin((gurg + i*0.25) * math.pi), i)
		end
	end
	
    if curStep >= 923 and curStep < 1048 then
		for i = 0, getProperty('unspawnNotes.length')-1 do
			setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY1 - 5 * math.sin((gurg + i*0.25) * math.pi), i)
		end
    end
	
    if curStep >= 1049 and curStep < 1176 then
		for i = 0, getProperty('unspawnNotes.length')-1 do
			setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY1)
			setPropertyFromGroup('playerStrums', i, 'x', defaultPlayerStrumX0 + i * defaultPlayerStrumX0/7 + 2 * math.sin((gurg + i*0.25) * math.pi), i)
			setPropertyFromGroup('opponentStrums', i, 'x', defaultOpponentStrumX0 + i * defaultOpponentStrumX0*1.15 + 2 * math.sin((gurg + i*0.25) * math.pi), i)
		end
	end

    if curStep >= 1177 and curStep < 1959 then
 		for i = 0, getProperty('unspawnNotes.length')-1 do
			setPropertyFromGroup('playerStrums', i, 'x', defaultPlayerStrumX0 + i * defaultPlayerStrumX0/7 - 6 * math.sin((gurg + i*0.25) * math.pi), i)
			setPropertyFromGroup('opponentStrums', i, 'x', defaultOpponentStrumX0 + i * defaultOpponentStrumX0*1.15 - 6 * math.sin((gurg + i*0.25) * math.pi), i)
		end
    end
end

function onStepHit()
	if getProperty('curBeat') < 327 or getProperty('curBeat') > 357 then
	if mustHitSection == true then
        if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
            triggerEvent('Camera Follow Pos',xx2,yy2)
        end
	else
		if getProperty('dad.animation.curAnim.name') == 'idle' then
			triggerEvent('Camera Follow Pos',xx,yy)
		end
	end
	end
end