-- Event notes hooks
function onCreate()
	makeLuaSprite('dark', 'blackscreen', 0, 0);
	setObjectCamera('dark', 'hud');
	setProperty('dark.visible', false)
	doTweenAlpha('darkalpha', 'dark', 0, 0.001, 'linear');
	addLuaSprite('dark', false);
end

function onEvent(name, value1, value2)
	if name == 'Dark' then
		state = tonumber(value1);
		if state == 0 then
			setProperty('dark.visible', true);
			doTweenAlpha('darkalpha', 'dark', 0.5, 0.5, 'linear');
		end
		if state == 1 then
			doTweenAlpha('darkalpha', 'dark', 0, 0.5, 'linear');
		end
    	end
end