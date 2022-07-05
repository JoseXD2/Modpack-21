function onEvent(name, value1, value2)
	if name == 'Count' then
		colour = tonumber(value2);
		duration = tonumber(value1);
		if colour == 1 then
			makeLuaSprite('unoaparece', 'uno', 140, 230);
			setObjectCamera('unoaparece', 'hud');
                        scaleObject('unoaparece', 2, 2);
			addLuaSprite('unoaparece', true);
			doTweenColor('unocolor', 'unoaparece', 'FFFFFF', 0.01, 'linear');
			doTweenAlpha('unoalpha', 'unoaparece', 0, duration, 'linear');
		end
		if colour == 2 then
			makeLuaSprite('dosaparece', 'dos', 140, 230);
			setObjectCamera('dosaparece', 'hud');
                        scaleObject('dosaparece', 2, 2);
			addLuaSprite('dosaparece', true);
			doTweenColor('doscolor', 'dosaparece', 'FFFFFF', 0.01, 'linear');
			doTweenAlpha('dosalpha', 'dosaparece', 0, duration, 'linear');
		end
		if colour == 3 then
			makeLuaSprite('tresaparece', 'tres', 140, 230);
			setObjectCamera('tresaparece', 'hud');
                        scaleObject('tresaparece', 2, 2);
			addLuaSprite('tresaparece', true);
			doTweenColor('trescolor', 'tresaparece', 'FFFFFF', 0.01, 'linear');
			doTweenAlpha('tresalpha', 'tresaparece', 0, duration, 'linear');
		end
		if colour == 4 then
			makeLuaSprite('cuatroaparece', 'cuatro', 140, 230);
			setObjectCamera('cuatroaparece', 'hud');
                        scaleObject('cuatroaparece', 2, 2);
			addLuaSprite('cuatroaparece', true);
			doTweenColor('cuatrocolor', 'cuatroaparece', 'FFFFFF', 0.01, 'linear');
			doTweenAlpha('cuatroalpha', 'cuatroaparece', 0, duration, 'linear');
		end
    end
end