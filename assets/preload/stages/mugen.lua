function onCreate()
	makeLuaSprite('bg lmao', 'Gapple/covers/mugen_basics', -600, -250);
	scaleObject('bg lmao', 1.35, 1.35);
	addLuaSprite('bg lmao', false);

        makeLuaSprite('text', 'Gapple/russian', 200, 300);
        setObjectCamera('text', 'other');
        setProperty('text.visible', false);
	addLuaSprite('text', false);
end

function onUpdate()
  
       if curStep == 1552 then
          setProperty('text.visible', true)
       else if curStep == 1584 then
          setProperty('text.visible', false)
      end
   end
end