local isPixelStage = false

function onCreate()

        if getPropertyFromClass('ClientPrefs', 'hideHUD', false) then
     elseif getPropertyFromClass('PlayState', 'isPixelStage') == true then
		else if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		makeLuaSprite('gficon', 'icons/gfidle', 635, 595)
                else
		makeLuaSprite('gficon', 'icons/gfidle', 635, 50)
                end
                setObjectCamera('gficon', 'other')
                scaleObject('gficon', 0.2, 0.2)
                setProperty('gficon.visible', true)
                addLuaSprite('gficon', true)

		if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		makeLuaSprite('gfsad', 'icons/gfsad', 635, 595)
                else
		makeLuaSprite('gfsad', 'icons/gfsad', 635, 50)
                end
                setObjectCamera('gfsad', 'other')
                scaleObject('gfsad', 0.2, 0.2)
                setProperty('gfsad.visible', false)
                addLuaSprite('gfsad', true)

		if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		makeLuaSprite('gfsmile', 'icons/gfsmile', 635, 595)
                else
		makeLuaSprite('gfsmile', 'icons/gfsmile', 635, 50)
                end
                setObjectCamera('gfsmile', 'other')
                scaleObject('gfsmile', 0.2, 0.2)
                setProperty('gfsmile.visible', false)
                addLuaSprite('gfsmile', true)
       end
        if getPropertyFromClass('ClientPrefs', 'hideHUD', false) then
     elseif getPropertyFromClass('PlayState', 'isPixelStage') == false then
		else if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		makeLuaSprite('pixelgficon', 'icons/pixelgfidle', 635, 595)
                else
		makeLuaSprite('pixelgficon', 'icons/pixelgfidle', 635, 50)
                end
                setObjectCamera('pixelgficon', 'other')
                scaleObject('pixelgficon', 0.2, 0.2)
                setProperty('pixelgficon.visible', true)
                addLuaSprite('pixelgficon', true)

		if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		makeLuaSprite('pixelgfsad', 'icons/pixelgfsad', 635, 595)
                else
		makeLuaSprite('pixelgfsad', 'icons/pixelgfsad', 635, 50)
                end
                setObjectCamera('pixelgfsad', 'other')
                scaleObject('pixelgfsad', 0.2, 0.2)
                setProperty('pixelgfsad.visible', false)
                addLuaSprite('pixelgfsad', true)

		if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		makeLuaSprite('pixelgfsmile', 'icons/pixelgfsmile', 635, 595)
                else
		makeLuaSprite('pixelgfsmile', 'icons/pixelgfsmile', 635, 50)
                end
                setObjectCamera('pixelgfsmile', 'other')
                scaleObject('pixelgfsmile', 0.2, 0.2)
                setProperty('pixelgfsmile.visible', false)
                addLuaSprite('pixelgfsmile', true)
       end
end

function onUpdate()
	if getProperty('healthBar.percent') > 51 then
                setProperty('gfsad.flipX', false)
                setProperty('gfsmile.flipX', true)
                setProperty('gficon.flipX', true)
                setProperty('pixelgficon.flipX', true)
                setProperty('pixelgfsmile.flipX', true)
        else
                setProperty('gfsad.flipX', false)
                setProperty('gfsmile.flipX', false)
                setProperty('gficon.flipX', false)
                setProperty('pixelgficon.flipX', false)
                setProperty('pixelgfsmile.flipX', false)
        end

	if getProperty('healthBar.percent') > 80 then
	setProperty('gfsmile.scale.x', getProperty('iconP1.scale.x'))
	setProperty('gfsmile.scale.y', getProperty('iconP1.scale.y'))
	setProperty('gfsmile.alpha', getProperty('healthBar.alpha'))
		setProperty('gfsad.visible', false)
		setProperty('gfsmile.visible', true)
		setProperty('gficon.visible', false)
		setProperty('pixelgfsad.visible', false)
		setProperty('pixelgfsmile.visible', true)
		setProperty('pixelgficon.visible', false)
        else if getProperty('healthBar.percent') < 25 then
	setProperty('gfsad.scale.x', getProperty('iconP1.scale.x'))
	setProperty('gfsad.scale.y', getProperty('iconP1.scale.y'))
	setProperty('gfsad.alpha', getProperty('healthBar.alpha'))
		setProperty('gfsmile.visible', false)
		setProperty('gfsad.visible', true)
		setProperty('gficon.visible', false)
		setProperty('pixelgfsmile.visible', false)
		setProperty('pixelgfsad.visible', true)
		setProperty('pixelgficon.visible', false)
        else
		setProperty('gfsad.visible', false)
		setProperty('gfsmile.visible', false)
		setProperty('gficon.visible', true)
		setProperty('pixelgfsad.visible', false)
		setProperty('pixelgfsmile.visible', false)
		setProperty('pixelgficon.visible', true)
        end
        end

	setProperty('gficon.scale.x', getProperty('iconP1.scale.x'))
	setProperty('gficon.scale.y', getProperty('iconP1.scale.y'))
	setProperty('gficon.alpha', getProperty('healthBar.alpha'))

       --pixel a--

	setProperty('pixelgficon.scale.x', getProperty('iconP1.scale.x'))
	setProperty('pixelgficon.scale.y', getProperty('iconP1.scale.y'))
	setProperty('pixelgficon.alpha', getProperty('healthBar.alpha'))


	setProperty('pixelgfsad.scale.x', getProperty('iconP1.scale.x'))
	setProperty('pixelgfsad.scale.y', getProperty('iconP1.scale.y'))
	setProperty('pixelgfsad.alpha', getProperty('healthBar.alpha'))

	setProperty('pixelgfsmile.scale.x', getProperty('iconP1.scale.x'))
	setProperty('pixelgfsmile.scale.y', getProperty('iconP1.scale.y'))
	setProperty('pixelgfsmile.alpha', getProperty('healthBar.alpha'))

	setProperty('timeBar.alpha', false)
	setProperty('timeTxt.color', getColorFromHex('90ff7d'))
end
function opponentNoteHit(id, direction, noteType, isSustainNote)

         setProperty('iconP2.angle', 20)
         doTweenAngle('iconP2Angle', 'iconP2', 0, 0.34, 'linear')

end

function goodNoteHit(id, direction, noteType, isSustainNote)

         setProperty('iconP1.angle', -20)
         doTweenAngle('iconP1Angle', 'iconP1', 0, 0.34, 'linear')

end -- iconsBop script by misha21220 [GD] amogus flushed