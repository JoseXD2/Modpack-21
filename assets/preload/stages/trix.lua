function onCreate()
	makeLuaSprite('front 1', 'Gapple/trix/alge_front', -300, -845);
        scaleObject('front 1', 2, 2)
	addLuaSprite('front 1', false)
	
	makeLuaSprite('front 2', 'Gapple/trix/butch_front', -300, -845);
        scaleObject('front 2', 2, 2)
	setProperty('front 2.visible', false)
	addLuaSprite('front 2', false)
	
	makeLuaSprite('front 3', 'Gapple/trix/bad_front', -300, -845);
        scaleObject('front 3', 2, 2)
	setProperty('front 3.visible', false)
	addLuaSprite('front 3', false)
end

function onSongStart()
	doTweenColor('darkbf', 'boyfriend', '949494', 1, 'linear')
	doTweenColor('darkbamb', 'dad', '949494', 1, 'linear')
	doTweenColor('darkgf', 'gf', '949494', 1, 'linear')
end

function onEvent(name, value1, value2)
      if name == 'Change BG 1' then
                    setProperty('front 2.visible', true)
      end
      if name == 'Change BG 2' then
                    setProperty('front 3.visible', true)
end
end