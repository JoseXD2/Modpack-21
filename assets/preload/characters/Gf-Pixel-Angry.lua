function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'gf-pixel-dead'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'gf_loss_sfx-pixel'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver-pixel'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd-pixel'); --put in mods/music/
end