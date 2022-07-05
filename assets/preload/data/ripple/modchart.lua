function onUpdate(elapsed)
songPos = getSongPosition()
		local currentBeat = (songPos/5000)*(curBpm/60)
			noteTweenX('PlayerStrumX0', 4, defaultPlayerStrumX0 + (math.sin((currentBeat) + 0) * 210), 0.05)
			noteTweenX('PlayerStrumX1', 5, defaultPlayerStrumX1 + (math.sin((currentBeat) + 16) * 60), 0.05)
			noteTweenX('PlayerStrumX2', 6, defaultPlayerStrumX2 + (math.sin((currentBeat) + 0) * 210), 0.05)
			noteTweenX('PlayerStrumX3', 7, defaultPlayerStrumX3 + (math.sin((currentBeat) + 16) * 60), 0.05)
			noteTweenY('PlayerStrumY0', 4, defaultPlayerStrumY0 + (math.cos((currentBeat) + 0) * 45), 0.05)
			noteTweenY('PlayerStrumY1', 5, defaultPlayerStrumY1 + (math.cos((currentBeat) + 16) * 45), 0.05)
			noteTweenY('PlayerStrumY2', 6, defaultPlayerStrumY2 + (math.cos((currentBeat) + 0) * 45), 0.05)
			noteTweenY('PlayerStrumY3', 7, defaultPlayerStrumY3 + (math.cos((currentBeat) + 16) * 45), 0.05)
			noteTweenX('OpponentStrumX0', 0, defaultOpponentStrumX0 + (math.sin((currentBeat) + 0) * 60), 0.05)
			noteTweenX('OpponentStrumX1', 1, defaultOpponentStrumX1 + (math.sin((currentBeat) + 16) * 210), 0.05)
			noteTweenX('OpponentStrumX2', 2, defaultOpponentStrumX2 + (math.sin((currentBeat) + 0) * 60), 0.05)
			noteTweenX('OpponentStrumX3', 3, defaultOpponentStrumX3 + (math.sin((currentBeat) + 16) * 210), 0.05)
			noteTweenY('OpponentStrumY0', 0, defaultOpponentStrumY0 + (math.cos((currentBeat) + 0) * 45), 0.05)
			noteTweenY('OpponentStrumY1', 1, defaultOpponentStrumY1 + (math.cos((currentBeat) + 16) * 45), 0.05)
			noteTweenY('OpponentStrumY2', 2, defaultOpponentStrumY2 + (math.cos((currentBeat) + 0) * 45), 0.05)
			noteTweenY('OpponentStrumY3', 3, defaultOpponentStrumY3 + (math.cos((currentBeat) + 16) * 45), 0.05)
            doTweenY(dadTweenY, 'dad', 290-130*math.sin((currentBeat*0.25)*math.pi),0.001)
end



-- finally a modchart that has a download and easily editable AND doesnt involve forcing a Y level for the notestrum