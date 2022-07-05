function onCreatePost()
	--if difficulty == 1 then
                if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		--if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
		makeAnimatedLuaSprite('Left', 'noteSplashes', 0, -45)
		else
		makeAnimatedLuaSprite('Left', 'noteSplashes', 0, 480)
		end
		addAnimationByPrefix('Left', 'LSplash', 'note splash purple', 24, false)
		addLuaSprite('Left', true)
		setObjectCamera('Left', 'hud')
		scaleObject('Left', 0.85, 0.85);
		setProperty('Left.alpha', 0)
		if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		makeAnimatedLuaSprite('Down', 'noteSplashes', 100, -45)
		else
		makeAnimatedLuaSprite('Down', 'noteSplashes', 100, 480)
		end
		addAnimationByPrefix('Down', 'DSplash', 'note splash blue', 24, false)
		addLuaSprite('Down', true)
		setObjectCamera('Down', 'hud')
		scaleObject('Down', 0.85, 0.85);
		setProperty('Down.alpha', 0)
		if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
		makeAnimatedLuaSprite('Up', 'noteSplashes', 215, -45)
		else
		makeAnimatedLuaSprite('Up', 'noteSplashes', 860, -45)
		end
		else
		if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
		makeAnimatedLuaSprite('Up', 'noteSplashes', 215, 480)
		else
		makeAnimatedLuaSprite('Up', 'noteSplashes', 860, 480)
		end
		end
		addAnimationByPrefix('Up', 'USplash', 'note splash green', 24, false)
		addLuaSprite('Up', true)
		setObjectCamera('Up', 'hud')
		scaleObject('Up', 0.85, 0.85);
		setProperty('Up.alpha', 0)
		if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
			if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
				makeAnimatedLuaSprite('Right', 'noteSplashes', 330, -45)
			else
				makeAnimatedLuaSprite('Right', 'noteSplashes', 975, -45)
			end
		else
			if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
				makeAnimatedLuaSprite('Right', 'noteSplashes', 330, 480)
			else
				makeAnimatedLuaSprite('Right', 'noteSplashes', 975, 480)
			end
		end
		if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
		addAnimationByPrefix('Right', 'RSplash', 'note splash red', 24, false)
		addLuaSprite('Right', true)
		setObjectCamera('Right', 'hud')
		scaleObject('Right', 0.85, 0.85);
		setProperty('Right.alpha', 0)
	end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	--if difficulty == 1 then
                if direction == 0 then
			if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
			setProperty('Left.alpha', 1)
			else
			setProperty('Left.alpha', 0.5)
			end
			objectPlayAnimation('Left', 'LSplash', true)
			runTimer('LSpl', 0.16)
		elseif direction == 1 then
			if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
			setProperty('Down.alpha', 1)
			else
			setProperty('Down.alpha', 0.5)
			end
			objectPlayAnimation('Down', 'DSplash', true)
			runTimer('DSpl', 0.16)
		elseif direction == 2 then
			if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
			setProperty('Up.alpha', 1)
			else
			setProperty('Up.alpha', 0.5)
			end
			objectPlayAnimation('Up', 'USplash', true)
			runTimer('USpl', 0.16)
		elseif direction == 3 then
			if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
			setProperty('Right.alpha', 1)
			else
			setProperty('Right.alpha', 0.5)
			end
			objectPlayAnimation('Right', 'RSplash', true)
			runTimer('RSpl', 0.16)
		end
	--end
end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'LSpl' then
		setProperty('Left.alpha', 0)
	elseif tag == 'DSpl' then
		setProperty('Down.alpha', 0)
	elseif tag == 'USpl' then
		setProperty('Up.alpha', 0)
	elseif tag == 'RSpl' then
		setProperty('Right.alpha', 0)
	end
end