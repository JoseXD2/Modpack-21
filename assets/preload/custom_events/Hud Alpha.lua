function onEvent('name, value1, value2)
    if name == 'Hud Alpha' then
        duration = tonumber('value1')
        alpha = tonumber('value2')
        doTweenAlpha('alphahud', 'camHud', alpha, duration, 'linear')
    end
end