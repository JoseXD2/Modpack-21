function onCreate()

	 makeLuaSprite('bg','ripple/bg', -1400, -800)
       scaleObject('bg', 4, 4)
    addLuaSprite('bg',false)

end


function onUpdate()
	if charsloaded == 2 then --see i did this before onCreatePost existed
		setProperty('boyfriend.scrollFactor.x', 1.4);
		setProperty('boyfriend.scrollFactor.y', 1.4);
		setObjectOrder('boyfriend',getObjectOrder('dad'));
		setProperty('gf.visible', false);
		--setObjectOrder('shad',getObjectOrder('dad'));

		



	end
end

function onEvent( name, value1,value2)
	if name == 'Camera Zoom Speed' then
		camSpeed = value1
		camInt = value2
	end
	if name == 'Set GF Speed' then
	setProperty('gf.visible', true);
	end
	if name == 'stopbf' then
	setProperty('boyfriend.stunned', true);
	end
	if name == 'gobf' then
	setProperty('boyfriend.stunned', false);
	end
end