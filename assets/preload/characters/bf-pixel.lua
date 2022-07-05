function onCreate()

	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-pixel-dead'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx-pixel'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver-pixel'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd-pixel'); --put in mods/music/
end

function onBeatHit()
	--for every beat
       health = getProperty('health')
    if getProperty('health') > 0.5 then
       setProperty('health', health- 0.0001);
	end
end