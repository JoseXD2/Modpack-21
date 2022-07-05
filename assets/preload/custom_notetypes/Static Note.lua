function onCreate()
	makeAnimatedLuaSprite('note_static','SonicExe/hitStatic',-100,-100)
	addAnimationByPrefix('note_static','static_anim','staticANIMATION',30,true)
	setScrollFactor('note_static', 0, 0);
	scaleObject('note_static', 1.25, 1.25);
	setObjectCamera('note_static', 'other')
	setProperty('note_static.alpha', 0)
	addLuaSprite('note_static',true)
	--lean
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Totally not stolen from bulet note ass ets
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Static Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'SonicExe/staticNotes');
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', 0.3); --Change amount of health to take when you miss like a fucking moron
		end
	end
end

function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'Static Note' then
		playSound('hitStatic1', 1)
		playSound('ring', 1)
		setProperty('note_static.alpha', 1)
		runTimer('deletestatic', 0.5)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'deletestatic' then
		setProperty('note_static.alpha', 0)
	end
end